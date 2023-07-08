package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	// 커밋
	@GetMapping("/gallery")
	public String home() {
		System.out.println("test");
		return "gallery";
	}
	
	@GetMapping("/main")
	public String main() {
		System.out.println("main으로 이동");
		return "index";
	}
}
