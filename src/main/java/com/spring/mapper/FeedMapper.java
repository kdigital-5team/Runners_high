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

	public int deleteFeedByFeedId(int feed_id) throws SQLException;

	public PersonalFeed getFeedByFeedId(int feed_id) throws SQLException;

	public int updateFeed(PersonalFeed pf) throws SQLException;

	public int getLikesByFeedId(int feedId) throws SQLException;

}
