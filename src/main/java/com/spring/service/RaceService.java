package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Race;
import com.spring.dto.Region;
import com.spring.dto.SearchKeyword;
import com.spring.mapper.RaceMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RaceService {
	@Autowired
	RaceMapper mapper;
	
	public List<Race> getRaceWithKeyword(SearchKeyword keyword) {
		return mapper. getRaceWithKeyword(keyword);
	}
	
	public List<String> getAllState() {
		return mapper.getAllState();
	}

	public List<Race> getAllRace() {
		return mapper.getAllRace();
	}

	public List<Race> getRaceByOption(List<String> category, String dist, List<Integer> date, List<String> con, List<String> state, List<String> city, String keyword) {
		return mapper.getRaceByOption(category, dist, date, con, state, city, keyword);
	}

	
	

	

}
