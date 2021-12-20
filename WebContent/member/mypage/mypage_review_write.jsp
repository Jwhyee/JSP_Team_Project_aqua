<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/mypage_header.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/review_style.css?abcd">
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<!--  menu list 시작  -->
    <section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage.jsp">회원정보</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_order.jsp">구매내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_qna.jsp">문의내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_cart.jsp">장바구니</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_dibs.jsp">찜목록</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_review.jsp" style="color:black">리뷰</a></li>
	    </ul>
	</section>
	<div align = "center">
	<br>
		<h4>고객님의 소중한 리뷰를 남겨주세요.</h4>
	<br>
	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";
	
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		
		String rq_p_id = request.getParameter("p_id");
		int rq_ord_no = Integer.parseInt(request.getParameter("ord_no"));
		
		String jsql = "SELECT * FROM product where p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, rq_p_id);
		ResultSet rs = pstmt.executeQuery();

		String jsql2 = "SELECT * FROM ticket where t_id = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, rq_p_id);
		ResultSet rs2 = pstmt2.executeQuery();
		
		%>
		<form method="post" action="mypage_review_write_result.jsp">
			<table id = 'mypage_r_in_table' style="font-size: 10pt; font-family: 맑은 고딕">
		<%
		if(rs.next()){
			String p_name = rs.getString("p_name");
			String p_id = rs.getString("p_id");
		%>
		
				<tr style="display:none;">
					<td id = 'mypage_r_in_title'>리뷰 번호</td>
					<td>
						<input type="text" name="r_no" value="<%=rq_ord_no%>" readonly readonly>
					</td>
				</tr>
				<tr style="display:none;">
					<td id = 'mypage_r_in_title'>상품 카테고리</td>
					<td>
						<input type="text" name="r_category" value="product" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>상품 이름</td>
					<td>
						<input type="text" name="r_product" value="<%=p_name%>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>작성자 ID</td>
					<td>
						<input type="text" name="r_writer" value="<%=sid%>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>리뷰 작성 날짜</td>
					<td>
						<input type="text" name="r_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>만족도</td>
					<td>
						배송 만족도
						<select name="d_satisfy">
							<option value="매우 만족">매우 만족</option>
							<option value="만족">만족</option>
							<option value="보통">보통</option>
							<option value="불만족">불만족</option>
							<option value="매우 불만족">매우 불만족</option>
						</select>
						<br>
						상품 만족도
						<select name="p_satisfy">
							<option value="매우 만족">매우 만족</option>
							<option value="만족">만족</option>
							<option value="보통">보통</option>
							<option value="불만족">불만족</option>
							<option value="매우 불만족">매우 불만족</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>리뷰</td>
					<td>
						<textarea name="r_content" rows="10" cols="40" placeholder="200자 내로 작성해주세요." style="resize : none;"></textarea>
					</td>
				</tr>
			
		<%
		}
		

		else {
			rs2.next();
			String t_name = rs2.getString("t_name");
			String t_id = rs2.getString("t_id");
		%>
				<tr style="display:none;">
					<td id = 'mypage_r_in_title'>리뷰 번호</td>
					<td>
						<input type="text" name="r_no" value="<%=rq_ord_no%>" readonly>
					</td>
				</tr>
				<tr style="display:none;">
					<td id = 'mypage_r_in_title'>상품 카테고리</td>
					<td>
						<input type="text" name="r_category" value="ticket" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>상품 이름</td>
					<td>
						<input type="text" name="r_product" value="<%=t_name%>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>작성자 ID</td>
					<td>
						<input type="text" name="r_writer" value="<%=sid%>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>리뷰 작성 날짜</td>
					<td>
						<input type="text" name="r_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>만족도</td>
					<td>
						문자 배송 만족도
						<select name="d_satisfy">
							<option value="매우 만족">매우 만족</option>
							<option value="만족">만족</option>
							<option value="보통">보통</option>
							<option value="불만족">불만족</option>
							<option value="매우 불만족">매우 불만족</option>
						</select>
						<br>
						아쿠아리움 만족도
						<select name="p_satisfy">
							<option value="매우 만족">매우 만족</option>
							<option value="만족">만족</option>
							<option value="보통">보통</option>
							<option value="불만족">불만족</option>
							<option value="매우 불만족">매우 불만족</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id = 'mypage_r_in_title'>리뷰</td>
					<td>
						<textarea name="r_content" rows="10" cols="40" placeholder="200자 내로 작성해주세요."></textarea>
					</td>
				</tr>
			
		<%
		
	}
		%>
		
			</table>
			<br><br>
			<input id = 'mypage_r_in_btn' type="submit" value="후기 등록">
			<input id = 'mypage_r_in_btn' type="reset" value="취 소">
		</form>
		<%
}catch (Exception e) {
	out.println(e);
}
%>
	</div>
</body>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/review.js"></script>
</html>