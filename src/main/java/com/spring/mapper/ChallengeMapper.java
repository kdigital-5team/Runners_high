package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Challenge;
import com.spring.dto.SearchKeyword;

@Mapper
public interface ChallengeMapper {

	public List<Challenge> getChallWithKeyword(SearchKeyword keyword);

}
