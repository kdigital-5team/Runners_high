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
		
		<div class="container">
				<div class="row">
					<div class="col-lg-10">
						<div class="display-flex">
							<div class="post" style="border:none; margin-top:10%; margin-left:35%">
								<div class="post-header2">
									<img src="/images/${user.user_pic}" alt="Profile Picture">									
								</div>
							</div>
							<form action="/mypage/feed" enctype="multipart/form-data" method="POST">					
								<div class="post" style="border:none; margin-top:60%;">
									<div class="username">${user.user_id}</div>
									<div class="userintro">${user.intro}</div>
								</div>
							</form>	
							<div onclick="location.href='#'" style="border:none; margin-top:14%; margin-left:2%; margin-right:15%">
								<button>프로필 수정</button>
							</div>
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
								<a href="/mypage/feed"><strong>피드</strong></a> <span class="mx-2">|</span>
								<a href="/mypage/chall">참여 챌린지</a> <span class="mx-2">|</span> <a
									href="/mypage/title">칭호</a> <span class="mx-2"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 피드 글 작성 -->
		<div class="container">
			<div class="post">	        
		        <form action='<c:url value='/mypage/write'/>' method="POST" enctype="multipart/form-data">					
					<div class="form-group row">	
						<label style="margin-left:20px; margin-top:15px; margin-right:19%;">제목</label>					
						<div style="display:table-cell; margin:auto; margin-top:5px;">		                	
		                	<input class="form-control" type="text" name="feed_title" style="width:600px; display:block;">
	                	</div>
	                	<button type="submit" class="blue_outline_btn" name ="user_id" value= ${user.user_id}  style="border; margin-left:205px; margin-right:20px; margin-top:5px;">
	                		등록
	                	</button>
					</div>
					<hr>
					<div class="form-group">
						<div style="height: 150px; width: 200px; vertical-align: middle; margin-left:41%">	
							<label>이미지 파일 첨부</label> 
				            <input type="file" name="file" onchange="readURL(this);"/>
							<img id="preview" src="#" width=250 height=150 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
						</div>
					</div>
					<div class="form-group">
						<div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;">
							<textarea class="form-control" name="feed_cont" rows="5" style="width:600px; display:block; margin: 0 auto;"></textarea>
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
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