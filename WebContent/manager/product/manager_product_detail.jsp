<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" href="../css/style-product.css">
<body onload="init();">
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css"
	href="../../css/style-product.css">

<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("p_id");
	String jsql = "SELECT * FROM product WHERE p_id = ?";

	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String p_id = rs.getString("p_id");
	String p_name = rs.getString("p_name");
	int p_price = rs.getInt("p_price");
	String p_category = rs.getString("p_category");
	String p_description = rs.getString("p_description");
	int p_stock = rs.getInt("p_stock");
	String p_option = ("p_option");
%>
</head>


<!-- 전체 박스 시작 -->
<form name="product" method="post">
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
							<img src="../../img/product/<%=p_id%>.jpg" width="500"
								height="200">
						</div>
					</div>
				</div>
				<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은
					이미지를 확인하실 수 있습니다.</span>
			</div>

			<div class="products-box-detail">



				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">제품아이디</span>
					<span class="products-box-detail-postInfo-content"><%=p_id %></span>
				</div>
				
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">카테고리</span>
					<span class="products-box-detail-postInfo-content"><%=p_category %></span>
				</div>
				
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">상품명</span>
					<span class="products-box-detail-postInfo-content"><%=p_name %></span>
				</div>
				 
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">가격</span>
					<span class="products-box-detail-postInfo-content"><fmt:formatNumber value="<%=p_price%>" type="number" />
						원</span>
				</div>
				
				
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">재고</span>
					<span class="products-box-detail-postInfo-content"><%=p_stock%>개</span>
				</div>

				<div class="products-box-detail-realInfo border-btm-e1e1e1">
					<span class="products-box-detail-realInfo-title">상품설명</span>
					<span class="products-box-detail-realInfo-content">자세한 설명 보기</span>
					<span class="products-box-detail-realInfo-popover"
						onclick="realInfoBox();"> ∨ </span>
					<div id="realInfo-box">
						&lt;상품 설명&gt;<br /> <%=p_description %>
					</div>
				</div>
				<br><br>
	
				<!-- 버튼 시작 장바구니-->
				<c:choose>
					<c:when test="${empty manager_id}">
						<button type="button" class="update-delete-btn" onclick="need_login();">수정</button>
						<button type="button" class="update-delete-btn" onclick="need_login();">삭제
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="update-delete-btn" onclick="update_product()">수정</button>
						<button type="button" class="update-delete-btn" onclick="delete_product()">삭제
				
						</button>
					</c:otherwise>
				</c:choose>
</form>

<!-- 버튼 끝 -->
</div>
</div>
<!-- 상단 박스 끝 -->

	<div id="detail-img-text-box">
		<img src="../../img/product/<%=p_id%>_description.jpg">
	</div>
</div>
</body>
<%
} catch (Exception e) {
out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/products_manager.js?v=1"></script>