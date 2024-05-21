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
					<div onclick="location.href='board_main?mb_number=${mb_number}'" class="category">전체글</div>
					
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
							<div class="category" onclick="location.href='board_main?mb_number=${mb_number}&board_main?bat_number=${atli.bat_number}'">${atli.bat_cls}</div>
						</c:if>
					</c:forEach>
				</aside>
				<div class="store" onclick="location.href='store_main'">STORE</div>
			</div>
			
			<div class="board">
				<div class="post" style="margin-top: 20px;">
					<table class="post_view">
						<tr>
							<td>
								<div style="display: flex; align-items: center; justify-content: space-between;">
									<div style="font-weight: bold; padding-left: 10px;">${post.bct_title}</div>
									<c:if test="${mb_number == member.mb_number}">
										<div style="padding-right: 10px; display: flex; align-items: center;">
											<c:if test="${post.noties == 'false'}">
												<span id="noties_bt" class="noties_passive"></span>
											</c:if>
											<c:if test="${post.noties == 'true'}">
												<span id="noties_bt" class="noties_active"></span>
											</c:if>
											공지설정
										</div>
									</c:if>
								</div>
								<div style="display: flex; align-items: center; justify-content: space-between;">
									<span style="padding-left: 10px;">
										${post.bct_writer} │
										${post.bct_write_date}
									</span> 
									<span style="padding-right: 10px;">
										조회수 ${post.bct_view_cnt}
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td><div class="div_pd10">${post.bct_content}</div></td>
						</tr>
						<tr>
							<td>
								<div class="div_pd10" style="display: flex;">
									<div class="like_box">
										<a id="like_none" class="like_button" style="display: inline;"><i class="fa-regular fa-heart"></i></a>
										<a id="like_active" class="like_button" style="display: none;"><i class="fa-solid fa-heart"></i></a>
										<span style="font-weight: bold;">${post.bct_like_cnt}</span>
									</div>
									<div class="comment_box">
										<i class="fa-regular fa-comment-dots"></i>
										<span style="font-weight: bold;">${comment.size()}</span>
									</div>
								</div>
							</td>
						</tr>
							<c:if test="${comment.size() != 0}">
								<c:forEach items="${comment}" var="c" varStatus="status">
									<c:if test="${c.cm_inheritance == 0}">
										<tr>
											<td>
												<div class="div_pd10">
													<div id="comment_area_${status.index}">
														${c.mb_nick_name} &emsp;&emsp;
														<a id="comment_${status.index}" style="color: black; text-decoration-line: none; cursor: pointer;">
															${c.cm_content}
														</a>
														<span style="float: right;">
															<a id="comment_del_${status.index}" data-mb_id="${c.mb_id}" data-cm_number="${c.cm_number}" style="cursor: pointer; font-size: small; display: none;">삭제</a>&emsp;
															${c.cm_write_date}
														</span>
													</div>
											    	<div id="re_comment_div_${status.index}" style="display: none; width: 95%; background-color: rgb(0,0,0,0.1); border: 1px solid white; float: right; text-align: center;">
											            <textarea id="re_content_${status.index}" name="re_content_${status.index}" style="width: 99%; height: 50px;" placeholder="댓글을 입력해주십시오"></textarea>
											            <span style="float: right;"><button id="re_submitButton_${status.index}" type="button" data-cm_number="${c.cm_number}">작성</button></span>
											        </div>
											        <c:forEach items="${comment}" var="rc">
											        	<c:if test="${rc.cm_inheritance == c.cm_number}">
													    	<div id="comment_area_${status.index}" style="width: 95%; background-color: rgb(0,0,0,0.1); border: 1px solid white; text-align: left; float: right;">
													    		${rc.mb_nick_name} &emsp;&emsp; ${rc.cm_content} 
													    		<span style="float: right;">
													    			<a id="comment_del_${status.index}" data-mb_id="${rc.mb_id}" data-cm_number="${rc.cm_number}" style="cursor: pointer; font-size: small; display: none;">삭제</a>&emsp;
													    			${rc.cm_write_date}
													    		</span>
													    	</div>
												    	</c:if>
											    	</c:forEach>
										    	</div>
									    	</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						<tr>
							<td>
								<div class="div_pd10">
									<span style="font-weight: bold;">댓글작성</span> &emsp;
									${member.mb_nick_name}
								</div>
							</td>
						</tr>
						<tr class="textbox">
						    <td align="center" style="position: relative;">
						        <textarea id="cm_content" name="cm_content" style="width: 99%; height: 50px;" placeholder="댓글을 입력해주십시오"></textarea>
						        <button id="submitButton" type="button" style="position: absolute; right: 10px; bottom: 10px; display: none;">작성</button>
						    </td>
						</tr>
					</table>
					<c:if test="${post.bct_writer_id == member.mb_id}">
						<span style="float: right; margin-top: 4px;">
							<button type="button" id="modify_button">수정</button>
							<button type="button" id="delete_button">삭제</button>
						</span>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="resources/js/board_view.js"></script>
	<script type="text/javascript">
		var writer_id = "${post.bct_writer_id}";
		var login_id = "${member.mb_id}";
		var state = "${loginState}";
	    var bct_content_number = "${post.bct_content_number}";
	    var noties = "${post.noties}"
		var like = "${like}";
		var mb_number = "${mb_number}";
		var login_number = "${member.mb_number}";
	</script>
</body>
</html>