<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${user.nickname}의 챌린지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
<link rel="stylesheet" href="../static/fonts/icomoon/style.css">

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
					<div class="col-lg-10">
						<div class="display-flex">
							<div class="post" style="border:none; margin-top:10%; margin-left:35%">
								<div class="post-header2">
									<img src="/images/${user.user_pic}" alt="Profile Picture">									
								</div>
							</div>				
							<div class="post" style="border:none; margin-top: 12%;">
								<div class="username">${user.nickname}</div>
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
								<a href="/feed/${user.user_id}">피드</a><span class="mx-2">|</span>
								<a href="#"><strong>참여 챌린지</strong></a> <span class="mx-2">|</span> 
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


				<div class="row mb-5" id="list">
					<c:forEach items="${myChallList}" var="chall" varStatus="status">
					<c:set var="ListEnd" value="${status.count}" />
						<div style="width: 45%; 
									float:left; 
									height:200px; 
									background-color:#F0F0F0; 
									margin:2%; margin-bottom:20px; 
									border-radius: 5px;">
						<div>
									<div id="map${status.count}" style="float: left; width: 35%; padding-top:35%; height:0;margin: 2%; border-radius: 5px;
										background-position:center;
										background-size:cover;">
										</div>
									<div style="float: left; width: 59%; margin-left:2px;" >
										<c:choose>
										
											<c:when test="${myUCList[status.index].user_chall_status eq 'Y' }">
												<div style="float: left; 
															background-color:#FFCECE; 
															width: 30%; 
															text-align: center;
															 margin-top: 4%; 
															 margin-bottom: 4%; 
															 border-radius: 5px;"><b>완료</b>
												</div>
											</c:when>
											<c:when test="${myUCList[status.index].chall_reg_status eq 'Y' }">
												<div style="float: left; 
															background-color:#FFCECE; 
															width: 30%; 
															text-align: center;
															 margin-top: 4%; 
															 margin-bottom: 4%; 
															 border-radius: 5px;"><b>참가중</b>
												</div>
											</c:when>
											<c:otherwise>
												<div style="float: left; 
															background-color:#FFCECE; 
															width: 30%; 
															text-align: center;
															 margin-top: 4%; 
															 margin-bottom: 4%; 
															 border-radius: 5px;"><b>대기중</b>
												</div>
											</c:otherwise>
										</c:choose>
										<div style="float:left; width: 30%; margin-right: 40%; text-align: center; margin-top: 4%; border-radius: 5px; background-color: #FFCC99" ><b>${chall.chall_category}</b></div>
										<h3 style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 100%; margin-right: 5%;">${chall.chall_name}</h3>
										<c:if test="${chall.chall_category eq '대회용'}">
											<div style="font-size: 15px">${chall.race_name }</div>
										</c:if>
										<c:if test="${chall.region_state eq chall.region_city}">
										<div style="font-size: 15px">${chall.region_state} ${chall.region_district}</div>
										</c:if>
										<c:if test="${chall.region_state ne chall.region_city}">
										<div style="font-size: 15px">${chall.region_state} ${chall.region_city}</div>
										</c:if>
										<div>${race.region_state} ${race.region_city}</div>
										<div class="caption" style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_end_date}"/></div>
										<div>인증 주 ${chall.chall_week_auth}회 / 최대 ${chall.chall_size}명</div>
										<div style="display: none;" id="${status.count}">${chall.chall_id}</div>
									</div>
								</div>
						</div>
              </c:forEach>
            </div>
          </div>
					
		</div>

		
	</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9fd4644a9a496749d0625dffe4286f8&libraries=services,clusterer,drawing"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/js/jquery-ui.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.stellar.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>

	<script src="/js/main.js"></script>

</body>
<script type="text/javascript">
	$(document).ready(function (){
   		navigator.geolocation.getCurrentPosition(success, fail);
   		
   		function success(pos) { // 위치 정보를 가져오는데 성공했을 때 호출되는 콜백 함수 (pos : 위치 정보 객체)

   		 	for (var i=1; i<='<c:out value="${ListEnd}"/>'; i++){
   	   		    const lat = pos.coords.latitude;
   	   		    const lng = pos.coords.longitude;
   		 	var container = document.getElementById('map'+i); //지도를 담을 영역의 DOM 레퍼런스
   		 	var chall_id = document.getElementById(i).innerText;
   		   	$.ajax({
   		        async : false, 
   		        type : 'POST', 
   		        data: JSON.stringify({chall_id}),
   		        url: "/getLatLongById",
   		        dataType: "text",
   		        contentType: "application/json; charset=UTF-8",
   		        success: function(data) {  
   		        if(data){
   		        		var raceLat=JSON.parse(data).item[0].route_lat;
   		        		var raceLong=JSON.parse(data).item[0].route_long;
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
   		        		    strokeColor: '#ff0000', // 선의 색깔입니다
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
   	   		
   	   		

   		}
   		function fail(err) { // 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
   		    alert('현위치를 찾을 수 없습니다.');
   		}
	});
	  </script>
</html>
