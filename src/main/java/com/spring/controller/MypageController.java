package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MypageController {
	// 커밋
	@GetMapping("/mypage_feed")
	public String mypage_feed() {
		System.out.println("feed");
		return "mypage_feed";
	}	
	
	@GetMapping("/mypage_chall")
	public String mypage_chall() {
		System.out.println("chall");
		return "mypage_chall";
	}	
	
	@GetMapping("mypage_title")
	public String events() {
		System.out.println("title");
		return "mypage_title";
	}
	

}
