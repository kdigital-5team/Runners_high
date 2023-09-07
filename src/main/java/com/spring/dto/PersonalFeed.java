package com.spring.dto;

import java.util.Date;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null || getClass() != obj.getClass()) return false;
		
		PersonalFeed otherFeed = (PersonalFeed) obj;
		return feed_id == otherFeed.feed_id;
	}
	
	@Override
	public int hashCode() {
		return Objects.hashCode(feed_id);
	}

}
