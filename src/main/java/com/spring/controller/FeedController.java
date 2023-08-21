package com.spring.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.FeedPicture;
import com.spring.dto.PersonalFeed;
import com.spring.dto.User;
import com.spring.service.FeedPictureService;
import com.spring.service.FeedService;
import com.spring.service.UserService;

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	private UserService service;
	
	@Autowired
	private FeedService feedservice;
	
	@Autowired
	private FeedPictureService pictureservice;
	
	// 전체 피드 리스트
	@RequestMapping(value = "/mypage/feed", method = RequestMethod.GET)
	public String getAllFeeds(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession(false);
		System.out.println("접속 계정 : " + session.getAttribute("userId"));
		
		User user = service.getUserByUserId(session.getAttribute("userId").toString());
		
		model.addAttribute("user", user);
		
		if (session == null || !request.isRequestedSessionIdValid()) {
			model.addAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
			return "login";
		}
		
		List<PersonalFeed> feedList = feedservice.getAllFeeds();
		model.addAttribute("feedList", feedList);
		
		List<FeedPicture> picList = pictureservice.getAllFeedPicture();
		model.addAttribute("picList", picList);
		
		return "mypage_feed";
	 }
	
	// 피드 작성 get
	 @RequestMapping(value = "/mypage/write", method = RequestMethod.GET)
	 public String getWrite(HttpServletRequest request, Model model) throws Exception {
		 HttpSession session = request.getSession(false);
		 
		 User user = service.getUserByUserId(session.getAttribute("userId").toString());
			
		 model.addAttribute("user", user);
		 
		 logger.info("get feed write");
		 return "mypage_feed_write";
	 }
	 
	// 피드 작성 post
	 @RequestMapping(value = "/mypage/write", method = RequestMethod.POST)
	 public String insertFeed(@ModelAttribute PersonalFeed pf,
			 					@RequestParam("file") MultipartFile file,
			 					Model model, HttpSession session) throws Exception {	
		 
		 User user = service.getUserByUserId(session.getAttribute("userId").toString());
			
		 model.addAttribute("user", user);
		 
		 logger.info("feed write");
		  
		 String view = "error";
		 
		 boolean feedResult = false;
		 boolean fileResult = false;
		  
		  try {
			  feedResult = feedservice.insertFeed(pf);
			  
			  int pfeed = pf.getFeed_id();
			  
			  fileResult = pictureservice.insertFeedPicture(file, pfeed);
			  
			  if(feedResult && fileResult) {
				  model.addAttribute("user", user);
				  
				  session.setAttribute("pfeed", pfeed);
				  view = "redirect:/mypage/feed";
				  return view;
			  }
		  } catch (Exception e) {
			e.printStackTrace();
			return view;
		  	}	  
		  
		  return view;
	} 
	
	 @RequestMapping(value = "/mypage/delete/{feed_id}", method = RequestMethod.GET)
	 public String deleteFeed(@PathVariable int feed_id, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		
		String view = "error";
		
		System.out.println(feed_id);
		
		boolean result1 = false;
		int result2 = 0;
		
		try {
			String filePath = "C:\\images";
			FeedPicture feedPicture = pictureservice.getFeedPictureByFeedId(feed_id);
			
			String fileName = feedPicture.getFeed_pic_title();
			
			File file = new File(filePath + "\\" + URLDecoder.decode(fileName,"UTF-8"));
			
			if(file.exists()) {
				file.delete();
			}
			
			result1 = feedservice.deleteFeedByFeedId(feed_id);
			
			if(result1) {
				view = "redirect:/mypage/feed";
				return view;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}		
		 
		return view;		 
	 }
	 
		// 피드 수정 get
	 @RequestMapping(value = "/mypage/feed/{feed_id}/modify", method = RequestMethod.GET)
	 public String getModify(HttpServletRequest request, Model model, @PathVariable int feed_id) throws Exception {
		 HttpSession session = request.getSession(false);
		 User user = service.getUserByUserId(session.getAttribute("userId").toString());
		 PersonalFeed userfeed = feedservice.getFeedByFeedId(feed_id);
		 FeedPicture picture = pictureservice.getFeedPictureByFeedId(feed_id);
		 
		 System.out.println(userfeed);
		 model.addAttribute("feed", userfeed);
		 model.addAttribute("user", user);
		 model.addAttribute("picture", picture);
		 
		 logger.info("get feed modify");
		 return "mypage_feed_modify";
	 }
	 
	 @RequestMapping(value = "/mypage/feed/{feed_id}/modify", method = RequestMethod.POST)
	 public String modifyFeed(@ModelAttribute PersonalFeed pf,
				@RequestParam("file") MultipartFile file,
				Model model, HttpSession session) throws Exception {
		 User user = service.getUserByUserId(session.getAttribute("userId").toString());
		 logger.info("post feed modify");
		 String view = "error";

		 boolean feedResult = false;
		 boolean fileResult = false;

		 try {
		 feedResult = feedservice.updateFeed(pf);

		 int pfeed = pf.getFeed_id();
		 deletePreviousUserPicFile(pfeed);
		 fileResult = pictureservice.insertFeedPicture(file, pfeed);
		 if(feedResult && fileResult) {
		 //if(feedResult) {
		 model.addAttribute("user", user);
		 session.setAttribute("pfeed", pfeed);
		 view = "redirect:/mypage/feed";
		 return view;
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 return view;
		 }	  

		 return view;
		 } 
	 
	 private void deletePreviousUserPicFile(int pfeed) throws Exception {

			System.out.println("deletePreviousUserPicFile 실행");
			FeedPicture userPicture = pictureservice.getFeedPictureByFeedId(pfeed);
			if (userPicture != null) {

				String filePath = userPicture.getFeed_pic_path() + userPicture.getFeed_pic_title();

				File previousePic = new File(filePath);
				System.out.println("삭제 대상 : " + previousePic);

				if (previousePic.exists()) {
					System.out.println("이전 사진 파일 존재");
					previousePic.delete();
					pictureservice.deleteFeedPicture(pfeed);
				} else {
					System.out.println("이전  사진 부재!");
				}
			}
		}
	 }
	 
	 
