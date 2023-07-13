package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.PersonalFeed;

public interface FeedService {
	
	public List<PersonalFeed> getAllFeeds();
	
	public boolean insertFeed(PersonalFeed pf) throws SQLException, Exception;

}
