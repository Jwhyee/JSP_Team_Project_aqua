<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" href="../css/style-product.css">
<body onload="init();">
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="../../css/style-product.css">
<%
request.setCharacterEncoding("utf-8");

String p_id = request.getParameter("id");
String p_name = request.getParameter("name");
int p_price = Integer.parseInt(request.getParameter("price"));
int p_stock = Integer.parseInt(request.getParameter("stock"));
String p_category = request.getParameter("ctg");
String p_description = request.getParameter("description");

String[] p_option = request.getParameterValues("option");
String p_option_list = " ";
if (p_option != null) {
	for (int i = 0; i < p_option.length; i++) {
		p_option_list += p_option[i];
		p_option_list += "  ";
	}
} else
	p_option_list = "옵션 없음";

try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "UPDATE product SET p_name=?, p_price=?, p_stock=?, p_category=?, p_description=?, p_option=? WHERE p_id=?";

	PreparedStatement pstmt = con.prepareStatement(jsql);

	pstmt.setString(1, p_name);
	pstmt.setInt(2, p_price);
	pstmt.setInt(3, p_stock);
	pstmt.setString(4, p_category);
	pstmt.setString(5, p_description);
	pstmt.setString(6, p_option_list);
	pstmt.setString(7, p_id);
	pstmt.executeUpdate();
	pstmt.executeUpdate();

	String jsql2 = "select * from product where p_id=?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, p_id);

	ResultSet rs = pstmt2.executeQuery();
	rs.next();
%>

<input type=hidden name=p_id value="<%=p_id%>">
<div class="products-detail">
	<!-- 상단 박스 시작 -->
	<div class="products-detail-box">
		<div class="products-box-info">
			<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
			<div class="products-info-image swiper-container">
				<!-- 이미지 -->
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="../../img/product/<%=p_id%>.jpg" width="500" height="200">
					</div>
					<div class="swiper-slide">
						<img src="../../img/product/<%=p_id%>_1.jpg" width="500" height="200">
					</div>
					<div class="swiper-slide">
						<img src="../../img/product/<%=p_id%>_2.jpg" width="500" height="200">
					</div>
				</div>
			</div>
			<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은 이미지를 확인하실 수 있습니다.</span>
		</div>

		<div class="products-box-detail">



			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">제품아이디</span>
				<span class="products-box-detail-postInfo-content"><%=p_id%></span>
			</div>

			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">카테고리</span>
				<span class="products-box-detail-postInfo-content"><%=p_category%></span>
			</div>

			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">상품명</span>
				<span class="products-box-detail-postInfo-content"><%=p_name%></span>
			</div>

			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">가격</span>
				<span class="products-box-detail-postInfo-content">
					<fmt:formatNumber value="<%=p_price%>" type="number" />
					원
				</span>
			</div>


			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">재고</span>
				<span class="products-box-detail-postInfo-content"><%=p_stock%>개
				</span>
			</div>

			<div class="products-box-detail-realInfo border-btm-e1e1e1">
				<span class="products-box-detail-realInfo-title">상품설명</span>
				<span class="products-box-detail-realInfo-content">자세한 설명 보기</span>
				<span class="products-box-detail-realInfo-popover" onclick="realInfoBox();"> ∨ </span>
				<div id="realInfo-box">
					&lt;상품 설명&gt;<br />
					<%=p_description%>
				</div>
			</div>
			<br>
			<br>

			<!-- 버튼 시작 장바구니-->
			<c:choose>
				<c:when test="${empty manager_id}">
					<button type="button" class="update-delete-btn" onclick="need_login();">재수정</button>
					<button type="button" class="update-delete-btn" onclick="need_login();">전체 상품 보기</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="update-delete-btn" onclick="location.href='manager_product_update.jsp?p_id=<%=p_id%>' ">재수정</button>
					<button type="button" class="update-delete-btn" onclick="location.href='manager_product_select.jsp' ">전체 상품 보기</button>
				</c:otherwise>
			</c:choose>

			<!-- 버튼 끝 -->
		</div>
	</div>
	<!-- 상단 박스 끝 -->

	<div id="detail-img-text-box">
		<img src="../../img/product/<%=p_id%>_description.jpg">
	</div>
	<%
	} catch (Exception e) {
	out.println(e);
	}
	%>
	<p>
		<script type="text/javascript" src="../../js/products_manager.js?v=1"></script>

		</body>
		<%@ include file="../../layout/footer.jsp"%>