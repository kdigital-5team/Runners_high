<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
<form name= "updatePw" method="post" action="/updatePw">
    <div class="container">
        <h1>새 비밀번호 설정</h1>
        <div class="form-group">
            <label for="inputPassword">password</label>
            <input type="password" class="form-control" id="new_Pw" name="new_Pw" placeholder="새 비밀번호">
        </div>
        <div class="form-group">
            <label for="inputPasswordCheck">password check</label>
            <input type="password" class="form-control" id="new_Pw_check" name="new_Pw_check" placeholder="새 비밀번호 확인">
            <label for="pw_check"></label>
        </div>
        <button type="button" class="btn btn-primary" onclick="submit2();">확인</button>
    </div>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 
<script> 

var pw_chk = false;
const getPwCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,20}$/);
$('#new_Pw_check').keyup(function() {
	var user_pw = document.getElementById('new_Pw').value; 
	var user_pw_check = document.getElementById('new_Pw_check').value; 
	
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

function submit2(){
	if (pw_chk== true){
	document.updatePw.submit();
	} else{
	alert("비밀번호 입력 값을 확인해주세요.");
}};

</script>
</html>