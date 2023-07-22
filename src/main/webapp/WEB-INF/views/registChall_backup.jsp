<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Runner's High &mdash; Regist Challenge2</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" href="../static/css/form.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
<!-- <script src="jquery.cookie.js"></script>   -->	

	<!-- header -->
	<%@ include file="./inc/header.jsp"%>


	<!-- 챌린지 등록  -->
	<div class="site-wrap-width">
		<div class="site-section"></div>
		<div class="site-section">
			<div class="container">
				<form name= "regist_form" id="regist_form" method="post" action="/registChall">
	        <div class="context-form">
	        <h2 class="form-h2">챌린지 등록</h2>
	            <label for="inputChall">챌린지명</label><br>
	            <input type="text" id="chall_name" name="chall_name" placeholder="챌린지명"><br>
	            <label class="notice-label" for="challName_check"></label>
	        </div>
	        <div class="context-form">
	            <label for="inputIntro">설명</label><br>
	            	<textarea id="textArea" name="chall_intro" rows="1" maxlength="300"
							  placeholder="챌린지 설명글" wrap="hard"
							  onkeyup="fn_checkByte(this)"></textarea><br>
							 <sup><span id="currByte">0</span>/500bytes</sup><br>
	        </div>
	        <div class="context-form">
	            <label for="inputDate">기간</label><br>
	            	<input type="text" id="chall_start_date" name="chall_start_date" placeholder="챌린지 시작일" readonly>
	            	<input type="text" id="chall_end_date" name="chall_end_date" placeholder="챌린지 종료일" readonly><br>
	        	
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
	        <div class="context-form">
	            <label for="input_chall_week_auth">주간 인증 횟수</label><br>
					<input type="range" class="form-range" min="1" max="7" value="1" id="chall_week_auth" name="chall_week_auth"><br>
	       				<output id="chall_week_auth_value">주 1회</output><br>
	        </div>
	        <div class="context-form">
	        	<label for="chall_size">인원</label><br>
	        	<label class="notice-label">*모집할 최대 인원 수(최소 3명 ~ 최대 100명)</label><br>
	       		<input type="text" id="chall_size" name="chall_size" placeholder="예: 3, 10, 100"><br>
	       		<label class="notice-label" for="size_check"></label>
			</div>
	        <div class="context-form">
	        	<label for="chall_category">챌린지 목적</label><br>
					<input type="button" class="customBtn" value ="일상용" onclick="selectedBtn(this, 'chall_category');">
					<input type="button" class="customBtn" value ="대회용" onclick="selectedBtn(this, 'chall_category'); challRacePopup();">
					<input type="hidden" id="race_id" name="race_id" value=""  readonly>
					<input type="hidden" name="chall_category" id="chall_category" value="">
			</div>
				<div class="context-form">
		        	<label for="region">지역</label><br>
	        		<label class="notice-label">*'일상용' 챌린지의 경우 선택 입력</label><br>
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
			<div class="context-form">
	        	<label for="chall_sit">모집상태</label><br>
					<input type="button" class="customBtn" onclick="selectedBtn(this , 'chall_sit');" value ="모집중">
					<input type="button" class="customBtn" onclick="selectedBtn(this, 'chall_sit');" value ="모집 종료">
					<input type="button" class="customBtn" onclick="selectedBtn(this, 'chall_sit');" value ="모집 예정">
					<input type="hidden" name="chall_sit" id="chall_sit" value="">
			</div>
			<div class="context-form">
	        	<label for="chall_online">온라인/오프라인</label><br>
				<label class="notice-label">*오프라인 모임 개최 여부</label><br>
					<input type="button" class="customBtn" onclick="selectedBtn(this, 'chall_online');" value ="온라인">
					<input type="button" class="customBtn" onclick="selectedBtn(this, 'chall_online');" value ="오프라인">
					<input type="button" class="customBtn" onclick="selectedBtn(this, 'chall_online');" value ="모두"><br>
					<input type="hidden" name="chall_online" id="chall_online" value="">
			</div>
			<div class="context-form">
	        	<label for="chall_all_auth">챌린지 최소 인증률</label><br>
	        	<label class="notice-label">*챌린지 완수 기준(최소 40% ~ 최대 100%)</label><br>
	       		<input type="text" id="chall_all_auth" name="chall_all_auth" placeholder="예 : 40, 90"><br>
	       		<label class="notice-label" for="all_auth_check"></label>
			</div>
			<input type="button" onclick="submit2();" value="다음" />
			<br><br><br>
</form>
</div>
</div>
</div>

<!-- footer -->
<%@ include file="./inc/footer.jsp"%>

</body>

<script type="text/javascript">

<!-- 동적으로 챌린지 설명 크기 변경 -->
window.onload = function() {
	console.log("onload JS");
	
	function resize() {
        let textarea = document.getElementById("textArea");
        textarea.style.height = "0px";
        
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
        
        textarea.style.height = (scrollHeight + borderTop + borderBottom) + "px";
    }
    
    let textarea = document.getElementById("textArea");
    textarea.addEventListener("input", resize);
    
    // window.onload 시 캘린더 실행
    buildCalendar(); 
}

<!-- 동적으로 챌린지 설명 체크 -->
function fn_checkByte(obj){
	console.log("byte체크 실행");
	
	const str = obj.value;
	const str_len = str.length;
	
	const maxByte = 500;
	let rbyte = 0;
	let rlen = 0;
	let one_char = "";
	let str2 = "";
	
    for(let i = 0; i < str_len; i++){

    	one_char = str.charAt(i);
    	
        if(escape(one_char).length > 4){
        	rbyte += 3;
        }else{
        	rbyte++;
        }
        if (rbyte <= maxByte) {
        	rlen = i+1;
        }
    }
        if(rbyte > maxByte){
        	alert('챌린지 소개는 최대 500Byte까지만 입력 가능합니다.');
            document.getElementById("currByte").innerText = rbyte;
            document.getElementById("currByte").style.color = "#e35c5c";
            
         // 초과된 부분 제거
		str2= str.substr(0, rlen);
         obj.value = str2;
         fn_checkByte(obj);
        } else {
    document.getElementById("currByte").innerText = rbyte;
    document.getElementById("currByte").style.color = "#293A8E";
    }
}

<!-- 입력값 검증 -->
var popup;
var chall_path;
var all_auth_chk = false;
var size_chk = false;
var regionId = null;
var state=null;
var city=null;
var district=null;
const allAuthCheck = RegExp(/^[0-9]+$/);
const allSizeCheck = RegExp(/^[0-9]+$/);	
	

	$('#chall_all_auth').keyup(function() {
		var chall_all_auth = document.getElementById('chall_all_auth').value; 
        if(!allAuthCheck.test($(event.target).val())){
        	 $("label[for='all_auth_check']").text("숫자로만 입력해주세요");
        	 $("label[for='all_auth_check']").css("color", "#e35c5c");
        	 console.log($(event.target).val() );
        	 all_auth_chk = false;
        } 
        else if (chall_all_auth < 40 || chall_all_auth > 100){
        	$("label[for='all_auth_check']").text("40 이상 100 이하로만 입력해주세요.");
        	$("label[for='all_auth_check']").css("color", "#e35c5c");
       	 	console.log($(event.target).val() );
    		all_auth_chk = false;
        }
        else{
        console.log("성공");
        all_auth_chk = true;
        $("label[for='all_auth_check']").text("정확히 입력하셨습니다.");
        $("label[for='all_auth_check']").css("color", "#898989");
        }
	});

	
	$('#chall_size').keyup(function() {
		var chall_size= document.getElementById('chall_size').value; 
        if(!allAuthCheck.test($(event.target).val())){
        	 $("label[for='size_check']").text("숫자로만 입력해주세요.");
        	 $("label[for='size_check']").css("color", "#e35c5c");
        	 console.log($(event.target).val() );
        	 size_chk = false;
        } 
        else if (chall_size < 3 || chall_size > 100){
        	$("label[for='size_check']").text("3 이상 100 이하로만 입력해주세요.");
        	$("label[for='size_check']").css("color", "#e35c5c");
       	 	console.log($(event.target).val() );
    		size_chk = false;
        }
        else{
        console.log("성공");
       	size_chk = true;
        $("label[for='size_check']").text("정확히 입력하셨습니다.");
        $("label[for='size_check']").css("color", "#898989");
        }
	});

/* <!-- 드롭다운 -->
const label = document.querySelector('.label');
const options = document.querySelectorAll('.optionItem');
const optionList = document.querySelector('.optionList');
const selectBox = document.querySelector('.selectBox2');

// 클릭한 옵션의 텍스트를 라벨 안에 넣음
const handleSelect = (function(item) {
  label.innerHTML = item.textContent;
  optionList.style.display='none';
  
  // 선택한 값 업데이트
  document.getElementById('region_state_input').value = item.getAttribute('value');
  document.getElementById('region_city_input').value = item.getAttribute('value');
  document.getElementById('region_district_input').value = item.getAttribute('value');
});

// 옵션 클릭시 클릭한 옵션을 넘김
options.forEach(function(option){
  option.addEventListener('click', function(){
	  handleSelect(option)
	  selectBox.style.backgroundColor = '#E8F0FE';
	  })
});

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.addEventListener('click', function(event){
  event.preventDefault();
  if(optionList.style.display === 'block') {
	    optionList.style.display = 'none';
	  } else {
	    optionList.style.display = 'block';
	  }
});
 */

 <!-- 버튼 -->
//선택된 버튼들을 저장하는 객체
 var selectedButtons = {
   'chall_category': null,
   'chall_sit': null,
   'chall_online': null
 };

 // 버튼 선택에 따른 값, css 변경
 function selectedBtn(button, type) {
     switch (type) {
         case 'chall_category':
             chall_category = button.value;
             break;
         case 'chall_sit':
             chall_sit = button.value;
             break;
         case 'chall_online':
             chall_online = button.value;
             break;
     }

     if (selectedButtons[type] === button) {
         button.style.backgroundColor = '';
         selectedButtons[type] = null;
     } else {
         if (selectedButtons[type]) {
             selectedButtons[type].style.backgroundColor = '';
         }
         button.style.backgroundColor = '#d0e3ff';
         selectedButtons[type] = button;
     }
 }

<!-- 캘린더 -->
let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화
// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.

function buildCalendar() {
	<% session.removeAttribute("raceId");%>
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
            nowColumn.style.color = "white";
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
    
    // 달력 로드 후 어제 날짜 css 처리
    setYesterdayRadius();
}

//날짜 선택
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
		console.log(document.getElementsByClassName("choiceDay")[0].innerText);
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

<!-- 어제 날짜 css 처리  -->
function setYesterdayRadius() {
    let yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1); // 어제로 설정
    yesterday.setHours(0, 0, 0, 0); // 비교를 위해 시간을 0시 0분 0초로 설정

    let calendarRows = document.querySelectorAll(".Calendar tbody tr");
    for (let i = 0; i < calendarRows.length; i++) {
        let rowCells = calendarRows[i].querySelectorAll("td");
        for (let j = 0; j < rowCells.length; j++) {
            let cell = rowCells[j];
            let cellDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), parseInt(cell.innerText)); // 현재 달의 날짜로 설정
            cellDate.setHours(0, 0, 0, 0); // 비교를 위해 시간을 0시 0분 0초로 설정

            if (cellDate.getTime() === yesterday.getTime()) {
                cell.classList.add("yesterDay");
            }
        }
    }
}

<!-- 인증 주기 슬라이더 -->

	var valueMap = {
			1: "주 1회",
			2: "주 2회",
			3: "주 3회",
			4: "주 4회",
			5: "주 5회",
			6: "주 6회",
			7: "매일",
	}
	
// 초기값
document.getElementById("chall_week_auth").value="1";	
	
document.getElementById("chall_week_auth").addEventListener("input", function() {
    var sliderValue = document.getElementById("chall_week_auth").value;
    var outputElement = document.getElementById("chall_week_auth_value");
    
   var mappedValue = valueMap[sliderValue];
   
    outputElement.innerText = mappedValue;
    
});

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}

function challRacePopup(){
    	var popOption = "width = 500, height = 500, top = 50, left = 50, location = no";
    	var openUrl ='/registChall/selectChallRace';
    	popup = window.open(openUrl, 'pop', popOption);
}

function setChildValue(raceId){
	var raceId = raceId.raceId
    document.getElementById("race_id").value = raceId;
   	
    $.ajax({
        async : false, 
        type : 'POST', 
        data: JSON.stringify({raceId}),
        url: "/getRegionIdByRaceId",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success: function(data) { 
        regionId=data;
        },
        error: function(error) {
            alert("자동으로 주소값을 불러오는데 실패했습니다.");
        } 
    });
    $.ajax({
        async : false, 
        type : 'POST', 
        data: JSON.stringify({regionId}),
        url: "/getStateById",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success: function(data) { 
      	console.log("data", data);
      	state=data;
        },
        error: function(error) {
            alert("자동으로 주소값을 불러오는데 실패했습니다.");
        } 
    });
    $.ajax({
        async : false, 
        type : 'POST', 
        data: JSON.stringify({regionId}),
        url: "/getCityById",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success: function(data) { 
      	console.log("data", data);
      	city=data;
        },
        error: function(error) {
            alert("자동으로 주소값을 불러오는데 실패했습니다.");
        } 
    });
    
    $.ajax({
        async : false, 
        type : 'POST', 
        data: JSON.stringify({regionId}),
        url: "/getDistrictById",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success: function(data) { 
      	console.log("data", data);
      	district=data;
        },
        error: function(error) {
            alert("자동으로 주소값을 불러오는데 실패했습니다.");
        } 
    });
    
    
    $('#region_state').val(state).prop('selected',true).change();

}

function chageState(){
    var state = document.getElementById("region_state").value;
    console.log(state)
          $.ajax({
              async : false, 
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
    $('#region_city').val(city).prop('selected',true).change();
}


function chageCity(){
    var city = document.getElementById("region_city").value;
    console.log(city)
          $.ajax({
              async : false, 
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
    $('#region_district').val(district).prop('selected',true).change();

}

function chageDistrict(){
    console.log("선택된"+$("select[name=region_district] option:selected").text());  
}


function submit2(){
	
	Form = document.regist_form;
	
	console.log(Form);
	
	if(Form.chall_start_date.value=="" || Form.chall_end_date.value=="" || Form.chall_all_auth.value=="" || Form.region_district.value==""  || !all_auth_chk || !size_chk){
	        alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");
	        
	        
	} else {
			 Form.chall_category.value = chall_category;
	         Form.chall_sit.value = chall_sit;
	         Form.chall_online.value = chall_online;
		
	         alert(
	        		 "chall_sit : " + chall_sit + " : " + Form.chall_sit.value +		 
	        		 "\nchall_category : " + chall_category + " : " + Form.chall_category.value +		 
	        		 "\nchall_online : " + chall_online + " : " + Form.chall_online.value		 
	         );
	         document.regist_form.submit();
	         
	         return;
	    }
	};
		
</script>
</html>