package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.User;

@Mapper
public interface UserMapper {
	
	// List
	public List<User> getAllUsers();

	// 객체 - Dept
	public Optional<User> getUserByUserId(int userid);
	
	public int insertUser(User user) throws SQLException;
	
	// update - Dept
	public int updateUserId(User user) throws SQLException; 

	// delete - dept
	public int deleteUserByUserId(int userid)throws SQLException;
}
	