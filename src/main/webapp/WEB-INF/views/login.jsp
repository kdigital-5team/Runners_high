<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Runner's High &mdash; Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
<!--   <link rel="stylesheet" href="../fonts/icomoon/style.css">-->

<link rel="stylesheet" href="../static/css/loginForm.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/login.css">

</head>
<body>

	<div class="site-wrap">
		<div class="container">
			<div class="col-6 col-lg-2 site-logo">
				<a role="button" onclick="location.href='/main'">Runner's High</a>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<form action="login" method="POST" id="login-form">
					<p align="center">
						<input type="text" name="userId" size="30" placeholder="Id"
							style="border: 0 solid black"> </br> <input type="password"
							name="userPw" size="30" placeholder="Password"
							style="border: 0 solid black">
					</p>
					<p align="center">
						<span style="font-size: 12pt;"> <input type="submit"
							value="Login" style="border: 0 solid black">
						</span>
					</p>
					<div id="sub-page">
						<a href="" id="sub-page">비밀번호 찾기</a> <span>|</span> <a href=""
							id="sub-page">회원가입</a>
					</div>
					<br>
					<br>
					<!-- 
					카카오 로그인 API
					<a class="social" href="https://kauth.kakao.com/oauth/authorize?client_id=6b8fd47f0536895682320ac460cd43a2&redirect_uri=http://localhost:8081/login/kakao&response_type=code">
						<img src="../static/icons/kakao_login_medium_wide.png" style="height:53px">
					</a>
					 -->
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

	<!-- 
<script>
       	var message = "[[${msg}]]";
        console.log("[[${msg}]]");
        if (message != "") {
            alert(message);
            location.href='/login';
        }
</script>
 -->

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