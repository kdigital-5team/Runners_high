package com.spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.Challenge;
import com.spring.dto.ChallengePost;
import com.spring.dto.ChallengeRegion;
import com.spring.dto.FeedPicture;
import com.spring.dto.PersonalFeed;
import com.spring.dto.RaceAndRegion;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.service.ChallengeService;
import com.spring.service.FeedPictureService;
import com.spring.service.FeedService;
import com.spring.service.RaceService;
import com.spring.service.RegionService;
import com.spring.service.RouteService;
import com.spring.service.UserService;

@Controller
// http://localhost:8081/regist
public class ChallengeController {
	@Autowired
	private RegionService service;
	
	@Autowired
	private ChallengeService challService;
	
	@Autowired
	private RouteService routeService;
	
	@Autowired
	private RaceService raceService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private FeedPictureService pictureservice;
	
	@RequestMapping(value = "/registChall", method = RequestMethod.GET)
	public String registChall(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<String> stateList = service.getAllState();
		String userId = (String) session.getAttribute("userId");
		int isOtherApply=0;
		isOtherApply = challService.checkOtherChall(userId);
		if(isOtherApply>0) {
			rttr.addFlashAttribute("isTrue", "존재");
			return "redirect:/challenge";
		}
		//List<String> cityList = service.getCityByState();
		//List<String> districtList = service.getDistrictByCity();
		model.addAttribute("stateList",stateList);
		//model.addAttribute("cityList",cityList);
		//model.addAttribute("districtList",districtList);
		return "registChall";
	}
	
	
	// 챌린지 추가
	// http://localhost:8081/registChall
		@RequestMapping(value = "/registChall", method = RequestMethod.POST)
		public String insertChallenge(@ModelAttribute Challenge newChallenge,
									  Model model,
									  @RequestParam(required = false) String region_district,
									  HttpSession session) throws Exception {
			
			System.out.println("registChall controller 실행");
			
			String userId = (String) session.getAttribute("userId");
			String raceId = newChallenge.getRace_id();
			System.out.println("새로운 챌린지 정보1 : " + newChallenge);
			System.out.println(region_district);
			System.out.println(userId);
			
			boolean challResult = false;
			
		
			try {
				if (raceId==null && newChallenge.getChall_category().equals("대회용")) {
					session.setAttribute("msg", "대회 선택을 다시 해주세요!");
					session.setAttribute("url", "/registChall");
					return "alert";
					
				} else if (newChallenge.getChall_category().equals("일상용")) {
					raceId=null;
					
					
				}
				
				newChallenge.setChall_reg_id(userId);
				
				if ("일상용".equals(newChallenge.getChall_category()) && (region_district == null || region_district.isEmpty())) {
					newChallenge.setRegion_id(null);
				} else {
					int regionId = service.getIdByDistrict(region_district);
					newChallenge.setRegion_id(regionId);
					System.out.println("새로운 챌린지 정보2 : " + newChallenge);
				}
				
				newChallenge.setRace_id(raceId);
				System.out.println("새로운 챌린지 정보3 : " + newChallenge);
				challResult = challService.insertChallenge(newChallenge);
				
				if(challResult) {
					System.out.println("등록완료");
					
					int challId = newChallenge.getChall_id();
					System.out.println(challId);
					session.setAttribute("challId", challId);
					session.removeAttribute(raceId);
					challService.insertHost(userId, challId);
					
					return "registChallRoute";
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				return "challenge";
			}
			return "challenge";
		}
		
	
	@RequestMapping(value = "/registChall/selectChallRace" , method = RequestMethod.GET)
	public String selectRace(Model model) {
		List<RaceAndRegion> raceList = raceService.getAllRaces();
		model.addAttribute("raceList", raceList);
		return "selectChallRace";
	}
	

	@RequestMapping(value="/getRaceId",  method=RequestMethod.POST)
	@ResponseBody
	String getRace(@RequestBody String raceId,HttpSession session, Model model) throws Exception {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(raceId);
		
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
	
	@RequestMapping(value="/getRegionIdByRaceId", method=RequestMethod.POST)
	@ResponseBody
	String getRegionIdByRaceId(@RequestBody String raceId) throws Exception {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(raceId);
		int regionId = raceService.getRegionIdByRaceId(Integer.parseInt(jsonObj.get("raceId").toString()));
		return Integer.toString(regionId);
	}
	@RequestMapping(value="/getStateById", method=RequestMethod.POST)
	@ResponseBody
	String getStateyId(@RequestBody String regionId) throws Exception {
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(regionId);
		String state= service.getStateById(Integer.parseInt(jsonObj.get("regionId").toString()));
		return state;
	}
	
	@RequestMapping(value="/getCityById", method=RequestMethod.POST)
	@ResponseBody
	String getCityById(@RequestBody String regionId) throws Exception {
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(regionId);
		String city = service.getCityById(Integer.parseInt(jsonObj.get("regionId").toString()));
		return city;
	}
	
	@RequestMapping(value="/getDistrictById", method=RequestMethod.POST)
	@ResponseBody
	String getDistrictById(@RequestBody String regionId) throws Exception {
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(regionId);
		String district = service.getDistrictById(Integer.parseInt(jsonObj.get("regionId").toString()));
		return district;
	}

	// 전체 챌린지 리스트
	@GetMapping("/challenge")
	public String getAllChall(Model model) {
		List<ChallengeRegion> challList = challService.getAllChallR();
		model.addAttribute("challList", challList);
		return "challenge";
	}
	
	// 검색필터를 통해 보여지는 챌린지 리스트
	@GetMapping("/challenge/filter")
	public String getChallByOption(@RequestParam(value="opt[]", required=false) List<String> opt, @RequestParam(value="val[]", required=false) List<String> val, @RequestParam(value="keyword") String keyword, Model model) {
		List<ChallengeRegion> challList = null;
		if(opt==null && (keyword==null||keyword=="")) {
			challList=challService.getAllChallR();
			model.addAttribute("challList", challList);
			return "/challengeFilter";
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
			List<UserChallenge> parList = new ArrayList<UserChallenge>();
			UserChallenge userChall=new UserChallenge();
			for(UserChallenge uc:userList) {
				if(uc.getUser_id().equals(userId))
					userChall = uc;
				if(uc.getChall_reg_status().equals("Y"))
					parList.add(uc);
					
			}
			model.addAttribute("challenge", challenge);
			model.addAttribute("userChall", userChall);
			model.addAttribute("host", host);
			model.addAttribute("userList", parList);
			return "/challengeDetail";
		}

	
	// 챌린지 신청
	@RequestMapping(value="/challenge/{chall_id}/apply", method = RequestMethod.POST)
	public String applyByChallId(@PathVariable int chall_id,
								HttpSession session, 
								@RequestParam("applyId") String applyId,
								RedirectAttributes rttr) {
		if(applyId==null || applyId=="") {
			return "redirect:/login";
		}
		int isOtherApply=0;
		isOtherApply = challService.checkOtherChall(applyId);
		if(isOtherApply ==0) {
			challService.applyByChallId(applyId, chall_id);
		}
		else
			rttr.addFlashAttribute("isTrue", "존재");
		
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
		

	//인증게시판 리스트
		@RequestMapping(value="challenge/{chall_id}challengePost")
		public String getPostByChallId(@PathVariable int chall_id, Model model, HttpSession session) {
			Challenge challenge = challService.getChallByChallId(chall_id);
			User host = challService.getHostByChallId(chall_id);
			String userId = (String) session.getAttribute("userId");
			List<UserChallenge> userList = challService.getUserByChallId(chall_id);
			UserChallenge userChall=new UserChallenge();
			List<ChallengePost> postList = challService.getPostByChallId(chall_id);
			model.addAttribute("postList", postList);
			
			model.addAttribute("challenge", challenge);
			model.addAttribute("userChall", userChall);
			model.addAttribute("host", host);
			model.addAttribute("userList", userList);
			return "challengePost";
		}

		@RequestMapping(value = "/challenge/challPostDetail{auth_id}", method = RequestMethod.GET)
		public String getPostByAuthId(@PathVariable int auth_id, Model model) {
			ChallengePost post = challService.getPostByAuthId(auth_id);
			
			
			model.addAttribute("post", post);
			
			return "challengePostDetail";
		}
		
		@RequestMapping(value = "/modifyPost/{auth_id}", method = RequestMethod.GET)
		public String updateChallPostForm(@PathVariable int auth_id,
									Model model) {
			ChallengePost post = challService.getPostByAuthId(auth_id);
			
			model.addAttribute("post", post);
			
			return "updateChallPost";
		}
		//수정
		@RequestMapping(value = "/updatePost/{auth_id}", method = RequestMethod.POST)
		public String updateChallPost(@PathVariable int auth_id, 
								@ModelAttribute("auth_title") String auth_title,
								@ModelAttribute("auth_cont") String auth_cont) {
			
			
			boolean result = false;
			
			ChallengePost post = challService.getPostByAuthId(auth_id);
			post.setAuth_title(auth_title);
			post.setAuth_cont(auth_cont);
			
			try {
				 result = challService.updateChallPost(post);
				 
				 if(result) {
//					 
					 return "redirect:/challenge/challengePost"+auth_id;
				 }
			} catch (Exception e) {
				e.printStackTrace();
				return "index";
			}
			
			return "index";
		}
		
		//삭제
		@RequestMapping(value = "/challenge/deletepost/{auth_id}", method = RequestMethod.GET)
		public String deletePostByAuthId(@PathVariable int auth_id) {
			
			
			boolean deletePost = false;
			
			challService.deletePostByAuthId(auth_id);
			deletePost = challService.deletePostByAuthId(auth_id);
			
				if(deletePost) {
					
					return "redirect:/challenge";
				}
				
			
			return "index";
		}

		
		@RequestMapping(value="/challenge/{chall_id}insertChallPost", method = RequestMethod.GET)		//게시글 작성 화면 호출
	    public String insertChallPostForm(@PathVariable int chall_id, Model model) throws Exception{
			System.out.println(chall_id);
			model.addAttribute("chall_id", chall_id);
	    	return "/insertChallPost";
	    }
		
		@RequestMapping(value="/challenge/{chall_id}/insertChallPost", method = RequestMethod.POST)
		public String insertChallPost(@PathVariable int chall_id, @ModelAttribute ChallengePost challpost, Model model, HttpSession session) throws Exception {
			String userId = (String)session.getAttribute("userId");
			boolean challPostResult = false;
			boolean authNum = false;
			System.out.println(challpost);
		
			try {
				System.out.println(challpost);
				challpost.setComment_id(userId);
				challPostResult = challService.insertChallPost(challpost);
				
				if(challPostResult) {
					System.out.println("등록완료");
					authNum = challService.updateAuthNum(userId, chall_id);
					if(authNum) {
						return "redirect:/challenge/"+chall_id;
					}
					return "index";
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				return "index";
			}
			
			return "/challenge"+chall_id;
		}
		
		

	
		

	// 챌린지 수정폼
		@RequestMapping(value="/challenge/{chall_id}modify")
		public String updateByChallId(@PathVariable int chall_id, Model model, HttpSession session) {
			String userId = (String) session.getAttribute("userId");
			User host = challService.getHostByChallId(chall_id);
			if(!host.getUser_id().equals(userId))
				return "redirect:/challenge/"+chall_id;
			
			Challenge chall = challService.getChallByChallId(chall_id);
			List<String> stateList = service.getAllState();
			
			model.addAttribute("stateList",stateList);
			model.addAttribute("chall", chall);
			
			return "updateChall";
		}
		
		// 챌린지 수정
		@RequestMapping(value = "/challenge/updateChall{chall_id}", method = RequestMethod.POST)
		public String updateChall(@ModelAttribute Challenge updateChallenge,
								 Model model,
								 @RequestParam String region_district,
								 @PathVariable int chall_id,
								 HttpSession session) throws Exception {
			String userId = (String) session.getAttribute("userId");

			boolean challResult = false;
			
		
			try {
				updateChallenge.setChall_id(chall_id);
				updateChallenge.setRegion_id(service.getIdByDistrict(region_district));
				challResult = challService.updateChallenge(updateChallenge);
				
				if(challResult) {
					if(updateChallenge.getChall_sit().equals("모집종료"))
						challService.deleteApplyUserbyChallId(chall_id);
					return "redirect:/challenge/"+chall_id;
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				return "index";
			}
			return "index";
		}
		
		@RequestMapping(value = "/challenge/delete/{chall_id}", method = RequestMethod.GET)
		String deleteChallbyChallId(@PathVariable int chall_id, HttpSession session) {
			String userId = (String) session.getAttribute("userId");
			User host = challService.getHostByChallId(chall_id);
			if(!host.getUser_id().equals(userId))
				return "redirect:/challenge";
			
			boolean deleteChall = false;
			
			
				challService.deleteUserchallbyChallId(chall_id);
				challService.deleteRoutebyChallId(chall_id);
				deleteChall = challService.deleteChallbyChallId(chall_id);
				
				if(deleteChall) {
					System.out.println("챌린지 삭제");
					return "redirect:/challenge";
				}
			return "index";
		}
		
		@RequestMapping(value="challenge/{challId}calendar")
		String calendarbyChallId(@PathVariable int challId, HttpSession session, Model model) {
			String userId = (String)session.getAttribute("userId");
			UserChallenge myUC = new UserChallenge();
			User host = challService.getHostByChallId(challId);
			List<UserChallenge> userList = challService.getUserByChallId(challId);
			List<UserChallenge> parList = new ArrayList<UserChallenge>();
			List<ChallengePost> postList = challService.getPostByUserandChall(userId, challId);
			Challenge chall = challService.getChallByChallId(challId);
			Date date = chall.getChall_start_date();
			System.out.println(date);
			int count =0;
			int totalAuth=0;
			for(UserChallenge uc:userList) {
				if(uc.getUser_id().equals(userId) && uc.getChall_reg_status().equals("Y"))
					myUC = uc;
				if(uc.getChall_reg_status().equals("Y")) {
					totalAuth += uc.getChall_auth_num();
					count++;
					parList.add(uc);
				}
				
				
			}
			float avgAuth = totalAuth/count;
			model.addAttribute("myUC", myUC);
			model.addAttribute("chall", chall);
			model.addAttribute("avgAuth", avgAuth);
			model.addAttribute("parList", parList);
			model.addAttribute("host", host);
			model.addAttribute("postList", postList);
			return "challengeCalendar";
		}
		
		// 다른 사람 피드로 이동
		@RequestMapping(value = "/feed/{otherId}", method = RequestMethod.GET)
		public String getAllFeeds(@PathVariable String otherId, Model model, HttpSession session) throws Exception {
			String userId =(String) session.getAttribute("userId");
			
			User user = userService.getUserByUserId(otherId);
			
			model.addAttribute("user", user);
			
			List<PersonalFeed> feedList = feedService.getAllFeeds();
			model.addAttribute("feedList", feedList);
			
			List<FeedPicture> picList = pictureservice.getAllFeedPicture();
			model.addAttribute("picList", picList);
			
			if(userId.equals(otherId)) {
				return "/mypage_feed";
			}
			
			else {
				model.addAttribute("other", otherId);
				return "otherFeed";
			}
		 }
		
		// 다른 사람 챌린지로 이동
				@RequestMapping(value = "/otherChall/{otherId}", method = RequestMethod.GET)
				public String getOtherChall(@PathVariable String otherId, Model model, HttpSession session) throws Exception {
					String userId =(String) session.getAttribute("userId");
					
					User user = userService.getUserByUserId(otherId);
					List<ChallengeRegion> myChallList = challService.getChallByUserId(otherId);
					List<UserChallenge> myUCList = challService.getUserChallbyUserId(otherId);
					model.addAttribute("user", user);
					model.addAttribute("myUCList", myUCList);
					model.addAttribute("myChallList", myChallList);
					
					if(userId.equals(otherId)) {
						return "/mypage_feed";
					}
					
					else {
						return "otherChall";
					}
				 }
		
		@Scheduled(cron = "0 0 0 * * *")
		public String updateChallSit() {
			boolean updateChallSit = challService.updateChallSit();
			
			if(updateChallSit) {
				return "redirect:/main";
			}
			
			else
				return "redirect:/challenge";
		}

}
