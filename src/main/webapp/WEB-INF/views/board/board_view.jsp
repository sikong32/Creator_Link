<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>${post.bct_title}</th>
		</tr>
		<tr>
			<td>${post.bct_writer}<br>
				${post.bct_write_date} &emsp; 
				${post.bct_view_cnt}</td>
		</tr>
		<tr>
			<td>${post.bct_content}
				<c:if test="${post.bct_image != null}"><img src="./resources/board/${post.bct_image}"></c:if></td>
		</tr>
	</table>
</body>
</html>