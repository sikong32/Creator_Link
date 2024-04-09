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
<script type="text/javascript">
	var logIdCnt = 0;
	var logPwCnt = 0;
	
	function check_logInfo() {
		var logId = document.getElementById("logId").value;
		const vrId = /^[A-Za-z\d]{4,20}$/;
		if (logIdCnt == 0) {
			if (logId=="") {
				alert("아이디를 입력해주세요.");
				return false;		
			} else if (!vrId.test(logId)) {
				alert("아이디는 4~20자의 영어와 숫자만 입력 가능합니다.");
				return false;
			} else if (vrId.test(logId)) {
				logIdCnt = 1;
			} 
		}
		if (logPwCnt == 0) {
			var logPw = document.getElementById("logPw").value;
//			var vrPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#_])[A-Za-z\d!@#_]{8,20}$/;
//			아래 식은 임시식이므로 프로젝트 완성 후 위의 식으로 교체해야됩니다.
			var vrPw = /^.{3,20}$/;
			if (logPw=="") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (!vrPw.test(logPw)) {
				alert("비밀번호는 특수문자(!@#_),영 대/소문자와 숫자를 포함한 8~20자 이내로 작성해야 합니다.");
				return false;
			} else if (vrPw.test(logPw)) {
				logPwCnt = 1;
			}
		}
		if (logIdCnt == 1 && logPwCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
</script>
<body>
	<section class="login_container">
		<div class="login_tot">
			<h3>로그인</h3>
	       	<form class="login_form" action="login_do" method="post" onsubmit="return check_logInfo()">
	            <div class="login_idpw">
	            	<div class=login_input>
		                <input type="text" name="logId" id="logId" placeholder="아이디 입력">
		                <input type="text" name="logPw" id="logPw" placeholder="비밀번호 입력">
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
</body>
</html>