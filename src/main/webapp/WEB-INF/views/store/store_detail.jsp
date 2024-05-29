<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sub_image {
    transition: transform 0.2s; /* 애이메이션 */
}
.sub_image:hover {
    transform: scale(1.1); /* 이미지를 약간 확대 */
}
#main_image{
	min-width:300px;
	max-height:500px;
}
#image_slider{
	overflow-x: scroll;
	scroll-behavior: smooth; /* 이동이 좀 부트럽게 */
	white-space: nowrap; /* 자식 요소들이 한 줄에 표시되도록 설정 */
	width: 500px;
}
#image_container {
    width: 50vw; /* 이동 너비, 필요에 따라 조절 */
}
.diteil_top{
	display: flex;
}
.item_css {
    /* 전체 너비 설정 */
    width: 50vw; /* 예시 너비, 필요에 따라 조정 */

    /* 가운데 정렬 */
    margin: 0 auto;

    /* 패딩 추가 */
    padding: 20px;
}
.item_css table {
	width: 400px;
	text-align: center; /* 가운데 정렬 */
	border-collapse: collapse; /* 셀의 테두리를 겹치게 함 */
}

.item_css th {
	color: #333333; /* 헤더 셀 텍스트 색상 */
	background-color: #f2f2f2; /* 헤더 셀의 배경색 */
	width:3vw;
	height: 3vw;
}
.item_css td {
	background-color: #ffffff; /* 일반 셀의 배경색 */
	color: #666666; /* 일반 셀 텍스트 색상 */
	width: 1vw;
	height: 4vw;
}
.item_css select {
	text-align: center;
	width: 6vw;
	height: 2vw;
    font-size: 16px;
}

.uplode_bnt {
	position: fixed;
	width: 85px;
	height: 50px;
	background-color: #2A2F4F;
	color: white;
	border: none;
	border-radius: 5px;
	bottom: 190px;
	left: 60px;
	font-size: 15px;
	font-family:'Pretendard-Regular';
}

.uplode_bnt:hover {
	background-color:#917FB3;
}

#cart_button,
.buy_button {
	text-align: center;
	width: 85px;
	height: 50px;
    background-color: #2A2F4F;
	color: white;
	border: none;
	border-radius: 5px;
	bottom: 190px;
	left: 60px;
	font-size: 15px;
	font-family:'Pretendard-Regular';
}
#cart_button:hover,
.buy_button:hover {
	background-color:#917FB3;
}
#content_table{
width: 50vw;
border: 1px solid;
}
#content_table td{
padding: 1vw;
}
.os_form{

}
.select_os_css{
	display: flex; /* 유연한 박스 모델 사용 */
    flex-direction: column; /* 우측 정렬 */
    align-items: flex-end; /* 우측 정렬 */
    padding: 1vw;
}
.review_css {
    font-family: Arial, sans-serif;
    max-width: 50vw;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
}

.review_css ul {
    list-style-type: none;
    padding: 0;
}

.review_css li {
    margin-bottom: 10px;
    line-height: 1.6;
}

.review_css li a {
    text-decoration: none;
    color: #007BFF;
    font-weight: bold;
}

.review_css li a:hover {
    text-decoration: underline;
}

.review_css li b {
    color: #333;
    font-weight: bold;
}

.review_css .review-rating {
    font-size: 1.2em;
    color: #555;
}

.review_css .review-content {
    font-size: 1em;
    color: #333;
}

.review_css .review-date {
    font-size: 0.9em;
    color: #999;
}

.review_css .review-actions a {
    margin-right: 10px;
    color: #d9534f;
}

.review_css .review-actions a:hover {
    color: #c9302c;
}

.review_css .review-header {
    font-size: 1.4em;
    margin-bottom: 10px;
}

.review_css .review-header b {
    color: #007BFF;
}
</style>
</head>
<body>
<div class="item_css">
<div class="diteil_top">
	<div id="image_container">
	    <img id="main_image" src="./resources/store/item_cover/${dto.pd_photo}">
	    <c:if test="${list.size()!=0}">
	        <div id="image_slider">
	                <c:forEach items="${list}" var="s" varStatus="status">
	                    <img class="sub_image" src="./resources/store/item_cover/${s.os_photo}" width="100" onmouseover="change_image(this.src)" onmouseout="reset_image()">
	                </c:forEach>
	        </div>
	    </c:if>
	</div>
	<form action="shoping_buy" method="post" name="shoping_buy_form" class="os_form">
		<table>
			<tr>
				<th>상품명</th>
				<td>${dto.pd_name}
				<input type="hidden" name="pd_number" id="pd_number" value="${dto.pd_number}">
				<input type="hidden" name="mb_number" id="mb_number" value="${dto.mb_number}">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="hidden" name="pd_price" id="pd_price" value="${dto.pd_price}"><b><fmt:formatNumber pattern="#,###" value="${dto.pd_price}"/></b>원</td>
			</tr>
			<tr>
				<th>재고</th>
				<td><input type="hidden" name="pd_stock" id="pd_stock" value="${dto.pd_stock}">${dto.pd_stock}</td>
			</tr>
			<tr>
				<th>배송 예상일</th>
				<td>${today}</td>
			</tr>
			<c:choose>
			    <c:when test="${not empty os1name and os1name[0] ne null}">
			        <tr>
			            <th>옵션1</th>
			            <td>
			                <select name="os_1" id="os_1" onchange="os_check()">
			                    <c:forEach items="${os1name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<c:choose>
			    <c:when test="${not empty os2name and os2name[0] ne null}">
			        <tr>
			            <th>옵션2</th>
			            <td>
			                <select name="os_2" id="os_2" onchange="os_check()">
			                    <c:forEach items="${os2name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<c:choose>
			    <c:when test="${not empty os3name and os3name[0] ne null}">
			        <tr>
			            <th>옵션3</th>
			            <td>
			                <select name="os_3" id="os_3" onchange="os_check()">
			                    <c:forEach items="${os3name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<tr>
				<th>구매수량</th>
				<td>
				<c:choose>
					<c:when test="${dto.pd_stock < 1}">
						품절
					</c:when>
					<c:otherwise>
						<select name="buy_quantity" id="buy_quantity">
							<c:forEach begin="1" end="${dto.pd_stock}" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input class="buy_button" type="button" value="구매" onclick="login_check()" <c:if test="${dto.pd_stock < 1}">disabled</c:if>></td>
			</tr>
		</table>
	</form>
</div>
	<form action="shopping_cart_save" name="cart_form" id="cart_form" class="select_os_css">
		<div>선택된 옵션</div>
			<div id="os_items">
				<ul id="os_lists"></ul>
			</div>
			<input type="hidden" name="buy_quantity" value="0">
			<input type="hidden" name="pd_number" id="pd_number" value="${dto.pd_number}">
			<input type="button" id="cart_button" value="장바구니" onclick="cart()" <c:if test="${dto.pd_stock < 1}">disabled</c:if>>
	</form>
	<form action="">
		<table id="content_table">
			<tr>
				<td><div>${dto.pd_content}</div></td>
			</tr>
		</table>
	</form>
	<div class="review_css">
		<ul>
			<li>리뷰평점 <c:if test="${not empty staravg}"><b>${staravg}</b>/5 리뷰 개수 <b>${re_list.size()}</b></c:if></li>
				<c:if test="${review=='OK'}">
					<li>
						<a href="review_input?pd_number=${dto.pd_number}" onclick="popup(event)">리뷰 등록</a>
					</li>
				</c:if>
				<c:forEach items="${re_list}" var="re">
					<li>${re.re_day}  ${re.re_star}</li>
					<li>${re.re_content}</li>
					<c:if test="${re.mb_number==member.mb_number}">
						<li>
							<a href="review_modify?pd_number=${dto.pd_number}&re_number=${re.review_number}" onclick="popup(event)">리뷰 수정</a><br>
							<a href="review_delete?pd_number=${dto.pd_number}&re_number=${re.review_number}">리뷰 삭제</a>
						</li>
					</c:if>
				</c:forEach>
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
function login_check() {
	var login = "${loginState}";
	if(login == "true"){
		var f = document.shoping_buy_form;
		f.submit();
	}else{
		alert("로그인이 필요합니다.");
		window.location.href="login";
	}
}
let os_check_count = 1;
function os_check() {
	var os_items = document.getElementById("os_lists");
    var cart_button = document.getElementById("cart_button");

	var os_1 = document.getElementById('os_1')? document.getElementById('os_1').value : '';
	var os_2 = document.getElementById('os_2')? document.getElementById('os_2').value : '';
	var os_3 = document.getElementById('os_3')? document.getElementById('os_3').value : '';
	const os_stock = document.getElementById('pd_stock').value;
	
	if(os_items.querySelectorAll('li').length>=10){
		alert("옵션은 10개까지 선택할 수 있습니다.");
		return false;
	}
	
	const pd_number = document.getElementById('pd_number').value;
	
	const os_li = document.createElement('li');
	os_li.setAttribute("name","os_choice");
	os_li.setAttribute("value",os_1+os_2+os_3);
	os_li.innerHTML = 	'상품명: '+os_1+' '+os_2+' '+os_3+' '+
						'<input type="button" onclick="os_choice_delete('+os_check_count+')" value="X">'+
						'<input type="hidden" name="os_number" id="os_number'+os_check_count+'" ></li></ul>';
	os_items.appendChild(os_li);
	
    // div#os_items 안에 내용이 있는지 확인합니다.
    if (os_items.querySelectorAll("li").length === 0) {
        // 내용이 없으면 버튼을 비활성화합니다.
        cart_button.disabled = true;
    } else {
        // 내용이 있으면 버튼을 활성화합니다.
        cart_button.disabled = false;
    }
	
	const os_names = os_1+","+os_2+","+os_3;
	os_number_select(os_names,pd_number);
	os_check_count++; //삭제하기 위한 함수 증가
	
}
function os_number_select(os_names,pd_number,) {
	$.ajax({
		type:"get",
		async:false,
		url:"os_number_get",
		dataType:"text",
		data:{"os_names":os_names , "pd_number":pd_number},
		success:function(check) {
			if (check != null) {
				document.getElementById("os_number" + os_check_count).value = check; // 여기에서 값을 설정합니다.
			}else {
				alert("옵션 추가 실패");
			}
		},error:function(){
			alert("옵션 추가 실패");
		}
	});
}
function os_choice_delete(os_check_count) {
    var os_choice_li = document.getElementById("os_number"+os_check_count).parentNode;
    if (os_choice_li) {
        os_choice_li.parentNode.removeChild(os_choice_li);
    }
    
	var os_items = document.getElementById("os_lists");
    var cart_button = document.getElementById("cart_button");
    // div#os_items 안에 내용이 있는지 확인합니다.
    if (os_items.querySelectorAll("li").length === 0) {
        // 내용이 없으면 버튼을 비활성화합니다.
        cart_button.disabled = true;
    } else {
        // 내용이 있으면 버튼을 활성화합니다.
        cart_button.disabled = false;
    }
}
function cart() {
	var login = "${loginState}";
	if(login == "true"){
		const os_1 = document.getElementById("os_1");
		const items = document.getElementById("os_lists");
		const os_items = items.getElementsByTagName("li");
		const buy_quantity = document.getElementById('buy_quantity').value;
	    // 옵션이 있는 상품인지 체크
		if(os_1 && os_items.length===0){
			alert("옵션을 선택하세요");
			return;
		}
	    if(os_1){
		var f = document.cart_form;
		var formData = new FormData(f);
			$.ajax({
				type:"post",
				async:false,
				url:"shopping_cart_save",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){
					if(confirm("장바구니에 상품이 저장되었습니다.\n 취소를 누르면 장바구니로 이동")){
					}else{
						window.location.href="shopping_cart_view";
					}
				},error:function(){
					alert("오류발생");
				}
			});
			}else{
				const pd_number = document.getElementById('pd_number').value;
				$.ajax({
					type:"post",
					async:false,
					url:"shopping_cart_save",
					dataType:"text",
					data:{"pd_number":pd_number,"buy_quantity":buy_quantity},
					success:function(){
						if(confirm("장바구니에 상품이 저장되었습니다.\n아니요를 눌러 장바구니로 이동")){
						}else{
							window.location.href="shopping_cart_view";
						}
					},error:function(){
						alert("오류발생");
					}
				});
	  		 }
	}else{
		alert("로그인이 필요합니다.");
		window.location.href="login";
	}
}
</script>
<script type="text/javascript">
let original_image = "./resources/store/item_cover/${dto.pd_photo}";
function change_image(src) {
    document.getElementById('main_image').src = src;
}
function reset_image() {
    // 원래 큰 이미지의 소스로 변경. 원래의 큰 이미지 소스를 변수에 저장하거나 다른 방법을 사용해 관리해야 합니다.
    document.getElementById('main_image').src = original_image;
}
</script>
</html>