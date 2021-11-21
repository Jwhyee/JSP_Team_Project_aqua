<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../layout/header.jsp"%>

<link rel="stylesheet" href="../../css/style-favorite.css">
<link rel="stylesheet" href="../../css/style-index.css">
<link rel="stylesheet" href="../../css/style-common.css">


<body>

	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String jsql = "select * from product";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		ResultSet rs = pstmt.executeQuery();
	%>

</head>

<div class="frame">
	<!-- main 타이틀 시작 -->
	<div class="favor-head border-btm-black">상품 리스트</div>
	<div id="product_order_list">
		<form name="list" method="post">
			<a href="javascript:popular_list()">인기순</a>
			&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:price_high();">높은가격</a>
			&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:price_low();">낮은가격</a>
		</form>
	</div>
	<!-- main 타이틀 끝 -->
	<!-- sidebar 시작 -->
	<div class="favor-sidebar">
		<form name="categorys" method="post">
			<div class="favor-sidebar-title">상품 옵션</div>
			<div class=" custom-checkbox favor-content">
				<input type="checkbox" class="custom-control-input" id="notSoldout">
				<label class="custom-control-label" for="notSoldout">품절 제외<구현중...></label>
			</div>
			<div class=" custom-checkbox favor-content">
				<input type="radio" name="compList" value="상" />
				상
			</div>
			<div class=" custom-checkbox favor-content">
				<input type="radio" name="compList" value="중" />
				중
			</div>
			<div class=" custom-checkbox favor-content">
				<input type="radio" name="compList" value="하" />
				하
			</div>
			<div class=" custom-checkbox favor-content">
				<input type="radio" name="compList" value="default" />
				전체보기
			</div><br>
		<button type="button" class="btn btn-primary" onclick="category_top()">검색</button>
		</form>
	</div>
</div>
<!-- sidebar 끝 -->
<!-- 좌측박스 시작 -->
<main id="main-prd">
	<div class="favor-item-box" id="favor-item-box">

		<div class="favor-prd-list">
			<%
			while (rs.next()) {
				String p_id = rs.getString("p_id");
				String p_name = rs.getString("p_name");
				int p_price = Integer.parseInt(rs.getString("p_price"));
				int p_stock = Integer.parseInt(rs.getString("p_stock"));
				String p_category = rs.getString("p_category");
				String p_description = rs.getString("p_description");
				String p_option = rs.getString("p_option");
			%>
			<div class="favor-prd-box">
				<a class="favor-link-prod" href="goods_select.jsp?p_id=<%=p_id%>"></a>
				<img src="../../img/product/<%=p_id%>.jpg" class="main-prd-item-img" />
				<ul class="favor-prd-item">
					<!-- 상품이미지 -->
					<li class="prd-item-company"><%=p_category%></li>
					<!-- 카테코 -->
					<li class="prd-item-name"><%=p_name%></li>
					<!-- 상품명 -->
					<li class="prd-item-price"><fmt:formatNumber
							value="<%=p_price%>" type="number" />원</li>
					<!-- 가격 -->
					<li class="prd-item-soldCount"><%=p_stock%>판매</li>
					<!-- 판매량 default = 0 -->
				</ul>
			</div>
			<%
			}
			%>
		</div>
	</div>
</main>
<!-- 좌측박스 끝 -->

</div>
<!-- 전체 박스 끝 -->
<%
} catch (Exception e) {
out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/categories.js"></script>