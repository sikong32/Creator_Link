<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 여기는 W3에서 받은 네이바 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- END W3에서 받은 네이바 -->
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="main">Creator link</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="main">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">스토어<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
               data-toggle="dropdown" href="#">크리에이터<span class="caret"></span></a>
               <ul class="dropdown-menu">
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
               </ul></li>
     	    </ul>
   
			<ul class="nav navbar-nav navbar-right">
						<li><a href="member_input"><span
								class="glyphicon glyphicon-user"></span>회원가입</a></li>
						<li><a href="member_login"><span
								class="glyphicon glyphicon-log-in"></span>로그인</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>