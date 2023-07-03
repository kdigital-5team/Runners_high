--임시 DML
SET DEFINE OFF;
insert into rh_user
(
user_id, user_pw, pw_quest, pw_quest_answer, nickname, intro, user_pic
)
values
(
'test01','test01', '테스트 질문', '테스트 답변', 'TEST1', '테스트용 계정입니다', 
'https://images.unsplash.com/photo-1534644107580-3a4dbd494a95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'
);