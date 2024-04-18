<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
#mainImage {
    opacity: 1; /* 기본적으로 완전히 불투명 */
    transition: opacity 0.5s ease-in-out; /* 페이드 효과에 대한 전환 효과 설정 */
}
#image_container {
    display: flex;
    overflow-x: scroll;
    width: 250px; /* 이동 너비, 필요에 따라 조절 */
    scroll-behavior: smooth; /* 이동이 좀 부트럽게 */
}

</style>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<th><img id="main_image" src="./resources/store/item_cover/${dto.pd_photo}"	width="500"></th>
				<td>
					<div id="image_slider">
				        <button type="button" id="prev">◀</button>
				        <div id="image_container">
				            <c:forEach items="${list}" var="s" varStatus="status">
				                <!-- 클래스 사용, ID 제거 -->
				                <img class="sub_image" src="./resources/store/item_cover/${s.os_photo}" width="100" onmouseover="change_image(this.src)" onmouseout="reset_image()">
				            </c:forEach>
				        </div>
				        <button type="button" id="next">▶</button>
				    </div>
				</td>
			</tr>
		</table>
	</form>
	<form action="shoping_buy" method="post" name="shoping_buy_form">
		<table border="1">
			<tr>
				<th>상품명</th>
				<td>${dto.pd_name}
				<input type="hidden" name="pd_number" id="pd_number" value="${dto.pd_number}">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="hidden" name="pd_price" id="pd_price" value="${dto.pd_price}">${dto.pd_price}원</td>
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
				<td><input type="button" value="구매" onclick="login_check()"
					<c:if test="${dto.pd_stock < 1}">disabled</c:if>></td>
			</tr>
		</table>
	</form>
	<form action="shopping_cart_save" name="cart_form" id="cart_form">
		<div>선택된 옵션</div>
			<div id="os_items">
				<ul id="os_lists"></ul>
			</div>
			<input type="hidden" name="buy_quantity" value="0">
			<input type="hidden" name="pd_number" id="pd_number" value="${dto.pd_number}">
			<input type="button" id="cart_button" value="장바구니" onclick="cart()" <c:if test="${dto.pd_stock < 1}">disabled</c:if>>
	</form>
	<form action="">
		<table border="1">
			<tr>
				<td><div>${dto.pd_content}</div></td>
			</tr>
			<tr>
				<td>리뷰평점 <b>${staravg}</b>/5</td>
				<c:choose>
					<c:when test="${review=='OK'}">
					<td><a href="review_input?pd_number=${dto.pd_number}" onclick="popup(event)">리뷰 등록</a></td>
				</c:when>
				</c:choose>
					<c:forEach items="${re_list}" var="re">
						<tr>
						<td>${re.re_content}</td>
						<td>${re.re_star}</td>
						<td>${re.re_day}</td>
						</tr>
					</c:forEach>
			</tr>
		</table>
	</form>
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
document.getElementById('next').addEventListener('click', function() {
    // 오른쪽으로 슬라이드
    document.getElementById('image_container').scrollLeft += 100; // 100px을 오른쪽으로 슬라이드
});

document.getElementById('prev').addEventListener('click', function() {
    // 왼쪽으로 슬라이드
    document.getElementById('image_container').scrollLeft -= 100; // 100px을 왼쪽으로 슬라이드
});
</script>
</html>