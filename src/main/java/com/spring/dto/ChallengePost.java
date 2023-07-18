package com.spring.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class ChallengePost {
	private int auth_id;
	private int chall_id;
	private String comment_id;
	private String auth_title;
	private String auth_cont;
	private Date auth_date;
	
	private String user_id;
	private String nickname;
	private String auth_pic_path;
}
