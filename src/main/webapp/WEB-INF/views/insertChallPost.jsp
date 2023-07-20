	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>피드 작성</title>
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

<!-- 글쓰기 박스 css -->
<style>
	div#editor {
    	padding: 4px 6px;
        border: 1px solid #D6D6D6;
        border-radius: 4px;
    }
</style>

<body>
	<div class="site-wrap">

		<!-- header -->
		<%@ include file="./inc/header.jsp"%>

		<!-- 피드 / 챌린지 / 칭호 탭 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero-wrap text-center" style=""
						data-stellar-background-ratio="0.5">
						<div class="hero-contents">
							<p>
								<a href="/mypage/feed"><strong>피드</strong></a> <span class="mx-2">|</span>
								<a href="${chall_id}challengePost">인증게시판</a> <span class="mx-2">|</span> <a
									href="/mypage/title">칭호</a> <span class="mx-2"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 피드 글 작성 -->
		<div class="container">
			<!-- <div class="post"> -->	        
		        <form action='<c:url value='/challengePost/insertChallPost'/>' method="GET" enctype="multipart/form-data">					
					<div class="form-group">	
						<label for="auth_title">제목</label>					
						<!-- <div style="display:table-cell; margin:auto; margin-top:5px;"> -->		                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" ><!-- style="width:600px; display:block;" -->
	                	<!-- </div> -->
	                	
					</div>
					<div class="form-group">
					<input class="form-control" type="number" name="chall_id" placeholder="2">
					</div>
					 
					<div class="form-group">
						<!-- <div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;"> -->
							<textarea class="form-control" type="text" name="auth_cont" id="auth_cont"></textarea>
							<!-- rows="5" style="width:600px; display:block; margin: 0 auto;" -->
						<!-- </div> -->
					</div>	
				</form>
			</div>
		</div>
		<div style="text-align:center; ">		
			<button type="submit" style="background-color:Gainsboro; border-radius:5%; padding:6px 11px; font-color:white">등록</button></div>
	<!-- </div> -->
	<!-- 사진 첨부용 자바 스크립트 -->
	<script type="text/javascript">

	   function readURL(input) {
	      var file = input.files[0] 
	      console.log(file)
	      if (file != '') {
	         var reader = new FileReader();
	         reader.readAsDataURL(file);
	         reader.onload = function (e) { 
		     console.log(e.target)
			console.log(e.target.result)
	           $('#preview').attr('src', e.target.result);
	          }
	      }
	  }  
	</script>
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