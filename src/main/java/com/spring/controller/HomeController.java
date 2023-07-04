package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	// 커밋
	@GetMapping("home")
	public String home() {
		System.out.println("test");
		return "home";
	}
	
	@GetMapping("main")
	public String main() {
		System.out.println("test");
		return "index";
	}
	
	@GetMapping("events")
	public String events() {
		return "events";
	}
	
}
