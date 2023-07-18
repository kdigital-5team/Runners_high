package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.FeedPicture;
import com.spring.dto.PersonalFeed;
import com.spring.service.FeedPictureService;
import com.spring.service.FeedService;

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	private FeedService feedservice;
	
	@Autowired
	private FeedPictureService pictureservice;
	
	// 전체 피드 리스트
		 @GetMapping("/mypage/feed")
		 public String getAllFeeds(Model model) {
			 List<PersonalFeed> feedList = feedservice.getAllFeeds();
			 model.addAttribute("feedList", feedList);
			 return "mypage_feed";
		 }
	
	// 피드 작성 get
	 @GetMapping("/mypage/write")
	 public String getWrite() throws Exception {
	  logger.info("get feed write");
	  return "mypage_feed_write";
	 }
	
	// 피드 작성 post
	 @PostMapping("/mypage/write")
	 public String feedWrite(@ModelAttribute PersonalFeed pf,
			 					@RequestParam("file") MultipartFile file,
			 					Model model, HttpSession session) throws Exception {
	  logger.info("feed write");
	  
	  String view = "error";
	  
	  boolean feedResult = false;
	  boolean fileResult = false;
	  
	  try {
		  feedResult = feedservice.insertFeed(pf);
		  
		  int pfeed = pf.getFeed_id();
		  
		  fileResult = pictureservice.insertFeedPicture(file, pfeed);
		  
		  if(feedResult && fileResult) {
			  session.setAttribute("pfeed", pfeed);
			  view = "redirect:/main";
			  return view;
		  }
	  } catch (Exception e) {
		e.printStackTrace();
		return view;
	  	}	  
	  
	  return view;
	} 
	 
}
