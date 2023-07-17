package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.ChallengeService;
import com.spring.service.RouteService;

@Controller
public class RouteController {
	@Autowired
	private ChallengeService challService;
	
	@Autowired
	private RouteService routeService;
	
	
	@RequestMapping(value = "/registChallRoute", method = RequestMethod.GET)
	public String registChall(Model model) throws Exception {

		return "/registChall";
	}
	

	@RequestMapping(value="/getPath", method=RequestMethod.POST)
	@ResponseBody
	String getPath(@RequestBody String chall_path, Model model, HttpSession session) throws Exception {
		boolean routeResult = false;
		int chall_Id = (int)session.getAttribute("challId");
		System.out.println(chall_Id);
		   try {
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObj = (JSONObject) jsonParser.parse(chall_path);
               JSONArray coordsArray = (JSONArray) jsonObj.get("chall_path");
               
               for(int i=0 ; i<coordsArray.size() ; i++){
                       JSONObject tempObj = (JSONObject) coordsArray.get(i);
                       routeResult = routeService.insertRoute(chall_Id, tempObj.get("La").toString(), tempObj.get("Ma").toString());
                      // 인설트-> DB -> 
                       System.out.println(tempObj.get("La"));
                       System.out.println(tempObj.get("Ma"));
                       }
               System.out.println(coordsArray);
               return "main";

               } catch (Exception e) {
                       e.printStackTrace();
                       return "index";
               }
	}
	
	
}
