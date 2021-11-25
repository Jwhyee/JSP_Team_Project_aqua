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
	href="${pageContext.request.contextPath}/css/aqua_header.css?v=1232">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gnb.js?v=1"></script>
<script src="${pageContext.request.contextPath}/js/tab-ex-1.js?v=2"></script>


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
	



<%
String sid = (String) session.getAttribute("sid");
%>

<c:choose>
	<c:when test="${empty sid}">
		<title>aqua</title>
	</c:when>
	<c:otherwise>
		<title><%=sid %>님 환영합니다</title>
	</c:otherwise>
</c:choose>
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
						<li><a href="${pageContext.request.contextPath}/manager/login/manager_login.jsp">admin</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/login/login.jsp">Login</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/join/insert_member.jsp">Join</a></li>
						</c:when>
						<c:otherwise>
							<li><a
									href="${pageContext.request.contextPath}/member/login/logout.jsp">logout</a></li>
							<li><a
									href="${pageContext.request.contextPath}/member/mypage/mypage.jsp?id=<%=sid%>">mypage</a></li>
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
								<li><a href="${pageContext.request.contextPath}/html/about_us_info.html">아쿠아리움 소개</a></li>
								<li><a href="${pageContext.request.contextPath}/html/about_us_road.html">찾아 오시는 길</a></li>
								<li><a href="${pageContext.request.contextPath}/html/about_us_cost.html">이용 요금 안내</a></li>
							</ul></li>
						<li><a href="#">
								<span class="eng">Theme</span>
								<span class="kor">테마</span>
							</a>
							<ul class="submenu">
								<li><a href="${pageContext.request.contextPath}/html/themeA.html">Theme A</a></li>
								<li><a href="${pageContext.request.contextPath}/html/themeB.html">Theme B</a></li>
								<li><a href="${pageContext.request.contextPath}/html/themeC.html">Theme C</a></li>

							</ul></li>
						<li><a href="#">
								<span class="eng">Products</span>
								<span class="kor">제품</span>
							</a>
							<ul class="submenu">
								<li><a
										href="${pageContext.request.contextPath}/member/ticket/tickets_select.jsp">티켓
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
								<li><a href="${pageContext.request.contextPath}/member/about_us/about_us_notice.jsp">공지사항</a></li>
							<c:choose>
								<c:when test="${empty sid}">
									<li><a class="btn" onClick="need_login();">개별문의 (1:1)</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/member/about_us/about_us_qna_write.jsp">개별문의 (1:1)</a></li>
								</c:otherwise>
							</c:choose>

							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<script type="text/javascript">
	function need_login() {
		Swal.fire({
			title: '로그인이 필요한 기능입니다.',
			text: '로그인하시겠습니까?',
			icon: 'info',
			closeOnClickOutside: false,
			showCancelButton: true,
			confirmButtonText: '로그인',
			cancelButtonText: '페이지 머물기',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				location.href = 'http://localhost:8080/aqua/member/login/login.jsp ';
			} else {
				swal.close();
			}
		})
	};
	</script>