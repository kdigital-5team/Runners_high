package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Challenge;
import com.spring.dto.SearchKeyword;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.mapper.ChallengeMapper;

@Service
public class ChallengeService {
	@Autowired
	ChallengeMapper mapper;

	public List<Challenge> getAllChall() {
		return mapper.getAllChall();
	}

	public List<Challenge> getChallByOption(List<String> online, List<String> state, List<String> city, List<Integer> date, List<String> cat, List<String> con, String keyword) {
		return mapper.getChallByOption(online, state, city, date, cat, con, keyword);
	}


	public Challenge getChallByChallId(int chall_id) {
		return mapper.getChallByChallId(chall_id);
	}

	public User getHostByChallId(int chall_id) {
		return mapper.getHostByChallId(chall_id);
	}

	public List<UserChallenge> getUserByChallId(int chall_id) {
		return mapper.getUserByChallId(chall_id);
	}

	public void applyByChallId(String userId, int chall_id) {
		mapper.applyByChallId(userId, chall_id);
		
	}

	public boolean insertChallenge(Challenge newChallenge) throws SQLException, Exception {
		boolean result = false;

		int res = mapper.insertChallenge(newChallenge);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("챌린지 추가 실패 ");
		}
		
		return result;
	}
	


}
