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
				<c:if test="${member != null}">
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
				</c:if>
				<aside class="category_list">
					<div class="category_title">
						<c:choose>
							<c:when test="${mb_number == '1' || mb_number == null}">
								<span>CreatorLink</span>
							</c:when>
							<c:otherwise>
								<span>${mb_nick_name}</span>
							</c:otherwise>
						</c:choose>
						<span id="list_add" style="font-size: 15px; display: none; cursor: pointer;">➕</span>
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
				<div class="history">
					<span style="font-weight: bold; padding-left: 10px; margin-right: 10px;">History</span>
					<c:forEach items="${history_list}" var="hl" varStatus="state">
						<c:if test="${mb_number != hl.mb_number }">
							<c:if test="${state.index <= 10}">
								<div style="margin-left: 10px; margin-right: 10px;">
									<a href="board_main?mb_number=${hl.mb_number}">${hl.mb_nick_name}</a>
									<a id="history_del_${state.index}" data-mb_number="${hl.mb_number}" style="cursor: pointer;">x</a>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				
				<form id="form_input" action="board_modify_do" method="post">
				<input type="hidden" name="bct_content_number" value="${post.bct_content_number}">
				<input type="hidden" name="mb_number" value="${mb_number}">
					<div class="post_write">
						<div style="display: flex; align-items: center; justify-content: space-between;">
							<div style="width: 19%; display: flex; align-items: center;">
								<select name="attribute" style="width: 100%; height: 21px;">
									<option value="1" <c:if test="${post.bat_number == '1'}">selected</c:if>>자유게시판</option>
									<option value="2" <c:if test="${post.bat_number == '2'}">selected</c:if>>문의게시판</option>
									<option value="3" <c:if test="${post.bat_number == '3'}">selected</c:if>>공지게시판</option>
									<c:forEach items="${attribute_list}" var="atli">
										<c:if test="${atli.bat_number > 3}">
											<option value="${atli.bat_number}" <c:if test="${atli.bat_number == post.bat_number}">selected</c:if>>${atli.bat_cls}</option>
										</c:if>
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