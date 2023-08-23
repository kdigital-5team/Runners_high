package com.spring.controller;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.spring.dto.Challenge;
import com.spring.dto.User;
import com.spring.dto.UserTitle;
import com.spring.service.ChallengeService;
import com.spring.service.TitleService;
import com.spring.service.UserService;

@Controller
public class titleController {
	
	@Autowired
	TitleService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ChallengeService challService;

	// 칭호 자동 부여
	
	// 회원가입 칭호
	/* rh_user 안에 있으면 업데이트 */
	public boolean insertTitle1() {
		List<User> users = userService.getAllUsers();
		if (users != null) {
			
			for(int i = 0; i < users.size(); i++) {
				String userId = users.get(i).getUser_id();
				
				try {
					service.insertTitle1(userId);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return true;
			
		}
		
		return false;
	}
	
	// 완료 챌린지 수
	/* user_chall 테이블의 user_chall_status 'Y' 개수 */
	public boolean insertTitle2()  {
		
		return false;
	}
	

	// 챌린지 등록 수
	/* challenge 테이블의 chall_reg_id 개수
	 * host id만 저장하는 리스트 생성 -> 아이디별 count?? 
	 * 
	 * */
	public boolean insertTitle3()  {
		
		List<Challenge> challenges = challService.getAllChall();
		if (challenges != null) {
			
			for(int i = 0; i < challenges.size(); i++) {
				String hostId = challenges.get(i).getChall_reg_id();
				
				int count = challService.countChallReg(hostId);
				
				if (count >= 5) {
					try {
						service.insertTitle3(hostId);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			return true;
		}
		return false;
	}
	
	// 좋아요 수
	/* feed_like 테이블에서 feed_id의 전체 user_id 개수 합산 */
	public boolean insertTitle4()  {
		return false;
	}
	
	
	// 칭호 업데이트 주기
	@Scheduled(cron = "0/60 * * * * *")
	public void updateTitleStatus() {
		
		insertTitle1();
		insertTitle2();
		insertTitle3();
		insertTitle4();
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = now.format(formatter);
		
		System.out.println("유저 칭호 업데이트" + formattedDateTime);
		
	}
}
