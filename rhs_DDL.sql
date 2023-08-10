-- 테이블 초기화
DROP TABLE rh_user cascade constraint;
DROP TABLE title cascade constraint;
DROP TABLE user_title cascade constraint;
DROP TABLE personal_feed cascade constraint;
DROP TABLE feed_comment cascade constraint;
DROP TABLE feed_picture cascade constraint;
DROP TABLE feed_like cascade constraint;
DROP TABLE challenge cascade constraint;
DROP TABLE auth_post cascade constraint;
DROP TABLE auth_comment cascade constraint;
DROP TABLE auth_picture cascade constraint;
DROP TABLE auth_like cascade constraint;
DROP TABLE user_chall cascade constraint;
DROP TABLE race cascade constraint;
DROP TABLE region cascade constraint;
DROP TABLE race_route cascade constraint;
DROP TABLE chall_route cascade constraint;
DROP SEQUENCE title_seq;
DROP SEQUENCE personal_feed_seq;
DROP SEQUENCE feed_picture_seq;
DROP SEQUENCE region_seq;
DROP SEQUENCE race_seq;
DROP SEQUENCE challenge_seq;
DROP SEQUENCE post_seq;
DROP SEQUENCE user_title_seq;


-- 유저 테이블
CREATE TABLE rh_user (
    user_id         VARCHAR2(30 BYTE) NOT NULL,
    user_pw         VARCHAR2(100 BYTE) NOT NULL,
    pw_quest        VARCHAR2(50 BYTE) NOT NULL,
    pw_quest_answer VARCHAR2(50 BYTE) NOT NULL,
    nickname        VARCHAR2(30 BYTE) NOT NULL,
    intro           VARCHAR2(300 BYTE),
    user_title      NUMBER(10),
    user_pic        VARCHAR2(300 BYTE) DEFAULT 'default_image.png'
);

ALTER TABLE rh_user ADD CONSTRAINT user_pk PRIMARY KEY ( user_id );

-- 칭호 테이블
CREATE TABLE title (
    title_id     NUMBER(3) NOT NULL,
    title_name   VARCHAR2(30 BYTE) NOT NULL,
    title_complt NUMBER(5),
    title_reg    NUMBER(5),
    title_likes  NUMBER(5)
);

CREATE SEQUENCE title_seq
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1;

ALTER TABLE title ADD CONSTRAINT title_pk PRIMARY KEY ( title_id );

-- 유저 칭호 테이블
CREATE TABLE user_title (
    title_acq NUMBER(10) NOT NULL,
    user_id   VARCHAR2(30 BYTE) NOT NULL,
    title_id  NUMBER(10) NOT NULL
);

CREATE SEQUENCE user_title_seq
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1;

ALTER TABLE user_title ADD CONSTRAINT user_title_pk PRIMARY KEY ( title_acq );

-- 개인 피드 테이블
CREATE TABLE personal_feed (
    feed_id           NUMBER(20) NOT NULL,
    user_id           VARCHAR2(30 BYTE) NOT NULL,
    feed_title        VARCHAR2(100 BYTE) NOT NULL,
    feed_cont         VARCHAR2(500 BYTE),
    feed_writing_date DATE
);

CREATE SEQUENCE personal_feed_seq
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1;

ALTER TABLE personal_feed ADD CONSTRAINT personal_feed_pk PRIMARY KEY ( feed_id );

-- 피드 댓글 테이블
CREATE TABLE feed_comment (
    feed_comment_id   NUMBER(20) NOT NULL,
    feed_id           NUMBER(20) NOT NULL,
    user_id           VARCHAR2(30 BYTE) NOT NULL,
    feed_comment_date DATE,
    feed_comment_cont VARCHAR2(500 BYTE) NOT NULL
);

ALTER TABLE feed_comment ADD CONSTRAINT feed_comment_pk PRIMARY KEY ( feed_comment_id );

-- 피드 사진 테이블
CREATE TABLE feed_picture (
    feed_pic_id    NUMBER(10) NOT NULL,
    feed_id        NUMBER(20) NOT NULL,
    feed_pic_date  DATE NOT NULL,
    feed_pic_title VARCHAR2(100 BYTE) NOT NULL,
    feed_pic_path  VARCHAR2(300 BYTE) NOT NULL,
    feed_pic_uuid  VARCHAR2(300 BYTE) NOT NULL
);

CREATE SEQUENCE feed_picture_seq
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1;

CREATE TABLE feed_like(
    feed_id        NUMBER(20) NOT NULL,
    user_id        VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE feed_picture ADD CONSTRAINT feed_picture_pk PRIMARY KEY ( feed_pic_id );

-- 챌린지 테이블
CREATE TABLE challenge (
    chall_id         NUMBER(10) NOT NULL,
    chall_reg_id     VARCHAR2(30 BYTE) NOT NULL,
    region_id        NUMBER(5),
    race_id          NUMBER(5),
    chall_name       VARCHAR2(60 BYTE) NOT NULL,
    chall_intro      VARCHAR2(500 BYTE) NOT NULL,
    chall_start_date DATE NOT NULL,
    chall_end_date   DATE NOT NULL,
    chall_all_auth   NUMBER(3) NOT NULL,
    chall_week_auth  NUMBER(10)  NULL,
    chall_category   VARCHAR2(20 BYTE),
    chall_sit        VARCHAR2(20 BYTE),
    chall_auth       NUMBER(10),
    chall_online     VARCHAR2(20 BYTE),
    chall_size       NUMBER(20),
    chall_pic        VARCHAR2(300 BYTE)
);

CREATE SEQUENCE challenge_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

ALTER TABLE challenge ADD CONSTRAINT challenge_pk PRIMARY KEY ( chall_id );

-- 인증 게시글 테이블
CREATE TABLE auth_post (
    auth_id    NUMBER(20) NOT NULL,
    chall_id   NUMBER(20) NOT NULL,
    comment_id VARCHAR2(30 BYTE),
    auth_title VARCHAR2(20) NOT NULL,
    auth_cont  VARCHAR2(500 BYTE),
    auth_date  DATE
);

--시퀀스 추가
CREATE SEQUENCE post_seq 
    INCREMENT by 1
    START WITH 1
    MINVALUE 1;

ALTER TABLE auth_post ADD CONSTRAINT auth_post_pk PRIMARY KEY ( auth_id );

-- 인증 댓글 테이블
CREATE TABLE auth_comment (
    auth_comment_id   NUMBER(20) NOT NULL,
    auth_id           NUMBER(20) NOT NULL,
    user_id           VARCHAR2(30 BYTE) NOT NULL,
    auth_comment_date DATE NOT NULL,
    auth_comment_cont VARCHAR2(500 BYTE) NOT NULL
);

ALTER TABLE auth_comment ADD CONSTRAINT auth_comment_pk PRIMARY KEY ( auth_comment_id );

-- 인증 사진 테이블
CREATE TABLE auth_picture (
    auth_pic_id    NUMBER(10) NOT NULL,
    auth_id        NUMBER(20) NOT NULL,
    auth_pic_uuid  VARCHAR2(300 BYTE) NOT NULL,
    auth_pic_date  DATE NOT NULL,
    auth_pic_title VARCHAR2(100 BYTE) NOT NULL,
    auth_pic_path  VARCHAR2(300 BYTE) NOT NULL
);

CREATE TABLE auth_like(
    auth_id        NUMBER(20) NOT NULL,
    user_id        VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE auth_picture ADD CONSTRAINT auth_picture_pk PRIMARY KEY ( auth_pic_id );

-- 유저별 챌린지 테이블
CREATE TABLE user_chall (
    user_id           VARCHAR2(30 BYTE) NOT NULL,
    chall_id          NUMBER(20) NOT NULL,
    chall_auth_num    NUMBER(4) DEFAULT 0,
    chall_reg_status  VARCHAR2(1 BYTE) DEFAULT 'N',
    user_chall_status VARCHAR2(1 BYTE) DEFAULT 'N',
    user_reg_status   VARCHAR2(1 BYTE) DEFAULT 'N',
    user_deny_num     NUMBER(1) DEFAULT 0
);

-- 대회 테이블
CREATE TABLE race (
    race_id       NUMBER(5) NOT NULL,
    region_id     NUMBER(5) NOT NULL,
    race_org      VARCHAR2(80 BYTE),
    race_name     VARCHAR2(100 BYTE) NOT NULL,
    race_date     DATE NOT NULL,
    race_apply    DATE NOT NULL,
    race_deadline DATE NOT NULL,
    race_url      VARCHAR2(300 BYTE),
    race_category VARCHAR2(10) NOT NULL,
    race_dist     VARCHAR2(100 BYTE) NOT NULL,
    race_pic      VARCHAR2(300 BYTE),
    race_con      VARCHAR2(20 BYTE)
);

CREATE SEQUENCE race_seq 
    INCREMENT by 1
    START WITH 1
    MINVALUE 1; 

ALTER TABLE race ADD CONSTRAINT race_pk PRIMARY KEY ( race_id );

-- 지역 테이블
CREATE TABLE region (
    region_id       NUMBER(5) NOT NULL,
    region_state    VARCHAR2(30 BYTE),
    region_city     VARCHAR2(30 BYTE),
    region_district VARCHAR2(30 BYTE)
);

CREATE SEQUENCE region_seq 
    INCREMENT by 1
    START WITH 1
    MINVALUE 1; 

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region_id );

-- 대회 경로 테이블
CREATE TABLE race_route (
    race_id          NUMBER(5) NOT NULL,
    route_lat         NUMBER(7, 3) NOT NULL,
    route_long        NUMBER(7, 3) NOT NULL,
    route_marker_desc VARCHAR2(500 BYTE)
);

-- 챌린지 경로 테이블
CREATE TABLE chall_route (
    chall_id          NUMBER(5) NOT NULL,
    route_lat         NUMBER(7, 3) NOT NULL,
    route_long        NUMBER(7, 3) NOT NULL,
    route_marker_desc VARCHAR2(500 BYTE)
);


-- 외래키
ALTER TABLE rh_user
    ADD CONSTRAINT user_user_title_fk FOREIGN KEY ( user_title )
        REFERENCES user_title ( title_acq );
        
ALTER TABLE user_title
    ADD CONSTRAINT user_title_title_fk FOREIGN KEY ( title_id )
        REFERENCES title ( title_id );

ALTER TABLE user_title
    ADD CONSTRAINT user_title_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE personal_feed
    ADD CONSTRAINT personal_feed_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE feed_comment
    ADD CONSTRAINT feed_comment_personal_feed_fk FOREIGN KEY ( feed_id )
        REFERENCES personal_feed ( feed_id );

ALTER TABLE feed_comment
    ADD CONSTRAINT feed_comment_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE feed_picture
    ADD CONSTRAINT feed_picture_personal_feed_fk FOREIGN KEY ( feed_id )
        REFERENCES personal_feed ( feed_id )
                ON DELETE CASCADE;

ALTER TABLE feed_like
    ADD CONSTRAINT feed_like_personal_feed_fk FOREIGN KEY ( feed_id )
        REFERENCES personal_feed ( feed_id );

ALTER TABLE feed_like
    ADD CONSTRAINT feed_like_rh_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE challenge
    ADD CONSTRAINT challenge_region_fk FOREIGN KEY ( region_id )
        REFERENCES region ( region_id );

ALTER TABLE challenge
    ADD CONSTRAINT challenge_user_fk FOREIGN KEY ( chall_reg_id )
        REFERENCES rh_user ( user_id );

ALTER TABLE challenge
    ADD CONSTRAINT challenge_race_fk FOREIGN KEY ( race_id )
        REFERENCES race ( race_id );

ALTER TABLE auth_post
    ADD CONSTRAINT auth_post_challenge_fk FOREIGN KEY ( chall_id )
        REFERENCES challenge ( chall_id );

ALTER TABLE auth_post
    ADD CONSTRAINT auth_post_user_fk FOREIGN KEY ( comment_id )
        REFERENCES rh_user ( user_id );
    
ALTER TABLE auth_comment
    ADD CONSTRAINT auth_comment_auth_post_fk FOREIGN KEY ( auth_id )
        REFERENCES auth_post ( auth_id );

ALTER TABLE auth_comment
    ADD CONSTRAINT auth_comment_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE auth_picture
    ADD CONSTRAINT auth_picture_auth_post_fk FOREIGN KEY ( auth_id )
        REFERENCES auth_post ( auth_id );
        
ALTER TABLE auth_like
    ADD CONSTRAINT auth_like_personal_feed_fk FOREIGN KEY ( auth_id )
        REFERENCES auth_post ( auth_id );

ALTER TABLE auth_like
    ADD CONSTRAINT auth_like_rh_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );

ALTER TABLE user_chall
    ADD CONSTRAINT user_chall_challenge_fk FOREIGN KEY ( chall_id )
        REFERENCES challenge ( chall_id );

ALTER TABLE user_chall
    ADD CONSTRAINT user_chall_user_fk FOREIGN KEY ( user_id )
        REFERENCES rh_user ( user_id );
        
ALTER TABLE race
    ADD CONSTRAINT race_region_fk FOREIGN KEY ( region_id )
        REFERENCES region ( region_id );
        
ALTER TABLE race_route
    ADD CONSTRAINT race_route_race_fk FOREIGN KEY ( race_id )
        REFERENCES race ( race_id );

ALTER TABLE chall_route
    ADD CONSTRAINT chall_route_challenge_fk FOREIGN KEY ( chall_id )
        REFERENCES challenge ( chall_id );