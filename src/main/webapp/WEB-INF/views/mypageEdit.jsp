<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Runner's High &mdash; my page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" href="../static/css/form.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

</head>
<body>

	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	
	<!-- 피드 정보 수정 -->
	<div class="site-wrap">
		<div class="site-section">
			<div class="container">
				<form action="profile" method="POST">
					<div class="context">
						<p> 아이디 </p>
						<input type="text" name="userId" size="30" placeholder="${user.user_id}"
							   style="border: 0 solid black" readonly> 
						
						<p>
						
						<input type="text" name="userId" size="30" placeholder="이메일" id="login_id"
							style="border: 0 solid black"> 
							</br> 
						<label for="id_check"></label>
							</br> 
						<input type="password"
							name="userPw" size="30" placeholder="비밀번호" id="login_pw"
							style="border: 0 solid black">
							</br>
						<label for="pw_check"></label>
						</div>
					<p align="center">
						<span style="font-size: 12pt;"> 
						<input type="submit"
							value="저장" 
							style="border: 0 solid black"
							onclick= "getAlert(${msg})">
						</span>
					</p>
					<div id="sub-page">
						<a href="/updatePw" id="sub-page">비밀번호 찾기</a> <span>|</span> <a href="/regist"
							id="sub-page">회원가입</a>
					</div>
					<br>
					<br>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
 
	<script src="../static/js/jquery.min.js"></script>
	<script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../static/js/jquery-ui.js"></script>
	<script src="../static/js/popper.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<script src="../static/js/owl.carousel.min.js"></script>
	<script src="../static/js/jquery.stellar.min.js"></script>
	<script src="../static/js/jquery.fancybox.min.js"></script>
	<script src="../static/js/aos.js"></script>
	<script src="../static/js/main.js"></script>
</body>
</html>