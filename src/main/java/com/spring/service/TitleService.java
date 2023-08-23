package com.spring.service;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

	public List<UserTitle> getTitleByUserId(String userId) throws SQLException {
		return titleMapper.getTitleByUserId(userId);
	}

	public List<Title> getTitlesByTitleId(List<Integer> titleId) throws SQLException {
		return titleMapper.getTitlesByTitleId(titleId);
	}

	// 칭호 중복 검수
	// 중복 칭호 없음 = true, 중복 칭호 있음 = false
	public boolean checkDuplicateUserTitle(String userId, int titleId) throws SQLException {
		List<UserTitle> userTitles = titleMapper.getTitleByUserId(userId);
		
		for(UserTitle userTitle : userTitles) {
			if(userTitle.getTitle_id() == titleId) {
				return false;
			}
		}
		return true;
	}
	
	// 회원가입 칭호
	public boolean insertTitle1(String userId) throws SQLException {
		
		int titleId = 1;
		if (checkDuplicateUserTitle(userId, titleId)) {
			int result = titleMapper.insertTitle1(userId);
			
			if(result == 1) {
				return true;
			}
		}
		return false;
	}

	// 챌린지 등록 5회 이상 칭호
	public boolean insertTitle3(String hostId) throws SQLException {

		int titleId = 2;
		if (checkDuplicateUserTitle(hostId, titleId)) {
			int result = titleMapper.insertTitle3(hostId);
			
			if(result == 1) {
				return true;
			}
		}
		return false;
	}




}
