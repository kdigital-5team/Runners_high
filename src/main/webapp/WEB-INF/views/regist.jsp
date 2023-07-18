<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<title>Runner's High &mdash; Regist</title>

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
		<div class="col-6 col-lg-2 site-logo" id="main-logo">
			<a role="button" onclick="location.href='/main'">Runner's High</a>
		</div>
		<div class="sub-title">
			<label class="sub-title"> 회원가입 후 함께 달려보세요! </label>
		</div>
		<div class="site-section">
			<div class="container">
				<form name="regist_form" method="post" action="/regist">
					<div class="context-form">
						<label for="inputID">아이디</label><br>
							<input type="text" id="user_id" name="user_id" placeholder="사용자 아이디"><br> 
								<label class="notice-label" for="id_check"></label>
					</div>
					<div>
							<label for="inputAddress">이메일 인증</label><br> 
								<input type="text" class="email" id="auth_code" name="auth_code" placeholder="인증번호">
									<button type="button" class="btn btn-primary" id="checkEmail">인증 요청</button><br>
										<label class="notice-label" for="code_check"></label>
					</div>
					<div class="context-form">
						<label for="inputAddress">닉네임</label><br> 
							<input type="text" id="nickname" name="nickname" placeholder="사용자 닉네임"><br> 
								<label class="notice-label" for="nickname_check"></label>
					</div>
					<div class="context-form">
						<label for="inputPassword">비밀번호</label><br> 
							<input type="password" id="user_pw" name="user_pw" placeholder="사용자 비밀번호"><br>
								<label class="notice-label" for="user_pw"></label>
					</div>
					<div class="context-form">
						<label for="inputPasswordCheck">비밀번호 확인</label><br> 
							<input type="password" id="user_pw_check" name="user_pw_check" placeholder="사용자 비밀번호 확인"><br> 
								<label class="notice-label" for="user_pw_check"></label>
					</div>
					<div class="context-form">
					  <label for="PasswordQuestion">비밀번호 질문</label><br> 
					  <div class="selectBox">
					    <button class="label" id="pw_quest" name="pw_quest">질문 리스트</button>
					     	<input type="hidden" id="pw_quest_input" name="pw_quest_input" value="${pw_quest_input}">
							    <ul class="optionList">
							      <li class="optionItem" value="어렸을 때 장래희망은?">어렸을 때 장래희망은?</li>
							      <li class="optionItem" value="다녔던 초등학교의 명칭은?">다녔던 초등학교의 명칭은?</li>
							      <li class="optionItem" value="기억나는 장소는?">기억나는 장소는?</li>
							    </ul>
					  </div>
					</div>
					<div class="context-form">
						<input type="text" id="pw_quest_answer"
							   name="pw_quest_answer" placeholder="비밀번호 확인 답변">
					</div>
						<input type="submit" value="가입" onclick="submit2();">
					<br><br><br>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>
	
	<!-- 드롭다운 -->
	<script type="text/javascript">
	const label = document.querySelector('.label');
	const options = document.querySelectorAll('.optionItem');
	const optionList = document.querySelector('.optionList');
	const selectBox = document.querySelector('.selectBox');
	
	// 클릭한 옵션의 텍스트를 라벨 안에 넣음
	const handleSelect = (function(item) {
	  label.innerHTML = item.textContent;
	  optionList.style.display='none';
	  
	  // 선택한 값 업데이트
	  document.getElementById('pw_quest_input').value = item.getAttribute('value');
	});
	
	// 옵션 클릭시 클릭한 옵션을 넘김
	options.forEach(function(option){
	  option.addEventListener('click', function(){
		  handleSelect(option)
		  selectBox.style.backgroundColor = '#E8F0FE';
		  })
	});
	
	// 라벨을 클릭시 옵션 목록이 열림/닫힘
	label.addEventListener('click', function(event){
	  event.preventDefault();
	  if(optionList.style.display === 'block') {
		    optionList.style.display = 'none';
		  } else {
		    optionList.style.display = 'block';
		  }
		});
	</script>

	
</body>

<!-- 아이디/닉네임/비밀번호/이메일 검증  -->
<script type="text/javascript">
var id_chk = false;
var pw_chk = false; 
var nickname_chk = false; 
var code_chk=false;
$(function() {

	const getIdCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
	const getPwCheck = RegExp(/^(?=.*[0-9a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$/i);
  	const getNickNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/);


	$('#user_id').keyup(function() {
		var user_id = $('#user_id').val(); 
        if(!getIdCheck.test($(event.target).val())){
        	 $("label[for='id_check']").text("아이디는 영어와 숫자 조합으로 20자 이하의 이메일(@ .com)만 가능합니다.");
        	    $("label[for='id_check']").css({
        	        "color": "#e35c5c",
        	        "display": "inline-block"
        	   		 });
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
                        $("label[for='id_check']").css("color", "#e35c5c");
                        id_chk = false;
                    } else {
                    	 $("label[for='id_check']").text("사용 가능한 아이디입니다.");
                        $("label[for='id_check']").css("color", "");
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
  	

	  $('#user_pw').keyup(function() {
		    var user_pw = $('#user_pw').val();
			var user_pw_check = $('#user_pw_check').val();
		    
		    if (user_pw === '') {
		      $("label[for='user_pw']").text("");
		    } else if (!getPwCheck.test(user_pw)) {
		      $("label[for='user_pw']").text("비밀번호는 영어/숫자, 특수기호 조합으로 4~20자 이하만 가능합니다.");
		      $("label[for='user_pw']").css("color", "#e35c5c");
		    } else {
		      $("label[for='user_pw']").text("");
		      pw_chk = true;
		    }
	  });

		    
		$('#user_pw_check').keyup(function() {
		    var user_pw = $('#user_pw').val();
			var user_pw_check = $('#user_pw_check').val(); 
			console.log(user_pw_check);
			
		    if (user_pw === user_pw_check) {
		      $("label[for='user_pw_check']").text("비밀번호가 일치합니다.");
		      $("label[for='user_pw_check']").css("color", "");
		    } else if (user_pw === '' || user_pw_check === '') {
		      $("label[for='user_pw_check']").text("");
		    } else {
		      $("label[for='user_pw_check']").text("비밀번호가 일치하지 않습니다.");
		      $("label[for='user_pw_check']").css("color", "#e35c5c");
		    }
		  });
	

   		$('#nickname').keyup(function() {
   			var nickname = $('#nickname').val(); 
   	        if(!getNickNameCheck.test($(event.target).val())){
   	        	 $("label[for='nickname_check']").text("닉네임은 한글, 영어, 숫자 조합 2글자 이상 10글자 이하만 가능합니다.");
   	        	 $("label[for='nickname_check']").css("color", "#e35c5c");
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
   	                        $("label[for='nickname_check']").css("color", "#e35c5c");
   	                    	nickname_chk = false;
   	                    } else {
   	                    	 $("label[for='nickname_check']").text("사용 가능한 닉네임입니다.");
   	                    	 $("label[for='nickname_check']").css("color", "");
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
			var user_id = $('#user_id').val(); 
			
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
	                
	                $("label[for='code_check']").text("작성하신 이메일로 전송된 인증번호를 입력해주세요.");
	                $("label[for='code_check']").css("color", "");
	            },
	            error: function(xhr, status, e) {
	            	console.log("error", e);
	            }        
	        });
		} else { alert("아이디를 형식에 맞게 입력했는지 확인해주세요.")
	}});
	
	function chkEmailConfirm(data){
		$('#auth_code').keyup(function(){
		if(data.code == $('#auth_code').val()){
	           $("label[for='code_check']").text("인증되었습니다.");
	           $("label[for='code_check']").css("color", "");
	          	code_chk = true;
		
		} else{
			console.log(document.getElementById('auth_code').value)
	           $("label[for='code_check']").text("올바르지 않은 인증번호입니다.");
	           $("label[for='code_check']").css("color", "#e35c5c");
				code_chk = false;
		}
		
	})};

	// 제출
	function submit2() {
	  var selectedOption = document.querySelector('.optionItem.selected');
	  var pwQuestInput = document.getElementById('pw_quest_input');
	  var pwQuestAnswer = document.getElementById('pw_quest_answer').value;
	  var pwQuestValue = '';

	  if (selectedOption) {
	    pwQuestValue = selectedOption.getAttribute('value');
	  } else {
	    pwQuestValue = document.getElementById('pw_quest_input').value;
	  }

	  pwQuestInput.value = pwQuestValue;

	  if (pwQuestValue !== '' && pwQuestAnswer !== '' && id_chk && pw_chk && nickname_chk && code_chk) {
	    document.forms.regist_form.submit();
	    alert("가입이 완료되었습니다!");
	  } else {
	    alert("가입 정보를 다시 확인해주시기 바랍니다.");
	  }
	}

</script>
</html>