<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .product-row {
        padding: 10px;
        border: 1px solid #ddd;
        margin-bottom: 5px;
    }
    .product-row.checked {
        background-color: #e0f7fa;
    }
    input[type="checkbox"]{
    transform:scale(2);
    margin: 10px;
    }
</style>
</head>
<body>
	<form action="shoping_cart_buy" method="post">
		<c:choose>
		<c:when test="${not empty os_list or not empty pd_list}">
		<c:forEach items="${os_list}" var="os">
		<div class="product-row">
				<c:set var="nameDisplayed" value="false" />  <!-- 이름 출력 여부를 추적하는 플래그 변수 설정 -->
				<input type="checkbox" name="selectedOs" value="${os.os_number}" ${os.os_stock < 1 ? 'disabled' : ''}>
				<img alt="" src="./resources/store/item_cover/${os.os_photo}" width="100">
			<c:forEach items="${pd_all_list}" var="pd_all">
				<c:if test="${pd_all.pd_number==os.pd_number and not nameDisplayed}">
				상품명 : ${pd_all.pd_name}<br>
				<c:set var="nameDisplayed" value="true" />  <!-- 이름 출력 후 플래그를 true로 설정 -->
				</c:if>
			</c:forEach>
				옵션명 : ${os.os_1name}${os.os_2name}${os.os_3name}<br> 가격${os.os_price}<br>구매수량
			<c:choose>
				<c:when test="${os.os_stock < 1}">
					품절
				</c:when>
				<c:otherwise>
					<select name="buy_os_stock_${os.os_number}">
						<c:forEach begin="1" end="${os.os_stock}" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		</c:forEach>
		<c:forEach items="${pd_list}" var="pd">
		<div class="product-row">
			<input type="checkbox" name="selectedPd" value="${pd.pd_number}">
			<img alt="" src="./resources/store/item_cover/${pd.pd_photo}" width="100">
			상품명 : ${pd.pd_name}<br> 가격 : ${pd.pd_price} <br>구매수량
				<c:choose>
					<c:when test="${pd.pd_stock < 1}">
						품절
					</c:when>
					<c:otherwise>
					<input name="buy_pd_stock_${pd.pd_number}" type="number" min="1" max="${pd.pd_stock}" value="${pd.pd_buy_su}">
					</c:otherwise>
				</c:choose>
		</div>
		</c:forEach>
		<br>
		가격 합계 : <input id="tot_price" type="number" value="0">
		<br>
		<input type="submit" value="결제하기">
		</c:when>
		<c:otherwise>
		<hr>
		장바구니가 비어있습니다.<br>
		상품을 추가해주세요
		<hr>
		</c:otherwise>
		</c:choose>
	</form>
</body>
<script>
    function toggleCheck(div) {
        var checkbox = div.querySelector('input[type="checkbox"]');
        if (!checkbox.disabled) {  // 체크박스가 비활성화 상태가 아닐 때만 토글
            checkbox.checked = !checkbox.checked;
            updateBackground(div);
        }
    }

    function updateBackground(div) {
        var checkbox = div.querySelector('input[type="checkbox"]');
        if (checkbox.checked) {
            div.classList.add('checked');
        } else {
            div.classList.remove('checked');
        }
    }

    window.onload = function() {
        var rows = document.querySelectorAll('.product-row');
        rows.forEach(row => {
            row.onclick = function() { toggleCheck(this); };
            var checkbox = row.querySelector('input[type="checkbox"]');
            checkbox.onclick = function(e) {
                if (!this.disabled) {  // 체크박스가 비활성화 상태가 아니면 이벤트 진행
                    e.stopPropagation();  // 행 클릭 이벤트를 방지
                    updateBackground(row);
                }
            };
        });
    };
</script>
</html>