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
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/longinForm.css">
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

<form name= "regist_form" id="regist_form" method="post" action="/registChall">
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
            <label><input type="text" class="form-control" id="chall_start_date" name="chall_start_date" value=""  readonly></label>
            <label><input type="text" class="form-control" id="chall_end_date" name="chall_end_date"value="" readonly></label>
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
       		<label for="size_check"></label>
		</div>
        <div class="form-group">
        	<label for="chall_category">챌린지 목적</label>
        	<p></p>
        	<select id="chall_category" name="chall_category" onchange=challRacePopup();>
				<option value ="일상용" > 일상용</option>
				<option value ="대회용" > 대회용 </option>
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
       		<label for="all_auth_check"></label>
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
var popup;
var chall_path;
var race_id = '<%=(String)session.getAttribute("raceId")%>';
var all_auth_chk = false;
var size_chk = false;
const allAuthCheck = RegExp(/^[0-9]+$/);
const allSizeCheck = RegExp(/^[0-9]+$/);	
	
	$('#chall_all_auth').keyup(function() {
		var chall_all_auth = document.getElementById('chall_all_auth').value; 
        if(!allAuthCheck.test($(event.target).val())){
        	 $("label[for='all_auth_check']").text("챌린지 최소 인증률은 숫자로만 입력해주세요");
        	 console.log($(event.target).val() );
        	 all_auth_chk = false;
        } 
        else if (chall_all_auth < 40 || chall_all_auth > 100){
        	$("label[for='all_auth_check']").text("챌린지 최소 인증률은 40이상 100이하로만 입력해주세요");
       	 	console.log($(event.target).val() );
    		all_auth_chk = false;
        }
        else{
        console.log("성공");
        all_auth_chk = true;
        $("label[for='all_auth_check']").text("정확히 입력하셨습니다.");
        }
	});

	
	
	
	$('#chall_size').keyup(function() {
		var chall_size= document.getElementById('chall_size').value; 
        if(!allAuthCheck.test($(event.target).val())){
        	 $("label[for='size_check']").text("챌린지 인원수는 숫자로만 입력해주세요");
        	 console.log($(event.target).val() );
        	 size_chk = false;
        } 
        else if (chall_size < 3 || chall_size > 100){
        	$("label[for='size_check']").text("챌린지 인원수는 3이상 100이하로만 입력해주세요");
       	 	console.log($(event.target).val() );
    		size_chk = false;
        }
        else{
        console.log("성공");
       	size_chk = true;
        $("label[for='size_check']").text("정확히 입력하셨습니다.");
        }
	});








window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행
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

function challRacePopup(){
    var category = document.getElementById("chall_category").value;
    console.log(category);
    if (category == "대회용"){
    	var popOption = "width = 500, height = 500, top = 50, left = 50, location = no";
    	var openUrl ='/registChall/selectChallRace';
    	popup = window.open(openUrl, 'pop', popOption);

    }
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
	Form=document.regist_form;
	if(Form.chall_start_date.value=="" || Form.chall_end_date.value=="" || Form.chall_all_auth.value=="" || Form.region_district.value==""  || !all_auth_chk || !size_chk){
		
	        alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");

	        
	        
	} else {
	       document.regist_form.submit();

        
	    }
	};
	
		
</script>
</html>