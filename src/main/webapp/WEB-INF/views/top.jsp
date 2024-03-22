<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="search" method="post">
		<a href="index"><img alt="로고" src="./resources/light.png"></a>
		<a href="store_main">스토어</a>
		<a href="board_main">게시판</a>
		<input type="text" name="value">
		<input type="submit" value="검색">
		<a href="login">로그인</a>
		<a href="regist">가입</a>
	</form>
</body>
</html>