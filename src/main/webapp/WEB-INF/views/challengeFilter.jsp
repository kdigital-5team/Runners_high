<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
											<div class="space">${raceName}</div>
										</c:if>
										<c:if test="${chall.chall_category eq '일상용'}">
											<div class="space"></div>
										</c:if>
										<div class="caption">
											<c:if test="${chall.region_state eq chall.region_city}">
												<div class="caption">${chall.region_state} ${chall.region_district}</div>
											</c:if>
											<c:if test="${chall.region_state ne chall.region_city}">
												<div class="caption">${chall.region_state} ${chall.region_city}</div>
											</c:if>
											<div>${race.region_state} ${race.region_city}</div>
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
	</script>