package com.spring.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.FeedPicture;

@Mapper
public interface FeedPictureMapper {
	
	FeedPicture getFeedPictureByFileName(int filename) throws SQLException;

	int insertFeedPicture(FeedPicture feedpicture) throws SQLException; // int 인 이유는 갯수로 넘어오기 때문?

	public List<FeedPicture> getAllFeedPicture();
	
}
