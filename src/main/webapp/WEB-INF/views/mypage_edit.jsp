<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	
	
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>

	<!-- 피드 정보 수정 -->
	<div class="site-wrap-width">
		<div class="site-section"></div>
		<div class="site-section">
			<div class="container">
				<form action="/mypage/edit" enctype="multipart/form-data" method="POST" id="mypageEdit">
					<input type="hidden" name="_method" value="PUT" />
						<div class="context-form">
							<h2 class="form-h2">프로필 수정</h2>
							<label> 아이디 </label><br> 
							<input type="text" name="userId" placeholder="${user.user_id}" readonly>
						</div>
						<div class="context-form">
							<label> 닉네임 </label><br> 
							<input type="text" id="nickname" name="userNickname" placeholder="${user.nickname}"><br>
							<label class="notice-label" for="nickname_check"></label>
						</div>
						<div class="context-form">
							<label> 프로필 사진 </label><br>
							<div class="profile-pic">
								<img id="preImage" onclick="onClickUpload()"
									src="/images/${user.user_pic}" class="photo"
									onerror='this.src="../static/images/profileImages/default_image.png"'><br>
							</div>
							<input type="file" name="userPic" accept=".jpg, .png, .jpeg" id="userPic">
						</div>
						<div class="context-form">
							<label> 한줄 소개 </label><br>
							<textarea id="textArea" name="userIntro" rows="1" maxlength="300"
									  placeholder="${user.intro}" wrap="hard"
									  onkeyup="fn_checkByte(this)"></textarea><br>
							 <sup><span id="currByte">0</span>/300bytes</sup><br>
						</div>
						<br><hr><br>
						<h2 class="form-h2">계정 수정</h2>
						<div class="context-form" id="pw-check-div">
							<label> 비밀번호</label><br> 
							<input type="password" name="userPw" id="user_pw" placeholder="사용자 비밀번호"><br>
								<label for="user_pw" class="notice-label"></label><br> 
							<label id=pw-only>비밀번호 확인</label><br> 
								<input type="password" name="userPwCheck" id="user_pw_check" placeholder="사용자 비밀번호 확인"><br> 
									<label for="user_pw_check" class="notice-label"></label>
						</div>
						<div class="context-form">
						  <label for="PasswordQuestion">비밀번호 질문</label><br> 
						  <div class="selectBox">
						    <button class="label" id="pw_quest" name="pw_quest">${user.pw_quest}</button>
						     	<input type="hidden" id="pw_quest_input" name="pw_quest_input" value="${pw_quest_input}">
								    <ul class="optionList">
								      <li class="optionItem" value="어렸을 때 장래희망은?">어렸을 때 장래희망은?</li>
								      <li class="optionItem" value="다녔던 초등학교의 명칭은?">다녔던 초등학교의 명칭은?</li>
								      <li class="optionItem" value="기억나는 장소는?">기억나는 장소는?</li>
								    </ul>
						  </div>
						</div>
						<div class="context-form">
							<label> 비밀번호 확인 답변 </label><br> 
							<input type="text" name="userPwA" placeholder="${user.pw_quest_answer}">
						</div>
					<p align="center">
							<input type="submit" value="저장" />
					</p>
					<br><br>
				</form>
			</div>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./inc/footer.jsp"%>


</body>
	<!-- 프로필 사진 수정 -->
	<script type="text/javascript">
		function onClickUpload(){
			let pic_upload = document.getElementById('userPic');
			pic_upload.click();
		}

		
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

	<!-- 드롭다운 -->
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

	<!-- 동적으로 intro크기 변경 -->
	    window.onload = function() {
	    	console.log("onload JS");
	        
	    	function resize() {
	            let textarea = document.getElementById("textArea");
	            textarea.style.height = "0px";
	            
	            let scrollHeight = textarea.scrollHeight;
	            let style = window.getComputedStyle(textarea);
	            let borderTop = parseInt(style.borderTop);
	            let borderBottom = parseInt(style.borderBottom);
	            
	            textarea.style.height = (scrollHeight + borderTop + borderBottom) + "px";
	        }
	        
	        let textarea = document.getElementById("textArea");
	        textarea.addEventListener("input", resize);
	        
	        // 이전 한줄소개에 맞춰 기본 sieze 세팅
	        resize();
	    }

	<!-- 동적으로 introByte 체크 -->
		function fn_checkByte(obj){
			console.log("byte체크 실행");
			
			const str = obj.value;
			const str_len = str.length;
			
			const maxByte = 300;
			let rbyte = 0;
			let rlen = 0;
			let one_char = "";
			let str2 = "";
			
		    for(let i = 0; i < str_len; i++){

		    	one_char = str.charAt(i);
		    	
		        if(escape(one_char).length > 4){
		        	rbyte += 3;
		        }else{
		        	rbyte++;
		        }
		        if (rbyte <= maxByte) {
		        	rlen = i+1;
		        }
		    }
		        if(rbyte > maxByte){
		        	alert('한줄소개는 최대 300Byte까지만 입력 가능합니다.');
		            document.getElementById("currByte").innerText = rbyte;
		            document.getElementById("currByte").style.color = "#e35c5c";
		            
		         // 초과된 부분 제거
				str2= str.substr(0, rlen);
		         obj.value = str2;
		         fn_checkByte(obj);
		        } else {
		    document.getElementById("currByte").innerText = rbyte;
		    document.getElementById("currByte").style.color = "#293A8E";
		    }
		}


<!-- 닉네임/비밀번호 검증 -->
var pw_chk = false; 
var nickname_chk = false;
$(function() {
	  const getPwCheck = RegExp(/^(?=.*[0-9a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$/i);
	  const getNickNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$/);

	  $('#user_pw').keyup(function() {
		    var user_pw = $('#user_pw').val();
			var user_pw_check = $('#user_pw_check').val();
			
		    if (user_pw === '') {
		      $("label[for='user_pw']").text("");
		    } else if (!getPwCheck.test(user_pw)) {
		      $("label[for='user_pw']").text("비밀번호는 특수문자를 포함한 4~20자 이하의 영어/숫자만 가능합니다.");
	          $("label[for='user_pw']").css("color", "#e35c5c");
		    } else {
		      $("label[for='user_pw']").text("");
		    }
	  });

		    
		$('#user_pw_check').keyup(function() {
		    var user_pw = $('#user_pw').val();
			var user_pw_check = $('#user_pw_check').val(); 
			console.log(user_pw_check);
			
		    if (user_pw === user_pw_check) {
		      $("label[for='user_pw_check']").text("비밀번호가 일치합니다.");
		      $("label[for='user_pw_check']").css("color", "#898989");
		      pw_chk = true;
		    } else if (user_pw === '' || user_pw_check === '') {
		      $("label[for='user_pw_check']").text("");
		      pw_chk = false;
		    } else {
		      $("label[for='user_pw_check']").text("비밀번호가 일치하지 않습니다.");
		      $("label[for='user_pw_check']").css("color", "#e35c5c");
		      pw_chk = false;
		    }
		  });
	  
	$('#nickname').keyup(function() {
		var nickname = document.getElementById('nickname').value; 
		
		if (!getNickNameCheck.test($(event.target).val())) {
			$("label[for='nickname_check']").text("닉네임은 2~10자 이하의 한글/영어/숫자만 가능합니다.");
			$("label[for='nickname_check']").css("color", "#e35c5c");
			nickname_chk = false;
			return false;
		} else if (nickname.trim().length != 0) {
			$.ajax({
				async: true,
				type: 'POST',
				data: nickname,
				url: "/nickNameCheck",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(count) {
					if (count > 0) {
						$("label[for='nickname_check']").text("해당 닉네임이 존재합니다.");
						$("label[for='nickname_check']").css("color", "#e35c5c");
						nickname_chk = false;
					} else {
						$("label[for='nickname_check']").text("사용 가능한 닉네임입니다.");
						$("label[for='nickname_check']").css("color", "#898989");
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

<!-- 제출 완료 alert -->
$('#mypageEdit').on("submit", function () {
	   
	event.preventDefault();
	
	// 비밀번호 수정이 있을 경우 비밀번호 확인 반드시 작성
	var user_pw = $('#user_pw').val();
	var user_pw_check = $('#user_pw_check').val();
	
	if (user_pw !== '') {
		if(!pw_chk || user_pw_check === '') {
			alert("비밀번호 확인 후 진행해주세요.");
			return;
		}
	}
	    var form = event.target;
	    var formData = new FormData(form);
	    
	    // 비밀번호 질문 넣기
		  var selectedOption = document.querySelector('.optionItem.selected');
		  var pwQuestInput = document.getElementById('pw_quest_input');
		  var pwQuestAnswer = document.getElementById('pw_quest_answer');
		  var pwQuestValue = '';

		  if (selectedOption) {
		    pwQuestValue = selectedOption.getAttribute('value');
		  } else {
		    pwQuestValue = document.getElementById('pw_quest_input').value;
		  }

		  pwQuestInput.value = pwQuestValue;
	    
		// 최종 폼 전송
	    $.ajax({
	        url: form.action,
	        type: form.method,
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response) {
	            alert("프로필 수정을 완료했습니다.");
	            window.location.href = "/mypage/feed";
	        },
	        error: function(error) {
	            alert("프로필 수정 정보를 다시 확인해주시기 바랍니다.");
	            location.href="/mypage/edit";
	        }
	    });
})
</script>
</html>