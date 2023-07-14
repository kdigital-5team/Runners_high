package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Race;
import com.spring.dto.SearchKeyword;

@Mapper
public interface RegionMapper {
	
	public List<String> getAllState();
	public List<String> getCityByState(String state);
	public List<String> getDistrictByCity(String city);

}