package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.ChallengePost;

@Mapper
public interface ChallengePostMapper {

	List<ChallengePost> getAllPost();
	
}
