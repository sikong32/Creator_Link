<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="regist_do" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id">
					<input type="button" value="중복확인" id="idcheck"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td><input type="text" name="pw_veri"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" name="citizen_num_front"> - 
					<input type="text" name="citizen_num_back"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel_first"> -
					<input type="text" name="tel_second"> -
					<input type="text" name="tel_third"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>