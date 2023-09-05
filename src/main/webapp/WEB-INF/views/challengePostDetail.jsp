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
<link rel="stylesheet" href="../static/css/style4.css">
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
									<c:if test="${run ne null }">
										<div class="row">
											<div class="col-lg-12">
													<div id="map" style="width: 80%; padding-top:35%; height:0; border-radius: 5px; margin:auto; 
																	background-position:center;
																	background-size:cover;">
													</div>
											</div>
										</div>
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
					</form>
			</div>
						
	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
		<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9fd4644a9a496749d0625dffe4286f8&libraries=services,clusterer,drawing"></script>
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
$(document).ready(function (){
	navigator.geolocation.getCurrentPosition(success, fail);
	
	function success(pos) { // 위치 정보를 가져오는데 성공했을 때 호출되는 콜백 함수 (pos : 위치 정보 객체)
   	    const lat = pos.coords.latitude;
   		const lng = pos.coords.longitude;
	 	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

	 	var auth_id = '${auth_id}';
	 	console.log(auth_id);
	   	$.ajax({
	        async : true, 
	        type : 'POST', 
	        data: JSON.stringify({auth_id}),
	        url: "/getRunRoute",
	        dataType: "text",
	        contentType: "application/json; charset=UTF-8",
	        success: function(data) {  
	        if(data){
	        		var raceLat=JSON.parse(data).item[0].route_lat;
	        		var raceLong=JSON.parse(data).item[0].route_long;
	        		console.log(raceLat);
	        		console.log(raceLong);
      			 var options = { //지도를 생성할 때 필요한 기본 옵션
         	   			center: new kakao.maps.LatLng(raceLat, raceLong), //지도의 중심좌표.
         	   			level: 6 //지도의 레벨(확대, 축소 정도)
         	   		};
      				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴	
      				var linePath = [];
	        
	        	for (var itemLength=0; itemLength<JSON.parse(data).item.length; itemLength++){
	        		linePath.push(new kakao.maps.LatLng(JSON.parse(data).item[itemLength].route_lat, JSON.parse(data).item[itemLength].route_long));
	        	}
	        		// 지도에 표시할 선을 생성합니다
	        		var polyline = new kakao.maps.Polyline({
	        		    path: linePath, // 선을 구성하는 좌표배열 입니다
	        		    strokeWeight: 5, // 선의 두께 입니다
	        		    strokeColor: 'rgb(61 141 255)', // 선의 색깔입니다
	        		    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        		    strokeStyle: 'solid' // 선의 스타일입니다
	        		});

	        		// 지도에 선을 표시합니다 
	        		polyline.setMap(map);  
	 
	        	
	        	} else {
	        		
	        	}
	      	},
	      	error: function(error) {
	      		
	          } 
	        })
	        

	}
	function fail(err) { // 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
	    alert('현위치를 찾을 수 없습니다.');
	}
});

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