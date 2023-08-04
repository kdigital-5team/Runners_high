<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="now" value="<%=new java.util.Date() %>" />
<c:set var="sysDay"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>

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
						<div id="map" style="width: 80%; padding-top:35%; height:0; border-radius: 5px; margin:auto; 
										background-position:center;
										background-size:cover;">
						</div>
			</div>
		</div>
		<div class="hero-contents" style="margin-top: 20px;">
			<div style="float:left; width: 33%; text-align: center;">
				<h2>${challenge.chall_name}</h2>
				<p>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_end_date}"/><span class="mx-2">/</span>${fn:length(userList)}명
					<div class="caption" style="font-size: 10px"></div>
				</p>
			</div>
			<div style="float: left; width: 33%">
				<span>${challenge.chall_sit}</span>
				<c:if test="${userId ne challenge.chall_reg_id 
								&& userChall.user_reg_status ne 'Y' 
								&& userChall.user_deny_num lt 2 
								&& challenge.chall_sit eq '모집중'
								&& fn:length(userList) lt challenge.chall_size }">
					<form action="/challenge/${challenge.chall_id}/apply" method="post">
						<input type="hidden" name="applyId" value="${userId}">
						<input type="submit" class="btn btn-primary" value="신청">
					</form>
				</c:if>
				<c:if test="${userId ne challenge.chall_reg_id && userChall.user_reg_status eq 'Y'}">
					<form action="/challenge/${challenge.chall_id}/withdraw" method="post">
						<input type="hidden" name="applyId" value="${userId}">
						<input type="submit" class="btn btn-danger" value="탈퇴">
					</form>
				</c:if>
			</div>
			<div style="float: left; width: 34%;">
				<div onclick="location.href='/feed/${host.user_id}'" 
						style="cursor: pointer; width:30%; padding-top:30%; height:0; border-radius: 70%; float:left; 
						background-image: url(/images/${host.user_pic});
						background-position:center;
						background-size:cover;">
				</div>
				<div style="float: right; width: 65%;  vertical-align: middle;">
					<div>챌린지 호스트</div>
					<div id="chall_id" style="display: none;">${challenge.chall_id}</div>
					<div>${host.user_title }</div>
					<div>${host.nickname }</div>
					<div>${host.intro }</div>
				</div>
			</div>
		</div>
		
		<div style="margin: auto; text-align: center;">
			<a href="/challenge/${challenge.chall_id }">소개</a><span class="mx-2">|</span>
			<c:if test="${userId eq challenge.chall_reg_id }">
				<a href="/challenge/${challenge.chall_id}host">관리</a><span class="mx-2">|</span> 
			</c:if>
			<a href="#">인증 게시판</a><span class="mx-2">|</span>
			<a href="/challenge/${challenge.chall_id}calendar">캘린더</a>
		</div>

		<div style="margin:30px"></div>
		
		<table class="table table-hover table-striped" style="width:78%; margin:auto; text-align:center">
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
								<c:set var="postDay"><fmt:formatDate value="${post.auth_date}" pattern="yyy-MM-dd"/></c:set>
								<td>${post.auth_id}</td>
								<td><a href="/challenge/challPostDetail${post.auth_id}">${post.auth_title}</a></td>
								<c:choose>
									<c:when test="${postDay==sysDay}">
										<td><fmt:formatDate value="${post.auth_date}" pattern="HH:mm"/></td>
									</c:when>
									<c:otherwise>
										<td><fmt:formatDate value="${post.auth_date}" pattern="yyyy-MM-dd"/></td>
									</c:otherwise>
								</c:choose>
							</tr>
					</tbody>
					</c:forEach>

							</table>
				<div style="margin:30px"></div>
				<div style="text-align:center; ">		
			
			<a href="/challenge/${chall_id}insertChallPost">
			<button class="btn btn-dark" style="font-color:white">글쓰기</button>
			</a></div>
			
		
	</div>
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

	 	var chall_id = document.getElementById('chall_id').innerText;
	 	console.log(chall_id);
	   	$.ajax({
	        async : true, 
	        type : 'POST', 
	        data: JSON.stringify({chall_id}),
	        url: "/getLatLongById",
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
	        		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
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
	function apply(){

	}
	
	var cantPost='${cantPost}';
	if(cantPost=='불가')
		alert("챌린지 참가자가 아니거나, 인증 가능한 상태가 아닙니다");
	
	console.log(sysDay);
	console.log(postDay);

  </script>
</html>