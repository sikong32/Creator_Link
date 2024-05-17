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
					<a href="store_detail?pd_number=${od.od_pd_number}"><img alt="" src="./resources/store/item_cover/${od.image}"></a>
					<div class="list_items_test">
					상품명:    <b>${od.od_pd_name}</b><br>
					주문 개수:   ${od.od_pd_qnt}<br>
					주문 가격:   ${od.od_price} 원<br>
					주문 일자:   ${od.od_date}<br>
					<c:choose>
					<c:when test="${od.os_name!=null}">
					옵션 이름:   ${od.os_name}<br>
					</c:when>
					</c:choose>
					배송 주소:   ${od.dlvy_address}<br>
					삭세 주소:   ${od.dlvy_detail}<br>
					배송 메시지:   ${od.dlvy_comment}<br>
					송장번호: ${od.od_invoice}<br>
					</div>
					<div><a href="review_input?pd_number=${od.od_pd_number}" onclick="popup(event)">리뷰 등록</a></div>
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
function popup(event) {
    event.preventDefault(); // 기본 링크 동작을 중지합니다.
    const url = event.target.href; // 링크의 주소를 가져옵니다.
    window.open(url, "_blank", "width=600,height=400"); // 팝업 창을 엽니다.
}
</script>
</html>