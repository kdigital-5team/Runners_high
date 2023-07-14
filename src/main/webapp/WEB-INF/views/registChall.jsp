<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/style3.css">
    <style>
        td {
            width: 50px;
            height: 50px;
        }

        .Calendar { 
            text-align: center;
            margin: 0 auto; 
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        

        .pastDay{ background-color: lightgray; }

        .today{            
            background-color: #FFCA64;            
            cursor: pointer;
        }

        .futureDay{            
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
            cursor: pointer;
        }
    </style>

    
</head>
<body>
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
<form name= "regist_form" method="post" action="/registChall">
    <div class="container">
        <h1>챌린지 등록</h1>
        <div class="form-group">
            <label for="inputChall">챌린지명</label>
            <input type="text" class="form-control" id="chall_name" name="chall_name" placeholder="챌린지명">
            <label for="challName_check"></label>
        </div>
        <div class="form-group">
            <label for="inputIntro">설명</label>
            <input type="text" class="form-control" id="chall_intro" name="chall_intro" placeholder="챌린지 설명">
             <label for="chall_intro"></label>
        </div>
        <div class="form-group">
            <label for="inputDate">기간</label>
            <label><input type="text" class="form-control" id="chall_start_date" name="chall_start_date" value=""  ></label>
            <label><input type="text" class="form-control" id="chall_end_date" name="chall_end_date"value="" ></label>
        	<table class="Calendar">
        	<thead>
           		<tr>
               	 <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                	<td colspan="5">
                    	<span id="calYear"></span>년
                    	<span id="calMonth"></span>월
                	</td>
                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
            	</tr>
            	<tr>
                	<td>일</td>
                	<td>월</td>
                	<td>화</td>
                	<td>수</td>
                	<td>목</td>
                	<td>금</td>
                	<td>토</td>
            	</tr>
        	</thead>

        	<tbody>
        	</tbody>
    		</table>
		</div>
        <div class="form-group">
            <label for="input_chall_week_auth">주간 인증 횟수</label>
            <select id="chall_week_auth" name="chall_week_auth">
				<option value ="1"> 주 1회</option>
				<option value ="2"> 주 2회 </option>
				<option value ="3"> 주 3회 </option>
				<option value ="4"> 주 4회 </option>
				<option value ="5"> 주 5회</option>
				<option value ="6"> 주 6회 </option>
				<option value ="7"> 매일 </option>
			</select >
        </div>
        <div class="form-group">
        	<label for="chall_size">인원</label>
       		<input type="text" class="form-control" id="chall_size" name="chall_size" placeholder="인원 수">
		</div>
        <div class="form-group">
        	<label for="chall_route">챌린지 루트</label>
        	<label for="chall_route_intro">지도를 마우스로 클릭하면 선 그리기가 시작되고 오른쪽 마우스를 클릭하면 선 그리기가 종료되면서 그려진 선의 실제 거리(단위 : m)를 표시합니다.</label>
        	<div id="map" style="width: 800px; height: 500px;"></div>
        </div>
        <div class="form-group">
        	<label for="chall_category">챌린지 목적</label>
        	<p></p>
        	<select id="chall_category" name="chall_category">
				<option value ="대회용"> 대회용</option>
				<option value ="일상용"> 일상용 </option>
			</select >
		</div>
		<div class="form-group">
        	<label for="region">지역</label>
        	<p></p>
        	<label for="region_state">도</label>
        	<select id="region_state" name="region_state" onchange="chageState();">
        	    <c:forEach var="state" items="${stateList}">
          		<option>${state}</option>
          		</c:forEach>
			</select >
			<label for="region_city">시</label>
        	<select id="region_city" name="region_city" onchange="chageCity();">
			</select >
			<label for="region_district">군/구</label>
        	<select id="region_district" name="region_district" onchange="chageDistrict();">
			</select >
		</div>
		<div class="form-group">
        	<label for="chall_sit">모집상태</label>
        	<p></p>
        	<select id="chall_sit" name="chall_sit">
				<option value ="모집중"> 모집중</option>
				<option value ="모집 종료"> 모집 종료 </option>
				<option value ="모집 예정"> 모집 예정 </option>
			</select >
		</div>
		<div class="form-group">
        	<label for="chall_online">온라인/오프라인 여부</label>
        	<p></p>
        	<select id="chall_online" name="chall_online">
				<option value ="온라인"> 온라인 </option>
				<option value ="오프라인"> 오프라인  </option>
				<option value ="모두"> 모두 </option>
			</select >
		</div>
		<div class="form-group">
        	<label for="chall_all_auth">챌린지 최소 인증률</label>
       		<input type="text" class="form-control" id="chall_all_auth" name="chall_all_auth" placeholder="최소 40% 이상 숫자로만 입력해주세요!">
		</div>
        <button type="button" class="btn btn-primary" onclick="submit2();">등록하기</button>
    </div>
</form>
<!-- footer -->
<%@ include file="./inc/footer.jsp"%>
</body>
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
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 
<script>


$(function() {
});
window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화
// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
        nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력

    
        if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
            nowColumn.style.color = "#DC143C";
        }
        if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
            nowColumn.style.color = "#0000CD";
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }


        if (nowDay < today) {                       // 지난날인 경우
            nowColumn.className = "pastDay";
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            nowColumn.className = "today";
            nowColumn.onclick = function () { choiceDate(this); }
        }
        else {                                      // 미래인 경우
            nowColumn.className = "futureDay";
            nowColumn.onclick = function () { choiceDate(this); }
        }
    }
}

// 날짜 선택
function choiceDate(nowColumn) {

    if (document.getElementsByClassName("choiceDay")[1]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[1].classList.remove("choiceDay");
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");// 해당 날짜의 "choiceDay" class 제거
    }
    
    nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	if (document.getElementsByClassName("choiceDay")[0] && document.getElementsByClassName("choiceDay")[1]) {
		$('input[name=chall_end_date]').attr('value',nowMonth.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + document.getElementsByClassName("choiceDay")[1].innerText );
		console.log(document.getElementsByClassName("choiceDay")[1].innerText);

	} else {
		$('chall_start_date').val(document.getElementsByClassName("choiceDay")[0].innerText);
		$('input[name=chall_start_date]').attr('value',nowMonth.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + document.getElementsByClassName("choiceDay")[0].innerText);
	}
}

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    buildCalendar();    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}


function chageState(){
    var state = document.getElementById("region_state").value;
    console.log(state)
          $.ajax({
              async : true, 
              type : 'POST', 
              data: state,
              url: "/getCity",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              success: function(data) {  
            	console.log("data", data);
            	$("#region_city option").remove();
            	$("#region_district option").remove();
            	for(var count = 0; count < data.length; count++){ 
            		$('#region_city').append("<option>" + data[count] + "</option>");
            	}
              },
              error: function(error) {
                  alert("도를 입력해주세요!");
              }        
          });
}

function chageCity(){
    var city = document.getElementById("region_city").value;
    console.log(city)
          $.ajax({
              async : true, 
              type : 'POST', 
              data: city,
              url: "/getDistrict",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              success: function(data) {  
            	console.log("data", data);
            	$("#region_district option").remove();
            	for(var count = 0; count < data.length; count++){ 
            		$('#region_district').append("<option>" + data[count] + "</option>");
            	}
              },
              error: function(error) {
                  alert("시를 입력해주세요!");
              } 
          });

}

function chageDistrict(){
    console.log("선택된"+$("select[name=region_district] option:selected").text());  
}

function submit2(){
	document.regist_form.submit();
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
   	             strokeColor: '#db4040', // 선의 색깔입니다
   	             strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
   	             strokeStyle: 'solid' // 선의 스타일입니다
   	         });
   	         
   	         // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
   	         moveLine = new kakao.maps.Polyline({
   	             strokeWeight: 3, // 선의 두께입니다 
   	             strokeColor: '#db4040', // 선의 색깔입니다
   	             strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
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
   	             content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>' ; // 커스텀오버레이에 추가될 내용입니다
   	         
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
   	    	 console.log(path);
   	      $.ajax({
              async : true, 
              type : 'POST', 
              data: JSON.stringify({path}),
              url: "/getPath",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              success: function(data) {  
            	console.log("data", data);
            	},
            	error: function(error) {
                    alert("시를 입력해주세요!");
                } 
              })
              
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
   	     content += '    <li>';
   	     content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
   	     content += '    </li>';
   	     content += '    <li>';
   	     content += '        <span class="label">도보</span>' + walkHour + walkMin;
   	     content += '    </li>';
   	     content += '    <li>';
   	     content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
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