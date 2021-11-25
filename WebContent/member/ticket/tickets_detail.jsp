<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../layout/header.jsp"%>
<link rel="stylesheet" href="../css/style-product.css">
<body onload="init();">
	<link rel="stylesheet" type="text/css" href="../../css/style-product.css">
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="../../css/style-product.css">

<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("t_id");
	String jsql = "SELECT * FROM ticket WHERE t_id = ?";

	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String t_id = rs.getString("t_id");
	String t_name = rs.getString("t_name");
	int t_price_adult = rs.getInt("t_price_adult");
	int t_price_teen = rs.getInt("t_price_teen");
	int t_price_child = rs.getInt("t_price_child");
	String t_description = rs.getString("t_description");
	String t_place = ("t_place");
	
	/*
	String jsql2 = "SELECT * FROM ticket WHERE t_id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, key);
	*/
%>
</head>


<!-- 전체 박스 시작 -->
<form name="ticket" method="post">
	<input type=hidden name=t_id value="<%=t_id%>">
	<div class="products-detail">
		<!-- 상단 박스 시작 -->
		<div class="products-detail-box">
			<div class="products-box-info">
				<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
				<div class="products-info-image swiper-container">
					<!-- 이미지 -->
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="../../img/tickets/<%=t_id%>.jpg" width="500" height="200">
						</div>
					</div>
				</div>
			</div>

			<div class="products-box-detail">
				<div class="products-box-detail-name">
					<!-- 상품명 -->
					<span><%=t_name%></span>
				</div>

				<div class="products-box-detail-price">
					<!-- 가격 -->
					<span class="products-box-detail-price-figure">가격 </span>
					<span>
						<fmt:formatNumber value="<%=t_price_adult%>" type="number" />
						원
					</span>

				</div>
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">배송정보</span>
					<span class="products-box-detail-postInfo-content">e-ticket(문자 알림)</span>
				</div>

				<div class="products-box-detail-realInfo border-btm-e1e1e1">
					<span class="products-box-detail-realInfo-title">설명</span>
					<span class="products-box-detail-realInfo-content">아쿠아플래닛 입장 티켓입니다.</span>
					<span class="products-box-detail-realInfo-popover"
						onclick="realInfoBox();"> ∨ </span>
					<div id="realInfo-box">
						&lt;티켓 설명&gt;<br /> <%=t_description%>
					</div>
				</div>
				<!--  수량 선택 및 상품 구매  -->
				<div class="products-box-detail-realInfo border-btm-e1e1e1">
					<span class="products-box-detail-realInfo-title">수량 선택</span>
					<br><b>성인(만 19세 이상)</b><br>
					<input type=hidden name="sell_price_adult" value="<%=t_price_adult%>" style="border: none;">
					<input type="text" name="amount_adult" value="1" size="3" onchange="change();" style="border: none;" max="100">
					<input type="button" value=" + " onclick="add_a();" style="border: none;">
					<input type="button" value=" - " onclick="del_a();" style="border: none;">
					<br><b>청소년(만 13세 ~ 18세)</b><br>
					<input type=hidden name="sell_price_teen" value="<%=t_price_teen%>" style="border: none;">
					<input type="text" name="amount_teen" value="0" size="3" onchange="change();" style="border: none;" max="100">
					<input type="button" value=" + " onclick="add_t();" style="border: none;">
					<input type="button" value=" - " onclick="del_t();" style="border: none;">
					<br><b>어린이(만 4세 ~ 12세)</b><br>
					<input type=hidden name="sell_price_child" value="<%=t_price_child%>" style="border: none;">
					<input type="text" name="amount_child" value="0" size="3" onchange="change();" style="border: none;" max="100">
					<input type="button" value=" + " onclick="add_c();" style="border: none;">
					<input type="button" value=" - " onclick="del_c();" style="border: none;">
					<br>
				</div>

				<div class="products-box-detail-allPrice">
					<span class="products-box-detail-allPrice-title">상품 금액: </span>
					<input type="text" name="sum" size=7
						style="text-align: right; border: none" readonly>
					원


				</div>
				<!-- 버튼 시작 장바구니-->
				<c:choose>
					<c:when test="${empty sid}">
						<button type="button" class="buy-btn" onclick="need_login();">바로
							구매</button>
						<button type="button" class="cart-btn" onclick="need_login();">
							<i class="material-icons">shopping_cart</i>
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="buy-btn" onclick="direct_ticket_order()">바로 구매</button>
						<button type="button" class="cart-btn" onclick="add_to_cart()">
							<i class="material-icons">shopping_cart</i>
						</button>

					</c:otherwise>
				</c:choose>
</form>

<!-- 버튼 끝 -->
</div>
</div>
<!-- 상단 박스 끝 -->
<!-- 아래 박스 전체 시작-->
<div class="wrap-detail-info">
	<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
	<div class="tab-detail-info">
		<ul class="tab">
			<li class="active" id="tab-img-text"><a
					href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
			<li class="active" id="tab-review"><a href="#detail-review-box"
					id="tab-review-a">리뷰</a></li>
			<li class="active" id="tab-qna"><a href="#detail-qna-box"
					id="tab-qna-a">Q&amp;A</a></li>
			<li class="active" id="tab-purchaseInfo"><a
					href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">환불규정</a></li>
		</ul>
	</div>
	<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

	<!-- 상품 상세 설명 이미지/글 시작 -->
	<!-- 우측 하단 sticky  -->
	<div class="detail-sticky-go-to-top-btn-box">
		<a href="#" class="detail-sticky-go-to-top-btn-a">
			<img class="detail-sticky-go-to-top-btn-img"
				src="../../img/arrow_up.png" />
		</a>
	</div>
	<!-- 우측 하단 sticky 끝 -->
	<div id="detail-img-text-box"></div>
	<!-- 상품 상세 설명 이미지/글 끝 -->

	<!-- 리뷰 시작 -->
	<div id="detail-review-box">
		<div class="detail-review-header">
			리뷰
			<a class="detail-qna-header-a" href="review.jsp">전체보기</a>
		</div>
		<div class="detail-qna-body"></div>

	</div>
	<!-- 리뷰 끝 -->

	<!-- Q&A 시작 -->
	<div id="detail-qna-box">
		<div class="detail-qna-header">
			q&a
			<a class="detail-qna-header-a" href="qna.jsp">전체보기</a>
		</div>
		<div class="detail-qna-body"></div>

	</div>
	<!-- Q&A 끝 -->

	<!-- 주문정보 시작 -->
	<div id="detail-purchaseInfo-box">
		<div class="detail-purchaseInfo-header">환불 규정</div>

		<b>[변경 및 취소안내]</b><br/>
		<p>
			※특별상품이므로 부분사용 및 부분 취소/환불 불가합니다.<br>
			※판매기간 내 취소가능합니다.<br>
			※수량 변경 시 반드시 전체 취소 후 다시 구매 해 주시기 바랍니다.<br>
			※취소요청은 유선상 취소 신청해주시기 바랍니다.<br>
			※ 문자 미수신시, 판매처 문의<br>
			※ 구매시 기재한 이용자 정보로만 재발송 가능<br>
			※ 연락처 변경 재발송 불가<br>
		</p>
		<b>[업체정보]</b><br/>
		<p>
			업체명 : 아쿠아플래닛<br>
			주 소 : (00000) 수원<br>
			홈페이지 : index.html<br>
			시설문의 : 1234-5678<br>
		</p>
		<b>[판매처정보]</b><br/>
		<p>
			업체명 : 아쿠아플래닛<br>
			예약/취소문의 : 1234-5678<br>
		</p>

	</div>
	<!-- 주문정보 끝 -->

</div>
<!-- 아래 박스 전체 끝 -->

</div>
</body>
<%
} catch (Exception e) {
out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/tickets.js"></script>
