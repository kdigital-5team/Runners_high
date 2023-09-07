<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Runner's High &mdash; Regist Challenge</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" href="/static/css/form.css">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<!-- header -->
	<%@ include file="./inc/header.jsp"%>

	<!-- 챌린지 등록  -->
	<div class="site-wrap-width">
		<div class="site-section"></div>
		<div class="site-section">
			<div class="container">
				<h2 class="form-h2">챌린지 등록</h2>
				<div id="chall_id"	style="display: none;">${chall_id}</div>
				<label class="notice-label" for="chall_route_intro">
					*챌린지를 수행할 대략적인 경로를 설정합니다. <br> 지도를 마우스로 좌클릭하면 선 그리기가 시작되고, 우클릭 시 선 그리기가 종료되며, 실제 거리(단위 : m)를 표시합니다. </label>
			</div>
			<div class="site-section">
				<div id="map"></div>
				<div id="distance-info"></div>
					<input type="submit" onclick="submit2();" value="등록"/>
					<br><br>
			</div>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

</body>


<script>
var chall_id = parseInt(document.getElementById('chall_id').innerText);
var chall_path;
function submit2(){
   	$.ajax({
	        async : true, 
	        type : 'POST', 
	        data: JSON.stringify({chall_path}),
	        url: "/editPath/"+chall_id,
	        dataType: "text",
	        contentType: "application/json; charset=UTF-8",
	        success: function(data) {  
	        if(data == "main"){
	        	
	      	alert('등록완료 하였습니다.');
	      	location.replace("/challenge");
	      	
	        	} else {
	        		alert('등록하지 못했습니다!');
	        	}
	      	},
	      	error: function(error) {
	      		alert('등록하지 못했습니다!');
	          } 
	        })
	};
	

		
    
   	$(document).ready(function (){
   		navigator.geolocation.getCurrentPosition(success, fail);
   		
   		function success(pos) { // 위치 정보를 가져오는데 성공했을 때 호출되는 콜백 함수 (pos : 위치 정보 객체)
   		    const lat = pos.coords.latitude;
   		    const lng = pos.coords.longitude;

   		    
   			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   	   		var options = { //지도를 생성할 때 필요한 기본 옵션
   	   			center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
   	   			level: 3 //지도의 레벨(확대, 축소 정도)
   	   		};

   	   		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   	   	var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
   	 var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
   	 var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
   	 var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
   	 var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

   	 // 지도에 클릭 이벤트를 등록합니다
   	 // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
   	 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

   	     // 마우스로 클릭한 위치입니다 
   	     var clickPosition = mouseEvent.latLng;

   	     // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
   	     if (!drawingFlag) {

   	         // 상태를 true로, 선이 그리고있는 상태로 변경합니다
   	         drawingFlag = true;
   	         
   	         // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
   	         deleteClickLine();
   	         
   	         // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
   	         deleteDistnce();

   	         // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
   	         deleteCircleDot();
   	     
   	         // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
   	         clickLine = new kakao.maps.Polyline({
   	             map: map, // 선을 표시할 지도입니다 
   	             path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
   	             strokeWeight: 3, // 선의 두께입니다 
   	             strokeColor: 'rgb(61 141 255)', // 선의 색깔입니다
   	             strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
   	             strokeStyle: 'solid' // 선의 스타일입니다
   	         });
   	         
   	         // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
   	         moveLine = new kakao.maps.Polyline({
   	             strokeWeight: 3, // 선의 두께입니다 
   	             strokeColor: '#202e70', // 선의 색깔입니다
   	             strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
   	             strokeStyle: 'solid' // 선의 스타일입니다    
   	         });
   	     
   	         // 클릭한 지점에 대한 정보를 지도에 표시합니다
   	         displayCircleDot(clickPosition, 0);

   	             
   	     } else { // 선이 그려지고 있는 상태이면

   	         // 그려지고 있는 선의 좌표 배열을 얻어옵니다
   	         var path = clickLine.getPath();
   	     	 chall_path= path;
   	     

   	         // 좌표 배열에 클릭한 위치를 추가합니다
   	         path.push(clickPosition);
   	         chall_path.push(clickPosition);
   	         
   	         // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
   	         clickLine.setPath(path);

   	         var distance = Math.round(clickLine.getLength());
   	         displayCircleDot(clickPosition, distance);
   	     }
   	 });
   	
   	 // 지도에 마우스무브 이벤트를 등록합니다
   	 // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
   	 kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

   	     // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
   	     if (drawingFlag){
   	         
   	         // 마우스 커서의 현재 위치를 얻어옵니다 
   	         var mousePosition = mouseEvent.latLng; 

   	         // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
   	         var path = clickLine.getPath();
   	         
   	         // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
   	         var movepath = [path[path.length-1], mousePosition];
   	         moveLine.setPath(movepath);    
   	         moveLine.setMap(map);

   	          
   	         var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
   	             content = '<div class="dotOverlay distanceInfo"><span class="info-label">총거리</span><span class="number">' + distance + '</span>m</div>' ; // 커스텀오버레이에 추가될 내용입니다
   	         
   	         // 거리정보를 지도에 표시합니다
   	         showDistance(content, mousePosition);   
   	          
   	        
   	     }             
   	 });                 

   	 // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
   	 // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
   	 kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

   	     // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
   	     if (drawingFlag) {
   	    	 
   	    	 count=0;
   	    	 // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
   	      var path = clickLine.getPath();
   	    	 

   	 
              
   	         // 마우스무브로 그려진 선은 지도에서 제거합니다
   	         moveLine.setMap(null);
   	         moveLine = null;  
   	         
   	         // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
   	         var path = clickLine.getPath();

   	         // 선을 구성하는 좌표의 개수가 2개 이상이면
   	         if (path.length > 1) {

   	             // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
   	             if (dots[dots.length-1].distance) {
   	                 dots[dots.length-1].distance.setMap(null);
   	                 dots[dots.length-1].distance = null;    
   	             }

   	             var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
   	                 content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
   	                 
   	             // 그려진 선의 거리정보를 지도에 표시합니다
   	             showDistance(content, path[path.length-1]);  
   	              
   	         } else {

   	             // 선을 구성하는 좌표의 개수가 1개 이하이면 
   	             // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
   	             deleteClickLine();
   	             deleteCircleDot(); 
   	             deleteDistnce();

   	         }
   	         
   	         
   	         // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
   	         drawingFlag = false;          
   	     }  
   	 });    

   	 // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
   	 function deleteClickLine() {
   	     if (clickLine) {
   	         clickLine.setMap(null);    
   	         clickLine = null;        
   	     }
   	 }

   	 // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
   	 // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
   	 function showDistance(content, position) {
   	     
   	     if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
   	         
   	         // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
   	         distanceOverlay.setPosition(position);
   	         distanceOverlay.setContent(content);
   	         
   	     } else { // 커스텀 오버레이가 생성되지 않은 상태이면
   	         
   	         // 커스텀 오버레이를 생성하고 지도에 표시합니다
   	         distanceOverlay = new kakao.maps.CustomOverlay({
   	             map: map, // 커스텀오버레이를 표시할 지도입니다
   	             content: content,  // 커스텀오버레이에 표시할 내용입니다
   	             position: position, // 커스텀오버레이를 표시할 위치입니다.
   	             xAnchor: 0,
   	             yAnchor: 0,
   	             zIndex: 3  
   	         });      
   	     }
   	     
   	    const distanceInfoDiv = document.getElementById('distance-info');
   	    distanceInfoDiv.innerHTML = content;
   	 }

   	 // 그려지고 있는 선의 총거리 정보와 
   	 // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
   	 function deleteDistnce () {
   	     if (distanceOverlay) {
   	         distanceOverlay.setMap(null);
   	         distanceOverlay = null;
   	     }
   	 }
   	var count = 0;	
   	 // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
   	 // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
   	 function displayCircleDot(position, distance) {

   	     // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
   	     var circleOverlay = new kakao.maps.CustomOverlay({
   	         content: '<span class="dot"></span>',
   	         position: position,
   	         zIndex: 1
   	     });
   	     // 지도에 표시합니다
   	     circleOverlay.setMap(map);
   	 	 count++;
   	     if (distance > 0) {
   	         // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
   	         var distanceOverlay = new kakao.maps.CustomOverlay({
   	             content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>'+'<span class="seq">' +'분기점'+count + ': </span>',
   	             position: position,
   	             yAnchor: 1,
   	             zIndex: 2
   	         });

   	         // 지도에 표시합니다
   	         distanceOverlay.setMap(map);
   	     }

   	     // 배열에 추가합니다
   	     dots.push({circle:circleOverlay, distance: distanceOverlay});
   	 }

   	 // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
   	 function deleteCircleDot() {
   	     var i;

   	     for ( i = 0; i < dots.length; i++ ){
   	         if (dots[i].circle) { 
   	             dots[i].circle.setMap(null);
   	         }

   	         if (dots[i].distance) {
   	             dots[i].distance.setMap(null);
   	         }
   	     }

   	     dots = [];
   	 }

   	 // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
   	 // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
   	 // HTML Content를 만들어 리턴하는 함수입니다
   	 function getTimeHTML(distance) {
   	     // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
   	     var walkkTime = distance / 67 | 0;
   	     var walkHour = '', walkMin = '';

   	     // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
   	     if (walkkTime > 60) {
   	         walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
   	     }
   	     walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

   	     // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
   	     var bycicleTime = distance / 227 | 0;
   	     var bycicleHour = '', bycicleMin = '';

   	     // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
   	     if (bycicleTime > 60) {
   	         bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
   	     }
   	     bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

   	     // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
   	     var content = '<ul class="dotOverlay distanceInfo">';
   	     content += '    <li style="list-style: none;">';
   	     content += '        <span class="info-label">총거리</span><span class="number">' + distance + '</span>m';
   	     content += '    </li>';
   	     content += '    <li style="list-style: none;">';
   	     content += '        <span class="info-label">도보</span>' + walkHour + walkMin;
   	     content += '    </li>';
   	     content += '    <li style="list-style: none;">';
   	     content += '        <span class="info-label">자전거</span>' + bycicleHour + bycicleMin;
   	     content += '    </li>';
   	     content += '</ul>'

   	     return content;
   	 }
   		}

   		function fail(err) { // 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
   		    alert('현위치를 찾을 수 없습니다.');
   		}
   		
   	
   	
   	}
   		)

</script>
</html>