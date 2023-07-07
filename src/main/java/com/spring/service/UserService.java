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

	public int idCheck(String userId) throws Exception {
        return mapper.idCheck(userId);
    }



	public int nickNameCheck(String nickName) throws Exception{
		return mapper.nickNameCheck(nickName);
	}


	public String findPw(String user_id, String pw_quest, String pw_quest_answer) throws Exception{
		return mapper.findPw(user_id, pw_quest, pw_quest_answer);
	}
	public boolean updatePw(String new_pw, String user_id) throws Exception{
		return mapper.updatePw(new_pw, user_id);
	}

}
