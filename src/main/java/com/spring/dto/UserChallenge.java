package com.spring.dto;

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
public class UserChallenge {
	private String user_id;
	private int chall_id;
	private int chall_auth_num;
	private String chall_reg_status;
	private String user_chall_status;
	private String user_reg_status;
	private int user_deny_num;

}
