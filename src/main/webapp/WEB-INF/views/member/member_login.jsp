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
       	<form class="login_input" action="login_do" method="post">
       		<h2>로그인</h2>
            <div class="login_idpw">
                <div class="box_id"><input class="login_id" type="text" name="id" placeholder="아이디 입력"></div>
                <div class="box_pw"><input class="login_pw" type="text" name="pw" placeholder="비밀번호 입력"></div>
                <input class="login_bnt" type="submit" value="로그인">
            </div>
       	</form>
	</section>
</body>
</html>