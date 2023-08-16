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

	<script src="../static/js/main.js"></script>
	
	<script src="../static/js/jquery.min.js"></script>
	<script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../static/js/jquery-ui.js"></script>
	<script src="../static/js/popper.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<script src="../static/js/owl.carousel.min.js"></script>
	<script src="../static/js/jquery.stellar.min.js"></script>
	<script src="../static/js/jquery.magnific-popup.min.js"></script>
	<script src="../static/js/aos.js"></script>
</head>
<style>
</style>
<body>

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
		<div class="title-scroll">
		    <c:forEach var="title" items="${titleList}">
		        <section class="section">
		            <c:choose>
		                <c:when test="${userTitleList.contains(title)}">
							<div class="userTitleWrapper">
			                    <span class="userTitle">${title.title_name}</span><br>
								<div class="titleCondition">
									<c:choose>
										<c:when test="${title.title_complt != 0}">
											완료 챌린지 ${title.title_complt}번
										</c:when>
										<c:when test="${title.title_reg != 0}">
											챌린지 등록 ${title.title_reg}번
										</c:when>
										<c:when test="${title.title_likes != 0}">
											좋아요 ${title.title_likes}개
										</c:when>
										<c:otherwise>
											러너스 하이 가입
										</c:otherwise>
									</c:choose>
								</div>							
							</div>		                
		                </c:when>
		                <c:otherwise>
			                <div class="titleWrapper">
				                    <span class="title">${title.title_name}</span><br>
									<div class="titleCondition">
										<c:choose>
											<c:when test="${title.title_complt != 0}">
												완료 챌린지 ${title.title_complt}번
											</c:when>
											<c:when test="${title.title_reg != 0}">
												챌린지 등록 ${title.title_reg}번
											</c:when>
											<c:when test="${title.title_likes != 0}">
												좋아요 ${title.title_likes}개
											</c:when>
											<c:otherwise>
												러너스 하이 가입
											</c:otherwise>
										</c:choose>
									</div>							
								</div>		   				
		                </c:otherwise>
		            </c:choose>
		        </section>
		    </c:forEach>
		</div>
	</div>



	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
	
</body>
</html>