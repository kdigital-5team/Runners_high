package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.Challenge;
import com.spring.dto.Race;
import com.spring.dto.RaceAndRegion;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.service.ChallengeService;
import com.spring.service.RaceService;
import com.spring.service.RegionService;
import com.spring.service.RouteService;

@Controller
// http://localhost:8081/regist
public class ChallengeController {
	private static final String String = null;

	@Autowired
	private RegionService service;
	
	@Autowired
	private ChallengeService challService;
	
	@Autowired
	private RouteService routeService;
	
	@Autowired
	private RaceService raceService;
	
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
	
	// 회원가입
	// http://localhost:8081/regist
	@RequestMapping(value = "/registChall", method = RequestMethod.POST)
	public String insertDept(@ModelAttribute Challenge newChallenge,
							 Model model,
							 @RequestParam String region_district,
							 HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("userId");
		String raceId = (String)session.getAttribute("raceId");
		
		System.out.println(newChallenge);
		System.out.println(region_district);
		System.out.println(userId);
		
		if (raceId==null && newChallenge.getChall_category().equals("대회용")) {
			return "registChall";

		}
		System.out.println(raceId);
		boolean challResult = false;
		
	
		try {
			newChallenge.setChall_reg_id(userId);
			newChallenge.setRegion_id(service.getIdByDistrict(region_district));
			System.out.println(newChallenge);
			
			newChallenge.setRace_id(raceId);
			System.out.println(newChallenge);
			challResult = challService.insertChallenge(newChallenge);
			
			if(challResult) {
				System.out.println("등록완료");
				
				int challId = newChallenge.getChall_id();
				System.out.println(challId);
				session.setAttribute("challId", challId);
				session.removeAttribute(raceId);
				return "registChallRoute";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "index";
		}
		return "index";
	}
	
	@RequestMapping(value = "/registChall/selectChallRace" , method = RequestMethod.GET)
	public String selectRace(Model model) {
		List<RaceAndRegion> raceList = raceService.getAllRaces();
		model.addAttribute("raceList", raceList);
		return "selectChallRace";
	}
	
	@RequestMapping(value="/getRaceId",  method=RequestMethod.POST)
	@ResponseBody
	String getRace(@RequestBody String raceId,HttpSession session) throws Exception {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(raceId);
		session.setAttribute("raceId", Long.toString((long) jsonObj.get("raceId")));
		System.out.println(jsonObj.get("raceId"));
		return raceId;
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
