<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/board/board.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="pageParams" value="&now_page=${page.now_page}&view_per_page=${page.view_per_page}" />
	<c:set var="batParams" value=""/>
	<c:if test="${not empty bat_number}">
		<c:set var="batParams" value="&bat_number=${bat_number}"/>
	</c:if>
	<c:set var="sortParams" value=""/>
	<c:if test="${not empty sort}">
		<c:set var="sortParams" value="&sort=${sort}&sort_ad=${sort_ad}"/>
	</c:if>
	<c:set var="searchParams" value=""/>
	<c:if test="${not empty search}">
		<c:set var="searchParams" value="&search=${search}&value=${value}"/>
	</c:if>
	
	<div class="background">
		<div class="container">
			<div class="sidebar">
				<aside class="category_list">
					<div class="category_title">
						<span>CreatorLink</span>
						<span id="list_add" onclick="list_add()" style="font-size: 15px; display: none; cursor: pointer;">➕</span>
					</div>
					<div onclick="location.href='board_main'" class="category" style="cursor: pointer;">전체글</div>
					<c:forEach items="${attribute_list}" var="atli" varStatus="state">
						<div class="category" onclick="location.href='board_main?bat_number=${atli.bat_number}'">
							<span>${atli.bat_cls}</span>
							<span id="list_del_${state.index}" onclick="list_del(event)" style="font-size: 15px; display: none; cursor: pointer;">➖</span>
						</div>
					</c:forEach>
				</aside>
				<div class="store" onclick="location.href='store_main'">
					STORE
				</div>
				<div class="setting">
					<a id="modi_button" onclick="page_modify()" style="display: block; cursor: pointer;">⚙게시판설정</a>
					<span id="setting_button" style="display: none;">
						<a id="submit_button" onclick="submit_do()" style="cursor: pointer;">✔수정</a>&emsp;
						<a id="reset_button" onclick="reset_do()" style="cursor: pointer;">❌취소</a>
					</span>
				</div>
			</div>
			
			<div class="board">
				<div class="history">
					방문한 크리에이터 게시판 기록 (누르면 이동)
					<span style="float: right;">
							<select name="view_per_page" id="view_per_page" onchange="change_vpp(this)">
								<option value="10" <c:if test="${page.view_per_page == 10}">selected</c:if>>10개</option>
								<option value="20" <c:if test="${page.view_per_page == 20}">selected</c:if>>20개</option>
								<option value="30" <c:if test="${page.view_per_page == 30}">selected</c:if>>30개</option>
							</select>
					</span>
				</div>
				<div class="post">
					<table class="post_table">
						<c:forEach items="${board_list}" var="boli" varStatus="state">
						<tr>
							<td style="width: 70%;">
								<div style="display: flex; align-items: center;">
									<span><input type="checkbox" id="post_del_${state.index}" style="display: none;"></input></span>
									<c:if test="${empty bat_number}">
										<c:forEach items="${attribute_list}" var="atli">
											<c:if test="${boli.bat_number == atli.bat_number}">
												<span style="color:gray;">[${atli.bat_cls}]</span>
											</c:if>
										</c:forEach>
									</c:if>
									<a href="board_view?bct_content_number=${boli.bct_content_number}">
										${boli.bct_title}
										<c:forEach items="${comment_number}" var="cn">
											<c:if test="${boli.bct_content_number == cn.bct_content_number}">
												<span style="color:gray;">(${cn.comment_number})</span>
											</c:if>
										</c:forEach>
									</a>
								</div>
							</td>
							<td style="width: 10%; text-align: center;">${boli.bct_writer}</td>
							<td style="width: 10%; text-align: center;">
								<c:choose>
									<c:when test="${boli.bct_write_date.substring(0, 10) == now_date}">
										${boli.bct_write_date.substring(11,16)}
									</c:when>
									<c:otherwise>
										${boli.bct_write_date.substring(0, 10)}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width: 10%; text-align: center;">${boli.bct_view_cnt}</td>
						</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<c:if test="${page.start_page != page.end_page}">
							<c:if test="${page.start_page != 1}">
								<a href="board_main?now_page=${page.start_page-1}&view_per_page=${page.view_per_page}${searchParams}${sortParams}${batParams}">◀</a>
							</c:if>
							
							<c:forEach begin="${page.start_page}" end="${page.end_page}" var="p">
								<c:if test="${p == page.now_page}">
									<span style="color: red;">${p}</span>
								</c:if>
								<c:if test="${p != page.now_page}">
									<a href="board_main?now_page=${p}&view_per_page=${page.view_per_page}${searchParams}${sortParams}${batParams}">${p}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${page.end_page != page.last_page}">
								<a href="board_main?now_page=${page.end_page+1}&view_per_page=${page.view_per_page}${searchParams}${sortParams}${batParams}">▶</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="functions">
					<span style="float: left;"><button type="button" name="hitpost" id="hitpost" onclick="">인기글</button></span>
					<select name="search" id="search">
						<option value="bct_title">제목</option>
						<option value="bct_content">내용</option>
						<option value="tween">제목+내용</option>
						<option value="bct_writer">작성자</option>
					</select>
					<input type="text" name="value" id="value">
					<button type="button" onclick="search_do()">검색</button>
					<span style="float: right;"><button type="button" onclick="board_write()">글쓰기</button></span>
				</div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		var state = "${loginState}";
		function change_vpp(selval) {
			var view_per_page = selval.value;
			window.location = "board_main?view_per_page="+view_per_page+"${batParams}${searchParams}";
		}
		function search_do() {
			var search = document.getElementById('search').value;
		    var value = document.getElementById('value').value;
		    if (value != ""){
				window.location.href="board_main?search="+search+"&value="+value+"&view_per_page=${page.view_per_page}${batParams}";
		    }
		}
		function board_write() {
			if (state == "true"){
				window.location.href="board_write";
			}
			else{
				alert("로그인후 작성해주십시오");
			}
		}
		function toggle_list_del(show) {
			for (var i = 0; i < ${attribute_list.size()}; i++) {
				var list_del_num = document.getElementById('list_del_' + i);
				if (list_del_num) {
					list_del_num.style.display = show ? 'block' : 'none';
				}
			}
		}
		function toggle_post_del(show) {
			for (var i = 0; i < ${board_list.size()}; i++){
				var post_del_num = document.getElementById('post_del_' + i);
				if (post_del_num) {
					post_del_num.style.display = show ? 'block' : 'none';
				}
			}
		}
		function page_modify() {
			var modibt = document.getElementById('modi_button');
			var settingbt = document.getElementById('setting_button');
			var addbt = document.getElementById('list_add');
			modibt.style.display = "none";
			settingbt.style.display = "block";
			addbt.style.display = "block";
			toggle_list_del(true);
			toggle_post_del(true);
		}
		function submit_do() {
			var modibt = document.getElementById('modi_button');
			var settingbt = document.getElementById('setting_button');
			var addbt = document.getElementById('list_add');
			modibt.style.display = "block";
			settingbt.style.display = "none";
			addbt.style.display = "none";
			toggle_list_del(false);
			toggle_post_del(false);
		}
		function reset_do() {
			var modibt = document.getElementById('modi_button');
			var settingbt = document.getElementById('setting_button');
			var addbt = document.getElementById('list_add');
			modibt.style.display = "block";
			settingbt.style.display = "none";
			addbt.style.display = "none";
			toggle_list_del(false);
			toggle_post_del(false);
		}
		function list_add() {
		    var categoryList = document.querySelector('.category_list');
		    var newBatNumber = Math.floor(Math.random() * 100);
		    var newCategory = document.createElement('div');
		    newCategory.className = 'category';
		    newCategory.innerHTML = `
		        <span><input type="text" name="category_name_${newBatNumber}"></span>
		        <span id="list_del_${newBatNumber}" onclick="list_del(event)" style="font-size: 15px; display: none; cursor: pointer;">➖</span>
		    `;
		    categoryList.appendChild(newCategory);
		}
		function list_del(event) {
			event.stopPropagation();
			alert("삭제");
		}
	</script>
</html>