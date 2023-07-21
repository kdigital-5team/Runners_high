	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>피드 작성</title>
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
<link rel="stylesheet" href="../static/css/image_crop.css">
<link rel="stylesheet" href="../static/css/popup.css">
<link rel="stylesheet" href="../static/css/feed.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">
<link rel="stylesheet" href="../static/css/style2.css">
</head>

<!-- 글쓰기 박스 css -->
<style>
	div#editor {
    	padding: 4px 6px;
        border: 1px solid #D6D6D6;
        border-radius: 4px;
    }
</style>

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
		<!-- 피드 / 챌린지 / 칭호 탭 -->
		<%-- <div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero-wrap text-center" style=""
						data-stellar-background-ratio="0.5">
						<div class="hero-contents">
							<p>
								<a href="/mypage/feed"><strong>피드</strong></a> <span class="mx-2">|</span>
								<a href="${chall_id}challengePost">인증게시판</a> <span class="mx-2">|</span> <a
									href="/mypage/title">칭호</a> <span class="mx-2"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
		<div  class="container"><h2>인증하기</h2></div>
		
		<!-- 피드 글 작성 -->
		<div class="container">

		        <form action='<c:url value='/challenge/${chall_id}/insertChallPost'/>'name= "regist_form" id="regist_form" method="post" enctype="multipart/form-data">					
					<div class="form-group">	
						<label for="auth_title">제목</label>					
						<!-- <div style="display:table-cell; margin:auto; margin-top:5px;"> -->		                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" ><!-- style="width:600px; display:block;" -->
	                	<!-- </div> -->
	                	
					</div>
					<div class="form-group">
					<label><input type="hidden" class="form-control" id="chall_id" name="chall_id" value=${chall_id}  readonly></label>
					
					</div>
					 
					<div class="form-group">
					<label for="auth_cont">내용</label>	
						<!-- <div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;"> -->
							<textarea class="form-control" type="text" name="auth_cont" id="auth_cont" style="height:600px"]></textarea>
							<!-- rows="5" style="width:600px; display:block; margin: 0 auto;" -->
						<!-- </div> -->
					</div>	
					<div style="text-align:center; background-color:white;">		
      					 <button type="button" class="btn btn-primary" onclick="submit2();">등록하기</button>
    				</div>
				</form>
			</div>
		</div>
		
	<script type="text/javascript">
	
	var chall_id = null;
	
	$(document).ready(function(){
		chall_id =  ${chall_id};
	});
	
	function submit2(){
		Form=document.regist_form;
		if(Form.auth_cont.value =="" || Form.chall_id.value==""  || Form.auth_title.value==""){
		        alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");
		        
		        
		} else {
		       document.regist_form.submit();

		    }
		};
		
		
	   function readURL(input) {
	      var file = input.files[0] 
	      console.log(file)
	      if (file != '') {
	         var reader = new FileReader();
	         reader.readAsDataURL(file);
	         reader.onload = function (e) { 
		     console.log(e.target)
			console.log(e.target.result)
	           $('#preview').attr('src', e.target.result);
	          }
	      }
	  }  
	</script>
<!-- footer -->
<%@ include file="./inc/footer.jsp"%>
</body>
</body>
</html>