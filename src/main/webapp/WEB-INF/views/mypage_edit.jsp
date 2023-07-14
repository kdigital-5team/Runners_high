<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Runner's High &mdash; my page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" href="../static/css/form.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function () {
		$('#userPic').on('change', function(){
			readURL(this);	
			console.log('userpic 변경 감지');
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			console.log('썸네일 파일 변경');
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preImage').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>

	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	
	<!-- 피드 정보 수정 -->
	<div class="site-wrap">
		<div class="site-section"></div>
		<div class="site-section">
			<div class="container">
				<form action="/mypage/edit" enctype="multipart/form-data" method="POST">
					<input type="hidden" name="_method" value="PUT"/>
					<div class="context">
						<div class="context-form">
						<h2>  프로필 수정 </h2>
							<label> 아이디 </label><br>
							<input type="text" name="userId" placeholder="${user.user_id}" readonly> 
						</div>
						<div class="context-form">
							<label> 닉네임 </label><br>
								<input type="text" id="nickname" name="userNickname" placeholder="${user.nickname}"> 
									<label for="nickname_check"></label>
						</div>
						<div class="context-form">
							<label> 프로필 사진 </label><br>
								<div class="profile-pic">
											<img id="preImage" onclick="onClickUpload()" src="../static/images/profileImages/${user.user_pic}" class="photo" 
												 onerror='this.src="../static/images/profileImages/default_image.png"'><br>
								</div>
										<input type="file" name="userPic" accept=".jpg, .png, .jpeg" id="userPic"> 
						</div>
						<div class="context-form">
							<!-- 텍스트 길이에 맞춰 늘어나도록 변경 or 글자수 제한(byte 표기) -->
							<label> 한줄 소개 </label><br>
								<input type="text" name="userIntro" placeholder="${user.intro}"> 
						</div>
						<br><hr>
						<h2> 계정 수정 </h2>
						<div class="context-form">
            				<label> 비밀번호</label><br>
           						<input type="password" name="userPw" id="user_pw" placeholder="사용자 비밀번호">
        				</div>
       					 <div class="context-form">
				            <label for="inputPasswordCheck">비밀번호 확인</label>
				            	<input type="password" name="userPwCheck" id="user_pw_check" placeholder="사용자 비밀번호 확인">
				            		<label for="pw_check"></label>
				        </div>
						<div class="context-form"><br>
							<label> 비밀번호 확인 질문 </label><br>
					       		<select id="pw_quest" name="userPwQ">
									<option value ="어렸을 때 장래희망은?"> 어렸을 때 장래희망은? </option>
									<option value ="다녔던 초등학교의 명칭은?"> 다녔던 초등학교의 명칭은? </option>
									<option value ="기억나는 장소는?"> 기억나는 장소는? </option>
								</select >
						</div>
						<div class="context-form">
							<label> 비밀번호 확인 답변 </label><br>
								<input type="text" name="userPwA" placeholder="${user.pw_quest_answer}"> 
						</div>
					</div>

					<p align="center">
						<span style="font-size: 12pt;"> 
							<input type="submit" value="저장">
						</span>
					</p>
					<br>
					<br>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 프로필 사진 수정 -->
	<script type="text/javascript">
		function onClickUpload(){
			let pic_upload = document.getElementById('userPic');
			pic_upload.click();
		}
	</script>
	
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
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 
<script> 
var pw_chk = false, nickname_chk = false; code_chk=false;
$(function() {
	
  	const getPwCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,20}$/);
  	const getNickNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/);
  	
	$('#user_pw_check').keyup(function() {
	var user_pw = document.getElementById('user_pw').value; 
	var user_pw_check = document.getElementById('user_pw_check').value; 
	
	if(!getPwCheck.test($(event.target).val())){
   		$("label[for='pw_check']").text("비밀번호는 영어, 숫자, 특수기호 조합으로만 이루어지고 글자의 길이는 4글자 이상 20글자 이하로만 입력바랍니다.");
   		pw_chk = false;
   	 
	} else if ($(event.target).val() === ''){
		pw_chk = false;
		
	} if(user_pw == user_pw_check){
        	$("label[for='pw_check']").text("비밀번호가 일치합니다.");
        	pw_chk = true;
        } else {
        	$("label[for='pw_check']").text("비밀번호가 일치하지않습니다.");
        	pw_chk = false;
        }
	});
	

   		$('#nickname').keyup(function() {
   			var nickname = document.getElementById('nickname').value; 
   	        if(!getNickNameCheck.test($(event.target).val())){
   	        	 $("label[for='nickname_check']").text("닉네임은 한글, 영어, 숫자 조합으로만 이루어지고 글자의 길이는 2글자 이상 10글자 이하로만 입력바랍니다. ");
   	        	 nickname_chk = false;
   	        } else if(nickname.trim().length != 0) {
   	            $.ajax({
   	                async : true, 
   	                type : 'POST', 
   	                data: nickname,
   	                url: "/nickNameCheck",
   	                dataType: "json",
   	                contentType: "application/json; charset=UTF-8",
   	                success: function(count) {    
   	                    if(count > 0) { 
   	                        $("label[for='nickname_check']").text("해당 닉네임이 존재합니다.");
   	                    	nickname_chk = false;
   	                    } else {
   	                    	 $("label[for='nickname_check']").text("사용 가능한 닉네임입니다.");
   	                    	 nickname_chk = true;
   	                    }            
   	                }
   	            });
   	        } else {
   	         	$("label[for='nickname_check']").empty();
   	       		nickname_chk = false;
   	        }   
   		});
	
});
</script>
</html>