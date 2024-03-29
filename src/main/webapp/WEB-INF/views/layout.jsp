<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
<style type="text/css">
body {
	margin : 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 90%;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family:'Pretendard-Regular';
}
</style>
</head>
<body>
	<div id="container">
		<div id="top"><t:insertAttribute name="top" /></div>
		<div id="body"><t:insertAttribute name="body" /></div>
		<div id="footer"><t:insertAttribute name="footer" /></div>
	</div>
</body>
</html>