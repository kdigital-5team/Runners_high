package com.spring.mapper;



import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Route;


@Mapper
public interface RouteMapper {

	public int insertRoute(int chall_id, String latitude, String longitude)throws SQLException;

	public List<Route> getlatLongById(int challId);

}
