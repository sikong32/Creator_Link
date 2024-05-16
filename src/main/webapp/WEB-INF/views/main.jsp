<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- CSS 경로  -->
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<title>Creator Link</title>
</head>
<body>

<section class="main_container">
	<!-- 방송 카테고리 (사이드바) -->
	<aside class="streamcate_bar">
        <ul class="streamcate_detail">
            <li><a href="index"><i class="fa-solid fa-house"></i><span>전체</span></a></li>
            <li><a href="live_BC?live_BC=치지직_수다"><i class="fa-solid fa-comments"></i><span>수다</span></a></li>
            <li><a href="live_BC?live_BC=치지직_음악"><i class="fa-solid fa-music"></i><span>음악</span></a></li>
            <li><a href="live_BC?live_BC=치지직_아트"><i class="fa-solid fa-palette"></i><span>아트</span></a></li>
        </ul>
	</aside>
	<!-- LIVE 목록 -->
	<div class="live_container">
		<div class="live_creator_list">
			<h3>추천 크리에이터</h3>
			<div class="live_creator_tot">
				<c:forEach items="${mb_list}" var="mb" varStatus="i">
					<c:if test="${i.index < 8}">
						<div class="live_creator">
							<div class="creator_background">
								<c:if test="${mb.mb_photo=='basic_photo.png'}">
									<div class="creator_img">
										<img src="./resources/member/basic_photo/basic_photo.png">
									</div>
								</c:if>
								<c:if test="${mb.mb_photo!='basic_photo.png'}">
									<div class="creator_img">
										<img src="./resources/member/profile/${mb.mb_photo}">
									</div>
								</c:if>
							</div>
<!-- 							<div class="small_live_icon">LIVE</div> -->
							<div class="creator_nickname">${mb.mb_nick_name}</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div class="live_info_area">
			<h3>LIVE</h3>
			<div class="live_info_list">
			<c:forEach items="${bc_list}" var="bc">
				<div class="live_info_tot">
					<div class="live_screen">
						<img alt="" src="${bc.bc_imglink}" width="300" height="160">
						<div class="live_icon">LIVE</div>
						<div class="live_viewer">${bc.bc_sichengjasu}</div>
					</div>
					<div class="live_profile">
		            	<div class="live_pickture"><a href="${bc.bc_hreflink}"><img src="${bc.bc_profilimglink}"></a></div>
		            	<div class="live_nickname">${bc.bc_profilname}</div>
		            </div>
		       </div>
			</c:forEach>
<!-- 		       <div class="live_info_tot"> -->
<!-- 					<div class="live_screen"> -->
<!-- 						<div class="live_icon">LIVE</div> -->
<!-- 						<div class="live_viewer">시청자수</div> -->
<!-- 					</div> -->
<!-- 					<div class="live_profile"> -->
<!-- 		            	<div class="live_pickture"><img src="./resources/cssimage/happy.jpg"></div> -->
<!-- 		            	<div class="live_nickname">해피</div> -->
<!-- 		            </div> -->
<!-- 		       </div> -->
			</div>   
		</div>
	</div>
</section>
</body>
</html>