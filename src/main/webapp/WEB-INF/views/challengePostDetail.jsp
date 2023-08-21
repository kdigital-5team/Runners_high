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
							      <div class="modal-body">							    
									
									<br>
							        <!-- 피드 제목 -->
							        <div class="display-flex">
										<div class="post-description" style="font-size:20px; text-align: center; margin: auto;">
											${post.auth_title}
										</div>
										<div class="post-action-right" style="margin-left: auto">
											<input type="hidden" name="chall_id" value="${post.chall_id}">
											<c:if test="${post.comment_id eq userId }">
												<button type="button" class="btn btn-dark"   onclick="updatePost('${auth_id}','${userId}')">
												수정
												</button>
												<button type="button" class="btn btn-dark"   onclick="deletePost('${auth_id}')">
												삭제
												</button>
											</c:if>
										</div>
										
									</div>
									<hr>
									<c:if test="${pic ne null }">
										<div class="post-description" style="min-height: 100px;">
											<img alt="${pic.auth_pic_title }" src="/images/auth/${pic.auth_pic_uuid}">
										</div>
										<hr>
									</c:if>
									<!-- 피드 내용 -->
									<div class="post-description" style="min-height: 100px;">
										${post.auth_cont}
									</div>
									<hr>
									<div class="display-flex">
										<div class="left-likes" id="like-post">
											<c:choose>
												<c:when test="${alreadyLike eq 'like' }">
													<img alt="" src="../static/images/like.png" onclick="dislike('${userId}','${auth_id}')" style="width: 30px; cursor: pointer;">
												</c:when>
												<c:otherwise>
													<img alt="" src="../static/images/dislike.png" onclick="like('${userId}','${auth_id}')" style="width: 30px; cursor: pointer;">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="left-likes-num" id="like-num">${likeNum}</div>
										<div class="post-header" style="margin-left: auto;">
											<img  src="/images/${authUser.user_pic}" alt="Profile Picture">
											<span class="username">${authUser.nickname} | <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.auth_date}"/></span>
										</div>
									</div>
							        
							      </div>
						</div>	
					</form>
					<hr>
					<div class="context-form">
						<textarea id="comment" rows="1" maxlength="300"></textarea>
						<button type="button" onclick="registComment('${auth_id}')">댓글등록</button>
					</div>
					
					<div id="comment_box">
						<c:forEach items="${commentList}" var="comment">
						<div class="display-flex">
							<div class="post-header">
								<img alt="Profile Picture" src="/images/${comment.user_pic}">
								<span>${comment.nickname }</span>
							</div>
							<div style="margin: auto;">
								${comment.auth_comment_cont }
							</div>
							<div style="margin-left: auto">
								<div>
								<c:choose>
									<c:when test="${userId eq comment.user_id}">
										<a href="#" onclick="deleteComment('${comment.auth_comment_id}')">삭제</a>
									</c:when>
								</c:choose>
								</div>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.auth_comment_date}"/>
							</div>
						</div>
						</c:forEach>
					</div>

			</div>
						
	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

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
	
	function registComment(auth_id){
		var comment = document.getElementById('comment').value;
		
		if(comment==""){
			alert("내용을 입력해 주세요");
		}
		var objParams={"comment" : comment, "authId" : auth_id};
		$.ajax({
			type:'post',
			url:"/challenge/insertComment",
			data:objParams
			})
			.success(function(result){
				$('#comment_box').load(location.href+' #comment_box');
			})
			document.getElementById('comment').value = null;
		
	}
	
	function like(userId, auth_id){
		if(userId==""){
			alert("로그인이 필요합니다");
		}
		
		else{
			$.ajax({
				type:'post',
				url:"/challenge/"+auth_id+"like",
			})
			.success(function(result){
				$('#like-post').load(location.href+' #like-post');
				$('#like-num').load(location.href+' #like-num');
			})
		}
	}
	
	function dislike(userId, auth_id){
			$.ajax({
				type:'post',
				url:"/challenge/"+auth_id+"dislike",
			})
			.success(function(result){
				$('#like-post').load(location.href+' #like-post');
				$('#like-num').load(location.href+' #like-num');
			})
	}
	
	function deleteComment(comment_id){
		var objParams={"comment_id" : comment_id};
		$.ajax({
			type:'post',
			url:"/challenge/deleteComment",
			data:objParams
			})
			.success(function(result){
				$('#comment_box').load(location.href+' #comment_box');
			})
	}
  </script>
</html>