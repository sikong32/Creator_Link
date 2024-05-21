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
	<div class="background">
		<div class="container">
			<div class="sidebar">
				<div class="info_block">
					<div class="info_my">
						<div class="info_title">
							<div class="info_photo">
								<img src="./resources/member/
								<c:if test="${member.mb_photo == 'basic_photo.png'}">basic_photo</c:if>
								<c:if test="${member.mb_photo != 'basic_photo.png'}">profile</c:if>
								/${member.mb_photo}" width="180px" style="max-height: 180px;">
							</div>
						</div>
						<div class="info_data">
							<div class="info_name">
							${member.mb_nick_name}
							</div>
							<div class="info_record">
								<span onclick="location.href='board_main?mode=record_post'" style="cursor: pointer;">내가 쓴 글</span>
								<span>${write_post}</span>
							</div>
							<div class="info_record">
								<span onclick="location.href='board_main?mode=record_comment'" style="cursor: pointer;">내가 쓴 댓글</span>
								<span>${write_comment}</span>
							</div>
						</div>
					</div>
				</div>
				<aside class="category_list">
					<div class="category_title">
						<span>CreatorLink</span>
					</div>
					<div onclick="location.href='board_main'" class="category">전체글</div>
					
					<div class="category" onclick="location.href='board_main?mb_number=${mb_number}&bat_number=1'">
						<span>자유게시판</span>
					</div>
					<div class="category" onclick="location.href='board_main?mb_number=${mb_number}&bat_number=2'">
						<span>문의게시판</span>
					</div>
					<div class="category" onclick="location.href='board_main?mb_number=${mb_number}&bat_number=3'">
						<span>공지게시판</span>
					</div>
					
					<c:forEach items="${attribute_list}" var="atli">
						<c:if test="${atli.bat_number > 3}">
							<div class="category" onclick="location.href='board_main?bat_number=${atli.bat_number}'">${atli.bat_cls}</div>
						</c:if>
					</c:forEach>
				</aside>
				<div class="store" onclick="location.href='store_main'">STORE</div>
			</div>
			<div class="board">
				<form id="form_input" action="board_modify_do" method="post">
				<input type="hidden" name="bct_content_number" value="${post.bct_content_number}">
				<input type="hidden" name="mb_number" value="${mb_number}">
					<div class="post_write">
						<div style="display: flex; align-items: center; justify-content: space-between;">
							<div style="width: 19%; display: flex; align-items: center;">
								<select name="attribute" style="width: 100%; height: 21px;">
									<c:forEach items="${attribute_list}" var="atli">
										<option value="${atli.bat_number}" <c:if test="${atli.bat_number == post.bat_number}">selected</c:if>>${atli.bat_cls}</option>
									</c:forEach>
								</select>
							</div>
							<div style="width: 80%; display: flex; align-items: center;"><input type="text" name="title" value="${post.bct_title}" placeholder="제목" style="width: 100%;"></div>
						</div>
						<div class="inputbox"><textarea name="content" id="editor">${post.bct_content}</textarea></div>
						<div style="float: right;">
							<input type="submit" value="수정">
							<input type="button" onclick="censel()" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<script type="text/javascript" src="resources/js/editor_check.js"></script>
	<script type="text/javascript" src="resources/js/input_editor.js"></script>
	<script type="text/javascript">
		function censel() {
			history.go(-1);
		}
	</script>	
</body>
</html>