<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Runner's High &mdash; Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" href="../static/css/loginForm.css">
<link rel="stylesheet" href="../static/css/login.css">
<link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../static/css/jquery-ui.css">
<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/animate.css">
<link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../static/css/aos.css">

</head>
<body>

	<div class="site-wrap">
			<div class="col-6 col-lg-2 site-logo" id="main-logo">
				<a role="button" onclick="location.href='/main'" id="main-logo">Runner's High</a>
			</div>

		<div class="site-section">
			<div class="container">
				<form action="/login" method="POST" id="login-form">
					<p align="center">
						<input type="text" name="userId" size="30" placeholder="이메일" id="login_id"
							style="border: 0 solid black"> 
							</br> 
						<label for="id_check"></label>
							</br> 
						<input type="password"
							name="userPw" size="30" placeholder="비밀번호" id="login_pw"
							style="border: 0 solid black">
							</br>
						<label for="pw_check"></label>
					</p>
					<p align="center">
						<span style="font-size: 12pt;"> 
						<input type="submit"
							value="Login" 
							id="login-btn"
							style="border: 0 solid black"
							onclick="getAlert()">
						</span>
					</p>
					<div id="sub-page">
						<a href="/updatePw" id="sub-page">비밀번호 찾기</a> <span>|</span> <a href="/regist"
							id="sub-page">회원가입</a>
					</div>
					<br>
					<br>
					<!-- 
					카카오 로그인 API
					<a class="social" href="https://kauth.kakao.com/oauth/authorize?client_id=6b8fd47f0536895682320ac460cd43a2&redirect_uri=http://localhost:8081/login/kakao&response_type=code">
						<img src="../static/icons/kakao_login_medium_wide.png" style="height:53px">
					</a>
					 -->
				</form>
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
	
	<!-- 로그인 실패 alert -->
<script type="text/javascript">
	let msg = '${msg}';
	console.log(msg);
	
	function getAlert(){
		if (msg != '') {
		alert(msg);
		}
	}
	
</script>

</body>
 	<script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
 	<script>
 	// 잘못된 id, pw 양식 검수
	var id_chk = false, pw_chk = false; 
 	
	$(function() {
		const getIdCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
  	
  		$('#login_id').keyup(function () {
  			
  			var login_id = document.getElementById('login_id').value;
  			
  			// 빈 값 검수
  			if($(event.target).val() === '') {
  				$("label[for='id_check']").text("아이디를 입력해주시기 바랍니다.");
  			
  				id_chk=false;
  			}
  			
  			// 양식에 맞지 않는 값 검수
  			else if(!getIdCheck.test($(event.target).val())){
  				$("label[for='id_check']").text("아이디는 영문/숫자 조합의 이메일만 가능합니다.");
  			
  				id_chk=false;
  			} 
  			
  			else {
  				$("label[for='id_check']").text("");
  				id_chk=true;
  			}
  		})
  	
  		$('#login_pw').keyup(function () {
  			// 빈 값 검수
  			if($(event.target).val() === ''){
  				$("label[for='pw_check']").text("비밀번호를 입력해주시기 바랍니다.");
  			
  				pw_chk=false;
  			} else {
  				$("label[for='pw_check']").text("");
  				pw_chk=true;
  			}
  		})
});
	
</script>



</html>