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
	/* user_chall 테이블의 user_chall_status 'Y' 개수
	 * 데이터 가지고 오는 것까지 됐으니 count 3 이상 되는 것들은 insert 진행해주는 코드 추가해주면 됨!  */
	public boolean insertTitle2()  {
		
		List<UserChallenge> users = challService.getAllUserChall();
		
		if (users != null) {
			
			List<Map<String, Object>> userStatusCount = challService.getUserByChallStatus();
			System.out.println("userStatusCount : " + userStatusCount);
			
			
			for(Map<String, Object> userData : userStatusCount) {
				String userId = (String) userData.get("USER_ID");
				int userCount = ((Number) userData.get("COUNT")).intValue();
				
				System.out.println("user Id : " + userId + " userCount : " + userCount);
			}
			
			return true;
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
			
			for(String hostId : challengeIds) {
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
