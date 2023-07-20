package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Challenge;

import com.spring.dto.ChallengePost;

import com.spring.dto.ChallengeRegion;

import com.spring.dto.SearchKeyword;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;

@Mapper
public interface ChallengeMapper {
	public List<Challenge> getAllChall();

	public List<ChallengeRegion> getChallByOption(List<String> online, List<String> state, List<String> city, List<Integer> date, List<String> cat, List<String> con, String keyword);

	public Challenge getChallByChallId(int chall_id);

	public User getHostByChallId(int chall_id);

	public List<UserChallenge> getUserByChallId(int chall_id);



	public int insertChallenge(Challenge newChallenge);

	public void applyByChallId(String applyId, int chall_id);

	public List<User> applicantByChallId(int chall_id);
	
	public void acceptIdbyChallId(String acceptId, int chall_id);

	public void declineIdbyChallId(String declineId, int chall_id);

	public void withdrawByChallId(String applyId, int chall_id);

	public void kickIdbyChallId(String kickId, int chall_id);


	
	//인증게시판
	public List<ChallengePost> getAllPost();

	public void insertChallPost(ChallengePost newPost);

	public ChallengePost getPostByAuthId(int auth_id);

	public boolean updateChallenge(Challenge updateChallenge);

	public List<ChallengeRegion> getAllChallR();


	public int insertPost(ChallengePost newPost);

	public boolean deleteUserchallbyChallId(int challId);

	public boolean deleteChallbyChallId(int challId);

	public boolean deleteRoutebyChallId(int challId);


	public void insertHost(String userId, int challId);

	public void deleteApplyUserbyChallId(int chall_id);

}
