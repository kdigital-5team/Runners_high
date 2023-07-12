package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.dto.User;
import com.spring.service.UserService;

@Controller
public class MypageController {

	@Autowired
	UserService service;

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
	public String EditForm(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession(false);
		System.out.println("접속 계정 : " + session.getAttribute("userId"));

		User user = service.getUserByUserId(session.getAttribute("userId").toString());
		System.out.println(
				"닉네임 : " + user.getNickname() + "\n아이디 : " + user.getUser_id() + "\n한줄 소개 : " + user.getIntro());

		model.addAttribute("loginUser", user);
		
		if(session == null || !request.isRequestedSessionIdValid()) {
			model.addAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
			return "login";
		}
		
		return "mypageEdit";
	}

	// 프로필 수정
//	@PostMapping("/mypage/edit")
//	public String edit()  {
//		
//	}

}
