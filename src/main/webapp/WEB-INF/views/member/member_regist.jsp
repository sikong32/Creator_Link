<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#idCheck").click(function() {
		var id = $("#id").val();
		$.ajax({
			type:"post",
			async:true,
			url:"idCheck",
			datatype:"text",
			data:{"id":id},
			success:function(verified) {
				if (verified == "pass") {
					alert("사용 가능한 아이디입니다.");
					$("#registBtn").prop("disabled",false);
				} //if
				else {
					alert("이미 사용중인 아이디입니다.");
					$("#registBtn").prop("disabled",true);
				} //else
			}, //success
			error:function() {
				alert("오류가 발생했습니다. 관리자에게 문의하세요.\n 오류코드:");
			} //error
		}) // ajax
	}); //#check
}); //document
</script>
<meta charset="UTF-8">
<title>Sign Up : Creator Link</title>
</head>
<body>
	<form action="regist_do" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id">
					<input type="button" value="중복확인" id="idCheck" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="text" name="pw" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td><input type="text" name="pw_verify" placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" placeholder="이름"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="birthDate">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="phone1" size="8" placeholder="010"> -
					<input type="text" name="phone2" size="8" placeholder="0000"> -
					<input type="text" name="phone3" size="8" placeholder="0000">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="registBtn" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>