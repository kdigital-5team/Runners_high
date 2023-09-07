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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.AuthRoute;
import com.spring.dto.ChallengePost;
import com.spring.dto.Route;
import com.spring.service.RunService;

@Controller
public class RunController {
	int authId;
	
	@Autowired
	private RunService runService;

	@RequestMapping(value="/running")
	public String running() {
		return "runningRoute";
	}
	
	@ResponseBody
	@RequestMapping(value="/runPath", method=RequestMethod.POST)
	String getPath(@RequestBody String chall_path, Model model, HttpSession session) throws Exception {
		String userId = (String)session.getAttribute("userId");
		boolean routeResult = false;
		   try {
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObj = (JSONObject) jsonParser.parse(chall_path);
               JSONArray coordsArray = (JSONArray) jsonObj.get("chall_path");
               
               for(int i=0 ; i<coordsArray.size() ; i++){
                       JSONObject tempObj = (JSONObject) coordsArray.get(i);
                       routeResult = runService.insertRoute(userId, tempObj.get("Ma").toString(), tempObj.get("La").toString(), authId);
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
	@RequestMapping(value = "/getRunRoute", method = RequestMethod.POST)
	public JSONObject getRunRoute(@RequestBody String authId, Model model) throws Exception {
		List<AuthRoute> authRoute = null;
		JSONObject obj = new JSONObject();
		 try {
             JSONParser jsonParser = new JSONParser();
             JSONObject jsonObj = (JSONObject) jsonParser.parse(authId);
             authRoute = runService.getRunRoute(Integer.parseInt(jsonObj.get("auth_id").toString()));
             
             try {
                 JSONArray jArray = new JSONArray();//배열이 필요할때
                 for (int i = 0; i < authRoute.size(); i++)//배열
                 {
                     JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
                     sObject.put("auth_id", authRoute.get(i).getAuth_id());
                     sObject.put("route_lat", authRoute.get(i).getRoute_lat());
                     sObject.put("route_long", authRoute.get(i).getRoute_long());
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
	
	@RequestMapping(value="/insertRunPost")
	String insetPost(@RequestParam(value="title") String title, @RequestParam(value="cont") String cont, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		boolean isInsert = false;
		ChallengePost challengePost = new ChallengePost();
		challengePost.setAuth_cont(cont);
		challengePost.setAuth_title(title);
		challengePost.setComment_id(userId);
		isInsert = runService.insertRunPost(challengePost);
		authId = challengePost.getAuth_id();
		System.out.println(authId);
		return "main";
	}
}
