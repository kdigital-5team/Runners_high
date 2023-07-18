package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.dto.PersonalFeed;
import com.spring.service.FeedService;

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	private FeedService service;
	
	// 피드 작성 get
	 @GetMapping("/mypage/write")
	 public String getWrite() throws Exception {
	  logger.info("get feed write");
	  return "mypage_feed_write";
	 }
	
	// 피드 작성 post
	 @PostMapping("/mypage/write")
	 public String feedWrite(PersonalFeed pf) throws Exception {
	  logger.info("feed write");
	  
	  service.insertFeed(pf);
	  
	  return "redirect:/";
	 }
}
