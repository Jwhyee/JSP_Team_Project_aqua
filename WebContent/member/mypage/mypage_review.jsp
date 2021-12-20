<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/mypage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../css/review_style.css?abc">
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
		<h3>배송이 완료된 상품만 리뷰를 작성할 수 있습니다.</h3>
	<br>
		<table id = 'review_list_table'>
			<tr id = 'review_list_title_line' height = 50>
				<td width = 100></td>
				<td width = 300>상품정보</td>
				<td width = 200>구매일</td>
				<td width = 100>후기 작성</td>
			</tr>
	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";
	
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		String state = "배송완료";
		String jsql = "select * from order_info where m_id = ? AND ord_state = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, sid);
		pstmt.setString(2, state);
		ResultSet rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			
			String ord_date = rs.getString("ord_date");
			String ord_date2 = ord_date.substring(0,13);
			int ord_no = rs.getInt("ord_no");
			
			String jsql2 = "select p_id from order_product where ord_no = ?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, ord_no);
			ResultSet rs2 = pstmt2.executeQuery();
			
			while (rs2.next()){
				String p_id = rs2.getString("p_id");
				
				String jsql3 = "select p_name from product where p_id = ?";
				PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				pstmt3.setString(1, p_id);
				ResultSet rs3 = pstmt3.executeQuery();
				
				String jsql4 = "select t_name from ticket where t_id = ?";
				PreparedStatement pstmt4 = con.prepareStatement(jsql4);
				pstmt4.setString(1, p_id);
				ResultSet rs4 = pstmt4.executeQuery();
				
				while(rs3.next()){
					String p_name = rs3.getString("p_name");
					%>
					
					<tr id = 'review_list_content_line' height = 130>
						<td>
							<a href = "../product/goods_select.jsp?p_id=<%=p_id%>">
								<img src="../../img/product/<%=p_id%>.jpg" border=0 width=80px
							height=96px>
							</a>
						</td>
						<td>
							<a href = "../product/goods_select.jsp?p_id=<%=p_id%>">
								<%= p_name %>
							</a>
						</td>
						<td style = "text-align : center;">
							<a>
								<%=ord_date2%>
							</a>
						</td>
						<td id = 'review_write_btn'>
							
									<%
									String jsql5 = "select r_content from review where r_product = ? AND r_writer = ? AND r_no = ?";
									PreparedStatement pstmt5 = con.prepareStatement(jsql5);
									pstmt5.setString(1, p_name);
									pstmt5.setString(2, sid);
									pstmt5.setInt(3, ord_no);
									ResultSet rs5 = pstmt5.executeQuery();
									
									if(!rs5.next()){
										%>
										<a href = "mypage_review_write.jsp?p_id=<%=p_id%>&ord_no=<%=ord_no%>">
										<button type="button" class="buy-btn" style="background-color:#2535C7; color : white;">
										<%
										out.println("후기 작성");
										%>
										</button>
										<%
									}
									else{
										%>
										<button type="button" class="buy-btn" style="background-color : #98A1EA; color : white; curor : text;">
									<%
										out.println("작성 완료");
									%>
										</button>
									<%
									}
									%>
								
							</a>
						</td>
					</tr>
					<%
				}
				while(rs4.next()){
						String t_name = rs4.getString("t_name");
						%>
						
						<tr id = 'review_list_content_line' height = 130>
							<td>
								<a href = "../ticket/tickets_detail.jsp?t_id=<%=p_id%>">
									<img src="../../img/tickets/<%=p_id%>.jpeg" border=0 width=80px
								height=96px>
								</a>
							</td>
							<td>
								<a href = "../ticket/tickets_detail.jsp?t_id=<%=p_id%>">
									<%= t_name %>
								</a>
							</td>
							<td style = "text-align : center;">
								<a>
									<%= ord_date2 %>
								</a>
							</td>
							<td id = 'review_write_btn'>
										<%
									String jsql5 = "select r_content from review where r_product = ? AND r_writer = ? AND r_no = ?";
									PreparedStatement pstmt5 = con.prepareStatement(jsql5);
									pstmt5.setString(1, t_name);
									pstmt5.setString(2, sid);
									pstmt5.setInt(3, ord_no);
									ResultSet rs5 = pstmt5.executeQuery();
									
									if(!rs5.next()){
										%>
										<a href = "mypage_review_write.jsp?p_id=<%=p_id%>&ord_no=<%=ord_no%>">
										<button type="button" style="background-color : #2535C7; color : white;">
										<%
										out.println("후기 작성");
										%>
										</button>
										<%
									}
									else{
										%>
										<button type="button" style="background-color : #98A1EA; color : white; curor : text;">
									<%
										out.println("작성 완료");
									%>
										</button>
									<%
									}
									%>
								</a>
							</td>
						</tr>
						<%
				}
			}
		}
	%>
	</table>
<%
}catch (Exception e) {
	out.println("구매한 상품이 없습니다.");
}
%>
	</div>
</body>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/review.js"></script>
</html>