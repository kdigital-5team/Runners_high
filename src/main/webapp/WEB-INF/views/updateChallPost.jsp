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
		<%-- <div class="container">
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
				<c:if test="${userId ne challenge.chall_reg_id}"> 
					<form action="/challenge/${challenge.chall_id}/apply" method="post">
						<input type="submit" value="신청">
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
		</div> --%>
		
		<%-- <div style="margin: auto; text-align: center;">
			<a href="mypage_feed">소개</a><span class="mx-2">|</span> 
			<a href="/challengePost/${chall_id}">인증 게시판</a><span class="mx-2">|</span>
			<a href="mypage_title">캘린더</a>
			<spanclass="mx-2">
				</span>
		</div> --%>

		
		<%-- <table class="table table-hover table-striped">
					<thead>
						<tr>
							
						<th>글번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
						<c:forEach items="${postList}" var="post">
					<tbody>
							<tr>
								
								<td>${post.auth_id}</td>
								<td><a href="#">${post.auth_title}</a></td>
								<td>${post.auth_date}</td>
							</tr>
					</tbody>
					</c:forEach>

							</table> --%>
						
						<%-- <div>
						
						<table>
						<tr><td>${post.auth_title}</td></tr>
						<tr><td>${post.auth_cont}</td></tr>
						</table>
						
						</div> --%>
						
						<div class="container">
			<!-- <div class="post"> -->	        
		        					
					<div class="form-group">	
						<label for="auth_title">제목</label>					
							                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" value="${post.auth_title}">
	                
	                	
					</div>
					<div class="form-group">
					<label for="chall_id">챌린지 id</label>
					
					<input class="form-control" type="number" name="chall_id" id="chall_id" value="${post.chall_id }">
					
					</div>
					 
					<div class="form-group">
					<label for="auth_cont">내용</label>	
						<!-- <div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;"> -->
							<input class="form-control" type="text" name="auth_cont" id="auth_cont" style="height:400px" value="${post.auth_cont}"></input>
							<!-- rows="5" style="width:600px; display:block; margin: 0 auto;" -->
						<!-- </div> -->
					</div>	
					
			</div>
						
			
		
	</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

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
	

</body>
<script type="text/javascript">

	function apply(){

	}

  </script>
</html>