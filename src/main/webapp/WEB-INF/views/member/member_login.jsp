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
	       	<form class="login_form" action="login_do" method="post">
	            <div class="login_idpw">
	            	<div class=login_input>
		                <input type="text" name="id" placeholder="아이디 입력">
		                <input type="text" name="pw" placeholder="비밀번호 입력">
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