package com.spring.service;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.spring.dto.FeedPicture;
import com.spring.mapper.FeedPictureMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedPictureService {
	
	@Autowired
	FeedPictureMapper feedpicturemapper;
	
	public FeedPicture getFeedPictureByFileNo(int fileNo) throws Exception { 
		FeedPicture feedpicture = feedpicturemapper.getFeedPictureByFileNo(fileNo);
		
		if(feedpicture == null) {
			throw new Exception("존재하지 않는 파일");
		}
		
		return feedpicture;
	}
	
	public boolean insertFeedPicture(MultipartFile file, int feed_id) throws Exception {
		boolean result = false;
		
		if(file == null) {
			throw new Exception("파일 전달 오류 발생");
		}
		
		String feed_pic_path = "C:/images/";
		String feed_pic_title = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String feed_pic_uuid = uuid.toString();
	
		FeedPicture feedpicture = FeedPicture.builder().feed_pic_title(feed_pic_title)
														.feed_pic_uuid(feed_pic_uuid)
														.feed_pic_path(feed_pic_path)
														.feed_id(feed_id)																
														.build();		

		int res = feedpicturemapper.insertFeedPicture(feedpicture);
		
		
		if(res != 0) {
			// 실제 서버에 저장되는 로직 추가!!! (feedpicture.trasferTo())
			file.transferTo(new File(feed_pic_path + "\\" + feed_pic_title)); // 서버에 저장하는 로직 즉, 내가 지정한 위치에 파일을 저장하는가
			
			result = true;
		} else {
			throw new Exception("사진 저장 실패");
		}
		
		return result;
	}

	public FeedPicture getFeedPictureByfeedid(int feed_id) {
		
		FeedPicture feedpicture = null;
		
		feedpicture = feedpicturemapper.getFeedPictureByfeedid(feed_id);
		
		return feedpicture;
	}	
	
}
