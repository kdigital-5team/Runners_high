package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Challenge;
import com.spring.dto.SearchKeyword;
import com.spring.mapper.ChallengeMapper;

@Service
public class ChallengeService {
	@Autowired
	ChallengeMapper mapper;
	
	public List<Challenge> getChallWithKeyword(SearchKeyword keyword) {
		return mapper.getChallWithKeyword(keyword);
	}

}
