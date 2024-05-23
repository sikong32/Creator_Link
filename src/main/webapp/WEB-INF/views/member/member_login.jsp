<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 경로  -->
<link href="${pageContext.request.contextPath}/resources/css/member/member_login.css" rel="stylesheet" type="text/css">
<title>Login : Creator Link</title>
</head>
<body>
	<section class="login_container">
		<div class="login_tot">
			<h3>로그인</h3>
	       	<form class="login_form" action="login_do" method="post" onsubmit="return logVr()">
	            <div class="login_idpw">
	            	<div class="login_input">
		                <input type="text" name="id" id="id" placeholder="아이디 입력">
		                <div class="notice">
		                	<p id="id1" hidden="hidden">*아이디 입력은 필수사항 입니다.</p>
							<p id="id2" hidden="hidden">*아이디는 영어 대/소문자와 숫자를 포함한 4~20자<br> 이내로 만들어야 합니다.</p>
		                </div>
		                <input type="text" name="pw" id="pw" placeholder="비밀번호 입력">
		                <div class="notice">
		                	<p id="pw1" hidden="hidden">*비밀번호 입력은 필수사항 입니다.</p>
							<p id="pw2" hidden="hidden">*비밀번호는 특수문자(!@#_),영 대/소문자와 숫자를 포함한 8~20자<br> 이내로 만들어야 합니다.</p>
		                </div>
		                <div class="login_find"><a href="#">로그인 정보를 잊으셨나요?</a></div>
	                </div>
	                <div class="login_bnt">
		                <input type="submit" value="로그인">
		                <input type="button" onclick="location.href='regist'" value="회원가입">
	                </div>
	            </div>
	       	</form>
	       	<div class="line"></div>
	       	<div class="login_other">
	           	<div class="login_otherbox" id="kakao">
	           	<a href="#"><img src="./resources/cssimage/kakao.png">카카오 로그인</a></div>
	           	<div class="login_otherbox" id="naver">
	           	<a href="#"><img src="./resources/cssimage/naver.png">네이버 로그인</a></div>
	        </div>
        </div>
	</section>
<script type="text/javascript">
$(document).ready(function() {
}); //document
	function idVr() {
		var id = $("#id").val();
		var idVr = /^[A-Za-z\d]{4,20}$/;
		if (!id) {
			$("#id1").show();
			$("#id2").hide();
			return false;
		} else {
			$("#id1").hide();
		}
		if (!idVr.test(id)) {
			$("#id2").show();
			return false;
		} else {
			$("#id2").hide();
			return true;
		}
	}
	
	function pwVr() {
		//비밀번호 체크 정규식 및 변수
		//var vrPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#_])[A-Za-z\d!@#_]{8,20}$/;
		//아래 식은 임시식이므로 프로젝트 완성 후 위의 식으로 교체해야됩니다.
		var pwVr = /^.{3,20}$/;
		var pw = $("#pw").val();
		if (!pw) {
			$("#pw1").show();
			$("#pw2").hide();
			return false;
		} else {
			$("#pw1").hide();
		}
		if (!pwVr.test(pw)) {
			$("#pw2").show();
			return false;
		} else {
			$("#pw2").hide();
			return true;
		}
	}

	function logVr() {
		var idPass = idVr();
		var pwPass = pwVr();
		
		if (idPass && pwPass) {
			return true;
		} else {
			if (idPass == false) {
				$("#id").focus();
				return false;
			} else if (pwPass == false) {
				$("#pw").focus();
				return false;
			}
		}//else
		
	}// logVr()
</script>
</body>
</html>