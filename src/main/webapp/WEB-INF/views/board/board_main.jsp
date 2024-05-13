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
	<c:set var="mb_numberParams" value=""/>
	<c:if test="${not empty mb_number && mb_number != '1'}">
		<c:set var="mb_numberParams" value="&mb_number=${mb_number}"/>
	</c:if>
	<c:set var="bat_numberParams" value=""/>
	<c:if test="${not empty bat_number}">
		<c:set var="bat_numberParams" value="&bat_number=${bat_number}"/>
	</c:if>
	
	<div class="background">
		<div class="container">
			<div class="sidebar">
				<c:if test="${member != null}">
					<div class="info_block">
						<div class="info_my">
							<div class="info_photo">
								<img src="./resources/member/
								<c:if test="${member.mb_photo == 'basic_photo.png'}">basic_photo</c:if>
								<c:if test="${member.mb_photo != 'basic_photo.png'}">profile</c:if>
								/${member.mb_photo}" width="180px">
							</div>
							<div class="info_data">
								<div class="info_name">
								${member.mb_nick_name}
								</div>
								<div class="info_record">
									<span>내가 쓴 글</span>
									<span>${write_post}</span>
								</div>
								<div class="info_record">
									<span>내가 쓴 댓글</span>
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
					<div onclick="location.href='board_main?mb_number=${mb_number}'" class="category">전체글</div>
					<c:forEach items="${attribute_list}" var="atli" varStatus="state">
						<div class="category" onclick="location.href='board_main?mb_number=${mb_number}&bat_number=${atli.bat_number}'">
							<input type="text" id="input_${state.index}" value="${atli.bat_cls}" onclick="modi_name(event)" data-bat_number="${atli.bat_number}" style="display: none; width: 150px; border: none; outline: none; font-size: 16px;">
							<span id="text_${state.index}">${atli.bat_cls}</span>
							<span id="list_del_${state.index}" onclick="list_del(event)" data-bat_number="${atli.bat_number}" style="font-size: 15px; display: none; cursor: pointer;">➖</span>
						</div>
					</c:forEach>
				</aside>
				<c:if test="${mb_number == member.mb_number || member.mb_attribute == '관리자'}">
					<div class="setting">
						<a id="modi_button" onclick="page_modify()" style="display: block; cursor: pointer;">⚙게시판설정</a>
						<a id="submit_button" onclick="submit_do()" style="display: none; cursor: pointer;">💱돌아가기</a>
					</div>
				</c:if>
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
				
				<div class="noties">
					<table class="noties_table">
						<c:forEach items="${noties_list}" var="noli" varStatus="state">
							<tr>
								<td style="width: 70%; padding-left: 10px;">
									<div style="display: flex; align-items: center;">
										<a href="board_view?bct_content_number=${noli.bct_content_number}">
											${noli.bct_title}
											<c:forEach items="${comment_number}" var="cn">
												<c:if test="${noli.bct_content_number == cn.bct_content_number}">
													<span style="color:gray;">(${cn.comment_number})</span>
												</c:if>
											</c:forEach>
										</a>
									</div>
								</td>
								<td style="width: 10%; text-align: center;">${noli.bct_writer}</td>
								<td style="width: 10%; text-align: center;">
									<c:choose>
										<c:when test="${noli.bct_write_date.substring(0, 10) == now_date}">
											${noli.bct_write_date.substring(11,16)}
										</c:when>
										<c:otherwise>
											${noli.bct_write_date.substring(0, 10)}
										</c:otherwise>
									</c:choose>
								</td>
								<td style="width: 10%; text-align: center;">${noli.bct_view_cnt}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="tools">
					<span style="padding-left: 10px; position: relative; height: 100%; width: 150px;">
						<a id="post_check_all" onclick="post_check_all()" style="display: none; cursor: pointer; position: absolute;">전체선택</a>
						<a id="post_del" style="display: none; cursor: pointer; position: absolute; left: 100px;">❌삭제</a>
					</span>
					<span style="padding-right: 10px;">
						<select name="view_per_page" id="view_per_page" onchange="change_vpp(this)">
							<option value="10" <c:if test="${page.view_per_page == 10}">selected</c:if>>10개</option>
							<option value="20" <c:if test="${page.view_per_page == 20}">selected</c:if>>20개</option>
							<option value="30" <c:if test="${page.view_per_page == 30}">selected</c:if>>30개</option>
						</select>
					</span>
				</div>
				
				<div class="post">
					<c:if test="${board_list.size() == 0}">
						<div class="empty_board"></div>
					</c:if>
					<table class="post_table">
						<c:forEach items="${board_list}" var="boli" varStatus="state">
						<tr>
							<td style="width: 70%; padding-left: 10px;">
								<div style="display: flex; align-items: center;">
									<span><input type="checkbox" class="post_check" id="post_check_${state.index}" value="${boli.bct_content_number}" style="display: none;"></input></span>
									<c:if test="${empty bat_number}">
										<c:forEach items="${attribute_list}" var="atli">
											<c:if test="${boli.bat_number == atli.bat_number}">
												<span style="color:gray;">[${atli.bat_cls}]&ensp;</span>
											</c:if>
										</c:forEach>
									</c:if>
									<a href="board_view?mb_number=${mb_number}&bct_content_number=${boli.bct_content_number}">
										${boli.bct_title}
										<c:forEach items="${comment_number}" var="cn">
											<c:if test="${boli.bct_content_number == cn.bct_content_number}">
												<span style="color:red;">(${cn.comment_number})</span>
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
					<span style="float: left;"><button type="button" onclick="location.href='board_main?mode=best${mb_numberParams}${bat_numberParams}'">인기글</button></span>
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
	<script type="text/javascript" src="resources/js/board_main.js"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		var state = "${loginState}";
		var attribute_list_size = "${attribute_list.size()}";
		var board_list_size = "${board_list.size()}";
		var batParams = "${batParams}";
		var searchParams = "${searchParams}";
		var batParams = "${batParams}";
		var view_per_page = "${page.view_per_page}";
		var mb_number = "${mb_number}";
		var login_number = "${member.mb_number}";
		var mb_attribute = "${member.mb_attribute}";
	</script>
</body>
</html>