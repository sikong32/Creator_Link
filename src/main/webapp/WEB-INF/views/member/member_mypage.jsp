<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var exPwCnt = 0;
	$("#psCheckBtn").click(function() {
		//비밀번호 체크 정규식 및 변수
		var f = document.member_mypage_form;
		var vPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^*-=_]).{8,20}$/;
		var exId = "${dto.mb_id}";
		var exPw = "${dto.mb_password}";
		var exPwVr = f.exPw.value;
		var mdPw = f.mdPw.value;
		var mdPwVr = f.mdPwVr.value;
		
		if (exPwCnt == 0 || exPwCnt == null) {
			if (exPwVr=="") {
				alert("기존의 비밀번호를 입력해주세요.");
				return false
			} else if (exPw == exPwVr) {
				alert("비밀번호가 확인됐습니다. 새 비밀번호를 입력해주세요.");
				$("input[id='exPw']").prop("readonly",true);
				$("input[id='mdPw']").prop("readonly",false);
				$("input[id='mdPwVr']").prop("readonly",false);
				exPwCnt = 1;
				return false;
			} else {
				alert("기존 비밀번호를 잘못 입력했습니다.");
				return false;
			} //{if-else}
		}
		
		if (exPwCnt == 1) {
			if (mdPw=="") {
				alert("새로 변경할 비밀번호를 입력해주세요.");
				return false;
			}
			
			if (!vPw.test(mdPw)) {
				alert("비밀번호는 특수문자,영 대/소문자와 숫자를 포함한 8~20자 이내로 작성해야 합니다.");
				return false;
			}
			
			if (mdPwVr=="") {
				alert("새 비밀번호 확인란에도 비밀번호를 입력해주세요.");
				return false
			}
			if (mdPw != mdPwVr) {
				alert("새 비밀번호를 동일하게 입력해주세요");
				return false;
			}
			
			if (vPw.test(mdPw) && (mdPw == mdPwVr)) {
				$.ajax({
					type:"post",
					async:true,
					url:"mypage_pwModify",
					dataType:"text",
					data:{"exId":exId,"exPw":exPw,"mdPw":mdPw},
					success:function(pass) {
						if (pass == 1) {
							$("input[id='mdPw']").prop("readonly",true);
							$("input[id='mdPwVr']").prop("readonly",true);
							alert("비밀번호가 변경됐습니다.");
						} else {
							alert("서버 통신 중 오류가 발생했습니다.");
						} //else
					} //success
				}); //ajax
			}//{if}
		} //[if]
	}); //click function
}); //document
</script>
<meta charset="UTF-8">
<title>Mypage : Creator Link</title>
</head>
<body>
<form action="mypage_do" name="member_mypage_form" method="post" enctype="multipart/form-data">
	<table border="1" align="center">
		<tr>
			<th>아이디</th>
			<td>${dto.mb_id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="exPwVr" id="exPw" placeholder="기존 비밀번호">*기존 비밀번호 확인부터 해주세요.<br>
				<input type="text" name="mdPw" id="mdPw" readonly placeholder="새 비밀번호">*기존 비밀번호 확인 후 입력해주세요.<br>
				<input type="text" name="mdPwVr" id="mdPwVr" readonly placeholder="새 비밀번호 확인">
				<input type="button" value="확인하기" id="psCheckBtn">
			</td>
		</tr>
		<tr>
			<th>프로필사진</th>
			<c:choose>
				<c:when test="${dto.mb_photo eq 'basic_photo.png' }">
					<td>
						<a href="">
						<img alt="프로필 사진" src="resources/member/basic_photo/${dto.mb_photo }" width="80px" height="80px">
						</a>
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<img alt="프로필 사진" src="resources/member/member_profile/${dto.mb_photo }" width="80px" height="80px">
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>닉네임</th>
			<c:choose>
				<c:when test="${dto.mb_nick_name == 0 }">			
					<td>
						<input type="text" name="nickName" placeholder="닉네임을 만들어주세요 :D">
						<input type="button" name="nickNameVrBtn" value="중복확인" onclick="nickNameVr">
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<input type="text" name="nickName" value="${dto.mb_nick_name }">
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				${dto.mb_name }
				<input type="button" value="개명하셨다면? 이름변경>">
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
				<input type="date" value=${dto.mb_birth_date }>
			</td>			
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input type="text" name="phone" value="${dto.mb_phone }">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" value="${dto.mb_email }">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<c:choose>
					<c:when test="${dto.mb_addr == 0 }">		
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소"><br>
					</c:when>
					<c:otherwise>
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소"><br>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.mb_signup_date }</td>
		</tr>
		<tr>
			<th>보유 쿠폰</th>
			<c:choose>
				<c:when test="${dto.mb_coupon == 0 }">
					<td>
						보유 쿠폰이 없어요.. (っ °Д °;)っ
					</td>
				</c:when>
				<c:otherwise>
					<c:forEach items="${dto.mb_coupon }" var="coupon">				
						<td>
							${coupon }
						</td>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>주문목록</th>
			<c:choose>
				<c:when test="${dto.mb_order_list == 0 }">
					<td>
						주문하신 상품이 없네요! 좋아하는 크리에이터 있으세요?ㄟ(≧◇≦)ㄏ<br>
						<input type="button" value="구경하기" onclick="location.href='./'">
					</td>
				</c:when>
				<c:otherwise>
					<c:forEach items="${dto.mb_order_list }" var="order">
						<td>
							${order }
						</td>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>회원 유형</th>
			<td>
				${dto.mb_attribute }
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="location.href='index'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>