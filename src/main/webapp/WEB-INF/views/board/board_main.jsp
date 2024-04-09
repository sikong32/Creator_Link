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
	
	<div class="container">
		<div class="sidebar">
			<aside class="category_list">
				<a href="board_main" style="color: black;"><div class="category">전체글</div></a>
				<c:forEach items="${attribute_list}" var="atli">
				<a href="board_main?bat_number=${atli.bat_number}" style="color: black;"><div class="category">${atli.bat_cls}</div></a>
				</c:forEach>
			</aside>
			<a href="store_main" style="color: black; display: block;">
				<div class="store">
					STORE
				</div>
			</a>
			<div class="setting">
				<a href="#" style="color: black;">게시판설정</a>
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
					<c:forEach items="${board_list}" var="boli">
					<tr>
						<td style="width: 70%;">
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