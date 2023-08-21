package com.spring.dto;

import java.util.Objects;

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
	
	
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) return true;
	    if (obj == null || getClass() != obj.getClass()) return false;

	    Title otherTitle = (Title) obj;
	    return title_id == otherTitle.title_id;
	}

	@Override
	public int hashCode() {
	    return Objects.hash(title_id);
	}
}
