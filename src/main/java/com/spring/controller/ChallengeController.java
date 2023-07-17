package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.Challenge;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.service.ChallengeService;
import com.spring.service.RegionService;

@Controller
// http://localhost:8081/regist
public class ChallengeController {
	@Autowired
	private RegionService service;
	
	@Autowired
	private ChallengeService challService;
	
	@RequestMapping(value = "/registChall", method = RequestMethod.GET)
	public String registChall(Model model) throws Exception {
		List<String> stateList = service.getAllState();
		//List<String> cityList = service.getCityByState();
		//List<String> districtList = service.getDistrictByCity();
		model.addAttribute("stateList",stateList);
		//model.addAttribute("cityList",cityList);
		//model.addAttribute("districtList",districtList);
		return "/registChall";
	}
	
	@RequestMapping(value="/getCity", method=RequestMethod.POST)
	@ResponseBody
	List<String> getCity(@RequestBody String state) throws Exception {
		List<String> cityList = service.getCityByState(state);
		return cityList;
	}
	
	@RequestMapping(value="/getDistrict", method=RequestMethod.POST)
	@ResponseBody
	List<String> getDistrict(@RequestBody String city) throws Exception {
		List<String> districtList = service.getDistrictByCity(city);
		return districtList;
	}

	// 전체 챌린지 리스트
	@GetMapping("/challenge")
	public String getAllChall(Model model) {
		List<Challenge> challList = challService.getAllChall();
		model.addAttribute("challList", challList);
		return "challenge";
	}
	
	// 검색필터를 통해 보여지는 챌린지 리스트
	@GetMapping("/challenge/filter")
	public String getChallByOption(@RequestParam(value="opt[]", required=false) List<String> opt, @RequestParam(value="val[]", required=false) List<String> val, @RequestParam(value="keyword") String keyword, Model model) {
		List<Challenge> challList = null;
		if(opt==null && (keyword==null||keyword=="")) {
			challList=challService.getAllChall();
			model.addAttribute("challList", challList);
			return "/challFilter";
		}
		else {
			List<String> online= new ArrayList<String>();
			List<String> state = new ArrayList<String>();
			List<String> city = new ArrayList<String>();
			List<Integer> date = new ArrayList<Integer>();
			List<String> category = new ArrayList<String>();
			List<String> con = new ArrayList<String>();
			if(opt!=null) {
				for(int i=0; i<opt.size(); i++) {
					switch (opt.get(i)) {
					case "chall_online":
						online.add(val.get(i));
						break;
					case "region_state":
						state.add(val.get(i));
						break;
					case "region_city":
						city.add(val.get(i));
						break;
					case "chall_date":
						date.add(Integer.parseInt(val.get(i).replaceAll("[^0-9]", "")));
						break;
					case "chall_cat":
						category.add(val.get(i));
						break;
					case "chall_con":
						con.add(val.get(i));
						break;
					
					default:
						break;
					}
				}
			}
			challList=challService.getChallByOption(online, state, city, date, category, con,  keyword);
			System.out.println(challList);
			model.addAttribute("challList", challList);
			return "/challengeFilter";
		}
		
	}
	
	// 챌린지 상세 페이지
	@RequestMapping(value = "/challenge/{chall_id}", method = RequestMethod.GET)
	public String getChallByChallId(@PathVariable int chall_id, Model model, HttpSession session) {
		Challenge challenge = challService.getChallByChallId(chall_id);
		User host = challService.getHostByChallId(chall_id);
		String userId = (String) session.getAttribute("userId");
		List<UserChallenge> userList = challService.getUserByChallId(chall_id);
		UserChallenge userChall=new UserChallenge();
		System.out.println(userList);
		for(UserChallenge uc:userList) {
			if(uc.getUser_id().equals(userId))
				userChall = uc;
		}
		
		model.addAttribute("challenge", challenge);
		model.addAttribute("userChall", userChall);
		model.addAttribute("host", host);
		model.addAttribute("userList", userList);
		return "/challengeDetail";
	}
	
	// 챌린지 신청
	@RequestMapping(value="/challenge/{chall_id}/apply", method = RequestMethod.POST)
	public String applyByChallId(@PathVariable int chall_id, Model model, HttpSession session, @RequestParam("applyId") String applyId) {
		if(applyId==null || applyId=="") {
			return "redirect:/login";
		}
		
		challService.applyByChallId(applyId, chall_id);
		System.out.println(applyId);
		return "redirect:/challenge/"+chall_id;
	}
	
	// 챌린지 탈퇴
		@RequestMapping(value="/challenge/{chall_id}/withdraw", method = RequestMethod.POST)
		public String withdrawByChallId(@PathVariable int chall_id, Model model, HttpSession session, @RequestParam("applyId") String applyId) {
			System.out.println(applyId);
			
			challService.withdrawByChallId(applyId, chall_id);
			return "redirect:/challenge/"+chall_id;
		}
		
	// 챌린지 관리 페이지
	@RequestMapping(value="/challenge/{chall_id}host", method=RequestMethod.GET)
	public String challengeHost(@PathVariable int chall_id, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		User host = challService.getHostByChallId(chall_id);
		if(!host.getUser_id().equals(userId))
			return "redirect:/challenge/"+chall_id;
		Challenge challenge = challService.getChallByChallId(chall_id);
		List<UserChallenge> userList = challService.getUserByChallId(chall_id);
		List<UserChallenge> appList = new ArrayList<UserChallenge>();
		List<UserChallenge> parList = new ArrayList<UserChallenge>();
		
		for(UserChallenge uc : userList) {
			if(uc.getChall_reg_status().equals("N") && uc.getUser_reg_status().equals("Y"))
				appList.add(uc);
			else if(uc.getChall_reg_status().equals("Y") && uc.getUser_reg_status().equals("Y"))
				parList.add(uc);
		}
		model.addAttribute("host", host);
		model.addAttribute("appList", appList);
		model.addAttribute("parList", parList);
		model.addAttribute("challenge", challenge);
		return "/challengeHost";
	}
	
	// 챌린지 참가 수락
	@RequestMapping(value="/challenge/accept/{chall_id}")
	public String acceptUserById(@PathVariable int chall_id, @RequestParam("acceptId") String acceptId, Model model) {
		challService.acceptIdbyChallId(acceptId, chall_id);
		return "redirect:/challenge/"+chall_id+"host";
	}
	
	// 챌린지 참가 거절
	@RequestMapping(value="/challenge/decline/{chall_id}")
	public String declineUserById(@PathVariable int chall_id, @RequestParam("declineId") String declineId, Model model) {
		challService.declineIdbyChallId(declineId, chall_id);
		return "redirect:/challenge/"+chall_id+"host";
	}
	
	// 챌린지 추방
		@RequestMapping(value="/challenge/kick/{chall_id}")
		public String kickUserById(@PathVariable int chall_id, @RequestParam("kickId") String kickId, Model model) {
			challService.kickIdbyChallId(kickId, chall_id);
			return "redirect:/challenge/"+chall_id+"host";
		}
}
