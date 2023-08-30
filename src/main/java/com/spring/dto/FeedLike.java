package com.spring.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FeedLike {
	private int feed_id;
	private String user_id;
	
	
	private static PersonalFeed feedDto;
	
	public void setFeedDto(PersonalFeed feedDto) {
		this.feedDto = feedDto;
	}
	
	public static PersonalFeed getFeedDto() {
		return feedDto;
	}
}
