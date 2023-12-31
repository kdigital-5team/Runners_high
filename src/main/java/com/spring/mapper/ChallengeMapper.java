package com.spring.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.scheduling.annotation.Scheduled;

import com.spring.dto.AuthComment;
import com.spring.dto.AuthLike;
import com.spring.dto.AuthPicture;
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

	public int insertChallPost(ChallengePost challpost);

	public ChallengePost getPostByAuthId(int auth_id);

	public boolean updateChallenge(Challenge updateChallenge);

	public List<ChallengeRegion> getAllChallR();


	public int insertPost(ChallengePost newPost);

	public boolean deleteUserchallbyChallId(int challId);

	public boolean deleteChallbyChallId(int challId);

	public boolean deleteRoutebyChallId(int challId);

	public void deleteApplyUserbyChallId(int chall_id);

	public void insertHost(String userId, int challId);

	public int checkOtherChall(String applyId);

	public boolean updateChallSit();
	
	public List<ChallengePost> getPostByChallId(int chall_id);

	public boolean updateChallPost();
	
	public List<ChallengeRegion> getChallByUserId(String userId);

	public List<UserChallenge> getUserChallbyUserId(String userId);

	public boolean deletePostByAuthId(int auth_id, String userId);

	public boolean updateAuthNum(String userId, int chall_id);

	public List<ChallengePost> getPostByUserandChall(String userId, int challId);

	public String getUserByChallIdAndUserId(String userId, int chall_id);

	public void deleteAuthNum(String userId, int chall_id);

	public boolean updatePost(ChallengePost challpost, int authId);

	public boolean insertComment(AuthComment authComment);

	public List<AuthComment> getAllComment(int auth_id);

	public User getUserbyAuthId(int auth_id);

	public boolean insertPostLike(String authId, String userId);

	public List<AuthLike> getAllLike(int auth_id);

	public boolean deletePostLike(String authId, String userId);

	public boolean deleteComment(int commentId);

	public boolean insertAuthPicture(AuthPicture authPicture);

	public AuthPicture getImgbyAuthId(int auth_id);

	public boolean deletePicbyAuthId(int authId);

	public void deleteAuthComment(int authId);

	public void deleteAuthLike(int authId);
	
	// 챌린지 등록자 세기
	public int countChallReg(String hostId);

	// 완료 챌린지 유저 리스트
	public List<Map<String, Object>> getUserByChallStatus();

	// 전체 userChall
	public List<UserChallenge> getAllUserChall();

	public void updateChallStatus();


}
