<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var nickPass = 0;
	var pwPass = 0;
	var eMailPass = 0;
	var exPwCnt = 0;
	var f = document.member_mypage_form;
	var exPhoto = document.getElementById("exPhoto");
	var mdPhoto = document.getElementById("mdPhoto");
	
	function nickNameVr() {
		var vrNick = /^(?=.*[A-Za-z\d가-힣])[A-Za-z\d가-힣]{2,8}$/;
		var exNickName = "${dto.mb_nick_name}";
		var vrNickName = $("input[name='vrNickName']").val();
		if (vrNickName == "") {
			alert("닉네임을 입력해주세요.");
			return false;
		}
		if (!vrNick.test(vrNickName)) {
			alert("닉네임은 영어 및 한글, 숫자만 가능합니다.");
			return false;
		}
		if (vrNickName == exNickName) {
			alert("기존 닉네임과 같은 닉네임입니다.");
			return false;
		}
		if (vrNick.test(vrNickName) && (vrNickName != exNickName)) {
			$.ajax({
				type:"post",
				async:true,
				url:"mypage_nickName_check",
				dataType:"text",
				data:{"exNickName":exNickName,"vrNickName":vrNickName},
				success:function(result) {
					if (result == "pass") {
						alert("사용 가능한 닉네임입니다.");
					} else if (result == "false") {
						alert("이미 사용중인 닉네임입니다.");
					} //else if
				}, //(if)
				error: function() {
					alert("통신 중 오류가 발생했습니다.");
				} //error
			}); //ajax
		} //{if}
	} //function nickNameVr
	exPhoto.addEventListener("click", () => {
		mdPhoto.click();
	});
	function previewImage(event) { //이미지 미리보기 함수
	    var input = event.target;
	    var preview = document.getElementById('exPhoto');
	    var file = input.files[0];
	    var reader = new FileReader();
	
	    reader.onload = function(){
	        preview.src = reader.result;
	    };
	    reader.readAsDataURL(file);
	}
</script>
<script>
$(document).ready(function() {
	
	
	
	$("#psCheckBtn").click(function() {
		//비밀번호 체크 정규식 및 변수
//		var vrPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#_])[A-Za-z\d!@#_]{8,20}$/;
//		아래 식은 임시식이므로 프로젝트 완성 후 위의 식으로 교체해야됩니다.
		var vrPw = /^.{3,20}$/;
		var exId = "${dto.mb_id}";
		var exPw = "${dto.mb_password}";
		var exPwVr = $("input[name='exPwVr']").val();
		var mdPw = $("input[name='mdPw']").val();
		var mdPwVr = $("input[name='mdPwVr']").val();
		
		if (exPwCnt == 0) {
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
			if (mdPw == "") {
				alert("새로 변경할 비밀번호를 입력해주세요.");
				return false;
			}
			if (!vrPw.test(mdPw)) {
				alert("비밀번호는 특수문자(!@#_),영 대/소문자와 숫자를 포함한 8~20자 이내로 작성해야 합니다.");
				return false;
			}
			if (mdPwVr == "") {
				alert("새 비밀번호 확인란에도 비밀번호를 입력해주세요.");
				return false;
			}
			if (mdPw == exPw) {
				alert("기존 비밀번호와 동일합니다. 다르게 설정해주세요.");
				return false;
			}
			if (mdPw != mdPwVr) {
				alert("새 비밀번호를 동일하게 입력해주세요");
				return false;
			}
			if (vrPw.test(mdPw) && (mdPw == mdPwVr)) {
				$.ajax({
					type:"post", //전송타입
					async:true,
					url:"mypage_pwModify",
					dataType:"text",
					data:{"exId":exId,"exPw":exPw,"mdPw":mdPw},
					success:function(result) {
						if (result == "pass") {
							$("input[id='mdPw']").prop("readonly",true);
							$("input[id='mdPwVr']").prop("readonly",true);
							alert("비밀번호가 변경됐습니다.");
						} else if (result == "fail") {
							alert("서버 통신 중 오류가 발생했습니다.");
							return false;
						} //else
					} //success
				}); //ajax
			} //{if}
		} //[if]
	}); //click function
}); //document
</script>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/member/member_mypage.css" rel="stylesheet" type="text/css">
<title>Mypage : Creator Link</title>
</head>
<body>
	<section class="mypage_container">
		<div class="mypage_tot">
			<h3>정보 수정</h3>
			<form class="mypage_form" action="mypage_do" name="member_mypage_form" method="post" enctype="multipart/form-data">
				<div class="info_row">
					<div class="mypage_info">
						<label for="id">아이디</label>
						<input type="text" name="id" id="id" value="${dto.mb_id }" readonly><br>
						<input type="hidden" name="number" value="${dto.mb_number }">
					</div>
					<div class="mypage_info">
						<label for="nickname">닉네임</label>
						<div class="info_row">
							<input type="text" id="nickName" name="vrNickName" value="${dto.mb_nick_name }">
							<input type="hidden" name="exNickName" value="${dto.mb_nick_name }">
							<input type="button" id="button" name="nickNameVrBtn" value="중복확인" onclick="nickNameVr()">
						</div>
					</div>
				</div>
					<div class="mypage_info">
						<label for="pw">비밀번호 변경</label>
						<input type="text" name="exPwVr" id="exPw" placeholder="기존 비밀번호">
					</div>	
					<div class="info_row">
						<input type="text" name="mdPw" id="mdPw" readonly placeholder="새 비밀번호">
						<input type="text" name="mdPwVr" id="mdPwVr" readonly placeholder="새 비밀번호 확인">
						<input type="button" value="확인" id="psCheckBtn">
					</div>
					<div class="pw_notice">* 기존 비밀번호 확인 후 신규 비밀번호 입력가능</div>
				<div class="info_row">
					<div class="mypage_info">
						<label for="profile">프로필 사진</label>
						<c:choose>
							<c:when test="${dto.mb_photo eq 'basic_photo.png' }">
								<div class="mypage_profile">
									<label for="mdPhoto">
										<img alt="프로필 사진" src="resources/member/basic_photo/${dto.mb_photo }" id="exPhoto">
									</label>
								</div>
								<input type="hidden" name="exPhoto" value="${dto.mb_photo }">
								<input type="file" id="mdPhoto" name="mdPhoto" onchange="previewImage(event)" style="display: none;">
							</c:when>
							<c:otherwise>
								<div class="mypage_profile">
									<label for="mdPhoto">
										<img alt="프로필 사진" src="resources/member/profile/${dto.mb_photo }" id="exPhoto">
									</label>
								</div>
								<input type="hidden" name="exPhoto" value="${dto.mb_photo }">
								<input type="file" id="mdPhoto" name="mdPhoto" onchange="previewImage(event)" style="display: none;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="mypage_info" id="attribute">
						<label for="attribute">회원유형</label>
						<input type="text" name="attribute" value="${dto.mb_attribute }" readonly>
					</div>
				</div>
				<div class="info_row">
					<div class="mypage_info">
						<label for="name">이름</label>
						<div class="info_row">
							<input type="text" id="name" value="${dto.mb_name }" readonly>
						</div>
					</div>
					<div class="mypage_info">
						<label for="birthday">생년월일</label>
						<input type="date" name="birthDate" value=${dto.mb_birth_date }>
					</div>
				</div>
					<div class="mypage_info">
						<label for="phone">연락처</label>
						<input type="text" name="phone" value="${dto.mb_phone }">
					</div>
				<div class="mypage_info">
					<label for="email">이메일 주소</label>
					<div class="info_row">
						<input type="text" name="email" value="${dto.mb_email }">
						<input type="button" id="button" value="인증">
					</div>
				</div>
				<div class="mypage_info">
					<label for="address">주소</label>
							<div class="address_number">
								<input type="text" name="sample4_postcode" id="sample4_postcode" value="${dto.mb_addr_post }" placeholder="우편번호">
								<input type="button" id="find_address" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							</div>
								<div><input type="text" name="sample4_roadAddress" id="sample4_roadAddress" value="${dto.mb_addr_road }" placeholder="도로명주소">
								<input type="text" name="sample4_jibunAddress" id="sample4_jibunAddress" value="${dto.mb_addr_local }" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span></div>
								<input type="text" name="sample4_detailAddress" id="sample4_detailAddress" value="${dto.mb_addr_detail }" placeholder="상세주소">
				</div>
			<!-- <div class="mypage_info">
				<label for="signup_day">가입일</label>
				<input type="text" value="${dto.mb_signup_date }" readonly>
			</div> -->
			<!-- <div class="mypage_info">
				<label for="coupon">보유쿠폰</label>
				<c:choose>
					<c:when test="${dto.mb_coupon == 0 }">
						<div class="mypage_coupon">
							보유 쿠폰이 없어요.. (っ °Д °;)っ
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${dto.mb_coupon }" var="coupon">				
							<div class="mypage_coupon">
								${coupon }
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="mypage_info">
				<label for="order_list">주문목록</label>
				<c:choose>
					<c:when test="${dto.mb_order_list == 0 }">
						<div class="mypage_order_list">
							주문하신 상품이 없네요! 좋아하는 크리에이터 있으세요?ㄟ(≧◇≦)ㄏ
							<input type="button" value="구경하기" onclick="location.href='./'">
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${dto.mb_order_list }" var="order">
							<div class="mypage_order_list">
								${order }
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>-->
			<div class="mypage_button">
				<input type="submit" id="button" value="확인">
				<input type="button" id="button" value="취소" onclick="location.href='index'">
			</div>
		</form>
	</div>
</section>
</body>
</html>