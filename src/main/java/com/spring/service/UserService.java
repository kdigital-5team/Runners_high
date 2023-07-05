package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.User;
import com.spring.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Service
public class UserService {
	@Autowired
	UserMapper mapper;
	
	// List
	public List<User> getAllUsers() {
		return mapper.getAllUsers();
	}

	// 객체
	public User getUserByUserId(int userid) throws Exception { 
		User user = mapper.getUserByUserId(userid)
							.orElseThrow(Exception::new);
		return user; 
	}
	
	public boolean insertUser(User user) throws SQLException, Exception {
		boolean result = false;
		
		int res = mapper.insertUser(user);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("유저 회원가입 실패");
		}
		
		return result;
	}

	// 로그인
	public User getUserByUserIdAndUserPw(String userId, String userPw) throws Exception {
		
		User user = mapper.getUserByUserIdAndUserPw(userId, userPw);
		
		if(userId == null || userId == "") {
			throw new Exception("없는 이용자입니다.");
		}
		if(userPw == null || userPw == "") {
			throw new Exception("잘못된 비밀번호입니다.");
		}
		
		return user;
	}
}
