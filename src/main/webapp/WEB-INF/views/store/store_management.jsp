<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리 페이지</title>
<style>
.product-content { 
     display: none;
     margin-top: 10px;
     padding: 10px;
   	 background-color: #f9f9f9;
     border-radius: 8px;
}
.list_items {
    display: flex;
    background-color: white;
    border-radius: 1vw; /*테두리 부드럽게*/
    box-shadow: 0 4px 16px rgba(0, 0, 0, .05); /*그림자 설정*/
    width: 50vw; /* 넓이를 50%로 고정*/
    height: 10vw; /* 높이를 10%로 고정*/
    color: #555555;
    font-size: 1vw; /* 폰트 크기를 뷰포트 너비의 1%로 설정 */
    overflow: hidden; /* 내용이 div를 넘어가면 숨김 */
    font-family:'Pretendard-Regular';
}
.list_items_test {
    display: flex;
	margin-left: auto;
	flex-direction: column;
	align-items: stretch;
	justify-content: space-evenly;
}
.list_items img {
    border-radius: 1vw;
    height: 100%;
    object-fit: cover;
}
.list_items button[type="submit"],
.list_items button[type="button"] {
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
.list_items button[type="submit"]:hover,
.list_items button[type="button"]:hover {
	background-color:#917FB3;
}
   </style>
</head>
<body>
    <div style="background-color: #f4f6f8;">
        <ul>
            <c:forEach items="${ma_list}" var="ma">
                <div style="display: flex; margin-left: 25%">
                    <form action="store_product_modify" method="POST">
                        <div class="list_items">
                           	<img src="./resources/store/item_cover/${ma.pd_photo}" alt="상품 사진">
                            상품 카테고리: ${ma.pd_category}<br>
                            상품 번호: ${ma.pd_number}<input type="hidden" id="pd_number" name="pd_number" value="${ma.pd_number}"><br>
                            상품 이름: ${ma.pd_name}<br>
                            상품 가격: <fmt:formatNumber pattern="#,###" value="${ma.pd_price}"/><br>
                            상품 재고: ${ma.pd_stock}<br>
                            판매 수량: ${ma.pd_buy_su}<br>
                           	<div class="list_items_test">
                          	<button type="button" onclick="toggleContent('${ma.pd_number}')">상세 정보 보기</button>
	                        <button type="submit">제품 수정</button>
							<button type="button" onclick="pd_delete(${ma.pd_number})">제품삭제</button>
                           	</div>
                        </div>
                        <div class="product-content" id="productContent_${ma.pd_number}">
                            <p>${ma.pd_content}</p>
                        </div>
                    </form>
                </div><br>
            </c:forEach>
        </ul>
    </div>
    <script>
        function toggleContent(productNumber) {
            var contentDiv = document.getElementById("productContent_" + productNumber);
            contentDiv.style.display = contentDiv.style.display === "block" ? "none" : "block";
        }
        function pd_delete(pd_number) {
        	if(confirm("정말로 삭제하시겠습니까?")){
        		window.location.href="store_Delete?pd_number="+pd_number;
        	}
		}
    </script>
</body>
</html>
