<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="board_main" style="color: black;">전체글</a><br>
	<c:forEach items="${attribute_list}" var="atli">
	<a href="board_main?bat_number=${atli.bat_number}" style="color: black;">${atli.bat_cls}</a><br>
	</c:forEach>
	<a href="store_main" style="color: black;">스토어</a><br>
	<a href="#" style="color: black;">관리자용 게시판설정</a><br><br>
	
	방문한 크리에이터 게시판 기록 (누르면 이동)<br>
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
	</table>
	
	<button type="button" onclick="">인기글</button>
	<select id="search">
	<option value="title">제목</option>
	<option value="detail">내용</option>
	<option value="title_or_detail">제목+내용</option>
	<option value="writer">작성자</option>
	</select>
	<input type="text" id="value">
	<button type="button" id="search_do" onclick="">검색</button>
	<button type="button" onclick="location.href='board_write'">글쓰기</button>
</body>
</html>