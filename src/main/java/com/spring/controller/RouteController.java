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

import com.spring.dto.Route;
import com.spring.dto.User;
import com.spring.service.ChallengeService;
import com.spring.service.RouteService;

@Controller
public class RouteController {
	@Autowired
	private ChallengeService challService;
	
	@Autowired
	private RouteService routeService;
	
	
	@RequestMapping(value = "/registChallRoute/{chall_id}", method = RequestMethod.GET)
	public String registChall(Model model, @PathVariable int chall_id) throws Exception {
		model.addAttribute("chall_id",chall_id);
		return "/registChallRoute";	
	}
	
	@RequestMapping(value = "/editChallRoute/{chall_id}", method = RequestMethod.GET)
	public String editChall(Model model,  @PathVariable int chall_id) throws Exception {
		model.addAttribute("chall_id",chall_id);
		return "/editChallRoute";	
	}
	
	@ResponseBody
	@RequestMapping(value = "/getLatLongById", method = RequestMethod.POST)
	public JSONObject getLatLongById(@RequestBody String challId, Model model) throws Exception {
		List<Route> route = null;
		JSONObject obj = new JSONObject();
		 try {
             JSONParser jsonParser = new JSONParser();
             JSONObject jsonObj = (JSONObject) jsonParser.parse(challId);
             route = routeService.getlatLongById(Integer.parseInt(jsonObj.get("chall_id").toString()));
             
             try {
                 JSONArray jArray = new JSONArray();//배열이 필요할때
                 for (int i = 0; i < route.size(); i++)//배열
                 {
                     JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
                     sObject.put("chall_id", route.get(i).getChall_id());
                     sObject.put("route_lat", route.get(i).getRoute_lat());
                     sObject.put("route_long", route.get(i).getRoute_long());
                     jArray.add(sObject);
                 }
                 obj.put("item", jArray);//배열을 넣음

                 System.out.println(obj.toString());

             } catch (Exception e) {
                 e.printStackTrace();
             }
             
             

             model.addAttribute("Route", obj);
		 }
             catch (Exception e) {
                 e.printStackTrace();
         }
		return obj;
	}
	

	@ResponseBody
	@RequestMapping(value="/getPath/{chall_id}", method=RequestMethod.POST)
	String getPath(@RequestBody String chall_path,@PathVariable int chall_id, Model model, HttpSession session) throws Exception {
		boolean routeResult = false;
		System.out.println(chall_id);
		   try {
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObj = (JSONObject) jsonParser.parse(chall_path);
               JSONArray coordsArray = (JSONArray) jsonObj.get("chall_path");
               
               for(int i=0 ; i<coordsArray.size() ; i++){
                       JSONObject tempObj = (JSONObject) coordsArray.get(i);
                       routeResult = routeService.insertRoute(chall_id, tempObj.get("Ma").toString(), tempObj.get("La").toString());
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
	
	@ResponseBody
	@RequestMapping(value="/editPath/{chall_id}", method=RequestMethod.POST)
	String editPath(@RequestBody String chall_path,@PathVariable int chall_id, Model model, HttpSession session) throws Exception {
		boolean routeResult = false;
		routeService.deleteRoute(chall_id);
		System.out.println(chall_id);
		   try {
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObj = (JSONObject) jsonParser.parse(chall_path);
               JSONArray coordsArray = (JSONArray) jsonObj.get("chall_path");
               for(int i=0 ; i<coordsArray.size() ; i++){
                       JSONObject tempObj = (JSONObject) coordsArray.get(i);
                       routeResult = routeService.insertRoute(chall_id, tempObj.get("Ma").toString(), tempObj.get("La").toString());
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


