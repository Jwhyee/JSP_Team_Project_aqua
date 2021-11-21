<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>

<link rel="stylesheet" type="text/css"
	href="../../css/style-table.css?v=123">


<%
request.setCharacterEncoding("utf-8");

try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String ord_bank = request.getParameter("ord_bank");
	int ord_no = Integer.parseInt(request.getParameter("ord_no"));
	String m_id = request.getParameter("m_id");
	String ord_date = request.getParameter("ord_date");
	String ord_receiver = request.getParameter("ord_receiver");
	String ord_rcv_address = request.getParameter("ord_rcv_address");
	String ord_rcv_phone = request.getParameter("ord_rcv_phone");
	String ord_pay = request.getParameter("ord_pay");
	String ord_state = request.getParameter("ord_state");

	if (ord_bank.equals("0")) {

		String ord_card_no = request.getParameter("ord_card_no");
		String ord_card_pass = request.getParameter("ord_card_pass");
		String jsql = "UPDATE order_info SET ord_no=?, m_id=?, ord_date=?, ord_receiver=?, ord_rcv_address=?, ord_rcv_phone=?, ord_pay=?, ord_bank=?, ord_card_no=?, ord_card_pass=?, ord_state=? WHERE ord_no=?";

		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setInt(1, ord_no);
		pstmt.setString(2, m_id);
		pstmt.setString(3, ord_date);
		pstmt.setString(4, ord_receiver);
		pstmt.setString(5, ord_rcv_address);
		pstmt.setString(6, ord_rcv_phone);
		pstmt.setString(7, ord_pay);
		pstmt.setString(8, ord_bank);
		pstmt.setString(9, ord_card_no);
		pstmt.setString(10, ord_card_pass);
		pstmt.setString(11, ord_state);
		pstmt.setInt(12, ord_no);
		pstmt.executeUpdate();

		String jsql2 = "select * from order_info where ord_no=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setInt(1, ord_no);

		ResultSet rs = pstmt2.executeQuery();
		rs.next();
%>
<center>
	<table border="2" cellpadding="10"
		style="font-size: 10pt; font-family: 맑은 고딕">
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px"><font color="blue">
						[<%=m_id%>회원님의 주문 정보 수정 내역입니다.]
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
				<td>
					<fmt:formatNumber value="<%=ord_pay%>" />
				</td>
				<%
				if (ord_card_no.equals("")) {
				%>
				<td><%=ord_bank%></td>
				<td>
					<font color=red>무통장 입금 결제입니다.</font>
				</td>
				<td>
					<font color=red>무통장 입금 결제입니다.</font>
				</td>
				<%
				} else {
				%>
				<td>
					<font color=red>카드 결제입니다.</font>
				</td>
				<td><%=ord_card_no%></td>
				<td><%=ord_card_pass%></td>
				<%
				}
				%>
				<%
				if (ord_state.equals("입금확인중")) {
				%>
				<td>
					<font color="red"><%=ord_state%></font>
				</td>
				<%
				} else {
				%>
				<td><%=ord_state%></td>
				<%
				}
				%>
				<td align=center>
					<a href="manager_order_update.jsp?ord_no=<%=ord_no%>">수정</a>
				</td>
			</tr>
		</tbody>
	</table>
	<a href="manager_order_select.jsp" style="font-size:10pt;font-family:맑은 고딕" >전체주문보기</a>
</center>

<%
} 
	
	else {
String jsql = "UPDATE order_info SET ord_no=?, m_id=?, ord_date=?, ord_receiver=?, ord_rcv_address=?, ord_rcv_phone=?, ord_pay=?, ord_bank=?, ord_state=? WHERE ord_no=?";

PreparedStatement pstmt = con.prepareStatement(jsql);
pstmt.setInt(1, ord_no);
pstmt.setString(2, m_id);
pstmt.setString(3, ord_date);
pstmt.setString(4, ord_receiver);
pstmt.setString(5, ord_rcv_address);
pstmt.setString(6, ord_rcv_phone);
pstmt.setString(7, ord_pay);
pstmt.setString(8, ord_bank);
pstmt.setString(9, ord_state);
pstmt.setInt(10, ord_no);
pstmt.executeUpdate();

String jsql2 = "SELECT ord_no, m_id, ord_date, ord_receiver, ord_rcv_address, ord_rcv_phone, ord_pay, ord_bank, ord_state, ord_no FROM order_info WHERE ord_no=?";
PreparedStatement pstmt2 = con.prepareStatement(jsql2);
pstmt2.setInt(1, ord_no);

ResultSet rs = pstmt2.executeQuery();
rs.next();

%>
<center>
	<table border="2" cellpadding="10"
		style="font-size: 10pt; font-family: 맑은 고딕">
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px"><font color="blue">
						[<%=m_id%>회원님의 주문 정보 수정 내역입니다.]
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
				<td>
					<fmt:formatNumber value="<%=ord_pay%>" />
				</td>
				<td><%=ord_bank%></td>
					<td colspan="2"><font color=red>무통장 입금 결제입니다.</font></td>
				<%
				if (ord_state.equals("입금확인중")) {
				%>
				<td>
					<font color="red"><%=ord_state%></font>
				</td>
				<%
				} else {
				%>
				<td><%=ord_state%></td>
				<%
				}
				%>
				<td align=center>
					<a href="manager_order_update.jsp?ord_no=<%=ord_no%>">수정</a>
				</td>
			</tr>
		</tbody>
	</table>
	<a href="manager_order_select.jsp" style="font-size:10pt;font-family:맑은 고딕" >전체주문보기</a>
</center>
<%
	}
%>
<%
} catch (Exception e) {
out.println(e);
}
%>

</body>
<%@ include file="../../layout/footer.jsp"%>
</html>