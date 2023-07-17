package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;

import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.dto.FeedPicture;
import com.spring.service.FeedPictureService;

@Controller
public class FeedPictureController {
	
	@Autowired
	FeedPictureService pictureService;
	
	@GetMapping("/feed/write")
	public ResponseEntity<Resource> downloadFile(@PathVariable int fileNo){
		System.out.println(fileNo);
		
		FeedPicture feedpicture = null;
		Resource resource = null;
		HttpHeaders headers = null;
		
		try {
			feedpicture = pictureService.getFeedPictureByFileNo(fileNo);
			
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
