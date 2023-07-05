package com.spring.controller;

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
			HttpSession session) throws Exception {

		User user = service.getUserByUserIdAndUserPw(userId, userPw);

		session.setAttribute("userId", userId);
		System.out.println(session.getAttribute("userId"));

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
}
