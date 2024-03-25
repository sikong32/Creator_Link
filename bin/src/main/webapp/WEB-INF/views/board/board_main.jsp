<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	테이블로 받아서 Foreach로 뿌릴 게시판 카테고리<br>
	ex)<a href="board_main">전체글</a><br>
	<a href="board_main">&emsp;자유게시판</a><br>
	<a href="board_main">&emsp;Q&A</a><br>
	<a href="board_main">&emsp;공지</a><br>
	<a href="store_main">스토어</a><br>
	<a href="#">관리자용 게시판설정</a><br><br>
	
	방문한 크리에이터 게시판 기록 (누르면 이동)<br>
	테이블 제작시 게시판이 될 예정<br>
	공지<br>
	카테고리 모두 포함 최신글<br>
	<button type="button" onclick="">인기글</button>
	<select id="search">
	<option value="title">제목</option>
	<option value="detail">내용</option>
	<option value="title_or_detail">제목+내용</option>
	<option value="writer">작성자</option>
	</select>
	<input type="text" id="value">
	<button type="button" id="search_do" onclick="">검색</button>
	<button type="button" onclick="">글쓰기</button>
</body>
</html>