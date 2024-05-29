<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .product-row {
        display: flex;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 1vw;
        margin-bottom: 5px;
        
        background-color: white;
        border-radius: 1vw; /*테두리 부드럽게*/
        box-shadow: 0 4px 16px rgba(0, 0, 0, .05); /*그림자 설정*/
        width: 50vw; /* 넓이를 50%로 고정*/
/*         height: 10vw; /* 높이를 10%로 고정*/ */
        color: #555555;
	    align-items: center;
	    font-size: 1vw; /* 폰트 크기를 뷰포트 너비의 1%로 설정 */
        overflow: hidden; /* 내용이 div를 넘어가면 숨김 */
        font-family:'Pretendard-Regular';
    }
    .product-row select {
    	font-size: 1vw; /* 폰트 크기를 뷰포트 너비의 1%로 설정 */
    }
    .product-row.checked {
        background-color: #e0f7fa;
    }
    input[type="checkbox"]{
    transform:scale(2);
    margin: 10px;
    }
    .cart_view{
    width: 50vw;
    margin-left: 25vw;
    }
    input[type="submit"],
    input[type="button"] {
    margin: 1%;
	text-align: center;
	width: 5vw;
	height: 2vw;
    background-color: #2A2F4F;
	color: white;
	border: none;
	border-radius: 5px;
	bottom: 190px;
	left: 60px;
	font-size: 15px;
	font-family:'Pretendard-Regular';
	}
	input[type="submit"]:hover,
	input[type="button"]:hover {
		background-color:#917FB3;
	}
</style>
</head>
<body>
<div class="cart_view">
	<input type="button" value="품절 삭제" onclick="cart_del_0stock()">
	<input type="button" value="선택 삭제" onclick="cart_checked_del()">
	<form action="shoping_cart_buy" method="post">
		<c:choose>
		<c:when test="${not empty os_list or not empty pd_list}">
		<c:forEach items="${os_list}" var="os">
		<div class="product-row">
		<input type="hidden" id="cart_qnt" name="cart_qnt" value="${os.ct_pd_qnt}">
				<c:set var="nameDisplayed" value="false" />  <!-- 이름 출력 여부를 추적하는 불리안 변수 설정 -->
				<input type="checkbox" name="selectedOs" value="${os.os_number}" ${os.os_stock < 1 ? 'disabled' : ''}>
				<img alt="" src="./resources/store/item_cover/${os.os_photo}" width="100">
			<c:forEach items="${pd_all_list}" var="pd_all">
				<c:if test="${pd_all.pd_number==os.pd_number and not nameDisplayed}">
				상품명 : ${pd_all.pd_name}<br>
				<c:set var="nameDisplayed" value="true" />  <!-- 이름을 1번만 출력 후 불리안를 true로 설정하여 다시 출력 방지 -->
				</c:if>
			</c:forEach>
				옵션명 : ${os.os_1name}${os.os_2name}${os.os_3name}<br> 가격 : <fmt:formatNumber pattern="#,###" value="${os.os_price}"/>원 <br>구매수량
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
		<input type="hidden" id="cart_qnt" name="cart_qnt" value="${pd.ct_pd_qnt}">
			<input type="checkbox" name="selectedPd" value="${pd.pd_number}">
			<img alt="" src="./resources/store/item_cover/${pd.pd_photo}" width="100">
			상품명 : ${pd.pd_name}<br> 가격 : <fmt:formatNumber pattern="#,###" value="${pd.pd_price}"/>원 <br>구매수량
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
<!-- 		<br> -->
<!-- 		가격 합계 : <input id="tot_price" type="number" value="0"> -->
<!-- 		<br> -->
		<input type="submit" id="cart_submit" value="결제하기">
		</c:when>
		<c:otherwise>
		<hr>
		장바구니가 비어있습니다.<br>
		상품을 추가해주세요
		<hr>
		</c:otherwise>
		</c:choose>
	</form>
</div>
</body>
<script>
	// 상품이 품절이면 체크박스 비활 성화
    function toggleCheck(div) {
        var checkbox = div.querySelector('input[type="checkbox"]');
        if (!checkbox.disabled) {  // 체크박스가 비활성화 상태가 아닐 때만 토글
            checkbox.checked = !checkbox.checked;
            updateBackground(div);
        }
    }
	// 상품을 선택하여 체크 할 수 있게 처리
    function updateBackground(div) {
        var checkbox = div.querySelector('input[type="checkbox"]');
        if (checkbox.checked) {
            div.classList.add('checked');
        } else {
            div.classList.remove('checked');
        }
        check_cart_submit_bt(); // 체크된 내용이 없으면 결제 버튼 비활성화
    }
    // 상품이 선택 되지 않으면 결제 하기 버튼 비활성화
	function check_cart_submit_bt() {
		var checkboxes = document.querySelectorAll('.product-row input[type="checkbox"]');
	    var isAnyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
	    var submitButton = document.getElementById('cart_submit');
	    submitButton.disabled = !isAnyChecked;  // 제출 버튼을 비활성화합니다.
	}
    // 카트에서 품절 된 제품 삭제
	function cart_del_0stock() {
		var productRows = document.querySelectorAll('.product-row');
        productRows.forEach(function(row) {
            var checkbox = row.querySelector('input[type="checkbox"]');
            if (checkbox.disabled) { // 체크박스가 비활성화된 경우 품절로 간주
                var cartQuantity = row.querySelector('input[type="hidden"][name="cart_qnt"]').value;
                console.log('품절된 제품의 구매수량: ' + cartQuantity);
                cart_del(cartQuantity);
            }
        });
	}
    function cart_checked_del() {
    	var productRows = document.querySelectorAll('.product-row');
        productRows.forEach(function(row) {
            var checkbox = row.querySelector('input[type="checkbox"]');
            if (checkbox.checked) { // 체크된 경우 데이터 처리
                var cartQuantity = row.querySelector('input[type="hidden"][name="cart_qnt"]').value;
                cart_del(cartQuantity);
            }
        });
	}
    // 카트에서 삭제 할때 처리 ajax
	function cart_del(cartQuantity) {
		$.ajax({
            type: "POST",
            url: "cart_delete",
            data: {"cartQuantity": cartQuantity},
            dataType: "text",
            success: function(response) {
                location.reload();
            	console.log("삭제 성공: ", response);
            },
            error: function(xhr, status, error) {
                alert("삭제중 오류발생");
            	console.error("삭제 실패: ", error);
            }
	});
	}
    // 페이지가 로드될 때 처리
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
        check_cart_submit_bt(); // 체크된 내용이 없으면 결제 버튼 비활성화
    };
</script>
</html>