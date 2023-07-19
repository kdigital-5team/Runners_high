<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>Runner's High &mdash; Find Password</title>

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

	<div class="site-wrap-width">
		<div class="deco-banner"></div>
		<div class="col-6 col-lg-2 site-logo" id="main-logo">
			<a role="button" onclick="location.href='/main'">Runner's High</a>
		</div>
		<div class="sub-title">
			<label class="sub-title"> 비밀번호 조회를 위해 회원 정보를 입력해주세요.</label>
		</div>
		<div class="site-section">
			<div class="container">
				<form id="findPw_Form" name="findPwForm" method="post" action="/findPw">
					<div class="context-form">
						<label for="inputID">아이디</label><br> 
							<input type="text" id="user_id" name="user_id" placeholder="사용자 아이디"><br>
						<label class="notice-label" for="id_check"></label>
					</div>
					<div class="context-form">
						<label for="PasswordQuestion">비밀번호 질문</label><br>
						<div class="selectBox">
							<button class="label" id="pw_quest" name="pw_quest">질문
								리스트</button>
							<input type="hidden" id="pw_quest_input" name="pw_quest_input" value="${pw_quest_input}">
							<ul class="optionList">
								<li class="optionItem" value="어렸을 때 장래희망은?">어렸을 때 장래희망은?</li>
								<li class="optionItem" value="다녔던 초등학교의 명칭은?">다녔던 초등학교의 명칭은?</li>
								<li class="optionItem" value="기억나는 장소는?">기억나는 장소는?</li>
							</ul>
						</div>
					</div>
					<div class="context-form">
						<input type="text" id="pw_quest_answer" name="pw_quest_answer"
							placeholder="비밀번호 확인 답변">
					</div>
					<input type="submit" value="제출" onclick="submit2();"> <br>
					<br><br>
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
			optionList.style.display = 'none';

			// 선택한 값 업데이트
			document.getElementById('pw_quest_input').value = item
					.getAttribute('value');
		});

		// 옵션 클릭시 클릭한 옵션을 넘김
		options.forEach(function(option) {
			option.addEventListener('click', function() {
				handleSelect(option)
				selectBox.style.backgroundColor = '#E8F0FE';
			})
		});

		// 라벨을 클릭시 옵션 목록이 열림/닫힘
		label.addEventListener('click', function(event) {
			event.preventDefault();
			if (optionList.style.display === 'block') {
				optionList.style.display = 'none';
			} else {
				optionList.style.display = 'block';
			}
		});
	</script>

</body>
<script>
	var id_chk = false;
	const getIdCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);

	// 기본 안내
	$("label[for='id_check']").text("*20자 이하의 영어/숫자의 이메일(@.com)");

	$('#user_id').keyup(
			function() {
				var user_id = $('#user_id').val();
				if (!getIdCheck.test($(event.target).val())) {
					$("label[for='id_check']").text(
							"아이디는 20자 이하의 영어/숫자 이메일(@ .com)만 가능합니다.");
					$("label[for='id_check']").css({
						"color" : "#e35c5c",
						"display" : "inline-block"
					});
					id_chk = false;
				} else if (user_id.trim().length != 0) {
					$.ajax({
						async : true,
						type : 'POST',
						data : user_id,
						url : "/idCheck",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(count) {
							if (count > 0) {
								$("label[for='id_check']").text("");
								id_chk = true;
							} else {
								$("label[for='id_check']").text(
										"존재하지 않는 아이디입니다.");
								$("label[for='id_check']").css("color",
										"e35c5c");
								id_chk = false;
							}
						},
						error : function(error) {
							alert("아이디를 입력해주세요.");
						}
					});
				} else {
					alert("아이디를 입력해주세요.");
				}
			});

	function submit2() {

		event.preventDefault();

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

		// 아이디 값 확인
		if (id_chk == true && pwQuestValue !== '' && pwQuestAnswer !== '') {
			alert("회원 조회 완료! 새 비밀번호를 설정합니다.");
			document.forms.findPw_Form.submit();

		} else {
			alert("없는 회원입니다. 다시 확인해주세요.");
		}
	};
</script>
</html>