package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.Challenge;
import com.spring.dto.Race;
import com.spring.dto.SearchKeyword;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.service.ChallengeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChallengeController {
	@Autowired
	private ChallengeService service;

	@GetMapping("/challenge")
	public String getAllChall(Model model) {
		List<Challenge> challList = service.getAllChall();
		model.addAttribute("challList", challList);
		return "challenge";
	}
	
	@GetMapping("/challenge/filter")
	public String getChallByOption(@RequestParam(value="opt[]", required=false) List<String> opt, @RequestParam(value="val[]", required=false) List<String> val, @RequestParam(value="keyword") String keyword, Model model) {
		List<Challenge> challList = null;
		if(opt==null && (keyword==null||keyword=="")) {
			challList=service.getAllChall();
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
			challList=service.getChallByOption(online, state, city, date, category, con,  keyword);
			System.out.println(challList);
			model.addAttribute("challList", challList);
			return "/challengeFilter";
		}
		
	}
	
	@RequestMapping(value = "/challenge/{chall_id}", method = RequestMethod.GET)
	public String getChallByChallId(@PathVariable int chall_id, Model model) {
		Challenge challenge = service.getChallByChallId(chall_id);
		User host = service.getHostByChallId(chall_id);
		List<UserChallenge> userList = service.getUserByChallId(chall_id);
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
		
		service.applyByChallId(userId, chall_id);
		
		return "redirect:/challenge/"+chall_id;
	}
}
