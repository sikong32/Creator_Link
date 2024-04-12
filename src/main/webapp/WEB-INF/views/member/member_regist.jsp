<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.pw1_notice {
	color:#ff0000;
	font-size: 13px;
	font-family:'Pretendard-Regular';
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//비밀번호 체크 정규식 및 변수
	//var vrPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#_])[A-Za-z\d!@#_]{8,20}$/;
	//아래 식은 임시식이므로 프로젝트 완성 후 위의 식으로 교체해야됩니다.
	var vrPw = /^.{3,20}$/;
	
	$("#pw").blur(function() {
		alert("pw() test")
		pw();
	});
	
	$("#pwVr").blur(function() {
		pwVr();
	});
	
	function pw() {
		var pw = document.getElementById("pw").value;
		if (!pw) {
			$("#p1").show();
			return false;
		} else if (pw != "") {
			$("#p1").hide();
		}
		if (!vrPw.test(pw)) {
			$("#p2").show();
			return false;
		} else {
			$("#p2").hide();
		}
	}
	
	function pwVr() {
		var pw = document.getElementById("pw").value;
		var pwVr = document.getElementById("pwVr").value;
		if (!pwVr) {
			$("#p4").show();
			return false;
		} else {
			$("#p4").hide();
		}
		if (pw != pwVr) {
			$("#p3").show();
			return false;
		} else {
			$("#p3").hide();
		}
	}
	
	$("#idCheck").click(function() {
		var vrId = /^[A-Za-z\d]{4,20}$/;
		var id = document.getElementById("id").value;
		
		if (id.length < 4 || id.length > 20 || !vrId.test(id)) {
			alert("아이디는 4~20글자 이내의 영어 대,소문자 및 숫자만 가능합니다");
			return false;
		} else {
				$.ajax({
					type:"post",
					async:true,
					url:"idCheck",
					datatype:"text",
					data:{"id":id},
					success:function(verified) {
						if (verified == "pass") {
							alert("사용 가능한 아이디입니다.");
							$("#registBtn").prop("disabled",false);
						} //if
						else {
							alert("이미 사용중인 아이디입니다.");
							$("#registBtn").prop("disabled",true);
						} //else
					}, //success
					error:function() {
						alert("오류가 발생했습니다. 관리자에게 문의하세요.");
					} //error
				}) // ajax
		} //else
	}); //#id
}); //document
</script>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/member/member_regist.css" rel="stylesheet" type="text/css">
<title>Sign Up : Creator Link</title>
</head>
<body>
	<section class="regist_container">
		<div class="regist_tot">
			<h3>회원가입</h3>
			<form class="regist_form" action="regist_do" method="post">
				<div class="regist_menu">
					<label for="id">아이디</label>
					<div class="regist_id"><input type="text" id="id" name="id" maxlength="20" placeholder="아이디">
					<input type="button" value="중복확인" id="idCheck"></div>
				</div>
				<div class="regist_menu">
					<label for="pw">비밀번호</label>
					<input type="password" name="pw" placeholder="비밀번호">
				<div class="pw1_notice">	
					<p id="p1" hidden="hidden">*비밀번호 입력은 필수사항 입니다.</p>
					<p id="p2" hidden="hidden">*비밀번호는 특수문자(!@#_),영 대/소문자와 숫자를 포함한 8~20자<br> 이내로 만들어야 합니다.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="pw_verify">비밀번호 확인</label>
					<input type="password" name="pwVr" placeholder="비밀번호 확인">
				<div class="pw1_notice">	
					<p id="p3" hidden="hidden">*두 비밀번호를 같게 만들어주세요.</p>
					<p id="p4" hidden="hidden">*비밀번호 확인란에 비밀번호를 입력해주세요.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="name">이름</label>
					<input type="text" name="name" placeholder="이름">
				</div>
				<div class="regist_menu">
					<label for="date">생년월일</label>
					<input type="date" name="birthDate">
				</div>
				<div class="regist_menu">
					<label for="phone">전화번호</label>
					<div class="regist_phone"><input type="text" id="phone1" name="phone1" size="8" placeholder="010"> -
					<input type="text" id="phone2" name="phone2" size="8" placeholder="0000"> -
					<input type="text" id="phone3" name="phone3" size="8" placeholder="0000"></div>
				</div>
				<div class="regist_signup">
					<input type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</section>
</body>
</html>