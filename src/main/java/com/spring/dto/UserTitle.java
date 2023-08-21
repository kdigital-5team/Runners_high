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
public class UserTitle {
	private int title_acq;
	private String user_id;
	private int title_id;
	
	// title_id 객체 관계 설정
	private static Title titleDto;
	
	public void setTitleDto(Title titleDto) {
		this.titleDto = titleDto;
	}
	
	public static Title getTitleDto() {
		return titleDto;
	}
}
