package com.spring.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FeedPicture {
	private int feed_pic_id; 				// 파일 번호
	private int feed_id;					// 파일 저장 경로(base경로 + 새로운 폴더 경로)
	private Date feed_pic_date;				// 파일 등록 일자
	private String feed_pic_title;			// 파일명(UUID + 원본파일명)
	private String feed_pic_path;			// 원본 파일명
	private String feed_pic_uuid; 			// 부서 번호

	@Builder
	public FeedPicture(int feed_pic_id, int feed_id, Date feed_pic_date, String feed_pic_title,
							String feed_pic_path, String feed_pic_uuid) {
		this.feed_pic_id = feed_pic_id;
		this.feed_id = feed_id;
		this.feed_pic_date = feed_pic_date;
		this.feed_pic_title = feed_pic_title;
		this.feed_pic_path = feed_pic_path;
		this.feed_pic_uuid = feed_pic_uuid;
	}
}