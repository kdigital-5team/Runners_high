<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<title>Runner's High &mdash; Challenge</title>

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
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/style.css">

</head>
<body>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9fd4644a9a496749d0625dffe4286f8&libraries=services,clusterer,drawing"></script>
	<script src="../static/js/jquery.min.js"></script>
	<script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../static/js/jquery-ui.js"></script>
	<script src="../static/js/popper.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<script src="../static/js/owl.carousel.min.js"></script>
	<script src="../static/js/jquery.stellar.min.js"></script>
	<script src="../static/js/jquery.fancybox.min.js"></script>
	<script src="../static/js/aos.js"></script>
	<script src="../static/js/main.js"></script>
	
	
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->

		<div class="container">

		</div>

		<div class="row no-gutters site-subbar align-items-center py-3" >
			<div style="margin: auto;" >
				<nav class="site-navigation text-left text-md-left"
					     style="float: left;justify-content: center;align-items: center;display: flex;">
					<ul class="site-menu js-clone-nav d-none d-lg-block">
						<li class="has-children">온라인
							<ul class="dropdown arrow-top">
								<li><button style="width: 100px" type="button" id="온라인" name="chall_online"
										onclick="test(this.id, this.name)" class="option">온라인</button></li>
								<li><button style="width: 100px" type="button" id="오프라인" name="chall_online"
										onclick="test(this.id, this.name)" class="option">오프라인</button></li>
							</ul>
						</li>
						<li class="has-children">도
							<ul class="dropdown arrow-top">
									<li><button style="width: 100px" type="button" id="서울특별시" name="region_state"
										onclick="test(this.id, this.name)" class="option">서울특별시</button></li>
									<li><button style="width: 100px" type="button" id="부산광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">부산광역시</button></li>
										<li><button style="width: 100px" type="button" id="대구광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">대구광역시</button></li>
										<li><button style="width: 100px" type="button" id="인천광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">인천광역시</button></li>
										<li><button style="width: 100px" type="button" id="광주광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">광주광역시</button></li>
										<li><button style="width: 100px" type="button" id="대전광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">대전광역시</button></li>
										<li><button style="width: 100px" type="button" id="울산광역시" name="region_state"
										onclick="test(this.id, this.name)" class="option">울산광역시</button></li>
										<li><button style="width: 100px" type="button" id="세종특별차치시" name="region_state"
										onclick="test(this.id, this.name)" class="option">세종특별자치시</button></li>
										<li><button style="width: 100px" type="button" id="경기도" name="region_state"
										onclick="test(this.id, this.name)" class="option">경기도</button></li>
										<li><button style="width: 100px" type="button" id="강원도" name="region_state"
										onclick="test(this.id, this.name)" class="option">강원도</button></li>
										<li><button style="width: 100px" type="button" id="충청북도" name="region_state"
										onclick="test(this.id, this.name)" class="option">충청북도</button></li>
										<li><button style="width: 100px" type="button" id="충청남도" name="region_state"
										onclick="test(this.id, this.name)" class="option">충청남도</button></li>
										<li><button style="width: 100px" type="button" id="전라북도" name="region_state"
										onclick="test(this.id, this.name)" class="option">전라북도</button></li>
										<li><button style="width: 100px" type="button" id="전라남도" name="region_state"
										onclick="test(this.id, this.name)" class="option">전라남도</button></li>
										<li><button style="width: 100px" type="button" id="경상북도" name="region_state"
										onclick="test(this.id, this.name)" class="option">경상북도</button></li>
										<li><button style="width: 100px" type="button" id="경상남도" name="region_state"
										onclick="test(this.id, this.name)" class="option">경상남도</button></li>
										<li><button style="width: 100px" type="button" id="제주도" name="region_state"
										onclick="test(this.id, this.name)" class="option">제주도</button></li>
							</ul>
						</li>
						<li class="has-children">시/군
							<ul class="dropdown arrow-top" id="region_list" style="overflow: auto; height: 150px;">
								
								
							</ul>
						</li>
						<li class="has-children">월
							<ul class="dropdown arrow-top">
								<li><button style="width: 70px" type="button" id="1월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">1월</button></li>
								<li><button style="width: 70px" type="button" id="2월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">2월</button></li>
								<li><button style="width: 70px" type="button" id="3월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">3월</button></li>
								<li><button style="width: 70px" type="button" id="4월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">4월</button></li>
								<li><button style="width: 70px" type="button" id="5월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">5월</button></li>
								<li><button style="width: 70px" type="button" id="6월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">6월</button></li>
								<li><button style="width: 70px" type="button" id="7월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">7월</button></li>
								<li><button style="width: 70px" type="button" id="8월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">8월</button></li>
								<li><button style="width: 70px" type="button" id="9월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">9월</button></li>
								<li><button style="width: 70px" type="button" id="10월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">10월</button></li>
								<li><button style="width: 70px" type="button" id=11월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">11월</button></li>
								<li><button style="width: 70px" type="button" id="12월" name="chall_date"
										onclick="test(this.id, this.name)" class="option">12월</button></li>
							</ul></li>
						<li class="has-children">목적
							<ul class="dropdown arrow-top">
								<li><button style="width: 100px" type="button" id="대회용" name="chall_cat"
										onclick="test(this.id, this.name)" class="option">대회용</button></li>
								<li><button style="width: 100px" type="button" id="일상용" name="chall_cat"
										onclick="test(this.id, this.name)" class="option">일상용</button></li>
							</ul>
						</li>
						<li class="has-children">상태
							<ul class="dropdown arrow-top">
								<li><button style="width: 100px" type="button" id="모집중" name="chall_con"
										onclick="test(this.id, this.name)" class="option">모집중</button></li>
								<li><button style="width: 100px" type="button" id="모집예정" name="chall_con"
										onclick="test(this.id, this.name)" class="option">모집예정</button></li>
								<li><button style="width: 100px" type="button" id="모집종료" name="chall_con"
										onclick="test(this.id, this.name)" class="option">모집종료</button></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="contact-form2">
						<input type="text" class="form-control" id="keyword" placeholder="챌린지명 입력" name="keyword" style="float: left; width:65%; height: 40px;" onkeypress="if(event.keyCode==13){searchKeyword();}"> 
						<button type="button" onclick="searchKeyword()" class="btn btn-dark" style="width:61px;">검색</button>
						<button type="button" onclick="loginCheck();" class="btn btn-dark" style="margin-left:5px;">+</button>
				</div>
			</div>
		</div>
		<div style="width: 60%; margin: auto;">
			<ul id="option_list" style="padding: 5px">

			</ul>
		</div>


		<div class="site-section">
			<div class="container">


				<div class="row-challenge" id="list">
					<c:forEach items="${challList}" var="chall" varStatus="status">
					<c:set var="ListEnd" value="${status.count}" />
						<div class="challenge-block" onclick="location.href='challenge/${chall.chall_id}'"> <!-- margin 2% 부분 해소 -->
							
								<div>
									<div id="map${status.count}" class="list-map">
										</div>
									<div class="inline-block">
										<c:if test="${chall.chall_sit eq '모집중'}">
											<div class="tag-default tag-sit1"><span class="tag-text">모집중</span></div>
										</c:if>
										<c:if test="${chall.chall_sit eq '모집예정'}">
											<div class="tag-default"><span class="tag-text">모집예정</span></div>
										</c:if>
										<c:if test="${chall.chall_sit eq '모집종료'}">
											<div class="tag-default tag-sit3"><span class="tag-text">모집종료</span></div>
										</c:if>
										<c:if test="${chall.chall_category eq '일상용'}">
											<div class="tag-default"><span class="tag-text">일상용</span></div>
										</c:if>
										<c:if test="${chall.chall_category eq '대회용'}">
											<div class="tag-default tag-cat2"><span class="tag-text">대회용</span></div>
										</c:if>
										<h3 class="challenge-name"><a class="challenge-name-t" href="challenge/${chall.chall_id}">${chall.chall_name}</a></h3>
										<c:if test="${chall.chall_category eq '대회용'}">
											<div class="challenge-name-s">${chall.race_name}</div>
										</c:if>
										<c:if test="${chall.chall_category eq '일상용'}">
											<div class="space"></div>
										</c:if>
										<div class="caption">
											<c:if test="${chall.region_state eq chall.region_city}">
												<c:if test="${chall.region_state eq '지역무관'}">
														<div>${chall.region_state} </div>
												</c:if>
												<c:if test="${chall.region_state ne '지역무관'}">
													<div>${chall.region_state} ${chall.region_district}</div>
												</c:if>
											</c:if>
											<c:if test="${chall.region_state ne chall.region_city}">
												<c:if test="${chall.region_state eq '지역무관'}">
													<div>${chall.region_state} </div>
												</c:if>
												<c:if test="${chall.region_state ne '지역무관'}">
													<div>${chall.region_state} ${chall.region_city}</div>
												</c:if>
											</c:if>
												<span>
													<fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_end_date}"/>
												</span><br>
												<span class="caption"> 주 ${chall.chall_week_auth}회    |   
													<img class="caption-img" alt="인원 이미지" src="../static/images/join.png">
												  ${chall.chall_size}</span>
										</div>
											<div style="display: none;" id="${status.count}">${chall.chall_id}</div>
									</div>
								</div>
						</div>
              </c:forEach>
            </div>
          </div>
					
		</div>
				<div id="show-dog-img">
				</div>


			</div>

	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
	

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
   	   		
   	   		

   		}
   		function fail(err) { // 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
   		    alert('현위치를 찾을 수 없습니다.');
   		}
	});
	
	
	let keyword=null;
	function test(button_id, option){
		const target = document.getElementById(button_id);
		const sbutton = document.getElementById("select"+button_id);
		var option_list = $("#option_list");
		if(sbutton == null)
			option_list.append("<li style=\"display:inline-block\"id=\"select"+button_id+"\" name="+ option +"><button type=\"button\" onclick=\"removeBtn(this,this.innerText)\">" + target.innerText + "</button></li>");
		
		var region_list =$("#region_list");
		var rList = document.getElementById("region_list");
		const gangwon = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","홍천군","화천군","횡성군"];
	  	const gyeonggi = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
	  	const chungbuk =["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시","충주시"];
	  	const chungnam =["계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군"];
	  	const jeonbuk=["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"];
	  	const jeonnam=["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여주시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  	const gyeongbuk=["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","포항시"];
	  	const gyeongnam=["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산천군","양산시","의령군","진주시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"];
	  	const jeju=["제주시","서귀포시"];
	  	
	  	if(button_id=="경기도"){
	  		rList.replaceChildren();
	  		for(i=0; i<gyeonggi.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+gyeonggi[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+gyeonggi[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="강원도"){
	  		rList.replaceChildren();
	  		for(i=0; i<gangwon.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+gangwon[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+gangwon[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="중청북도"){
	  		rList.replaceChildren();
	  		for(i=0; i<chungbuk.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+chungbuk[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+chungbuk[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="충청남도"){
	  		rList.replaceChildren();
	  		for(i=0; i<chungnam.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+chungnam[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+chungnam[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="전라북도"){
	  		rList.replaceChildren();
	  		for(i=0; i<jeonbuk.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+jeonbuk[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+jeonbuk[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="경상북도"){
	  		rList.replaceChildren();
	  		for(i=0; i<gyeongbuk.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+gyeongbuk[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+gyeongbuk[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="경상남도"){
	  		rList.replaceChildren();
	  		for(i=0; i<gyeongnam.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+gyeongnam[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+gyeongnam[i]+"</button></li>");
	  		}
	  	}
	  	
	  	if(button_id=="제주도"){
	  		rList.replaceChildren();
	  		for(i=0; i<jeju.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+jeju[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+jeju[i]+"</button></li>");
	  		}
	  	}
	  
	  
		search();
	}
	function loginCheck(){
		var userId = '<%=(String)session.getAttribute("userId")%>';
		if (userId == "null"){
			alert("로그인이 필요한 서비스 입니다.");
		} else {
			location.href = "/registChall";
		}
		var isTrue='${isTrue}';
		if(isTrue=='존재')
			alert("이미 신청/참가한 챌린지가 있습니다.");
	}
	
	function removeBtn(ths, button_id){
		var ths = $(ths);
		const target = document.getElementById(button_id);
		ths.parents("li").remove();

		search();
	}
	
	function searchKeyword(){
		const target = document.getElementById("keyword");
		keyword = target.value;
	
		target.value = null;
		
		search();
		
		
	}
	
	function search(){
		var opt=[];
		var val=[];
		$("#option_list li").each(function(index, element){
			opt.push(element.getAttribute("name").trim());
			val.push($(this).text());
		})
		var objParams={"opt" : opt, "val" : val, "keyword" : keyword};
		$.ajax({
			type : "GET",
			url : "/challenge/filter",
			data : objParams
		})
			.success(function(result){
				$('#list').html(result);
				
		})
		
		
	}
	


  </script>
</html>