package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Challenge;
import com.spring.dto.SearchKeyword;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;

@Mapper
public interface ChallengeMapper {
	public List<Challenge> getAllChall();

	public List<Challenge> getChallByOption(List<String> online, List<String> state, List<String> city, List<Integer> date, List<String> cat, List<String> con, String keyword);

	public Challenge getChallByChallId(int chall_id);

	public User getHostByChallId(int chall_id);

	public List<UserChallenge> getUserByChallId(int chall_id);

	public void applyByChallId(String userId, int chall_id);

	public List<User> applicantByChallId(int chall_id);
}
