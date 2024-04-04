<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.container{
			width: 100%;
			display: flex;
			justify-content: center;
			background-color: rgb(0,0,255,0.1);
		}
		.category{
			width: 200px;
			background-color: white;
			margin: 10px;
			border-radius: 20px;
		}
		.board{
			width: 1200px;
			background-color: white;
			border-radius: 20px;
			margin: 10px;
		}
		.history{
			text-align: center;
		}
		.post{
			
		}
		.functions{
			text-align: center;
		}
		table{
			width: 90%;
			margin: auto;
		}
	</style>
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
	
	<div class="container">
		<aside class="category">
			<a href="board_main" style="color: black;">전체글</a><br>
			<c:forEach items="${attribute_list}" var="atli">
			<a href="board_main?bat_number=${atli.bat_number}" style="color: black;">${atli.bat_cls}</a><br>
			</c:forEach>
			<a href="store_main" style="color: black;">스토어</a><br>
			<a href="#" style="color: black;">관리자용 게시판설정</a><br><br>
		</aside>
		
		<div class="board">
			<div class="history">
				방문한 크리에이터 게시판 기록 (누르면 이동)<br>
			</div>
			<div class="post">
				<table border="1">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					<c:forEach items="${board_list}" var="boli">
					<tr>
						<td>${boli.bct_content_number}</td>
						<td><a href="board_view?bct_content_number=${boli.bct_content_number}" style="color: blue;">${boli.bct_title}</a></td>
						<td>${boli.bct_writer}</td>
						<td>${boli.bct_write_date.substring(0, 10)}</td>
						<td>${boli.bct_view_cnt}</td>
						<td>${boli.bct_like_cnt}</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="center">
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
					</tr>
				</table>
			</div>
			<div class="functions">
				<select name="view_per_page" id="view_per_page" onchange="change_vpp(this)">
					<option value="3" <c:if test="${page.view_per_page == 3}">selected</c:if>>3개</option>
					<option value="5" <c:if test="${page.view_per_page == 5}">selected</c:if>>5개</option>
					<option value="10" <c:if test="${page.view_per_page == 10}">selected</c:if>>10개</option>
				</select>
				<button type="button" name="hitpost" id="hitpost" onclick="">인기글</button>
				<select name="search" id="search">
					<option value="bct_title">제목</option>
					<option value="bct_content">내용</option>
					<option value="tween">제목+내용</option>
					<option value="bct_writer">작성자</option>
				</select>
				<input type="text" name="value" id="value">
				<button type="button" onclick="search_do()">검색</button>
				<button type="button" onclick="board_write()">글쓰기</button>
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
	</script>
</html>