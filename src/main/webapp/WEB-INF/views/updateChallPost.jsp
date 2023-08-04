	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>인증글 수정</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
<link rel="stylesheet" href="../fonts/icomoon/style.css">


<link rel="stylesheet" href="../static/css/form.css">
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
<div class="site-wrap-width">
		<div class="site-section"></div>
		<div class="container" style="width:60%" >
			<div  class="container" style="text-align:center"><h2 class="form-h2">인증하기</h2></div>
		        <form action='<c:url value='/updatePost/${post.auth_id}'/>'name= "update_form" id="update_form" method="post" enctype="multipart/form-data">					
					<div class="form-group">	
						<label for="auth_title">제목</label>					
						<!-- <div style="display:table-cell; margin:auto; margin-top:5px;"> -->		                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title"  value="${post.auth_title }">

	                	
					</div>
					<div class="form-group">
					
					</div>
					 
					<div class="form-group">
					<label for="auth_cont">내용</label>	
							<textarea class="form-control" type="text" name="auth_cont" id="auth_cont" style="height:600px">${post.auth_cont }</textarea>
					</div>	
					<div style="text-align:center; background-color:white;">		
      					 <button type="submit" class="btn btn-primary" onclick="submit2();" style="background-color:#FFDC3D; border:none;">수정하기</button>
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
		Form=document.update_form;
		if(Form.auth_cont.value =="" || Form.auth_title.value==""){
		        alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");
		        
		        
		} else {
		       document.update_form.submit();

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