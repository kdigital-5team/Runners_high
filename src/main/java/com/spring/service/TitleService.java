package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Title;
import com.spring.dto.UserTitle;
import com.spring.mapper.TitleMapper;

@Service
public class TitleService {
	
	@Autowired
	TitleMapper titleMapper;

	public List<Title> getAllTitles() throws SQLException {
		return titleMapper.getAllTitles();
	}

	public UserTitle getTitleByUserId(String userId) throws SQLException {
		return titleMapper.getTitleByUserId(userId);
	}

}
