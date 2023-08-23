package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RunController {

	@RequestMapping(value="/running")
	public String running() {
		return "runningRoute";
	}
}
