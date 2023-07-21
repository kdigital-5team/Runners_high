package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;

import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.FeedPicture;
import com.spring.service.FeedPictureService;

@Controller
public class FeedPictureController {
	
	@Autowired
	FeedPictureService pictureService;
	
	@RequestMapping(value = "/get/pic", method = RequestMethod.GET)
	public String getAllFeedPicture(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession(false);
		System.out.println("접속 계정 : " + session.getAttribute("userId"));
		
		List<FeedPicture> picList = pictureService.getAllFeedPicture();
		model.addAttribute("picList", picList);
		
		return "/feed/write";		
	}
	
	
	@RequestMapping(value = "/feed/write", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(@PathVariable int fileNo){
		System.out.println(fileNo);
		
		FeedPicture feedpicture = null;
		Resource resource = null;
		HttpHeaders headers = null;
		
		try {
			feedpicture = pictureService.getFeedPictureByFileName(fileNo);
			
			Path path = Paths.get(feedpicture.getFeed_pic_path() + "\\" + feedpicture.getFeed_pic_title());
			resource = new InputStreamResource(Files.newInputStream(path));
			
			headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.setContentDisposition(ContentDisposition
														.builder("attachment")
														.filename(feedpicture.getFeed_pic_title())
														.build());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
