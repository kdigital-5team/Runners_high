package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Challenge;

import com.spring.dto.ChallengePost;

import com.spring.dto.ChallengeRegion;

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

	public List<ChallengeRegion> getChallByOption(List<String> online, List<String> state, List<String> city, List<Integer> date, List<String> cat, List<String> con, String keyword) {
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

	public void applyByChallId(String applyId, int chall_id) {
		mapper.applyByChallId(applyId, chall_id);
		
	}

	public List<User> applicantByChallId(int chall_id) {
		return mapper.applicantByChallId(chall_id);
	}

	public void acceptIdbyChallId(String acceptId, int chall_id) {
		mapper.acceptIdbyChallId(acceptId, chall_id);
		
	}

	public void declineIdbyChallId(String declineId, int chall_id) {
		mapper.declineIdbyChallId(declineId, chall_id);
		
	}

	public void withdrawByChallId(String applyId, int chall_id) {
		mapper.withdrawByChallId(applyId, chall_id);
		
	}

	public void kickIdbyChallId(String kickId, int chall_id) {
		mapper.kickIdbyChallId(kickId, chall_id);
		
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


	//인증 게시판
	public List<ChallengePost> getAllPost() {
		
		return mapper.getAllPost();
	}

	public void insertChallPost(ChallengePost newPost) {

		mapper.insertChallPost(newPost);
		
	}

	public ChallengePost getPostByAuthId(int auth_id) {
		
		return mapper.getPostByAuthId(auth_id);

	}

	public boolean updateChallenge(Challenge updateChallenge) {
		return mapper.updateChallenge(updateChallenge);
	}

	public List<ChallengeRegion> getAllChallR() {
		return mapper.getAllChallR();

	}
	


}
