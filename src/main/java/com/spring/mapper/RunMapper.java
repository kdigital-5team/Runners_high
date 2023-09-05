package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.AuthRoute;
import com.spring.dto.ChallengePost;

@Mapper
public interface RunMapper {

	public int insertRoute(String userId, String latitude, String longitude, int authId) throws SQLException;

	public boolean insertRunPost(ChallengePost challengePost);

	public List<AuthRoute> getRunRoute(int authId);

	public String isExistRun(int auth_id);
}
