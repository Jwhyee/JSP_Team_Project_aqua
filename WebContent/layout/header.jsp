<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/aqua_header.css">




<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gnb.js"></script>
<script src="${pageContext.request.contextPath}/js/tab-ex-1.js"></script>
<title>aqua_projcet</title>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



<title>aqua_project</title>
<%
String sid = (String) session.getAttribute("sid");
%>
</head>

<body>

	<header id="header">
		<div class="bg_gnb"></div>
		<div class="inner">
			<h1 class="logo">
				<a href="${pageContext.request.contextPath}/member/index.jsp">아쿠아플라넷</a>
			</h1>
			<div class="nav_wrap">
				<ul class="service">
					<c:choose>
						<c:when test="${empty sid}">
							<li><a
									href="${pageContext.request.contextPath}/member/login/login.jsp">Login</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/join/insert_member.jsp">Join</a></li>
						</c:when>
						<c:otherwise>
							<li><a><%=sid%>님 환영합니다
								</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/login/logout.jsp">logout</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/my_page.jsp">mypage</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/order/cart_show.jsp">cart</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<nav class="gnb_wrap">
					<ul class="gnb">
						<li><a href="#">
								<span class="eng">About Aqua</span>
								<span class="kor">홈</span>
							</a>
							<ul class="submenu">
								<li><a href="#">아쿠아리움 소개</a></li>
								<li><a href="#">찾아 오시는 길</a></li>
								<li><a href="#">이용 요금 안내</a></li>
							</ul></li>
						<li><a href="#">
								<span class="eng">Theme</span>
								<span class="kor">테마</span>
							</a>
							<ul class="submenu">
								<li><a href="#">Theme A</a></li>
								<li><a href="#">Theme B</a></li>
								<li><a href="#">Theme C</a></li>

							</ul></li>
						<li><a href="#">
								<span class="eng">Products</span>
								<span class="kor">제품</span>
							</a>
							<ul class="submenu">
								<li><a
										href="${pageContext.request.contextPath}/member/product/goods_group.jsp">티켓
										구매하기</a></li>
								<li><a
										href="${pageContext.request.contextPath}/member/product/goods_group.jsp">굿즈
										구매하기</a></li>
								<li><a href="#">후기 게시판</a></li>

							</ul></li>
						<li><a href="#">
								<span class="eng">About Us</span>
								<span class="kor">소개</span>
							</a>
							<ul class="submenu">
								<li><a href="#">공지사항</a></li>
								<li><a href="#">개별문의 (1:1)</a></li>

							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<div id="header-first">
		<!-- <form id="headerSearchForm" method="POST"
		action="<%=request.getContextPath()%>/product?cmd=search">
		<button class="headerSearchForm-btn">
			<i class="tiny material-icons">search</i>
		</button>
		<input name="keyword" placeholder="상품명 또는 브랜드명으로 검색" class="headerSearchForm-input" />
	</form> -->
	</div>