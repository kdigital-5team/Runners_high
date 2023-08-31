package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.FeedPicture;
import com.spring.dto.PersonalFeed;

public interface FeedService {
	
	public List<PersonalFeed> getAllFeeds();
	
	public boolean insertFeed(PersonalFeed pf) throws SQLException, Exception;

	public PersonalFeed getFeedByFeedId(int feed_id) throws SQLException, Exception;

	public boolean updateFeed(PersonalFeed pf) throws SQLException, Exception;

	boolean deleteFeedByFeedId(int feed_id) throws SQLException, Exception;

	public int getLikesByFeedId(int feedId) throws SQLException, Exception;

}
