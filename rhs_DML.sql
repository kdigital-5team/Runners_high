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
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '종로구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '중구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '용산구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '성동구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '광진구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '동대문구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '중랑구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '성북구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '강북구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '도봉구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '노원구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '은평구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '서대문구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '마포구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '양천구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '강서구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '구로구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '금천구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '영등포구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '동작구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '관악구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '서초구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '강남구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '송파구');
INSERT INTO region values(region_seq.NEXTVAL,'서울특별시', '서울특별시', '강동구');

INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '중구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '서구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '동구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '영도구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '부산진구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '동래구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '남구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '북구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '해운대구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '사하구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '금정구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '강서구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '연제구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '수영구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '사상구');
INSERT INTO region values(region_seq.NEXTVAL,'부산광역시', '부산광역시', '기장군');

INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '중구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '동구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '서구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '남구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '북구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '수성구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '달서구');
INSERT INTO region values(region_seq.NEXTVAL,'대구광역시', '대구광역시', '달성군');


INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '중구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '동구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '연수구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '남동구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '부평구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '계양구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '서구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '미추홀구');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '강화군');
INSERT INTO region values(region_seq.NEXTVAL,'인천광역시', '인천광역시', '옹진군');

INSERT INTO region values(region_seq.NEXTVAL,'광주광역시', '광주광역시', '동구');
INSERT INTO region values(region_seq.NEXTVAL,'광주광역시', '광주광역시', '서구');
INSERT INTO region values(region_seq.NEXTVAL,'광주광역시', '광주광역시', '남구');
INSERT INTO region values(region_seq.NEXTVAL,'광주광역시', '광주광역시', '북구');
INSERT INTO region values(region_seq.NEXTVAL,'광주광역시', '광주광역시', '광산구');


INSERT INTO region values(region_seq.NEXTVAL,'대전광역시',  '대전광역시', '유성구');
INSERT INTO region values(region_seq.NEXTVAL,'대전광역시',  '대전광역시', '대덕구');

INSERT INTO region values(region_seq.NEXTVAL,'울산광역시',  '울산광역시', '중구');
INSERT INTO region values(region_seq.NEXTVAL,'울산광역시',  '울산광역시', '남구');
INSERT INTO region values(region_seq.NEXTVAL,'울산광역시',  '울산광역시', '동구');
INSERT INTO region values(region_seq.NEXTVAL,'울산광역시',  '울산광역시', '북구');
INSERT INTO region values(region_seq.NEXTVAL,'울산광역시',  '울산광역시', '울주군');

INSERT INTO region values(region_seq.NEXTVAL,'세종특별자치시', '세종시', '세종시');

INSERT INTO region values(region_seq.NEXTVAL,'경기도', '수원시', '장안구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '수원시', '권서구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '수원시', '팔달구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '수원시', '영통구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '성남시', '수정구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '성남시', '중원구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '성남시', '분당구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '의정부시', '의정부');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '안양시', '만안구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '안양시', '동안구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '부천시', '부천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '광명시', '광명');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '평택시', '평택');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '동두천시', '동두천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '안산시', '상록구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '안산시', '단원구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '고양시', '덕양구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '고양시', '일산동구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '고양시', '일산서구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '과천시', '과천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '구리시', '구리');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '남양주시', '남양주');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '오산시', '오산');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '시흥시', '시흥');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '군포시', '군포');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '의왕시', '의왕');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '하남시', '하남');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '용인시', '처인구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '용인시', '기흥구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '용인시', '수지구');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '파주시', '파주');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '이천시', '이천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '안성시', '안성');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '김포시', '김포');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '화성시', '화성');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '광주시', '광주');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '양주시', '양주');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '포천시', '포천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '여주시', '여주');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '연천군', '연천');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '가평군', '가평');
INSERT INTO region values(region_seq.NEXTVAL,'경기도', '양평군', '양평');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '춘천시', '춘천');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '원주시', '원주');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '강릉시', '강릉');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '동해시', '동해');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '태백시', '태백');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '속초시', '속초');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '삼척시', '삼척');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '홍천군', '홍천');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '횡성군', '횡성');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '영월군', '평창');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '정선군', '정선');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '철원군', '철원');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '화천군', '화천');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '양구군', '양구');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '인제군', '인제');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '고성군', '고성');
INSERT INTO region values(region_seq.NEXTVAL,'강원도', '양양군', '양양');

INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '충주시', '충주');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '제천시', '제천');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '청주시', '상당구');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '청주시', '서원구');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '청주시', '흥덕구');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '청주시', '청원구');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '보은군', '보은');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '옥천군', '옥천');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '영동군', '영동');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '진천군', '진천');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '괴산군', '괴산');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '음성군', '음성');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '단양군', '단양');
INSERT INTO region values(region_seq.NEXTVAL,'충청북도', '증평군', '증평');


INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '천안시', '동남구');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '천안시', '서북구');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '공주시', '공주');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '보령시', '보령');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '아산시', '아산');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '서산시', '서산');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '논산시', '논산');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '계룡시', '계룡');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '당진시', '당진');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '금산군', '금산');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '부여군', '부여');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '서천군', '서천');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '청양군', '청양');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '예산군', '예산');
INSERT INTO region values(region_seq.NEXTVAL,'충청남도', '태안군', '태안');


INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '전주시', '완산구');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '전주시', '덕진구');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '군산시', '군산');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '익산시', '익산');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '정읍시', '정읍');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '남원시', '남원');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '김제시', '김제');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '완주군', '완주');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '진안군', '진안');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '무주군', '무주');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '장수군', '장수');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '임실군', '임실');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '순창군', '순창');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '고창군', '고창');
INSERT INTO region values(region_seq.NEXTVAL,'전라북도', '부안군', '부안');


INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '목포시', '목포');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '여주시', '여주');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '순천시', '순천');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '나주시', '나주');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '광양시', '광양');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '담양군', '담양');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '곡성군', '곡성');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '구례군', '구례');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '고흥군', '고흥');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '보성군', '보성');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '화순군', '화순');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '장흥군', '장흔');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '강진군', '강진');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '해남군', '해남');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '영암군', '영암');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '무안군', '무안');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '함평군', '함평');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '영광군', '영광');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '장성군', '장성');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '완도군', '완도');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '진도군', '진도');
INSERT INTO region values(region_seq.NEXTVAL,'전라남도', '신안군', '신안');


INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '포항시', '남구');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '포항시', '북구');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '경주시', '경주');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '김천시', '김천');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '안동시', '안동');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '구미시', '구미');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '영주시', '영주');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '영천시', '영천');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '상주시', '상주');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '문경시', '문경');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '경산시', '경산');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '군위군', '군위');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '의성군', '의성');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '청송군', '청송');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '영양군', '영양');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '영덕군', '영덕');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '청도군', '청도');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '고령군', '고령');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '성주군', '성주');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '예천군', '예천');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '봉화군', '봉화');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '울진군', '울진');
INSERT INTO region values(region_seq.NEXTVAL,'경상북도', '울릉군', '울릉');

INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '진주시', '진주');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '통영시', '통영');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '사천시', '사천');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '김해시', '김해');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '밀양시', '밀양');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '거제시', '거제');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '양산시', '양산');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '창원시', '의창구');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '창원시', '성산구');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '창원시', '마산합포구');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '창원시', '마산회원구');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '의령군', '의령');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '함안군', '함안');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '창녕군', '창녕');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '고성군', '고성');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '남해군', '남해');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '하동군', '하동');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '산천군', '산천');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '함양군', '함양');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '거창군', '거창');
INSERT INTO region values(region_seq.NEXTVAL,'경상남도', '합천군', '합천');
INSERT INTO region values(region_seq.NEXTVAL,'제주도', '제주시', '제주');
INSERT INTO region values(region_seq.NEXTVAL,'제주도', '서귀포시', '서귀포');


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