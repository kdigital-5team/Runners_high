package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Race;
import com.spring.dto.RaceAndRegion;
import com.spring.dto.Region;
import com.spring.dto.SearchKeyword;
import com.spring.mapper.RaceMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RaceService {
	@Autowired
	RaceMapper mapper;
	

	public List<RaceAndRegion> getRaceByOption(List<String> category, String dist, List<Integer> date, List<String> con, List<String> state, List<String> city, String keyword) {
		return mapper.getRaceByOption(category, dist, date, con, state, city, keyword);
	}

	public List<RaceAndRegion> getAllRaces() {
		return mapper.getAllRaces();
	}

	public int getRegionIdByRaceId(int raceId) {
		return mapper.getRegionIdByRaceId(raceId);
		
	}

	public boolean updateRaceCon() {
		return mapper.updateRaceCon();
	}


	
	

	

}
