<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>대회 일정</title>
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
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>

	<div class="site-wrap">

		<div class="row no-gutters site-subbar align-items-center py-3">
			<div style="margin: auto; width: 60%;">
				<nav class="site-navigation text-left text-md-left"
					style="float: left; width: 60%">

					<ul class="site-menu js-clone-nav d-none d-lg-block">
						<li class="has-children">대회
							<ul class="dropdown arrow-top">
								<li><button style="width: 70px" type="button" id="마라톤" name="race_category"
										onclick="test(this.id, this.name)" class="option">마라톤</button></li>
								<li><button style="width: 70px" type="button" id="걷기" name="race_category"
										onclick="test(this.id, this.name)" class="option">걷기</button></li>
							</ul>
						</li>
						<li class="has-children">종목
							<ul class="dropdown arrow-top">
								<li><button style="width: 70px" type="button" id="100km" name="race_dist"
										onclick="test(this.id, this.name)" class="option">100km</button></li>
								<li><button style="width: 70px" type="button" id="풀코스" name="race_dist"
										onclick="test(this.id, this.name)" class="option">풀코스</button></li>
								<li><button style="width: 70px" type="button" id="하프코스" name="race_dist"
										onclick="test(this.id, this.name)" class="option">하프코스</button></li>
								<li><button style="width: 70px" type="button" id="10km" name="race_dist"
										onclick="test(this.id, this.name)" class="option">10km</button></li>
								<li><button style="width: 70px" type="button" id="5km" name="race_dist"
										onclick="test(this.id, this.name)" class="option">5km</button></li>
							</ul>
						</li>
						<li class="has-children">월
							<ul class="dropdown arrow-top">
								<li><button style="width: 70px" type="button" id="1월" name="race_date"
										onclick="test(this.id, this.name)" class="option">1월</button></li>
								<li><button style="width: 70px" type="button" id="2월" name="race_date"
										onclick="test(this.id, this.name)" class="option">2월</button></li>
								<li><button style="width: 70px" type="button" id="3월" name="race_date"
										onclick="test(this.id, this.name)" class="option">3월</button></li>
								<li><button style="width: 70px" type="button" id="4월" name="race_date"
										onclick="test(this.id, this.name)" class="option">4월</button></li>
								<li><button style="width: 70px" type="button" id="5월" name="race_date"
										onclick="test(this.id, this.name)" class="option">5월</button></li>
								<li><button style="width: 70px" type="button" id="6월" name="race_date"
										onclick="test(this.id, this.name)" class="option">6월</button></li>
								<li><button style="width: 70px" type="button" id="7월" name="race_date"
										onclick="test(this.id, this.name)" class="option">7월</button></li>
								<li><button style="width: 70px" type="button" id="8월" name="race_date"
										onclick="test(this.id, this.name)" class="option">8월</button></li>
								<li><button style="width: 70px" type="button" id="9월" name="race_date"
										onclick="test(this.id, this.name)" class="option">9월</button></li>
								<li><button style="width: 70px" type="button" id="10월" name="race_date"
										onclick="test(this.id, this.name)" class="option">10월</button></li>
								<li><button style="width: 70px" type="button" id=11월" name="race_date"
										onclick="test(this.id, this.name)" class="option">11월</button></li>
								<li><button style="width: 70px" type="button" id="12월" name="race_date"
										onclick="test(this.id, this.name)" class="option">12월</button></li>
							</ul></li>
						<li class="has-children">상태
							<ul class="dropdown arrow-top">
								<li><button style="width: 100px" type="button" id="접수중" name="race_con"
										onclick="test(this.id, this.name)" class="option">접수중</button></li>
								<li><button style="width: 100px" type="button" id="접수예정" name="race_con"
										onclick="test(this.id, this.name)" class="option">접수예정</button></li>
								<li><button style="width: 100px" type="button" id="접수마감" name="race_con"
										onclick="test(this.id, this.name)" class="option">접수마감</button></li>
							</ul></li>
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
					</ul>



				</nav>
				<div class="contact-form" style="float: right; width: 40%; margin-top: 25px">
					<label class="font-weight-bold" for="keyword" style="display: inline-block;">대회명 검색</label> 
					<input type="text" class="form-control" id="keyword" placeholder="대회명 입력" style="display: inline-block; width: 50%; height: 40px;" name="keyword" onkeypress="if(event.keyCode==13){searchKeyword();}"> 
					<button type="button" style="display: inline-block;" onclick="searchKeyword()" class="btn btn-dark">검색</button>
				</div>
			</div>
		</div>
		<div style="width: 60%; margin: auto;">
			<ul id="option_list" style="padding: 5px">

			</ul>
		</div>


		<div class="site-section">
			<div class="container">


				<div class="row mb-5" id="list">
					<c:forEach items="${raceList}" var="race" varStatus="vs">
						<div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
							
								<div class="custom-media d-block">
									<div class="img-wrap mb-3" style="height: 160px;">
										<a href="${race.race_url}"><img src="${race.race_pic}"
											alt="Image" class="img-fluid"></a>
									</div>
									<div>
										<h5 style="display: inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 70%;"><a href="#" data-toggle="modal" data-target="#myModal${vs.index}">${race.race_name}</a></h5>
										<div style="display: inline-block; float: right; width: 30%">${race.race_con}</div>
										<c:if test="${race.region_state eq race.region_city}">
										<div>${race.region_state} ${race.region_district}</div>
										</c:if>
										<c:if test="${race.region_state ne race.region_city}">
										<div>${race.region_state} ${race.region_city}</div>
										</c:if>
										<span class="caption" style="font-size: 10px"><fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_date}"/></span>
									</div>
								</div>
							
						</div>
						<!-- Modal -->
			<div class="modal fade" id="myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        
			      </div>
			      <div class="modal-body">
			        <img src="${race.race_pic}"
											alt="Image" class="img-fluid">
			        <table>
			        <tr><td>대회명 : ${race.race_name}</td></tr>
			        <tr><td>주최 : ${race.race_org}</td></tr>
			        <tr><td>종목 : ${race.race_dist}</td></tr>
			        <tr><td>개최 지역 : ${race.region_city} </td></tr>
			        <tr><td>일시 : <fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_date}"/></td></tr>
			        <tr><td>접수 기간 :<fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_apply}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_deadline}"/></td></tr>
			        <tr><td>상세정보 : <a href="${race.race_url}">${race.race_url}</a></td></tr>
			        </table>
			        
			        
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			       
			      </div>
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

</body>
<script type="text/javascript">
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
			url : "/events/filter",
			data : objParams
		})
			.success(function(result){
				$('#list').html(result);
		})
	}
  </script>
</html>