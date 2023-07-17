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
		</div>
		
		<div style="margin: auto; text-align: center;">
			<a href="mypage_feed">소개</a><span class="mx-2">|</span> 
			<a href="challengePost">인증 게시판</a><span class="mx-2">|</span>
			<a href="mypage_title">캘린더</a>
			<spanclass="mx-2">
				</span>
		</div>

		<%-- <div>
		<table>
		<c:forEach items="${postList}" var="post">
		
			        <tr><td colspan='3'>제목: ${post.auth_title}</td><td colspan='3'>내용: ${post.auth_cont}</td></tr>
			        
			        <tr><td>♥ ${post.auth_like}</td><td>작성자:${post.nickname}</td><td>작성날짜:${post.auth_date}</td></tr>
			        <tr><td>작성자:${post.nickname}</td><td>댓글:${post.auth_comment_cont}</td><td>작성날짜:${post.auth_comment_date}</td></tr>
			        </c:forEach></table>
		</div> --%>
		
		<table class="table table-hover table-striped">
					<thead>
						<tr>
							
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
						<c:forEach items="${postList}" var="post">
					<tbody>
							<tr>
								
								<td><a href="#" data-toggle="modal" data-target="#myModal2${vs.index}">${post.auth_title}</a></td>
								<td>${post.user_id}</td>
								<td>${post.auth_date}</td>
							</tr>
							
									
						
						
					</tbody>
					
							</table>
						<!-- Modal -->
						
			<div class="modal fade" id="myModal2${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        
			      </div>
			      <div class="modal-body">
			     
			        <table>
			        
			        <tr><td>${post.auth_title}</td></tr>
			        <tr><td><img src="${post.auth_pic_path}"
											alt="Image" class="img-fluid"></td></tr>
			        <tr><td>${post.auth_cont}</td></tr>
			        
			        </table>
			        
			        
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			       
			      </div>
			    </div>
			  </div>
			</div>
						
			</c:forEach>

		
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