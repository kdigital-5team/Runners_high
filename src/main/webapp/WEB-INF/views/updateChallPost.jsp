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
		
						<form name="update_form" id="update_form" method="POST" action="/updatePost/${auth_id}">
						<div class="container">
			<!-- <div class="post"> -->	        
		        					
					<div class="form-group">	
						<label for="auth_title">제목</label>					
							                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" value="${post.auth_title}">
	                
	                	
					</div>
					<div class="form-group">
					<label for="chall_id">챌린지 id</label>
					
					<input class="form-control" type="number" name="chall_id" id="chall_id" value="${post.chall_id }" readonly disabled>
					
					</div>
					 
					<div class="form-group">
					<label for="auth_cont">내용</label>	
						<!-- <div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;"> -->
							<input class="form-control" type="text" name="auth_cont" id="auth_cont" style="height:400px" value="${post.auth_cont}"></input>
							<!-- rows="5" style="width:600px; display:block; margin: 0 auto;" -->
						<!-- </div> -->
					</div>	
					<button type="button" class="btn btn-primary" onclick="submit()">수정하기</button>
			</div>
				</form>		
			
		
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

	
	function submit(){
		document.update_form.submit();
	}
  </script>
</html>