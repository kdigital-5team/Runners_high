package com.spring.dto;

import org.springframework.stereotype.Component;

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
@Component
public class User {
	private String user_id;
	private String user_pw;
	private String pw_quest;
	private String pw_quest_answer;
	private String nickname;
	private String intro;
	private String user_title;
	private String user_pic;
	private int running_dist;
	private int running_time;
}