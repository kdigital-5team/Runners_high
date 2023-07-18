<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="EUC-KR">
<title>Test용 jsp</title>
</head>
<body>

<p>유저 아이디 : ${user.user_id}</p>
<p>유저 닉네임 : ${user.nickname}</p>
<p>한줄 소개 : ${user.intro}</p>
<p>비번 질문 : ${user.pw_quest}</p>
<p>비번 답변 : ${user.pw_quest_answer}</p>
<p>유저 프로필 사진 : </p> 
<img id="preImage" onclick="onClickUpload()" src="../static/images/profileImages/${user.user_pic}" class="photo" 
												 onerror='this.src="../static/images/profileImages/default_image.png"'><br>

</body>
</html>