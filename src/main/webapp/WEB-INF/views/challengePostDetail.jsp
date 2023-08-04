<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${post.auth_title}</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
<link rel="stylesheet" href="../fonts/icomoon/style.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
<script src="../static/js/jquery-ui.js"></script>
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/css/image_crop.css">
<link rel="stylesheet" href="../static/css/popup.css">
<link rel="stylesheet" href="../static/css/feed.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/style2.css">
<script src="../static/js/jquery.stellar.min.js"></script>
<script src="../static/js/jquery.fancybox.min.js"></script>

</head>
<style>
</style>
<body>
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	
		        <div class="site-wrap">
				<form name="delete_form" id="delete_form" method="POST" action="/challenge/deletepost/${auth_id}">
					<div class="container" style="width:60%">
					<div class="form-group">	
						<label for="auth_title">제목</label>	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" value="${post.auth_title}" >
					</div>
					
					<div class="form-group">
					<label for="auth_cont">내용</label>	
							<input class="form-control" type="text" name="auth_cont" id="auth_cont" style="height:400px" value="${post.auth_cont}"></input>
							<input type="hidden" id="chall_id" name="chall_id" value="${post.chall_id}"  readonly>
					</div>	
					
					<div style="text-align:center">
					<c:if test="${post.comment_id eq userId }">
						<button type="button" class="btn btn-danger"   onclick="updatePost('${auth_id}','${userId}')">
						수정하기
						</button>
						<button type="button" class="btn btn-danger"   onclick="deletePost('${auth_id}')">
						삭제하기 
						</button>
					</c:if>

					</div>
					</form>
					
					<div>
						<textarea id="comment" rows="2" cols="80"></textarea>
						<button type="button" onclick="registComment()">댓글등록</button>
					</div>
					
					<div id="comment_box">
					
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
	function deletePost(auth_id){
		 document.forms.delete_form.submit();
		
	}
	
	function updatePost(auth_id, user_id){
		var new_form = document.createElement('form');
		
		new_form.name="update_post";
		new_form.method='PUT';
		new_form.action='/modifyPost/'+auth_id;
		
		var post_input = document.createElement('input');
		post_input.setAttribute("type","hidden");
		post_input.setAttribute("name","userId");
		post_input.setAttribute("value", user_id);
		
		new_form.appendChild(post_input);
		
		document.body.appendChild(new_form);
		new_form.submit();
	}
	
	function registComment(){
		var comment = document.getElementById('comment').value;
		
		if(comment==""){
			alert("내용을 입력해 주세요");
		}
		var objParams={"comment" : comment};
		$.ajax({
			type:'post',
			url:"/challenge/insertComment",
			data:objParams
			})
			.success(function(result){
				console.log('성공');
			})
		
	}
  </script>
</html>