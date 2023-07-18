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

public class PersonalFeed {
	private int feed_id;
	private String user_id;
	private String feed_title;
	private String feed_cont;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date feed_writing_date;
}
