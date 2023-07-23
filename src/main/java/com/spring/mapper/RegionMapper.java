package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Race;
import com.spring.dto.Region;
import com.spring.dto.SearchKeyword;

@Mapper
public interface RegionMapper {
	
	public List<String> getAllState();
	public List<String> getCityByState(String state);
	public List<String> getDistrictByCity(String city);
	public String getIdByDistrict(String district);
	public Region getRegionById(int regionId);
	public String getStateById(int regionId);
	public String getCityById(int regionId);
	public String getDistrictById(int regionId);
	public String getIdByStateCityDistrict(String region_state, String region_district, String region_city);

}
