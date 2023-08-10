package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Title;
import com.spring.dto.UserTitle;

@Mapper
public interface TitleMapper {

	// 전체 칭호
	public List<Title> getAllTitles() throws SQLException;

	// 유저 칭호
	public UserTitle getTitleByUserId(String userId) throws SQLException;

}
