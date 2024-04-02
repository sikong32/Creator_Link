<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

html,body {
	width: 100vw;
	height: 100vh;
	margin : 0;
	padding: 0;
	border: 0;
	
	-ms-overflow-style: none;
  	scrollbar-width: none;
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