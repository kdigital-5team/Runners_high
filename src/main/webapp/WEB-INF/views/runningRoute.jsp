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

<link rel="stylesheet" href="../static/css/form.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
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
<link rel="stylesheet" href="../static/css/style2.css">

<link rel="stylesheet" href="../fonts/icomoon/style.css">
<link rel="stylesheet" href="../static/css/image_crop.css">
<link rel="stylesheet" href="../static/css/popup.css">
<link rel="stylesheet" href="../static/css/feed.css">

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
	<div class="site-wrap">
		<div class="container">
			<div  class="container" style="text-align:center"><h2 class="form-h2">달리기</h2></div>
			<div class="site-section">
				<div id="map"></div>
				<div id="run-info">
					<div id="distance-info"></div>
					<div id="timer"></div>
					<button id="start-button" style="margin: auto;">시작</button>
					<button id="end-button" style="display: none; margin: auto;">종료</button>
					<button id="save-button" style="display: none; margin: auto;">저장</button>
				</div>
			</div>
			<div class="post" id="post" style="display: none;">	        
		        <form action='<c:url value='/insertRunPost'/>' name= "regist_form" id="regist_form" method="POST" enctype="multipart/form-data">					
					<div style="display: flex;">	
						<label style="margin-top:15px; width: 100px; text-align: center;">제목</label>					
						<div style="display:table-cell; margin:auto; margin-top:5px; justify-content: center;">		                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" style="width:600px; display:block;">
	                	</div>
	                	<button type="button" class="btn btn-dark" onclick="registPost();"  style="width: 100px; justify-content: center;">
	                		등록
	                	</button>
					</div>
					<hr>
					<div class="form-group">
						<div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;">
							<textarea class="form-control" name="auth_cont" id="auth_cont" rows="5" style="width:600px; display:block; margin: 0 auto;"></textarea>
						</div>
					</div>	
				</form>
			</div>
				<br> <br>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>

</body>


<script>

var chall_path;
function registPost(){
	Form=document.regist_form;
	if(Form.auth_title.value==""){
	    alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");   
	}
	
	var cont = document.getElementById('distance-info').innerHTML + "\n" + document.getElementById('timer').innerHTML + "\n" + Form.auth_cont.value;
	
	var objParams={"title" : Form.auth_title.value, "cont" : cont};
	$.ajax({
		type:'post',
		url:"/insertRunPost",
		data:objParams,
		success:function(result){
			submit2();
		}
	})
}
function submit2(){
   	$.ajax({
	        async : true, 
	        type : 'POST', 
	        data: JSON.stringify({chall_path}),
	        url: "/runPath",
	        dataType: "text",
	        contentType: "application/json; charset=UTF-8",
	        success: function(data) {  
	        if(data == "main"){
	        	
	      	alert('등록완료 하였습니다.');
	      	location.replace("challenge");
	      	
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
   	 var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
   	 var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
   	 var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
   	 
   	 // 시간 측정
   	 var time=0;
   	 var min="";
   	 var sec="";
   	 var interval;
   	 var timeInterval;
   	 
   	 
   	 const startButton = document.getElementById("start-button");
   	 const endButton = document.getElementById("end-button");
   	 const saveButton = document.getElementById("save-button");
   	 const info = document.getElementById("run-info");
   	 const post = document.getElementById("post");
   	 
   	 startButton.addEventListener('click', () => {
   		 time = 0;
   		 startButton.style.display='none';
   		 saveButton.style.display='none';
   		 endButton.style.display="block";
   		running();
   		interval = setInterval(running, 5000);
   		timeInterval = setInterval(function(){
   			min=parseInt(time/60);
   			sec=time%60;
   			
   			document.getElementById("timer").innerHTML = min+"분"+sec+"초";
   			time++;
   		},1000)
      });
   	 
   	endButton.addEventListener('click', () => {
  		 startButton.style.display='block';
  		 saveButton.style.display='block';
  		 endButton.style.display="none";
  		clearInterval(interval);
  		clearInterval(timeInterval);
  		runStop();
     });
   	
   	saveButton.addEventListener('click', () => {
 		 info.style.display="none";
 		 post.style.display="block";
    });
   	 
   	 function running() {

   	     // 현재 위치 표시 
   	     var clickPosition =new kakao.maps.LatLng(lat+0.0001*time, lng);
   	 	 map.panTo(clickPosition);

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
   	             strokeWeight: 7, // 선의 두께입니다 
   	             strokeColor: 'rgb(61 141 255)', // 선의 색깔입니다
   	             strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
   	             strokeStyle: 'solid' // 선의 스타일입니다
   	         });
   	     
   	         // 클릭한 지점에 대한 정보를 지도에 표시합니다
   	         displayCircleDot(clickPosition, 0);

   	             
   	     } else { // 선이 그려지고 있는 상태이면

   	         // 그려지고 있는 선의 좌표 배열을 얻어옵니다
   	         var path = clickLine.getPath();
   	     
   	     

   	         // 좌표 배열에 클릭한 위치를 추가합니다
   	         path.push(clickPosition);
   	         
   	         // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
   	         clickLine.setPath(path);

   	         var distance = Math.round(clickLine.getLength());
   	         displayCircleDot(clickPosition, distance);
   	     }
   	     
   	  	var distance = Math.round(clickLine.getLength()),
        content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
        
	    // 그려진 선의 거리정보를 지도에 표시합니다
	    var path = clickLine.getPath();
	    showDistance(content, path[path.length-1]);  
   	 };                

   	 // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
   	 // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
   	 function runStop() {

   	     // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
   	     if (drawingFlag) {
   	    	 
   	    	 count=0;
   	    	 // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
   	      var path = clickLine.getPath();
   	    	 
   	    	 //chall_path 등록
   	   	  chall_path = path;
   	         
   	         // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
   	         var path = clickLine.getPath();

   	         // 선을 구성하는 좌표의 개수가 2개 이상이면
   	         if (path.length > 1) {

   	             // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
   	             if (dots[dots.length-1].distance) {
   	                 dots[dots.length-1].distance.setMap(null);
   	                 dots[dots.length-1].distance = null;    
   	             }
   	              
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
   	 };    

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

   	     // 거리를 가지고 HTML Content를 만들어 리턴합니다
   	     var content = '<ul class="dotOverlay distanceInfo">';
   	     content += '    <li style="list-style: none;">';
   	     content += '        <span class="info-label">총거리</span><span class="number">' + distance + '</span>m';
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