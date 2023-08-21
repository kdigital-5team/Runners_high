package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.spring.service.TitleService;

@Controller
public class titleController {
	
	@Autowired
	TitleService service;

	// 칭호 자동 부여
	public String updateUserTitle()  {
		// 회원가입 칭호
		
		// 챌린지 등록 수
		
		// 좋아요 수
		
		// 완료 챌린지 수
		
		
	}
	
	// 주기 설정
	/*
	@Scheduled(cron = "0 0 * * * *")
	public String updateChallSit() {
		boolean updateChallSit = challService.updateChallSit();
		System.out.println("챌린지 상태 업데이트");
		
		if(updateChallSit) {
			return "redirect:/main";
		}
		
		else
			return "redirect:/challenge";
	}
	*/
}
