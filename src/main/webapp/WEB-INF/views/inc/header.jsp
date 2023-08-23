<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="/static/css/headerFooter.css">
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
									<li><a role="button" onclick="location.href='/challenge'">챌린지</a></li>
									<li><a role="button" onclick="loginCheck();">마이 페이지</a></li>
									<li><a role="button" onclick="location.href='/running'">달리기</a></li>
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

<script type="text/javascript">
	function loginCheck(){
		var userId = '<%=(String)session.getAttribute("userId")%>';
		if (userId == "null"){
			alert("로그인이 필요한 서비스 입니다.");
			location.href = "/login";
		} else {
			location.href = "/mypage/feed";
		}
	}
</script>