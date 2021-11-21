<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../css/style-table.css?v=123">
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "select * from order_info";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();
%>

<center>

	<p>
		<%
		while (rs.next()) {
			String m_id = rs.getString("m_id");
			int ord_no = rs.getInt("ord_no");
			String ord_date = rs.getString("ord_date");
			String ord_receiver = rs.getString("ord_receiver");
			String ord_rcv_address = rs.getString("ord_rcv_address");
			String ord_rcv_phone = rs.getString("ord_rcv_phone");
			String ord_pay = rs.getString("ord_pay");
			String ord_bank = rs.getString("ord_bank");
			String ord_card_no = rs.getString("ord_card_no");
			String ord_card_pass = rs.getString("ord_card_pass");
			String ord_state = rs.getString("ord_state");
		%>
	
	<table border="2" cellpadding="10"
		style="font-size: 10pt; font-family: 맑은 고딕">
		주문번호:
		<%=ord_no%>
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px"><font color="blue">
						[<%=m_id%>회원님의 주문정보입니다]
					</font></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>주문자 아이디</th>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>수령자</th>
				<th>수령자 주소</th>
				<th>수령자 번호</th>
				<th>가격</th>
				<th>결제 은행</th>
				<th>카드 번호</th>
				<th>카드 비밀번호</th>
				<th><b>[배송상태]</b></th>
				<th><b>[수정]</b></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th><a href="../member/manager_member_detail.jsp?id=<%=m_id%>"><%=m_id%></a></th>
				<td><%=ord_no%></td>
				<td><%=ord_date%></td>
				<td><%=ord_receiver%></td>
				<td><%=ord_rcv_address%></td>
				<td><%=ord_rcv_phone%></td>
				<td><fmt:formatNumber value="<%=ord_pay%>"/></td>
				<%
					if (ord_card_no.equals("")) {
				%>
					<td><%=ord_bank%></td>
					<td colspan="2"><font color=red>무통장 입금 결제입니다.</font></td>
				<%}else{
				%>
					<td><font color=red>카드 결제입니다.</font></td>
					<td><%=ord_card_no%></td>
					<td><%=ord_card_pass%></td>
				<%} 
				%>
				<%
				if(ord_state.equals("입금확인중")){
				%>	
					<td><font color="red"><%=ord_state%></font></td>
				<%
					}else{
				%>
					<td><%=ord_state%></td>
				<%} 
				%>
				<td align=center>
					<a href="manager_order_update.jsp?ord_no=<%=ord_no%>">수정</a>
				</td>
			</tr>
		</tbody>
		<%
		String jsql2 = "select * from order_product where ord_no = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setInt(1, ord_no);
		ResultSet rs2 = pstmt2.executeQuery();
		%>
		<thead>
			<tr>
				<td colspan="13">&nbsp</td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px"><font color="blue">
						[<%=m_id%>회원님의 주문목록입니다]</font></th>
			</tr>
		</thead>
		<p>
		<thead>
			<tr>
				<th colspan=3>상품 이미지</th>
				<th colspan=3>상품 아이디</th>
				<th colspan=3>주문 번호</th>
				<th colspan=3>수량</th>


			</tr>
		</thead>
		<%
		while (rs2.next()) {
			String p_id = rs2.getString("p_id");
			int ord_no2 = rs2.getInt("ord_no");
			int ord_qty = rs2.getInt("ord_qty");
		%>
		<tbody>
			<tr>
				<td colspan=3 align="center">
					<a href="../product/manager_product_detail.jsp?p_id=<%=p_id%>">
						<img src="../../img/product/<%=p_id%>.jpg" width="100"
							height="100" border=0>
					</a>
				</td>
				<th colspan=3><a
						href="../product/manager_product_detail.jsp?p_id=<%=p_id%>"><%=p_id%></a></th>
				<td colspan=3><%=ord_no%></td>
				<td colspan=3><%=ord_qty%></td>
			</tr>
		</tbody>
		<%
		}
		%>
		<%
		} // while문의 끝
		%>

	</table>
	<p>
		<br>
		<a href="../manager_index.jsp"
			style="font-size: 10pt; font-family: 맑은 고딕">관리자모드 메인페이지</a>

		<%
		} catch (Exception e) {
		out.println(e);
		}
		%>
		</body>
	
</center>
<%@ include file="../../layout/footer.jsp"%>
</html>