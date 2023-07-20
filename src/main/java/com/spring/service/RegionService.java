package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Race;
import com.spring.dto.Region;
import com.spring.dto.SearchKeyword;
import com.spring.mapper.RaceMapper;
import com.spring.mapper.RegionMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RegionService {
	@Autowired
	RegionMapper mapper;
	
	public List<String> getAllState() {
		return mapper.getAllState();
	}
	public List<String> getCityByState(String state) {
		return mapper.getCityByState(state);
	}
	public List<String> getDistrictByCity(String city) {
		return mapper.getDistrictByCity(city);
	}
	public String getIdByDistrict(String district) {
		return mapper.getIdByDistrict(district);
	}
	public Region getRegionbyId(int regionId) {
		return mapper.getRegionById(regionId);
	}
	public String getStateById(int regionId) {
		return mapper.getStateById(regionId);
	}
	public String getCityById(int regionId) {
		return mapper.getCityById(regionId);
	}
	public String getDistrictById(int regionId) {
		return mapper.getDistrictById(regionId);
	}


}
