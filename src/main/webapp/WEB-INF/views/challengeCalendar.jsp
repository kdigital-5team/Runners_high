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
        }

        .futureDay{            
            background-color: #FFFFFF;
        }

        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
        }
    </style>

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
				<h2>${chall.chall_name}</h2>
				<p>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_end_date}"/><span class="mx-2">/</span>${fn:length(parList)}명
					<div class="caption" style="font-size: 10px"></div>
				</p>
			</div>
			<div style="float: left; width: 33%">
				<span>${chall.chall_sit}</span>
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
					<div id="chall_id" style="display: none;">${chall.chall_id}</div>
					<div>${host.user_title }</div>
					<div>${host.nickname }</div>
					<div>${host.intro }</div>
				</div>
			</div>
		</div>
		
		<div style="margin: auto; text-align: center;">
			<a href="/challenge/${chall.chall_id}">소개</a><span class="mx-2">|</span> 
			<c:if test="${userId eq chall.chall_reg_id }">
				<a href="/challenge/${chall.chall_id}host">관리</a><span class="mx-2">|</span> 
			</c:if>
			<c:if test="${challenge.chall_sit ne '모집중' || challenge.chall_sit ne '모집예정' }">
				<a href="${chall.chall_id}challengePost">인증 게시판</a><span class="mx-2">|</span>
			</c:if>
			<a href="#">캘린더</a>
		</div>
		<div class="form-group">
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
		<div style="width: 70%; margin: auto; margin-top: 20px; text-align: center;">
			<span>나의 인증율</span>
			<div>
				<div style="text-align: center; width: 100%; height: 150px;">
					${myUC.chall_auth_num/chall.chall_all_auth*100}%
					<div style="width: 75%; background-color: #BDFFAD; height: 25px; position: relative; margin: auto;">
						<div style="width: ${myUC.chall_auth_num/chall.chall_all_auth*100}%; background-color: #32FF00; height: 25px; position: relative;">
					</div>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 70%; margin: auto; text-align: center;">
			<span>전체 인증율</span>
			<div>
				<div style="text-align: center; width: 100%; height: 150px;">
					${avgAuth/chall.chall_all_auth*100}%
					<div style="width: 75%; background-color: #BDFFAD; height: 25px; position: relative; margin: auto;">
						<div style="width: ${avgAuth/chall.chall_all_auth*100}%; background-color: #32FF00; height: 25px; position: relative;">
					</div>
					</div>
				</div>
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
	function fail(err) { // 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
	    alert('현위치를 찾을 수 없습니다.');
	}
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
        nowColumn.id = nowDay;

    
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
//input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}
  </script>

</html>