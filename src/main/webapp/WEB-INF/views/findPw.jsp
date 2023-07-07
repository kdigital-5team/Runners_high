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
<form name= "findPw" method="post" action="/findPw">
    <div class="container">
        <h1>비밀번호 찾기</h1>
        <div class="form-group">
            <label for="inputID">userId</label>
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="사용자 아이디">
            <label for="id_check"></label>
        </div>
        <div class="form-group">
        	<label for="PasswordQuestion">password question</label>
       		<select id="pw_quest" name="pw_quest">
				<option value ="어렸을 때 장래희망은?"> 어렸을 때 장래희망은? </option>
				<option value ="다녔던 초등학교의 명칭은?"> 다녔던 초등학교의 명칭은? </option>
				<option value ="기억나는 장소는?"> 기억나는 장소는? </option>
			</select >
			</div>
        <div class="form-group">
            <input type="text" class="form-control" id="pw_quest_answer" name="pw_quest_answer" placeholder="사용자 비밀번호 확인 질문 답변">
        </div>
        <button type="button" class="btn btn-primary" onclick="submit2();">비밀번호 찾기</button>
    </div>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script> 
<script>

var id_chk = false
const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);
$('#user_id').keyup(function() {
	var user_id = document.getElementById('user_id').value; 
    if(!getIdCheck.test($(event.target).val())){
    	 $("label[for='id_check']").text("아이디는 영어와 숫자 조합으로만 이루어지고 글자의 길이는 4글자 이상 20글자 이하로만 입력바랍니다.");
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
                    id_chk = true;
                } else {
                	 $("label[for='id_check']").text("사용 가능한 아이디입니다.");
                	id_chk = false;
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
function submit2(){
	if(id_chk == true){
	document.findPw.submit();
	} else{
	alert("아이디 입력 값을 확인해주세요.");
}};

</script>
</html>