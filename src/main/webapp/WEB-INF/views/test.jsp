<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test용 jsp</title>
</head>
<body>

<p>유저 아이디 : ${user.user_id}</p>
<p>유저 닉네임 : ${user.nickname}</p>
<p>한줄 소개 : ${fn:replace(user.intro, replaceChar, "<br/>")}</p>
<p> 현재 비밀번호 : ${user.user_pw}</p>
<p>비번 질문 : ${user.pw_quest}</p>
<p>비번 답변 : ${user.pw_quest_answer}</p>
<p>유저 프로필 사진 : </p> 
<img src="/images/${user.user_pic}" class="photo"><br>

<script type="text/javascript">
console.log('${user.user_pic}');

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('${user.user_pic}');
});
</script>
</body>
</html>