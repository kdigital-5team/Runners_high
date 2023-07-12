package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class MypageController {
	// 커밋
	@GetMapping("/mypage/feed")
	public String mypage_feed() {
		System.out.println("feed");
		return "mypage_feed";
	}	
	
	@GetMapping("/mypage/chall")
	public String mypage_chall() {
		System.out.println("chall");
		return "mypage_chall";
	}	
	
	@GetMapping("/mypage/title")
	public String events() {
		System.out.println("title");
		return "mypage_title";
	}
	
	// 프로필 수정으로 이동
	@GetMapping("/mypage/edit")
	public String EditForm(HttpServletRequest request,
						   Model model) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		
		return "mypage_edit";
	}
	
	// 프로필 수정
//	@PostMapping("/mypage/edit")
//	public String edit()  {
//		
//	}
	

}
