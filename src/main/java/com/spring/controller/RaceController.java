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
	public String getAllRace(Model model) {
		List<RaceAndRegion> raceList = service.getAllRaces();
		model.addAttribute("raceList", raceList);
		return "events";
	}
	
	@RequestMapping("/events/filter")
	public String raceListbyOption(@RequestParam(value="opt[]", required=false) List<String> opt, @RequestParam(value="val[]", required=false) List<String> val, @RequestParam(value="keyword") String keyword, Model model) {
		List<RaceAndRegion> raceList = null;
		if(opt==null && (keyword==null||keyword=="")) {
			raceList=service.getAllRaces();
			model.addAttribute("raceList", raceList);
			return "/eventsFilter";
		}
		else {
			List<String> category= new ArrayList<String>();
			String dist = "";
			List<Integer> date = new ArrayList<Integer>();
			List<String> con = new ArrayList<String>();
			List<String> state = new ArrayList<String>();
			List<String> city = new ArrayList<String>();
			if(opt!=null) {
				for(int i=0; i<opt.size(); i++) {
					switch (opt.get(i)) {
					case "race_category":
						category.add(val.get(i));
						break;
					case "race_dist":
						if(dist=="") {
							dist = dist+val.get(i);
						}
						else {
							dist=dist+"|"+val.get(i);
						}
						break;
					case "race_date":
						date.add(Integer.parseInt(val.get(i).replaceAll("[^0-9]", "")));
						break;
					case "race_con":
						con.add(val.get(i));
						break;
					case "region_state":
						state.add(val.get(i));
						break;
					case "region_city":
						city.add(val.get(i));
						break;
					default:
						break;
					}
				}
			}
			raceList=service.getRaceByOption(category, dist, date, con, state, city, keyword);
			System.out.println(raceList);
			model.addAttribute("raceList", raceList);
			return "/eventsFilter";
		}
		
	}
}
