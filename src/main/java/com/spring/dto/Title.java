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
public class Title {
	private int title_id;
	private String title_name;
	private int title_complt;
	private int title_reg;
	private int title_likes;
}
