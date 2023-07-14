package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.PersonalFeed;

@Mapper
public interface FeedMapper {
	
	// List
	public List<PersonalFeed> getAllFeeds();
		
	public int insertFeed(PersonalFeed pf) throws SQLException;
}
