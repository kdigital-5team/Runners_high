package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.User;
import com.spring.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service

public class UserService {
	@Autowired
	UserMapper mapper;
	
	// List
	public List<User> getAllUsers() {
		return mapper.getAllUsers();
	}

	// 객체
	public User getDeptByDeptno(int userid) throws Exception { 
		User user = mapper.getUserByUserId(userid)
							.orElseThrow(Exception::new);
						

		
		return user; 
	}
	
	public boolean insertDept(User user) throws SQLException, Exception {
		boolean result = false;
		
		int res = mapper.insertUser(user);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("유저 회원가 실패");
		}
		
		return result;
	}
}
