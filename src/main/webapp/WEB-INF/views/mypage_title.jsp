<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>mypage_feed</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
	
<link rel="stylesheet" href="../static/css/style2.css">
<link rel="stylesheet" href="../fonts/icomoon/style.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/css/image_crop.css">
<link rel="stylesheet" href="../static/css/popup.css">
<link rel="stylesheet" href="../static/css/feed.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">
</head>
<style>
</style>
<body>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>


	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	
	<div class="site-wrap">
	
	<!-- 유저 정보 -->
	<div class="container">
				<div class="row">
					<div class="display-flex" style=" text-align: center; margin-left:30%">
						<div class="post" style="border:none; float:left;">
							<div class="post-header2">
								<img src="/images/${user.user_pic}" alt="Profile Picture">									
							</div>
						</div>
						<form action="/mypage/feed" enctype="multipart/form-data" method="POST">					
							<div class="post" style="border:none; float:middle; margin-top:15%; width:200px">
								<div class="username">${user.nickname}</div>
								<pre><div class="userIntro">${user.intro}</div></pre>
							</div>
						</form>	
						<div onclick="location.href='/mypage/edit'" style="border:none; float:right; margin-top:12%;">
							<button class="btn btn-dark">프로필 수정</button>
						</div>
					</div>
				</div>
			</div>

		<!-- 피드 / 챌린지 / 칭호 탭 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero-wrap text-center" style=""
						data-stellar-background-ratio="0.5">
						<div class="hero-contents">
							<p>
								<a href="/mypage/feed">피드</a> <span class="mx-2">|</span> 
								<a href="/mypage/chall">참여 챌린지</a> <span class="mx-2">|</span> 
								<a href="/mypage/title"><strong>칭호</strong></a> <span class="mx-2"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 칭호 목록-->
		<div class="site-section">
			<div class="container">
						<div class="title-scroll">
							<c:forEach var="title" items="${titleList}">
								<span>${title.title_name}</span><br>
							</c:forEach>
						</div>
					</div>
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
	
</body>
</html>