<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
<style type="text/css">

html,body {
	width: calc(100vw - 21px); /* 스크롤 바 너비만큼 빼기 */
	height: 100vh;
	margin : 0;
	padding: 0;
	border: 0;
	box-sizing: border-box;
}

.navbar_container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: #2A2F4F;
	padding: 0px;
	z-index: 1000; /* 다른 컨텐츠 위에 오도록 설정 */
	display: flex;
	align-items: center;
	justify-content: space-between;
	background-color: #2A2F4F;
	white-space: nowrap;
}

#body {
    padding-top: 60px; /* 네비게이션 바 높이 + 추가 공간 */
}

</style>
</head>
<body>
	<div id="container">
		<div id="top"><div class="navbar_container"><t:insertAttribute name="top" /></div></div>
		<div id="body"><t:insertAttribute name="body" /></div>
		<div id="footer"><t:insertAttribute name="footer" /></div>
	</div>
</body>
</html>