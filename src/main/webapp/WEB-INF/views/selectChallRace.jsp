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
<link rel="stylesheet" href="../static/css/style.css">

    
</head>
<body>

		<div class="row no-gutters site-subbar align-items-center py-3" >
			<div style="margin: auto;" >
				<div class="contact-form" style="float: right; width: 40%; margin-top: 25px">
					<label class="font-weight-bold" for="keyword" style="display: inline-block;">대회명 검색</label> 
					<input type="text" class="form-control" id="keyword" placeholder="대회명 입력" style="display: inline-block; width: 50%; height: 40px;" name="keyword" onkeypress="if(event.keyCode==13){searchKeyword();}"> 
					<button type="button" style="display: inline-block;" onclick="searchKeyword()" class="btn btn-dark">검색</button>
				</div>
			</div>
		</div>

		
		
		<div class="site-section">
			<div class="container">


				<div class="row mb-5" id="list">
					
					<c:forEach items="${raceList}" var="race" varStatus="vs">
					
						<div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
							
								<div class="custom-media d-block">
									<div class="img-wrap mb-3">
										<a><img src="${race.race_pic}"
											alt="Image" class="img-fluid" onclick="selectRace(${race.race_id});"></a>
									</div>
									<div>
										<h5 style="display: inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 70%;"><a href="#" data-toggle="modal" data-target="#myModal${vs.index}">${race.race_name}</a></h5>
										<div style="display: inline-block; float: right; width: 30%">${race.race_con}</div>
										<div>${race.region_state} ${race.region_city}</div>
										<span class="caption" style="font-size: 10px"><fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_date}"/></span>
									</div>
								</div>
							
						</div>
						

              </c:forEach>
              
            </div>
          </div>
         </div>
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
function searchKeyword(){

	
	const target = document.getElementById("keyword");
	keyword = target.value;

	target.value = null;
	
	search();
	
	
}


function selectRace(raceId){
	//var list = '<c:out value="${raceList}"/>';
    console.log(raceId);
    $.ajax({
        async : true, 
        type : 'POST', 
        data: JSON.stringify({raceId}),
        url: "/getRaceId",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        success: function(data) {  
      	console.log("data", data);
      	alert("선택 완료");
      	window.close();
        },
        error: function(error) {
            alert("원하시는 대회를 다시 클릭해주세요");
        }        
    });

        
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
		url : "/events/filter2",
		data : objParams
	})
		.success(function(result){
			$('#list').html(result);
	})
}
</script>
</html>