package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Route;
import com.spring.mapper.RouteMapper;

@Service
public class RouteService {
	@Autowired
	RouteMapper mapper;


	public boolean insertRoute(int chall_id, String latitude, String longitude) throws SQLException, Exception {
		
		
		boolean result = false;

		int res = mapper.insertRoute(chall_id, latitude, longitude);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("챌린지 추가 실패 ");
		}
		
		return result;
	}
	public List<Route> getlatLongById(int challId) {
		return mapper.getlatLongById(challId);
	}
}

