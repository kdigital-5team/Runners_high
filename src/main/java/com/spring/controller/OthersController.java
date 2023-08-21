package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.ChallengeRegion;
import com.spring.dto.FeedPicture;
import com.spring.dto.PersonalFeed;
import com.spring.dto.Title;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.dto.UserTitle;
import com.spring.service.ChallengeService;
import com.spring.service.FeedPictureService;
import com.spring.service.FeedService;
import com.spring.service.RaceService;
import com.spring.service.RegionService;
import com.spring.service.RouteService;
import com.spring.service.TitleService;
import com.spring.service.UserService;


@Controller
public class OthersController {

	@Autowired
	private ChallengeService challService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private FeedPictureService pictureservice;
	
	@Autowired
	TitleService titleService;
	
	// 다른 사람 피드로 이동
	@RequestMapping(value = "/feed/{otherId}", method = RequestMethod.GET)
	public String getAllFeeds(@PathVariable String otherId, Model model, HttpSession session) throws Exception {
		String userId =(String) session.getAttribute("userId");
		if(userId==null)
			userId="";
		
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
				if(userId==null)
					userId="";
				
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
			
	// 다른 사람 칭호로 이동
			@RequestMapping(value = "/otherTitle/{otherId}", method = RequestMethod.GET)
			public String getOtherTitle(@PathVariable String otherId, Model model, HttpSession session) throws Exception {
				String userId =(String) session.getAttribute("userId");
				if(userId==null)
					userId="";
				
				User user = userService.getUserByUserId(otherId);
				List<Title> titleList = titleService.getAllTitles();
				UserTitle userTitle = titleService.getTitleByUserId(otherId);
				List<Title> userTitleList = new ArrayList<Title>();
				
				if (userTitle != null) {
					userTitleList = titleService.getTitlesByTitleId(userTitle.getTitle_id());
				}
				
				model.addAttribute("user", user);
				model.addAttribute("titleList", titleList);
				model.addAttribute("userTitleList", userTitleList);
				
				if(userId.equals(otherId)) {
					return "/mypage_title";
				}
				
				else {
					return "otherTitle";
				}
			 }					
}
