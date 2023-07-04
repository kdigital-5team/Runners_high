package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.User;
import com.spring.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService service;

	
	// http://localhost:8081/dept/10
	@RequestMapping(value = "/user/all", method = RequestMethod.GET)
	public String getDeptByDeptno(Model model) throws Exception {
		List<User> user = service.getAllUsers();
		
		model.addAttribute("user", user);
		System.out.println(user);
		
		return "home";
	}
}
