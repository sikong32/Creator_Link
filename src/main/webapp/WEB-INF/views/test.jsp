<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    // 전화번호를 검증하는 함수
    function checkPhone() {
        // 전화번호를 검증하는 정규식 패턴입니다.
        var vrPhone = /^(010|011|016|017|018|019)\d{7,8}$/;
        // 전화번호 입력란의 값을 가져옵니다.
        var exPhone = document.getElementById("phone").value;
        // 가져온 전화번호 값을 알림창으로 출력합니다.
        alert(exPhone);
        // 정규식을 사용하여 전화번호 유효성을 검사합니다.
        if (vrPhone.test(exPhone)) {
            // 유효한 전화번호일 경우 알림창으로 메시지를 표시합니다.
            alert("회원정보가 수정되었습니다.");
            // true를 반환하여 폼을 제출합니다.
            return true;
        } else {
            // 유효하지 않은 전화번호일 경우 알림창으로 메시지를 표시합니다.
            alert("전화번호는 숫자로 11자리 까지 입력 가능합니다.");
            // false를 반환하여 폼을 제출하지 않습니다.
            return false;
        }
    };
</script>
<meta charset="UTF-8">
</head>
<body>
	<input type="text" name="phone" id="phone">
	<input type="submit" class="button" value="확인" onclick="checkPhone()">
     
</body>
</html>