package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.dto.User;

@Mapper
public interface UserMapper {
	
	// List
	public List<User> getAllUsers();

	// 객체 - User
	public Optional<User> getUserByUserId(int userid);
	
	public int insertUser(User user) throws SQLException;
	
	// update - user
	public int updateUserId(User user) throws SQLException; 

	// delete - user
	public int deleteUserByUserId(int userid)throws SQLException;

	public int idCheck(String userId) throws Exception;

	public int nickNameCheck(String nickName) throws Exception;
	
	public String findPw(String user_id, String pw_quest, String pw_quest_answer) throws Exception;

	public boolean updatePw(String new_pw, String user_id) throws Exception;
	
	// user - id
	public User getUserByUserId(@Param("userId")String userId) throws SQLException;

	// update - user
	public int updateUserProfile(User user) throws SQLException;
}
	