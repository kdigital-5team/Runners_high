package com.spring.controller;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.spring.dto.Challenge;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.dto.UserTitle;
import com.spring.service.ChallengeService;
import com.spring.service.TitleService;
import com.spring.service.UserService;

@Controller
public class TitleController {
	
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
					int titleId = 1;
					service.insertUserTitle(userId, titleId);
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
		
		List<UserChallenge> users = challService.getAllUserChall();
		
		if (users != null) {
			
			List<Map<String, Object>> userStatusCount = challService.getUserByChallStatus();
			
			for(Map<String, Object> userData : userStatusCount) {
				String userId = (String) userData.get("USER_ID");
				int userCount = ((Number) userData.get("COUNT")).intValue();
				
				if(userCount >= 3) {
					try {
						int titleId = 2;
						service.insertUserTitle(userId, titleId);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return true;
				}
			}
		}
		
		return false;
	}
	

	// 챌린지 등록 수
	/* challenge 테이블의 chall_reg_id 개수 */
	public boolean insertTitle3()  {
		List<String> challengeIds = new ArrayList<String>();
		List<Challenge> challenges = challService.getAllChall();
		
		if (challenges != null) {
			
			for(Challenge challenge : challenges) {
				String regId = challenge.getChall_reg_id();
				if (!challengeIds.contains(regId)) {
					challengeIds.add(regId);
				}
			}
			
			for(String userId : challengeIds) {
				int count = challService.countChallReg(userId);
				
				if (count >= 5) {
					try {
						int titleId = 3;
						service.insertUserTitle(userId, titleId);
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
	/* feed_like 테이블에서 feed_id의 전체 user_id 개수 합산
	 * 전체 피드게시글 좋아요 수로 해야함.
	 * 1. 피드 게시글 작성
	 * 2. 대상 유저의  피드 게시글 id 전부 가지고 오기
	 * 3. 30개 이상 좋아요 찍기
	 * 4. feed_like에서 게시글당 좋아요 수 가지고 온 뒤 합산
	 * 5. 30개 이상이면 칭호 부여  */
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
		
		System.out.println("유저 칭호 업데이트 [" + formattedDateTime + "]");
		
	}
}
