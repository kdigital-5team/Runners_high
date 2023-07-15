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
//route_marker = null Yes
public class Route {
	private int route_id;
	private int race_id;
	private int chall_id;
	private int route_lat;
	private String route_marker;
	private String route_marker_desc;

}
