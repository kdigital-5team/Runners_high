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
public class Race {
	private int race_id;
	private int region_id;
	private String race_org;
	private String race_name;
	private Date race_date;
	private Date race_apply;
	private Date race_deadline;
	private String race_url;
	private String race_category;
	private String race_dist;
	private String race_pic;
	private String race_con;

}
