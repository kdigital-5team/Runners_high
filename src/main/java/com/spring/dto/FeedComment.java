package com.spring.dto;

import java.util.Date;

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
public class FeedComment {
	private int feed_comment_id;
	private int feed_id;
	private String user_id;
	private Date feed_comment_date;
	private String feed_comment_cont;
	
	private String user_pic;
	private String nickname;
}
