<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel="stylesheet" href="../css/style-product.css">
<link rel="stylesheet" type="text/css" href="../../css/review_style.css?aa">
<body onload="init();">
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css" href="../../css/style-product.css">

<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("p_id");
	String product = "product";
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

	java.util.Date date = new java.util.Date(); //   Date 타입의 객체 date 생성
	String recent_date = date.toLocaleString(); //   변수 oDate에 현재 시각(년.월.일 시:분:초)을 저장

	String ct_no = session.getId();
	if (sid != null) {
		String jsql3 = "SELECT * FROM temp_recent WHERE p_id = ? AND m_id = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, p_id);
		pstmt3.setString(2, sid);
		ResultSet rs3 = pstmt3.executeQuery();

		if (!rs3.next()) {
	String jsql2 = "INSERT INTO temp_recent (p_id, p_name, m_id, recent_date) VALUES (?,?,?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, p_id);
	pstmt2.setString(2, p_name);
	pstmt2.setString(3, sid);
	pstmt2.setString(4, recent_date);

	pstmt2.executeUpdate();
		} else {
	String jsql2 = "UPDATE temp_recent SET recent_date =? WHERE p_id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, recent_date);
	pstmt2.setString(2, p_id);

	pstmt2.executeUpdate();
		}
	}

	else {
		String jsql3 = "SELECT * FROM temp_recent WHERE p_id = ? AND ct_no = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, p_id);
		pstmt3.setString(2, ct_no);
		ResultSet rs3 = pstmt3.executeQuery();

		if (!rs3.next()) {
	String jsql2 = "INSERT INTO temp_recent (p_id, p_name, m_id, recent_date, ct_no) VALUES (?,?,?,?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, p_id);
	pstmt2.setString(2, p_name);
	pstmt2.setString(3, sid);
	pstmt2.setString(4, recent_date);
	pstmt2.setString(5, ct_no);

	pstmt2.executeUpdate();
		} else {
	String jsql2 = "UPDATE temp_recent SET recent_date =? WHERE ct_no = ? AND p_id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, recent_date);
	pstmt2.setString(2, ct_no);
	pstmt2.setString(3, p_id);

	pstmt2.executeUpdate();
		}
	}
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
				<div class="products-box-detail-company">
					<!-- 카테고리 -->
					<span class="products-box-detail-company-color">
						<%=p_category%>
					</span>
				</div>

				<div class="products-box-detail-name">
					<!-- 상품명 -->
					<span><%=p_name%></span>
				</div>

				<div class="products-box-detail-price">
					<!-- 가격 -->
					<span class="products-box-detail-price-figure">가격 </span>
					<span>
						<fmt:formatNumber value="<%=p_price%>" type="number" />
						원
					</span>

				</div>

				<div class="products-box-detail-soldCount border-btm-e1e1e1">
					<!-- 판매량 -->

					<%
					if (p_stock > 0) {
					%>
					<span class="products-box-detail-soldCount-figure">
						<input type="hidden" name="stock" value="<%=p_stock%>">재고:<%=p_stock%></span>
					<span class="products-box-detail-soldCount-figure">개</span>
					<%
					} else {
					%>
					<span class="products-box-detail-soldCount-figure" style="color: red;">품절 상품입니다.</span>
					<%}%>

				</div>
				<div class="products-box-detail-postInfo border-btm-e1e1e1">
					<span class="products-box-detail-postInfo-title">배송정보</span>
					<span class="products-box-detail-postInfo-content">일반배송</span>
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
				<!--  수량 선택 및 상품 구매  -->
				<div class="products-box-detail-realInfo border-btm-e1e1e1">
					<span class="products-box-detail-realInfo-title">수량 선택</span>
					<input type=hidden name="sell_price" value="<%=p_price%>" style="border: none;  ">
					<input type="number" name="amount" value="1" size="1" onchange="change();" style="border: none;" max="<%=p_stock%>" readonly>
					<input type="button" value=" + " onclick="add();" style="border: none;">
					<input type="button" value=" - " onclick="del();" style="border: none;">
				</div>

				<div class="products-box-detail-allPrice">
					<span class="products-box-detail-allPrice-title">상품 금액: </span>
					<input type="text" name="sum" size=7 style="text-align: right; border: none" readonly>
					원


				</div>
				<!-- 버튼 시작 장바구니-->
				<c:choose>
					<c:when test="${empty sid}">
						<button type="button" class="buy-btn" onclick="need_login();">바로 구매</button>
						<button type="button" class="cart-btn" onclick="need_login();">
							<i class="material-icons">shopping_cart</i>
						</button>
						<button type="button" class="fav-btn" onclick="need_login();">
							<i class="material-icons">favorite</i>
						</button>
					</c:when>
					<c:otherwise>
						<%
						if (p_stock <= 0) {
						%>
						<button type="button" class="buy-btn" onclick="sold_out()">바로 구매</button>
						<button type="button" class="cart-btn" onclick="sold_out()">
							<i class="material-icons">shopping_cart</i>
						</button>
						<button type="button" class="fav-btn" onclick="sold_out();">
							<i class="material-icons">favorite_border</i>
						</button>
						<%
						} else {
						%>
						<button type="button" class="buy-btn" onclick="direct_product_order()">바로 구매</button>
						<button type="button" class="cart-btn" onclick="add_to_cart()">
							<i class="material-icons">shopping_cart</i>
						</button>
						<%
						String jsql4 = "SELECT * FROM dibs WHERE p_id = ? AND m_id = ? ";
						PreparedStatement pstmt4 = con.prepareStatement(jsql4);
						pstmt4.setString(1, p_id);
						pstmt4.setString(2, sid);
						ResultSet rs4 = pstmt4.executeQuery();

						if (rs4.next()) {
						%>
						<button type="button" class="fav-btn" onclick="rmv_to_dibs();">
							<i class="material-icons">favorite_border</i>
						</button>
						<%
						} else {
						%>
						<button type="button" class="fav-btn" onclick="add_to_dibs();">
							<i class="material-icons" style="color: red;">favorite_border</i>
						</button>
						<%
						}
						%>
						<%
						}
						%>
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
			<li class="active" id="tab-img-text">
				<a href="#detail-img-text-box" id="tab-img-text-a">상품정보</a>
			</li>
			<li class="active" id="tab-review">
				<a href="#detail-review-box" id="tab-review-a">리뷰</a>
			</li>
			<!-- <li class="active" id="tab-qna"><a href="#detail-qna-box"
					id="tab-qna-a">Q&amp;A</a></li>  -->
			<li class="active" id="tab-purchaseInfo">
				<a href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a>
			</li>
		</ul>
	</div>
	<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

	<!-- 상품 상세 설명 이미지/글 시작 -->
	<!-- 우측 하단 sticky  -->
	<div class="detail-sticky-go-to-top-btn-box">
		<a href="#" class="detail-sticky-go-to-top-btn-a">
			<img class="detail-sticky-go-to-top-btn-img" src="../../img/arrow_up.png" />
		</a>
	</div>
	<!-- 우측 하단 sticky 끝 -->
	<div id="detail-img-text-box">
		<img src="../../img/product/<%=p_id%>_description.jpg">
	</div>
	<!-- 상품 상세 설명 이미지/글 끝 -->

	<!-- 리뷰 시작 -->
	<div id="detail-review-box">
		<div class="detail-review-header">
			리뷰
			<a class="detail-qna-header-a" href="review_list.jsp?p_id=<%=p_id%>">전체보기</a>
		</div>
		<div class="detail-qna-body">
			<table id='review_list_table'>
				<tr id='review_t_list_title_line' height=50>
					<td width="50">작성일</td>
					<td width="50">작성자</td>
					<td width="80">상품 이름</td>
					<td width="50">배송 만족도</td>
					<td width="50">상품 만족도</td>
					<td width="200">후기 내용</td>
				</tr>
				<%
				String jsql2 = "SELECT * FROM review WHERE r_category = ? AND r_product = ? order by r_no desc limit 5";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, product);
				pstmt2.setString(2, p_name);

				ResultSet rs2 = pstmt2.executeQuery();
				while (rs2.next()) {
					String r_writer = rs2.getString("r_writer");
					String r_product = rs2.getString("r_product");
					String r_date = rs2.getString("r_date");
					String d_satisfy = rs2.getString("d_satisfy");
					String p_satisfy = rs2.getString("p_satisfy");
					String r_content = rs2.getString("r_content");
				%>

				<tr id='review_t_list_content_line'>
					<td><%=r_date%></td>
					<td><%=r_writer%></td>
					<td><%=r_product%></td>
					<td><%=d_satisfy%></td>
					<td><%=p_satisfy%></td>
					<td><%=r_content%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>

	</div>
	<!-- 리뷰 끝 -->

	<!-- Q&A 시작 
	<div id="detail-qna-box">
		<div class="detail-qna-header">
			q&a
			<a class="detail-qna-header-a" href="qna.jsp">전체보기</a>
		</div>
		<div class="detail-qna-body"></div>

	</div>
	Q&A 끝 -->

	<!-- 주문정보 시작 -->
	<div id="detail-purchaseInfo-box">
		<div class="detail-purchaseInfo-header">주문정보</div>

		<b>[배송 정보 ]</b><br />
		<p>
			고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br /> CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br /> 발송한날로부터 1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수 있습니다.)
		</p>
		<b>[ 교환/환불 정보 ]</b><br />
		<p>
			상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품 수령 후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가 배송비를 부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br /> - 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는 예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br /> - 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의 늘어남 발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된 주문의 경우<br /> - 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단, 함량미달의 경우에는 환불이 가능함)<br /> 구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
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
<script type="text/javascript" src="../../js/products.js?v123123"></script>
