package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Race;
import com.spring.dto.SearchKeyword;

@Mapper
public interface RaceMapper {
	
	public List<Race> getRaceWithKeyword(SearchKeyword keyword);
	
	public List<String> getAllState();

	public List<Race> getAllRace();

	public List<Race> getRaceByOption(List<String> category, String dist, List<Integer> date, List<String> con, List<String> state, List<String> city);

	



	

}
