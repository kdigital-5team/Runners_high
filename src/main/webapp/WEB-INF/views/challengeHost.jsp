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
					<fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${challenge.chall_end_date}"/><span class="mx-2">/</span>${fn:length(parList)}명
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
		
		<div style="margin: auto; text-align: center; float: left; width: 40%; margin-left: 28%; margin-top: 10px">
			<a href="/challenge/${challenge.chall_id }">소개</a><span class="mx-2">|</span> 
			<c:if test="${userId eq challenge.chall_reg_id }">
				<a href="#">관리</a><span class="mx-2">|</span> 
			</c:if>
			<c:if test="${challenge.chall_sit ne '모집중' || challenge.chall_sit ne '모집예정' }">
				<a href="${chall_id}challengePost">인증 게시판</a><span class="mx-2">|</span>
			</c:if>
			<a href="/challenge/${challenge.chall_id}calendar">캘린더</a>
		</div>
		<div style="float: left; width: 32%; margin-top: 10px">
			<c:if test="${challenge.chall_sit eq '모집중' || challenge.chall_sit eq '모집예정' }">
				<button class="btn btn-danger" onclick="deleteChall('${challenge.chall_id}')" style="display: inline-block;">삭제</button>
			</c:if>
		</div>
		<div style="width: 50%; margin: auto; clear: both;">
		<c:if test="${not empty applist}"> <span class="mx-2">신청자</span></c:if>
		<c:forEach items="${appList}" var="app">
			<div style="background-color: #F0F0F0; vertical-align: center;">
				<div style="display:inline-block; width:20%; padding-top:20%; height:0; border-radius: 70%;  
					background-image: url(${challenge.chall_pic});
					background-position:center;
					background-size:cover;">
				</div>
				<div style="display:inline-block; width: 50%; position:relative;">
					<div>칭호</div>
					<div>${app.nickname }</div>
					<div>안녕</div>
				</div>
				<div style="display:inline-block; position:relative; margin-buttom:50%;">
					<button class="btn btn-primary" onclick="acceptId('${app.user_id }','${challenge.chall_id}')">수락</button>
					<button class="btn btn-danger" onclick="declinetId('${app.user_id }','${challenge.chall_id}')">거절</button>
				</div>
			</div>
		</c:forEach>
		</div>
		<div style="width: 70%; margin: auto;">
			<span>맴버별 인증율</span>
		<c:forEach items="${parList}" var="par">
			<div>
				<div style="width: 15%; float: left; height: 150px;">
						<c:if test="${par.user_id ne host.user_id}">
						<button class="btn btn-danger" style="margin: auto; margin-top: 50%; display: block;" onclick="kickId('${par.user_id}','${challenge.chall_id}')">추방</button>
						</c:if>
					</div>
				<div style="width: 15%; float: left; height: 150px;">
					<div style="width:100%; padding-top:100%; height:0; border-radius: 70%;  
							background-image: url(/images/${par.user_pic});
							background-position:center;
							background-size:cover;">
					</div>
					<div style="text-align: center;">
						${par.nickname }
					</div>
				</div>
				<div style="text-align: center; width: 70%; float: right; height: 150px;">
					${par.chall_auth_num/challenge.chall_all_auth*100}%
					<div style="width: 75%; background-color: #BDFFAD; height: 25px; position: relative; margin: auto;">
						<div style="width: ${par.chall_auth_num/challenge.chall_all_auth*100}%; background-color: #32FF00; height: 25px; position: relative;">
					</div>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>
		</c:forEach>
		<div>
			
		</div>
	</div>
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
	function acceptId(user_id, chall_id){
		var new_form = document.createElement('form');
		
		new_form.name="chall_accept";
		new_form.method='PUT';
		new_form.action='/challenge/accept/'+chall_id;
		
		var chall_input = document.createElement('input');
		chall_input.setAttribute("type","hidden");
		chall_input.setAttribute("name","acceptId");
		chall_input.setAttribute("value", user_id);
		console.log(chall_input);
		
		new_form.appendChild(chall_input);
		
		document.body.appendChild(new_form);
		new_form.submit();
	}
	
	function declinetId(user_id, chall_id){
		var new_form = document.createElement('form');
		
		new_form.name="chall_decline";
		new_form.method='PUT';
		new_form.action='/challenge/decline/'+chall_id;
		
		var chall_input = document.createElement('input');
		chall_input.setAttribute("type","hidden");
		chall_input.setAttribute("name","declineId");
		chall_input.setAttribute("value", user_id);
		console.log(chall_input);
		
		new_form.appendChild(chall_input);
		
		document.body.appendChild(new_form);
		new_form.submit();
	}
	
	function kickId(user_id, chall_id){
		var new_form = document.createElement('form');
		
		new_form.name="chall_kick";
		new_form.method='PUT';
		new_form.action='/challenge/kick/'+chall_id;
		
		var chall_input = document.createElement('input');
		chall_input.setAttribute("type","hidden");
		chall_input.setAttribute("name","kickId");
		chall_input.setAttribute("value", user_id);
		console.log(chall_input);
		
		new_form.appendChild(chall_input);
		
		document.body.appendChild(new_form);
		new_form.submit();
	}
	
	function deleteChall(chall_id){
		if(confirm("챌린지를 삭제하시겠습니까?")){
			var new_form = document.createElement('form');
			
			new_form.name="chall_delete";
			new_form.method='DELETE';
			new_form.action='/challenge/delete/'+chall_id;
			
			document.body.appendChild(new_form);
			new_form.submit();
		}
	}
  </script>

</html>