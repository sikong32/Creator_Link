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
<link href="${pageContext.request.contextPath}/resources/css/member/member_regist.css" rel="stylesheet" type="text/css">
<title>Sign Up : Creator Link</title>
</head>
<body>
	<section class="regist_container">
		<div class="regist_tot">
			<h3>회원가입</h3>
			<form class="regist_form" action="regist_do" method="post">
				<div class="regist_menu">
					<label for="id">아이디</label>
					<div class="regist_id"><input type="text" id="id" name="id" placeholder="아이디">
					<input type="button" value="중복확인" id="idCheck"></div>
				</div>
				<div class="regist_menu">
					<label for="pw">비밀번호</label>
					<input type="password" name="pw" placeholder="비밀번호">
				</div>
				<div class="regist_menu">
					<label for="pw_verify">비밀번호 확인</label>
					<input type="password" name="pw_verify" placeholder="비밀번호 확인">
				</div>
				<div class="regist_menu">
					<label for="name">이름</label>
					<input type="text" name="name" placeholder="이름">
				</div>
				<div class="regist_menu">
					<label for="date">생년월일</label>
					<input type="date" name="birthDate">
				</div>
				<div class="regist_menu">
					<label for="phone">전화번호</label>
					<div class="regist_phone"><input type="text" id="phone1" name="phone1" size="8" placeholder="010"> -
					<input type="text" id="phone2" name="phone2" size="8" placeholder="0000"> -
					<input type="text" id="phone3" name="phone3" size="8" placeholder="0000"></div>
				</div>
				<div class="regist_signup">
					<input type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</section>
</body>
</html>