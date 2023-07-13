package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.PersonalFeed;
import com.spring.mapper.FeedMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired 
	private FeedMapper mapper;
	
	public List<PersonalFeed> getAllFeeds() {		
		return mapper.getAllFeeds();	
	}	
	
	@Override
	public boolean insertFeed(PersonalFeed pf) throws Exception {		
		boolean result = false;
		
		int res = mapper.insertFeed(pf);
		
		try {
			if(res != 0) {
				result = true;
			} else {
				throw new Exception("부서 생성 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
