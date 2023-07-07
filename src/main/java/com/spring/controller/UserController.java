package com.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.User;
import com.spring.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;

	// http://localhost:8081/user/all
	@RequestMapping(value = "/user/all", method = RequestMethod.GET)
	public String getDeptByDeptno(Model model) throws Exception {
		List<User> user = service.getAllUsers();

		model.addAttribute("user", user);
		System.out.println(user);

		return "home";
	}

	// http://localhost:8081/login
	// 로그인 폼으로 이동
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			HttpSession session,
			Model mv){
		
		try {
			User user = service.getUserByUserIdAndUserPw(userId, userPw);
			
				session.setAttribute("userId", userId);
				System.out.println("접속자 session : " + session.getAttribute("userId"));
			
		} catch (Exception e) {
				mv.addAttribute("msg", e.getMessage());
				System.out.println("mv : " + mv);
//			e.printStackTrace();
			
			return "redirect:/login";
		}
		
		return "redirect:/main";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main";
	}
	
/* 0706 카카오 API 로그인
	// 카카오 로그인
	@GetMapping("/login/kakao")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("###code : " + code);
		
		String access_Token = service.getAccessToken(code);
		System.out.println("###access_Token : " + access_Token);
		
		HashMap<String, Object> userInfo = service.getUserByKakaoToken(access_Token);
		System.out.println("###userInfo : " + userInfo);
		
		return "test";
    	}
*/ 
}
