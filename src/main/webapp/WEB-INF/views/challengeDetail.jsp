<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${challenge.chall_name}</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
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
<link rel="stylesheet" href="../static/css/style2.css">

</head>
<style>
</style>
<body>
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	<div class="site-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero-wrap text-center"
						style="background-repeat: no-repeat; background-image: url(${challenge.chall_pic}); background-size:cover;"
						data-stellar-background-ratio="0.5"></div>
				</div>
			</div>
		</div>
		<div class="hero-contents">
			<div style="float:left; width: 33%; text-align: center;">
				<h2>${challenge.chall_name}</h2>
				<p>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_end_date}"/><span class="mx-2">/</span>${fn:length(userList)}명
					<div class="caption" style="font-size: 10px"></div>
				</p>
			</div>
			<div style="float: left; width: 33%">
				<span>${challenge.chall_sit}</span>
				<c:if test="${userId ne challenge.chall_reg_id && userChall.user_reg_status ne 'Y' && userChall.user_deny_num lt 2 && challenge.chall_sit eq '모집중'}">
					<form action="/challenge/${challenge.chall_id}/apply" method="post">
						<input type="hidden" name="applyId" value="${userId}">
						<input type="submit" class="btn btn-primary" value="신청">
					</form>
				</c:if>
				<c:if test="${userId ne challenge.chall_reg_id && userChall.user_reg_status eq 'Y'}">
					<form action="/challenge/${challenge.chall_id}/withdraw" method="post">
						<input type="hidden" name="applyId" value="${userId}">
						<input type="submit" class="btn btn-danger" value="탈퇴">
					</form>
				</c:if>
			</div>
			<div style="float: left; width: 34%;">
				<div style="float: left; width:30%; padding-top:30%; height:0; border-radius: 70%; 
					background-image: url(${challenge.chall_pic});
					background-position:center;">
				</div>
				<div style="float: right; width: 65%;  vertical-align: middle;">
					<div>챌린지 호스트</div>
					<div>${host.intro }</div>
					<div>${host.nickname }</div>
				</div>
			</div>
		</div>
		
		<div style="margin: auto; text-align: center;">
			<a href="mypage_feed">소개</a><span class="mx-2">|</span> 
			<c:if test="${userId eq challenge.chall_reg_id }">
				<a href="/challenge/${challenge.chall_id}host">관리</a><span class="mx-2">|</span> 
			</c:if>
			<a href="mypage_chall">인증 게시판</a><span class="mx-2">|</span>
			<a href="mypage_title">캘린더</a>
			<spanclass="mx-2">
				</span>
		</div>

		<div style="margin: auto; width: 50%;">챌린지 소개</div>
		<div style="margin: auto; width: 50%; height: 300px; background-color: #F0F0F0;" >
			<span style="margin: 3%;">${challenge.chall_intro }</span>
		</div>
		<div style="margin: auto; width: 50%; margin-top: 10px">참가자</div>
		<div style="margin: auto; background-color: #F0F0F0; width: 50%; height: 100px; margin-bottom: 10px;">
			<c:forEach items="${userList }" var="apply_user">
				<c:if test="${apply_user.chall_reg_status eq  'Y'}">
					<div style="display: inline-block; width: 10%;">
						<div style="width:100%; padding-top:100%; height:0; border-radius: 70%;  
						background-image: url(../static/images/profileImages/default_image.png);
						background-position:center;
						background-size:cover;">
						</div>
						<div style="text-align: center;">
							${apply_user.nickname }
						</div>
					</div>
				</c:if>
				
			</c:forEach>
		</div>

		
	</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>
	

</body>
<script type="text/javascript">
if(${userChall.user_deny_num}>=2)
	alert("거절 5회로 신청 불가");

  </script>
</html>