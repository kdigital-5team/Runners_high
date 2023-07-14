---------
-- pw 질문 리스트
--1. 어렸을 때 장래희망은?
--2. 다녔던 초등학교의 명칭은?
--3. 기억나는 장소는?


-- title
INSERT INTO title 
        (title_id, title_name) 
    VALUES 
        (title_seq.NEXTVAL, '유망주');
INSERT INTO title 
        (title_id, title_name, title_complt)
    VALUES 
        (title_seq.NEXTVAL, '챌린지 초심자', 3);
INSERT INTO title 
        (title_id, title_name, title_reg)
    VALUES 
        (title_seq.NEXTVAL, '리더', 5);
INSERT INTO title 
        (title_id, title_name, title_likes)
    VALUES 
        (title_seq.NEXTVAL, '인플루언서', 30);

-- region
INSERT INTO region 
        (region_id, region_state, region_city, region_district)
    VALUES 
        (region_seq.NEXTVAL, '경기도', '고양시', '덕양구');
INSERT INTO region 
        (region_id, region_state, region_city, region_district)
    VALUES 
        (region_seq.NEXTVAL, '경기도', '고양시', '일산동구');
INSERT INTO region 
        (region_id, region_state, region_city, region_district)
    VALUES 
        (region_seq.NEXTVAL, '경기도', '고양시', '일산서구');
INSERT INTO region 
        (region_id, region_state, region_city, region_district)
    VALUES 
        (region_seq.NEXTVAL, '경기도', '과천시', '중앙동');
INSERT INTO region 
        (region_id, region_state, region_city, region_district)
    VALUES 
        (region_seq.NEXTVAL, '경기도', '과천시', '갈현동');

-- race
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '(주) 스포테인', '서울오픈 런', '2023.08.26', '2023.06.19', '2023.07.31', 'http://irunman.kr/sub1_1.php?uid=79', '마라톤', 'Half, 10km, 5km', 
        'http://www.irunman.kr/admin/data/webedit/20220701132808_qxtfxhcd.jpg');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 4, '(사)한국산악마라톤연맹', '제4회안산.인왕산.북악산TrailRunning', '2023.07.16', '2023.01.03', '2023.07.10', 'http://koreatrail.net', '걷기', '10km', 'https://image.ytn.co.kr/general/jpg/2020/1130/202011300700017010_d.jpg');

-- challenge
INSERT INTO challenge 
        (chall_id, chall_reg_id, region_id, race_id, chall_name, chall_intro, chall_start_date, chall_end_date, chall_all_auth, chall_week_auth,
        chall_category, chall_sit, chall_auth, chall_online, chall_size, chall_pic) 
    VALUES 
        (challenge_req.NEXTVAL, 'fexis1594@gmail.com', 1, 1, '마라톤 챌린지', '실제로 42.195km를 주 1회 달립니다!', '20230701', '20230725', 4, 1, '대회용', '모집중', 40, '온라인', 
        5, 'https://image.ytn.co.kr/general/jpg/2020/1130/202011300700017010_d.jpg');

CREATE OR REPLACE PROCEDURE UPDATE_CON
IS
BEGIN
    UPDATE RACE SET race_con =
                    case
                        when SYSDATE<race_apply THEN '접수예정'
                        when SYSDATE>race_deadline THEN '접수마감'
                        ELSE '접수중'
                        END;
END UPDATE_CON;
/
EXEC UPDATE_CON;
        
commit;
