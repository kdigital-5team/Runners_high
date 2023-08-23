package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.Title;
import com.spring.dto.UserTitle;

@Mapper
public interface TitleMapper {

	// 전체 칭호
	public List<Title> getAllTitles() throws SQLException;

	// 유저 칭호
	public List<UserTitle> getTitleByUserId(String userId) throws SQLException;

	// 유저 획득 칭호 정보
	public List<Title> getTitlesByTitleId(List<Integer> titleId) throws SQLException;

	// 회원가입 칭호 부여
	public int insertTitle1(String userId) throws SQLException;

	// 챌린지 등록 5회 이상 칭호 부여
	public int insertTitle3(String hostId) throws SQLException;


}
