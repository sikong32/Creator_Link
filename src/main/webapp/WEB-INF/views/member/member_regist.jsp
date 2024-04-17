<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/member/member_regist.css" rel="stylesheet" type="text/css">
<title>Sign Up : Creator Link</title>
</head>
<body>
	<section class="regist_container">
		<div class="regist_tot">
			<h3>회원가입</h3>
			<form class="regist_form" action="regist_do" method="post" onsubmit="return regiVr()">
				<div class="regist_menu">
					<label for="id">아이디</label>
					<div class="regist_id">
						<input type="text" id="id" name="id" maxlength="20" placeholder="아이디">
						<div class="pw1_notice">	
							<p id="id1" hidden="hidden">*아이디 입력은 필수사항 입니다.</p>
							<p id="id2" hidden="hidden">*아이디는 영어 대/소문자와 숫자를 포함한 4~20자<br> 이내로 만들어야 합니다.</p>
							<p id="id3" hidden="hidden">*이미 사용중인 아이디입니다.</p>
						</div>
					</div>
				</div>
				<div class="regist_menu">
					<label for="pw">비밀번호</label>
					<input type="password" id="pw" name="pw" placeholder="비밀번호">
				<div class="pw1_notice">	
					<p id="pw1" hidden="hidden">*비밀번호 입력은 필수사항 입니다.</p>
					<p id="pw2" hidden="hidden">*비밀번호는 특수문자(!@#_),영 대/소문자와 숫자를 포함한 8~20자<br> 이내로 만들어야 합니다.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="pw_verify">비밀번호 확인</label>
					<input type="password" id="pwVr" name="pwVr" placeholder="비밀번호 확인">
				<div class="pw1_notice">	
					<p id="pw3" hidden="hidden">*비밀번호 확인란에 비밀번호를 입력해주세요.</p>
					<p id="pw4" hidden="hidden">*비밀번호를 같게 만들어주세요.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="name">이름</label>
					<input type="text" id="name" name="name" placeholder="이름">
				<div class="pw1_notice">	
					<p id="name1" hidden="hidden">*이름 입력은 필수사항 입니다.</p>
					<p id="name2" hidden="hidden">*이름은 한글로 2~30자 이내로 만들어야 합니다.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="date">생년월일</label>
					<input type="date" id="birthDate" name="birthDate" max="9999-12-31">
				<div class="pw1_notice">	
					<p id="birthDate1" hidden="hidden">*생년월일 입력은 필수사항 입니다.</p>
					<p id="birthDate2" hidden="hidden">*생년월일을 다시 확인해주세요.</p>
					<p id="birthDate3" hidden="hidden">*YYYY(년)-MM(월)-DD(일) 형식으로 입력해주세요.</p>
				</div>
				</div>
				<div class="regist_menu">
					<label for="phone">전화번호</label>
<!-- 				<div class="regist_phone"> -->
					<input type="text" id="phone" name="phone" placeholder="휴대전화번호">
				<div class="pw1_notice">	
					<p id="phone1" hidden="hidden">*전화번호 입력은 필수사항 입니다.</p>
					<p id="phone2" hidden="hidden">*전화번호는 010을 포함한 숫자 10~11자 이내로 입력해주세요.</p>
				</div>
<!-- 				</div> -->
				</div>
				<div class="regist_signup">
					<input type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</section>
<script type="text/javascript">
$(document).ready(function() {
	$("#id").blur(function() {
		idVr();
	});
	
	$("#pw").blur(function() {
		pw();
	});
	
	$("#pwVr").blur(function() {
		pwVr();
	});
	
	$("#name").blur(function() {
		nameVr();
	});
	
	$("#birthDate").blur(function() {
		birthDateVr();
	});
	
	$("#phone").blur(function() {
		phoneVr();
	});
	
	function idVr() {
		var id = $("#id").val();
		var idVr = /^[A-Za-z\d]{4,20}$/;
		if (!id) {
			$("#id1").show();
			$("#id2").hide();
			return false;
		} else {
			$("#id1").hide();
		}
		if (!idVr.test(id)) {
			$("#id2").show();
			return false;
		} else {
			$("#id2").hide();
		}
		if (idVr.test(id)) {
			$.post("idCheck", {"id":id}, function(result) {
				if (result == "pass") {
					$("#id3").hide();
					return true;
				} else {
					$("#id3").show();
					return false;
				}
			}).fail (function() {
				alert("서버 통신 중 오류가 발생했습니다.");
			});
		}
	}
	
	function pw() {
		//비밀번호 체크 정규식 및 변수
		//var vrPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#_])[A-Za-z\d!@#_]{8,20}$/;
		//아래 식은 임시식이므로 프로젝트 완성 후 위의 식으로 교체해야됩니다.
		var pwVr = /^.{3,20}$/;
		var pw = $("#pw").val();
		if (!pw) {
			$("#pw1").show();
			$("#pw2").hide();
			return false;
		} else {
			$("#pw1").hide();
		}
		if (!pwVr.test(pw)) {
			$("#pw2").show();
			return false;
		} else {
			$("#pw2").hide();
			return true;
		}
	}
	
	function pwVr() {
		var pw = $("#pw").val();
		var pwVr = $("#pwVr").val();
		if (!pwVr) {
			$("#pw3").show();
			$("#pw4").hide();
			return false;
		} else {
			$("#pw3").hide();
		}
		if (pw != pwVr) {
			$("#pw4").show();
			return false;
		} else {
			$("#pw4").hide();
			return true;
		}
	}
	
	function nameVr() {
		var name = $("#name").val();
		var nameVr = /^[가-힣]{2,30}$/;
		if (!name) {
			$("#name1").show();
			$("#name2").hide();
			return false;
		} else {
			$("#name1").hide();
		}
		if (!nameVr.test(name)) {
			$("#name2").show();
			return false;
		} else {
			$("#name2").hide();
			return true;
		}
	}
	
	function birthDateVr() {
		var nullCheck = "no";
		var vrCheck = "no";
		var sysCheck = "no";
		var sysDate = new Date();
		var birthDateValue = $("#birthDate").val();
		var birthDate = new Date($("#birthDate").val());
		var birthDateVr = /^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|(1-2)[0-9]|3[0-1])$/;
		
		if (!birthDateValue || birthDateValue == "0000-00-00" || birthDateValue == "yyyy-MM-dd" || birthDateValue == "yyyyMMdd") {
			$("#birthDate1").show();
			$("#birthDate2").hide();
			$("#birthDate3").hide();
			return false;
		} else {
			$("#birthDate1").hide();
			nullCheck = "pass";
		}
/* 		if (!birthDateVr.test(birthDateValue)) {
			$("#birthDate2").show();
			return false;
		} else {
			$("#birthDate2").hide();
			vrCheck = "pass";
			alert("bd vrCheck "+ vrCheck);
		} */
		
		if (birthDate >= sysDate) {
			$("#birthDate2").show();
			return false;
		} else {
			$("#birthDate2").hide();
			sysCheck = "pass";
		}
		if (nullCheck == "pass" && sysCheck == "pass") {
			return true;
		}
	}
	
	function phoneVr() {
		var phone = $("#phone").val();
		var phoneVr = /^(010)\d{7,8}$/;
		if (!phone) {
			$("#phone1").show();
			$("#phone2").hide();
			return false;
		} else {
			$("#phone1").hide();
		}
		if (!phoneVr.test(phone)) {
			$("#phone2").show();
			return false;
		} else {
			$("#phone2").hide();
			return true;
		}
	}
	
	window.regiVr = function() {
		var idPass = idVr();
		var pwPass = pw();
		var pwVrPass = pwVr();
		var namePass = nameVr();
		var birthDatePass = birthDateVr();
		var phonePass = phoneVr();
		
		if (idPass && pwPass && pwVrPass && namePass && birthDatePass && phonePass ) {
			return true;
		} else {
			if (idPass == false) {
				alert("idPass "+idPass);
				$("#id").focus();
				return false;
			} else if (pwPass == false) {
				alert("pwPass "+pwPass);
				$("#pw").focus();
				return false;
			} else if (pwVrPass == false) {
				alert("pwVrPass "+pwVrPass);
				$("#pwVr").focus();
				return false;
			} else if (namePass == false) {
				alert("namePass "+namePass);
				$("#name").focus();
				return false;
			} else if (birthDatePass == false) {
				alert("birthDatePass "+birthDatePass);
				$("#birthDate").focus();
				return false;
			} else if (phonePass == false) {
				alert("phonePass "+phonePass);
				$("#phone").focus();
				return false;
			}
		}
	}
}); //document
</script>
</body>
</html>