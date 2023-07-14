package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@GetMapping("/challenge")
	public String getAllChall(Model model) {
		List<Challenge> challList = challService.getAllChall();
		model.addAttribute("challList", challList);
		return "challenge";
	}
	
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
	
	@RequestMapping(value = "/challenge/{chall_id}", method = RequestMethod.GET)
	public String getChallByChallId(@PathVariable int chall_id, Model model) {
		Challenge challenge = challService.getChallByChallId(chall_id);
		User host = challService.getHostByChallId(chall_id);
		List<UserChallenge> userList = challService.getUserByChallId(chall_id);
		model.addAttribute("challenge", challenge);
		model.addAttribute("host", host);
		model.addAttribute("userList", userList);
		return "/challengeDetail";
	}
	
	@RequestMapping(value="/challenge/{chall_id}/apply", method = RequestMethod.POST)
	public String applyByChallId(@PathVariable int chall_id, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		
		if(userId==null||userId=="") {
			return "redirect:/login";
		}
		
		challService.applyByChallId(userId, chall_id);
		
		return "redirect:/challenge/"+chall_id;
	}
}
