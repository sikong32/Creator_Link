<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 관리 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        hr {
            border: 0;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
        form {
            margin-bottom: 20px;
        }
        .product-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .product-photo {
            flex: 0 0 auto;
            margin-right: 20px;
            border-radius: 8px;
            overflow: hidden;
        }
        .product-photo img {
            max-width: 100px;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s;
        }
        .product-photo img:hover {
            transform: scale(1.1);
        }
        .product-content {
            display: none;
            margin-top: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }
        .product-content p {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <ul>
            <c:forEach items="${ma_list}" var="ma">
                <li>
                    <hr>
                    <form action="store_product_modify" method="POST">
                        <div class="product-info">
                            <div>
                                <ul>
                                    <li>상품 번호: ${ma.pd_number}<input type="hidden" name="pd_number" value="${ma.pd_number}"></li>
                                    <li>상품 이름: ${ma.pd_name}</li>
                                    <li>상품 가격: ${ma.pd_price}</li>
                                    <li>상품 카테고리: ${ma.pd_category}</li>
                                </ul>
                                <button type="button" onclick="toggleContent('${ma.pd_number}')">상세 정보 보기</button>
                            </div>
                            <div class="product-photo">
                                <img src="./resources/store/item_cover/${ma.pd_photo}" alt="상품 사진">
                            </div>
                        </div>
                        <div class="product-content" id="productContent_${ma.pd_number}">
                            <p>${ma.pd_content}</p>
                        </div>
                        <ul>
                            <li>상품 사이즈: ${ma.pd_size}</li>
                            <li>상품 재고: ${ma.pd_stock}</li>
                            <li>판매 수량: ${ma.pd_buy_su}</li>
                        </ul>
                        <button type="submit">제품 수정</button>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>
    <script>
        function toggleContent(productNumber) {
            var contentDiv = document.getElementById("productContent_" + productNumber);
            contentDiv.style.display = contentDiv.style.display === "block" ? "none" : "block";
        }
    </script>
</body>
</html>
