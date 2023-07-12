package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.MailService;
@Controller
public class MailController {
	@Autowired
	private MailService mailservice;
	
	// 메일인증 
	@RequestMapping(value="/mailConfirm", method=RequestMethod.POST)
	@ResponseBody
	Map<String, String> mailConfirm(@RequestBody String userId) throws Exception {
		System.out.println(userId);
		String code = mailservice.sendSimpleMessage(userId);
		System.out.println("인증코드 : " + code);
		Map<String, String >resCode = new HashMap<String, String>();
		resCode.put("code", code);
		return resCode;
	}
	
}
