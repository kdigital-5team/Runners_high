<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
	
<link rel="stylesheet" href="../static/css/headerFooter.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

</head>
<header>
	<div class="site-wrap">
		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->

		<div class="container">

			<div class="row no-gutters site-navbar align-items-center py-3">

				<div class="col-6 col-lg-2 site-logo">
					<a role="button" onclick="location.href='/main'">Runner's High</a>
				</div>
				<div class="col-6 col-lg-10 text-right menu">
					<nav class="site-navigation text-right text-md-right">

						<ul class="site-menu js-clone-nav d-none d-lg-block">
									<li class="active"><a role="button" onclick="location.href='/main'">MAIN</a></li>
									<li><a role="button" onclick="location.href='/events'">대회일정</a></li>
									<li><a role="button" onclick="location.href='/gallery'">챌린지</a></li>
									<li><a role="button" onclick="location.href='/mypage_feed'">마이 페이지</a></li>
									<c:if test="${empty userId}">
									 	<li><a role="button"
											class="change-button"
											onclick="location.href='/login'"
											style="font-size: 13px;">로그인</a></li>
										<li><a role="button"
										   onclick="location.href='/regist'"
										   style="font-size: 13px;">회원가입</a></li>
									</c:if>
									<c:if test="${not empty userId}">
										<li><a role="button"
										   class="change-button"
										   onclick="location.href='/logout'"
										   style="font-size: 13px;">로그아웃</a></li> 
									</c:if>
						</ul>

						<a href="#"
							class="site-menu-toggle js-menu-toggle text-black d-inline-block d-lg-none"><span
							class="icon-menu h3"></span></a>
					</nav>
				</div>
			</div>
		</div>
</div>
</header>