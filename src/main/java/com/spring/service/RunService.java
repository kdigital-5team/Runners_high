package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.AuthRoute;
import com.spring.dto.ChallengePost;
import com.spring.mapper.RunMapper;

@Service
public class RunService {
	@Autowired
	private RunMapper mapper;

	public boolean insertRoute(String userId, String latitude, String longitude, int authId)throws SQLException, Exception {
		boolean result = false;

		int res = mapper.insertRoute(userId, latitude, longitude, authId);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("챌린지 추가 실패 ");
		}
		
		return result;
	}

	public boolean insertRunPost(ChallengePost challengePost) {
		return mapper.insertRunPost(challengePost);
	}

	public List<AuthRoute> getRunRoute(int authId) {
		return mapper.getRunRoute(authId);
	}

	public String isExistRun(int auth_id) {
		return mapper.isExistRun(auth_id);
	}

}
