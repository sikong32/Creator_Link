<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .list_items {
        display: flex;
        background-color: white;
        border-radius: 1vw; /*테두리 부드럽게*/
        box-shadow: 0 4px 16px rgba(0, 0, 0, .05); /*그림자 설정*/
        width: 50vw; /* 넓이를 50%로 고정*/
        height: 11vw; /* 높이를 10%로 고정*/
        color: #555555;
        font-size: 1vw; /* 폰트 크기를 뷰포트 너비의 1%로 설정 */
        overflow: hidden; /* 내용이 div를 넘어가면 숨김 */
        font-family:'Pretendard-Regular';
    }
    .list_items_test {
        margin-left: 1vw;
    }
    .list_items img {
        border-radius: 1vw;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .order_cancel{
        display: flex;
	    margin-left: 15vw;
	    align-items: center;
    }
    input[type="button"] {
	text-align: center;
	height: 3vh;
    background-color: #2A2F4F;
	color: white;
	border: none;
	border-radius: 5px;
	bottom: 190px;
	left: 60px;
	font-size: 15px;
	font-family:'Pretendard-Regular';
	}
	input[type="button"]:hover {
		background-color:#917FB3;
	}
</style>
</head>
<body>
<div style="background-color: #f4f6f8;">
	<div style="display: flex; margin-left: 25%">
		<ul style="list-style-type: none;">
		<c:choose>
		<c:when test="${not empty order_list}">
			<c:forEach items="${order_list}" var="od">
				<li>
				<div class="list_items">
					<input type="hidden" value="${od.od_number}" name="od_number">
					<a href="store_detail?pd_number=${od.od_pd_number}"><img alt="" src="./resources/store/item_cover/${od.image}"></a>
					<div class="list_items_test">
					주문 번호: <b>${od.od_number}</b>
					상품명:    <b>${od.od_pd_name}</b><br>
					주문 수량:   ${od.od_pd_qnt}
					결제 금액:   ${od.od_price} 원<br>
					주문 일자:   ${od.od_date}<br>
					<c:if test="${od.os_name!=null}">
					옵션 이름:   ${od.os_name}<br>
					</c:if>
					<c:if test="${od.od_cancel_text==null}">
					주문자: <b>${od.od_id}</b><br>
					배송 주소:   ${od.dlvy_address}<br>
					삭세 주소:   ${od.dlvy_detail}<br>
					배송 메시지:   ${od.dlvy_comment}<br>
					송장번호: <input type="text" name="dlvyAddress" id="dlvyAdd_${od.od_number}" maxlength="20" value="${od.od_invoice}"><input type="button" onclick="dlvyAddress(${od.od_number})" value="전송">
					</c:if>
					</div>
				<div class="order_cancel"><input ${od.od_cancel_text==null?"type='button'":"type='hidden'"} onclick="order_cancel(${od.od_number})" value="주문취소"><br></div>
				</div>
				</li><br>
			</c:forEach>
		</c:when>
		<c:otherwise>
			주문 내역이 없습니다.
		</c:otherwise>
		</c:choose>
		</ul>
	</div>
</div>
</body>
<script type="text/javascript">
function dlvyAddress(od_number) {
	const dlvyAddress = document.getElementById("dlvyAdd_"+od_number).value;
	window.location.href = "dlvyAddress?dlvyAdd="+dlvyAddress+"&&od_number="+od_number;
}
function order_cancel(od_number) {
	// 취소 확인
    if (confirm("주문을 취소하시겠습니까?")) {
		var cancel_text = prompt("취소 이유를 입력하세요:");
	    
		// 사용자가 입력한 취소 이유가 유효한 경우
	   	if (cancel_text != null && cancel_text.trim() !== "") {
            window.location.href = "cancel?cancel_text=" + encodeURIComponent(cancel_text)+"&&od_number="+od_number;
	   	}else if(cancel_text == null && cancel_text.trim() === ""){
	   		alert("취소이유를 입력해주세요");
	   	}
    }
}
</script>
</html>