<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>Runner's High &mdash; New Password</title>

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

</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 

	<div class="site-wrap-width">
		<div class="deco-banner"></div>
		<div class="col-6 col-lg-2 site-logo" id="main-logo">
			<a role="button" onclick="location.href='/main'">Runner's High</a>
		</div>
		<div class="sub-title">
			<label class="sub-title"> 새 비밀번호를 설정해주세요.</label>
		</div>
		<div class="site-section">
			<div class="container">
<form method="post" id="updatePw_form" action="/findPw/updatePw">
        					<div class="context-form">
						<label for="inputPassword">비밀번호</label><br> 
							<input type="password" id="new_Pw" name="new_Pw" placeholder="새 비밀번호"><br>
								<label class="notice-label" for="new_Pw"></label>
					</div>
					<div class="context-form">
						<label for="inputPasswordCheck">비밀번호 확인</label><br> 
							<input type="password" id="new_Pw_check" name="new_Pw_check" placeholder="새 비밀번호 확인"><br> 
								<label class="notice-label" for="new_Pw_check"></label>
					</div>
        <input type="submit" value="저장" onclick="submit2();">
        <br><br><br>
</form>
</div>
</div>
</div>
		<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
</body>
<script type="text/javascript">
	var pw_chk = false;
	
	const getPwCheck = RegExp(/^(?=.*[0-9a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$/i);
	
	// 기본 비밀번호 안내
  	$("label[for='new_Pw']").text("*특수문자(!@#$%^*+=-)를 반드시 포함한 4~20자의 영어/숫자");
	
	$('#new_Pw').keyup(function() {
		    var new_Pw = $('#new_Pw').val();
			var new_Pw_check = $('#new_Pw_check').val();
			
		    if (new_Pw === '') {
		      $("label[for='new_Pw']").text("");
		    } else if (!getPwCheck.test(new_Pw)) {
		      $("label[for='new_Pw']").text("비밀번호는 특수문자를 포함한 4~20자 이하의 영어/숫자만 가능합니다.");
	        $("label[for='new_Pw']").css("color", "#e35c5c");
		    } else {
		      $("label[for='new_Pw']").text("");
		    }
	});
	
		    
		$('#new_Pw_check').keyup(function() {
		    var new_Pw = $('#new_Pw').val();
			var new_Pw_check = $('#new_Pw_check').val(); 
			console.log(new_Pw_check);
			
		    if (new_Pw === new_Pw_check) {
		      $("label[for='new_Pw_check']").text("비밀번호가 일치합니다.");
		      $("label[for='new_Pw_check']").css("color", "#898989");
		      pw_chk = true;
		    } else if (new_Pw === '' || new_Pw_check === '') {
		      $("label[for='new_Pw_check']").text("");
		      pw_chk = false;
		    } else {
		      $("label[for='new_Pw_check']").text("비밀번호가 일치하지 않습니다.");
		      $("label[for='new_Pw_check']").css("color", "#e35c5c");
		      pw_chk = false;
		    }
		  });
	
	function submit2(){
		
		event.preventDefault();
		
		// 비밀번호 수정이 있을 경우 비밀번호 확인 반드시 작성
		var new_Pw = $('#new_Pw').val();
		var new_Pw_check = $('#new_Pw_check').val();
		
		if (new_Pw !== '') {
			if(!pw_chk || new_Pw_check === '') {
				alert("비밀번호 확인 후 진행해주세요.");
				return;
			}
		}
		
		if (pw_chk== true){
			alert("비밀번호가 수정되었습니다! 로그인을 진행해주세요.");
			document.forms.updatePw_form.submit();
			
		} else{
		alert("비밀번호 입력 값을 확인해주세요.");
	}};
	
</script>
</html>