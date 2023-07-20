package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Race;
import com.spring.dto.RaceAndRegion;
import com.spring.dto.SearchKeyword;

@Mapper
public interface RaceMapper {
	

	public List<RaceAndRegion> getRaceByOption(List<String> category, String dist, List<Integer> date, List<String> con, List<String> state, List<String> city, String keyword);

	public List<RaceAndRegion> getAllRaces();

	public int getRegionIdByRaceId(int raceId);

	



	

}
