package com.spring.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class AuthPicture {
	private int auth_pic_id;
	private int auth_id;
	private String auth_pic_uuid;
	private Date auth_pic_date;
	private String auth_pic_title;
	private String auth_pic_path;
}
