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
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	<div class="site-wrap">		
		<div class="container">
			<div  class="container" style="text-align:center"><h2 class="form-h2">인증글 수정</h2></div>
			<div class="post">	        
		        <form action='<c:url value='/updatePost/${post.auth_id}'/>' name= "update_form" id="update_form" method="POST" enctype="multipart/form-data">					
					<div class="form-group row">	
						<label style="margin-left:20px; margin-top:15px; margin-right:19%;">제목</label>					
						<div style="display:table-cell; margin:auto; margin-top:5px;">		                	
		                	<input class="form-control" type="text" name="auth_title" id="auth_title" style="width:600px; display:block;" value="${post.auth_title }">
	                	</div>
	                	<button type="button" class="btn btn-dark" onclick="submit2();"  style="border; margin-left:205px; margin-right:20px; margin-top:5px;">
	                		수정
	                	</button>
					</div>
					<hr>
					<div class="form-group">
						<div style="vertical-align: middle; margin-left:41%">	
							<label for="auth_image">
								업로드
							</label>
							<span id="pic_title">${pic.auth_pic_title }</span>
				            <input type="file" name="auth_image" id="auth_image" onchange="setThumbnail(event);" style="display: none"/>
						</div><br>
						<div id="image_container">
							<img alt="${pic.auth_pic_title }" src="/images/auth/${pic.auth_pic_uuid}">
						</div>
					</div>
					<div class="form-group">
						<div style="display:table-cell; width:50%; vertical-align: middle; margin-right:10px;">
							<textarea class="form-control" name="auth_cont" id="auth_cont" rows="5" style="width:600px; display:block; margin: 0 auto;">${post.auth_cont }</textarea>
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
</body>
<script type="text/javascript">
	function submit2(){
		Form=document.update_form;
		if(Form.auth_cont.value =="" || Form.auth_title.value==""){
		        alert("필수 입력란이 비었거나 입력 조건에 부합하지않습니다. 다시 확인해 주세요.");
		        
		        
		} else {
		       document.update_form.submit();

		    }
		};
	   
	function setThumbnail(event){
		var reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#image_container").replaceChildren();
			document.querySelector("div#image_container").appendChild(img);
		};
			
		reader.readAsDataURL(event.target.files[0]);
		document.getElementById("pic_title").innerHTML = event.target.files[0].name;
	}
</script>
</html>