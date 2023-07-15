package com.spring.mapper;



import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface RouteMapper {

	public int insertRoute(int chall_id, String latitude, String longitude)throws SQLException;
}
