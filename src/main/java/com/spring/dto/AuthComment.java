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
public class AuthComment {
	private int auth_comment_id;
	private int auth_id;
	private String user_id;
	private Date auth_comment_date;
	private String auth_comment_cont;
	
	private String user_pic;
	private String nickname;
}
