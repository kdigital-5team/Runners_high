---------
-- pw 질문 리스트
--1. 어렸을 때 장래희망은?
--2. 다녔던 초등학교의 명칭은?
--3. 기억나는 장소는?

-- user
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test01@gmail.com', 'test**', '어렸을 때 장래희망은?', '화가', 'Testing01');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test02@gmail.com', 'test**', '어렸을 때 장래희망은?', '대통령', 'abcAcademy');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test03@gmail.com', 'test**', '어렸을 때 장래희망은?', '의사', 'test001');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test04@gmail.com', 'test**', '어렸을 때 장래희망은?', '백수', '43242342');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test05@gmail.com', 'test**', '어렸을 때 장래희망은?', '닌자', '남혁');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test06@gmail.com', 'test**', '다녔던 초등학교의 명칭은?', '봉우리 초등학교', '봉승헌');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test07@gmail.com', 'test**', '다녔던 초등학교의 명칭은?', '남산 초등학교', '권인혜');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test08@gmail.com', 'test**', '다녔던 초등학교의 명칭은?', '두류', '손재영');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test09@gmail.com', 'test**', '다녔던 초등학교의 명칭은?', '기억 안 남', '양여름');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test10@gmail.com', 'test**', '다녔던 초등학교의 명칭은?', '모름', '백상');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test11@gmail.com', 'test**', '기억나는 장소는?', '캐나다', 'loream');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test12@gmail.com', 'test**', '기억나는 장소는?', '우리집', 'Loream3422');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test13@gmail.com', 'test**', '기억나는 장소는?', '서울특별시 서대문구 통일로 97 ', 'testing983328');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test14@gmail.com', 'test**', '기억나는 장소는?', '없음', 'user2934');
INSERT INTO rh_user 
        (user_id, user_pw, pw_quest, pw_quest_answer, nickname) 
    VALUES 
        ('test15@gmail.com', 'test**', '기억나는 장소는?', '대한민국', 'TdfjksSAd');


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
INSERT INTO region VALUES (6, '충청남도', '천안시', '불당동');
INSERT INTO region VALUES (7, '충청남도', '아산시', '둔포면');
INSERT INTO region VALUES (8, '충청남도', '천안시', '두정동');

-- race
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '(주) 스포테인', '서울오픈 런', '2023.08.26', '2023.06.19', '2023.07.31', 'http://irunman.kr/sub1_1.php?uid=79', '마라톤', '하프코스, 10km, 5km', 
        'http://www.irunman.kr/admin/data/webedit/20220701132808_qxtfxhcd.jpg');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '명품트레일런', '울산염포대왕트레일', '2023.07.23', '2023.05.31', '2023.07.21', 'http://www.mtrailrun.kr/run/1000.asp?T=3&wgu=1&wma=238', '마라톤', '14.8km', 
        'http://www.mtrailrun.kr/images/top.png');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 4, '주식회사 땀', '전설에 고향RUN', '2023.07.29', '2023.06.30', '2023.07.24', 'http://reg.runday.co.kr/marathon/2307marathon', '마라톤', '하프코스, 10km, 5km, 3km,, 7km', 'https://runday-challenge.s3.ap-northeast-2.amazonaws.com/marathon/2_7%EC%9B%94%EB%A7%88%EB%9D%BC%ED%86%A4%EB%A7%88%EB%9D%BC%ED%86%A4%EC%83%81%EC%84%B8%ED%99%94%EB%A9%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_1125_540_1688028286784.png');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '명품트레일런', '밀양아리랑 트레일런', '2023.08.06', '2023.05.31', '2023.07.31', 'http://www.mtrailrun.kr/run/1000.asp?T=3&wgu=1&wma=239', '마라톤', '15km', 
        'http://www.mtrailrun.kr/images/top.png');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '부울경트레일런', '영얄8봉종주60k', '2023.08.12', '2023.04.24', '2023.07.05', 'https://cafe.naver.com/buktr/148', '마라톤', '산악60km', 
        'https://cafeskthumb-phinf.pstatic.net/MjAyMzA3MDNfMTM3/MDAxNjg4MzUxMjk0MDg3.qEe49YzDkg5VG0hkxRbkVJkVeq4ypSUXki9AGxb_NWQg.jmPoilLJAufqCIl-usLjEm2pPag6v1Jz9eV33YPXQ10g.JPEG/KakaoTalk_20230627_104101334.jpg?type=w1080');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '매일경제TV', '한 여름밤의 쿨 2023 썸머나이트 런', '2023.08.12', '2023.04.27', '2023.07.28', 'http://night.run1080.com/', '마라톤', '10km, 5km', 
        'http://night.run1080.com/images/main/main_bann.jpg');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '(사)한국산악마라톤연맹', '제32회 광복78주년화대종주CLIMBATHON', '2023.08.13', '2023.01.19', '2023.07.31', 'http://koreatrail.net/', '마라톤', '48km, 40km', 
        'http://koreatrail.net/home/tBoard_PHOTO/img/a20230606105241.jpg');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '광주일보, 마라톤세상', '제8회 너릿재 혹서기 마라톤대회', '2023.08.13', '2023.06.12', '2023.08.03', 'http://marathonworld.kr/', '마라톤', '8.5km, 17km', 
        'http://marathonworld.kr/images/2023.png');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '네버스탑협동조합', '제19회부산썸머비치울트라마라톤대회', '2023.08.19', '2023.05.01', '2023.07.21', 'http://bbu100.com/', '마라톤', '100km, 50km', 
        'http://bbu100.com/images/main/main_visual_01.jpg');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '명품트레일', '포항호미반도트레일', '2023.08.20', '2023.06.10', '2023.08.18', 'http://mtrailrun.kr/run/1000.asp?T=3&wgu=1&wma=240', '마라톤', '27km', 
        'http://www.mtrailrun.kr/images/top.png');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '전국마라톤협회', '제12회 부여 굿뜨래 마라톤대회', '2023.08.27', '2023.04.03', '2023.08.16', 'http://www.run1080.com/new/mini/index.php?code=1372', '마라톤', '풀코스, 하프코스, 10km, 5km', 
        'http://www.run1080.com/uploadFolder/img_games/title_img_1372.jpg');

INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '순천만울트라조직위', '제15회순천만울트라마라톤대회', '2023.09.02', '2023.07.01', '2023.08.18', 'http://www.scultra100.net/pages/about2.php', '마라톤', '100km', 
        'http://www.scultra100.net/theme/scultra/img/main_info.jpg');
        
INSERT INTO race
        (race_id, region_id, race_org, race_name, race_date, race_apply, race_deadline, race_url, race_category, race_dist, race_pic)
    VALUES
        (race_seq.NEXTVAL, 1, '(주)스포테인', '	가든파이브 라이프 나이트레이스', '2023.09.09', '2023.07.10', '2023.08.25', 'http://irunman.kr/sub1_1.php?uid=81', '마라톤', '하프, 10km, 5km', 
        'http://irunman.kr/admin/data/main/main_294');
        
    UPDATE RACE SET race_con =
                    case
                        when SYSDATE<race_apply THEN '접수예정'
                        when SYSDATE>race_deadline THEN '접수마감'
                        ELSE '접수중'
                        END;   
set define off;
commit;