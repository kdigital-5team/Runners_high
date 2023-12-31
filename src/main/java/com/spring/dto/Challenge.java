package com.spring.dto;


import java.sql.Date;

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
public class Challenge {
    private int chall_id;
    private String chall_reg_id;
    private String region_id;
    private String race_id;
    private String chall_name;
    private String chall_intro;
    private Date chall_start_date;
    private Date chall_end_date;
    private int chall_all_auth;
    private int chall_week_auth;
    private String chall_category;
    private String chall_sit;
    private int chall_auth;
    private String chall_online;
    private int chall_size;
    private String chall_pic;
}
