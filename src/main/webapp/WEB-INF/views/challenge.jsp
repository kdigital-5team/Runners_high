<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>챌린지 목록</title>
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
			<div class="contact-form" style="border: 1px solid red;">
					<label class="font-weight-bold" for="keyword" style="border: 1px solid red; margin: auto;">챌린지 목록</label> <div></div>
					<input type="text" class="form-race" id="keyword" placeholder="챌린지 검색" name="keyword" style="float: left; width:65%;" onkeypress="if(event.keyCode==13){searchKeyword();}"> 
					<button type="button" onclick="searchKeyword()" style="margin-right: 5%; float: left; width: 20%">검색</button>
					<button type="button" onclick="location.href='/registChall'" style="float: left; width: 10%">+</button>
			</div>
				<nav class="site-navigation text-left text-md-left"
					style="float: left;">

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
									<li><button style="width: 100px" type="button" id="경기도" name="region_state"
										onclick="test(this.id, this.name)" class="option">경기도</button></li>
									<li><button style="width: 100px" type="button" id="강원도" name="region_state"
										onclick="test(this.id, this.name)" class="option">강원도</button></li>
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
								<li><button style="width: 100px" type="button" id="모집마감" name="chall_con"
										onclick="test(this.id, this.name)" class="option">모집마감</button></li>
							</ul>
						</li>
					</ul>



				</nav>
			</div>
		</div>
		<div>
			<ul id="option_list" style="padding: 5px">

			</ul>
		</div>


		<div class="site-section">
			<div class="container">


				<div class="row mb-5" id="list">
					<c:forEach items="${challList}" var="chall">
						<div style="width: 40%; float:left; border: 1px solid aqua; margin-right: 10%">
							
								<div>
									<div style="float: left; width: 35%;">
										<img src="${chall.chall_pic}"
											alt="Image" class="img-fluid" style="height: auto;">
									</div>
									<div style="float: left; width: 65%;">
										<div style="display: inline-block; float: left; border: 1px solid red; width: 30%; text-align: center;">${chall.chall_sit}</div>
										<div style="border: 1px solid green; float:left; width: 30%; margin-right: 40%; text-align: center;">${chall.chall_category}</div>
										<h5 style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 140px;"><a href="challenge/${chall.chall_id}">${chall.chall_name}</a></h5>
										<c:if test="${chall.chall_category ne null}">
											<div style="font-size: 10px">대회명</div>
										</c:if>
										
										<div style="font-size: 10px">${chall.region_id}</div>
										<div class="caption" style="font-size: 10px"><fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_end_date}"/> / 인증 주 ${chall.chall_week_auth}회 / 최대 ${chall.chall_size}명</div>
										<div class="caption" style="font-size: 10px"></div>
									</div>
								</div>
							
						</div>
              </c:forEach>
            </div>
          </div>
					
				</div>
				<div id="show-dog-img">
				</div>

				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="custom-pagination">
							<a href="#">1</a> <span>2</span> <a href="#">3</a> <a href="#">4</a>
							<a href="#">5</a>
						</div>
					</div>
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
		console.log(target);
		console.log(keyword);
		target.disabled=true;
		var option_list = $("#option_list");
		option_list.append("<li style=\"display:inline-block\" name="+ option +"><button type=\"button\" onclick=\"removeBtn(this,this.innerText)\">" + target.innerText + "</button></li>");
		
		var region_list =$("#region_list");
		const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  	const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  	
	  	
	  	if(button_id=="경기도"){
	  		for(i=0; i<gyeonggi.length; i++){
	  			region_list.append("<li><button style=\"width: 100px\" type=\"button\" id=\""+gyeonggi[i]+
	  								"\" name=\"region_city\" onclick=\"test(this.id, this.name)\" class=\"option\">"+gyeonggi[i]+"</button></li>");
	  		}
	  	}
	  	
	  if(button_id=="강원도"){
		for(i=0; i<gangwon.length; i++){
  			region_list.append("<li>"+ gangwon[i] +"</li>");
  		}
  	}
	  
	  
		search();
	}
	
	function removeBtn(ths, button_id){
		var ths = $(ths);
		const target = document.getElementById(button_id);
		target.disabled=false;
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