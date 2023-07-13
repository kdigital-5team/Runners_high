package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.Race;
import com.spring.dto.RaceAndRegion;
import com.spring.dto.SearchKeyword;
import com.spring.service.RaceService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RaceController {
	@Autowired
	private RaceService service;
	
	@GetMapping("/events")
	public String getAllRace(@ModelAttribute SearchKeyword keyword, Model model) {
		List<Race> raceList = service.getRaceWithKeyword(keyword);
		List<RaceAndRegion> myList = service.getAllRaces();
		List<String> stateList = service.getAllState();
		model.addAttribute("raceList", raceList);
		model.addAttribute("stateList",stateList);
		model.addAttribute("myList",myList);
		System.out.println("test");
		return "events";
	}
	
	@RequestMapping("/events/filter")
	public String raceListbyOption(@RequestParam(value="opt[]") List<String> opt, @RequestParam(value="val[]") List<String> val, String option, Model model) {
		List<String> category= new ArrayList<String>();
		List<String> dist = new ArrayList<String>();
		for(int i=0; i<opt.size(); i++) {
			switch (opt.get(i)) {
			case "race_category":
				category.add(val.get(i));
				break;
			case "race_dist":
				dist.add(val.get(i));
			default:
				break;
			}
		}
		System.out.println(dist);
		List<Race> raceList = service.getRaceByOption(category, dist);
		System.out.println(raceList);
		System.out.println("전체");
		model.addAttribute("raceList", raceList);
		return "/eventsFilter";
	}
}
