<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<form name= "regist_form" method="post" action="/regist">
    <div class="container">
        <h1>회원가입</h1>
        <div class="form-group">
            <label for="inputID">아이디</label>
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="사용자 아이디">
            <label for="id_check"></label>
        </div>
        <div>
        	<p>
        		<label for="inputAddress">이메일 인증</label>
            	<input type="text" class="form-control" id="auth_code" name="auth_code" placeholder="인증번호" style="width:100px;">
            	<button type="button" class="btn btn-primary" id="checkEmail">이메일 인증</button>
            	<label for="code_check"></label>
            </p>
        </div>
        <div class="form-group">
            <label for="inputAddress">닉네임</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="사용자 닉네임">
             <label for="nickname_check"></label>
        </div>
        <div class="form-group">
            <label for="inputPassword">비밀번호</label>
            <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="사용자 비밀번호">
        </div>
        <div class="form-group">
            <label for="inputPasswordCheck">비밀번호 확인</label>
            <input type="password" class="form-control" id="user_pw_check" name="user_pw_check" placeholder="사용자 비밀번호 확인">
            <label for="pw_check"></label>
        </div>
        <div class="form-group">
        	<label for="PasswordQuestion">비밀번호 질문</label>
       		<select id="pw_quest" name="pw_quest">
				<option value ="어렸을 때 장래희망은?"> 어렸을 때 장래희망은? </option>
				<option value ="다녔던 초등학교의 명칭은?"> 다녔던 초등학교의 명칭은? </option>
				<option value ="기억나는 장소는?"> 기억나는 장소는? </option>
			</select >
			</div>
        <div class="form-group">
            <input type="text" class="form-control" id="pw_quest_answer" name="pw_quest_answer" placeholder="사용자 비밀번호 확인 질문 답변">
        </div>
        <button type="button" class="btn btn-primary" onclick="submit2();">가입 완료</button>
    </div>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 
<script> 
var id_chk = false, pw_chk = false, nickname_chk = false; code_chk=false;
$(function() {

	// const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);
	const getIdCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
  	const getPwCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,20}$/);
  	const getNickNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/);


	$('#user_id').keyup(function() {
		var user_id = document.getElementById('user_id').value; 
        if(!getIdCheck.test($(event.target).val())){
        	 $("label[for='id_check']").text("아이디는 영어와 숫자 조합으로만 이루어지고 글자의 길이는 4글자 이상 20글자인 이메일 형태(@ .com)로만 입력바랍니다.");
        	 id_chk = false;
        } else if(user_id.trim().length != 0) {
            $.ajax({
                async : true, 
                type : 'POST', 
                data: user_id,
                url: "/idCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(count) {    
                    if(count > 0) { 
                        $("label[for='id_check']").text("해당 아이디가 존재합니다.");
                        id_chk = false;
                    } else {
                    	 $("label[for='id_check']").text("사용 가능한 아이디입니다.");
                    	id_chk = true;
                    }            
                },
                error: function(error) {
                    alert("아이디를 입력해주세요.");
                }        
            });
        } else {
            alert("아이디를 입력해주세요.");
        }        
	});
  	

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
   	                },
   	                error: function(error) {
   	                    alert("닉네임을 입력해주세요.");
   	                }        
   	            });
   	        } else {
   	            alert("닉네임을 입력해주세요.");
   	        }        
   		});
	
});

$('#checkEmail').click(function() {
	if(id_chk == true){
		var user_id = document.getElementById('user_id').value; 
	 	$.ajax({
		 async: false,
         type : 'POST', 
         data: user_id,
         url: "/mailConfirm",
         dataType: "json",
         contentType: "application/json; charset=UTF-8",
            success : function(data, status, xhr){
                alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
                console.log("data", data);
                chkEmailConfirm(data);
            },
            error: function(xhr, status, e) {
            	console.log("error", e);
            }        
        });
	} else { alert("아이디를 형식에 맞게 입력했는지 확인해주세요.")
}});

function chkEmailConfirm(data){
	$('#auth_code').keyup(function(){
	if(data.code == document.getElementById('auth_code').value){
           $("label[for='code_check']").text("인증되었습니다.");
          	code_chk = true;
	
	} else{
		console.log(document.getElementById('auth_code').value)
           $("label[for='code_check']").text("인증번호가 올바르지 않습니다. 확인부탁드립니다.");
			code_chk = false;
	}
})};

function submit2(){
	if(id_chk && pw_chk && nickname_chk && code_chk == true){
	document.regist_form.submit();
	} else{
	alert("아이디, 이메일인증, 비밀번호, 닉네임 입력 값을 확인해주세요.");
}};



</script>
</html>