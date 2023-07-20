<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>mypage_feed</title>
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


	<div class="site-wrap">

		<!-- header -->
		<%@ include file="./inc/header.jsp"%>

			<div class="container">
				<div class="row">
					<div class="col-lg-10">
						<div class="display-flex">
							<div class="post" style="border:none; margin-top:10%; margin-left:35%">
								<div class="post-header2">
									<img src="/images/${user.user_pic}" alt="Profile Picture">									
								</div>
							</div>				
							<div class="post" style="border:none; margin-top: 12%;">
								<div class="username">${user.user_id}</div>
								<div class="userIntro">${user.intro}</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- 피드 / 챌린지 / 칭호 탭 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero-wrap text-center" 
						data-stellar-background-ratio="0.5">
						<div class="hero-contents">
							<p>
								<a href="#"><strong>피드</strong></a> <span class="mx-2">|</span>
								<a href="/mypage/chall">참여 챌린지</a> <span class="mx-2">|</span> 
								<a href="/mypage/title">칭호</a> <span class="mx-2"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 피드 목록-->
		<div class="site-section">
			<div class="container">
				
				<div class="row">
					<c:forEach items="${feedList}" var="feed" varStatus="vs">
						<c:if test="${other eq feed.user_id}">
							<div class="col-6 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:30px">
								<div class="img-wrapper">
									<a href="#" data-toggle="modal" data-target="#myModal2${vs.index}" ><img
										src="/static/images/test.jpg" alt="Image" class="img-block">${feed.feed_title}</a>
								</div>
							</div>
						</c:if>							 
 						<div class="modal fade" id="myModal2${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        						        
						      </div>
						      <div class="modal-body">
						        <div class="display-flex">
											<img class="post-image" src="../images/test.jpg"
												alt="Post Image">
								</div>
						        <hr>
								
						        <!-- 피드 제목 -->
								<div class="post-description" style="font-size:20px;">
									${feed.feed_title}
								</div>
								
								<!-- 피드 내용 -->
								<div class="post-description">
									${feed.feed_cont}
								</div>
						        
						      </div>
						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						       
						      </div>
						    </div>
						  </div>
						</div>
						
					<%-- <div class="layer" id="layer_${vs.index }">
							<div class="layer_content">
								<div class="post">
									<div class="post-header">
										<img src="/static/images/test.jpg" alt="Profile Picture">
										<div class="username">${userId}</div>
									</div>
									<hr>
									<div class="display-flex">
										<img class="post-image" src="/images/${feed_picture.feed_pic_title}"
											alt="Post Image">
									</div>
									<hr>
									<div class="display-flex">
										<div class="left-likes">
											<button>Like</button>
										</div>
										<div class="left-likes-num">42</div>
										<div class="right-edit">
											<button>수정</button>
										</div>
										<div class="right-delete">
											<button>삭제</button>
										</div>
									</div>
									<!-- 피드 제목 -->
									<div class="post-description" style="font-size:20px;">
										${feed.feed_title}
									</div>
									
									<!-- 피드 내용 -->
									<div class="post-description">
										${feed.feed_cont}
									</div>
								</div>
							</div>
						</div>--%>
						
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- 피드 상세보기 레이어 팝업 js문 -->
	

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
</html>