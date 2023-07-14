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
<link rel="stylesheet" href="../static/fonts/icomoon/style.css">
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
					<fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_end_date}"/><span class="mx-2">/</span>${fn:length(parList)}명
					<div class="caption" style="font-size: 10px"></div>
				</p>
			</div>
			<div style="float: left; width: 33%">
				<span>${challenge.chall_sit}</span>
			</div>
			<div style="float: left; width: 34%;">
				<div style="float: left; width:30%; padding-top:30%; height:0; border-radius: 70%; 
					background-image: url(${challenge.chall_pic});
					background-position:center;
					background-size:cover;">
				</div>
				<div style="float: right; width: 65%;  vertical-align: middle;">
					<div>챌린지 호스트</div>
					<div>${host.user_title }</div>
					<div>${host.nickname }</div>
				</div>
			</div>
		</div>
		
		<div style="margin: auto; text-align: center;">
			<a href="/challenge/${challenge.chall_id}">소개</a><span class="mx-2">|</span> 
			<a href="#">관리</a><span class="mx-2">|</span> 
			<a href="mypage_chall">인증 게시판</a><span class="mx-2">|</span>
			<a href="mypage_title">캘린더</a>
			<spanclass="mx-2">
				</span>
		</div>
		<div style="width: 50%; margin: auto;">
		<span>신청자</span>
		<c:forEach items="${appList}" var="app">
			<div style="border: 1px solid aqua; vertical-align: center;">
				<div style="display:inline-block; width:20%; padding-top:20%; height:0; border-radius: 70%;  
					background-image: url(${challenge.chall_pic});
					background-position:center;
					background-size:cover;">
				</div>
				<div style="display:inline-block; width: 50%; position:relative; top: 50%; buttom:50%;">
					<div>칭호</div>
					<div>${app.nickname }</div>
					<div>안녕</div>
				</div>
				<div style="display:inline-block; position:relative; top: 50%; buttom:50%;">
					<button>수락</button>
					<button>거절</button>
				</div>
			</div>
		</c:forEach>
		</div>
		
		<div>
			
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

	<script src="js/main.js"></script>
	

</body>
<script type="text/javascript">

  </script>
</html>