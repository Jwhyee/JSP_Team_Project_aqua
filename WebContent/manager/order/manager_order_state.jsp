<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/style-table.css?v=123">
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	String state = request.getParameter("state");

	String jsql = "select * from order_info where ord_state=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, state);
	ResultSet rs = pstmt.executeQuery();

	String jsql2 = "SELECT * FROM order_info WHERE ord_state = '입금확인중'";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	ResultSet rs2 = pstmt2.executeQuery();

	String jsql3 = "SELECT * FROM order_info WHERE ord_state = '배송준비중'";
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	ResultSet rs3 = pstmt3.executeQuery();

	String jsql4 = "SELECT * FROM order_info WHERE ord_state = '배송시작'";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	ResultSet rs4 = pstmt4.executeQuery();

	String jsql5 = "SELECT * FROM order_info WHERE ord_state = '배송완료'";
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	ResultSet rs5 = pstmt5.executeQuery();

	int count2 = 0;
	int count3 = 0;
	int count4 = 0;
	int count5 = 0;

	while (rs2.next()) {
		count2 = count2 + 1;
	}

	while (rs3.next()) {
		count3 = count3 + 1;
	}

	while (rs4.next()) {
		count4 = count4 + 1;
	}

	while (rs5.next()) {
		count5 = count5 + 1;
	}

	int sum = count2 + count3 + count4 + count5;
%>
<!--  menu list 시작  -->

<center>
	<%
	String[] p_state = state.split(" ");
	String[] checked = new String[4];

	for (int i = 0; i < p_state.length; i++) {
		if (p_state[i].equals("입금확인중")) {
			checked[0] = "style=background-color:#d3d3d3";
		} else if (p_state[i].equals("배송준비중")) {
			checked[1] = "style=background-color:#d3d3d3";
		} else if (p_state[i].equals("배송시작")) {
			checked[2] = "style=background-color:#d3d3d3";
		} else if (p_state[i].equals("배송완료")) {
			checked[3] = "style=background-color:#d3d3d3";
		}
	}
	%>
	<ul class="mylist">
		<li>
			<a href="manager_order_select.jsp">
				전체보기(<%=sum%>)
			</a>
		</li>
		<li <%=checked[0]%>>
			<a href="manager_order_state.jsp?state=입금확인중">
				입금확인중(<%=count2%>)
			</a>
		</li>
		<li <%=checked[1]%>>
			<a href="manager_order_state.jsp?state=배송준비중">
				배송준비중(<%=count3%>)
			</a>
		</li>
		<li <%=checked[2]%>>
			<a href="manager_order_state.jsp?state=배송시작">
				배송시작(<%=count4%>)
			</a>
		</li>
		<li <%=checked[3]%>>
			<a href="manager_order_state.jsp?state=배송완료">
				배송완료(<%=count5%>)
			</a>
		</li>
	</ul>
	<br>
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
	
	<table border="2" width="1200px">
		주문번호:
		<%=ord_no%>
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px">
					<font color="blue"> 배송자 정보 </font>
				</th>
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
				<th>
					<b>[배송상태]</b>
				</th>
				<th>
					<b>[수정]</b>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>
					<a href="../member/manager_member_detail.jsp?id=<%=m_id%>"><%=m_id%></a>
				</th>
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
				<td colspan="2">
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
		<%
		String jsql6 = "select * from order_product where ord_no = ?";
		PreparedStatement pstmt6 = con.prepareStatement(jsql6);
		pstmt6.setInt(1, ord_no);
		ResultSet rs6 = pstmt6.executeQuery();
		%>
		<thead>
			<tr>
				<td colspan="13">&nbsp;</td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th colspan="13" style="font-size: 16px">
					<font color="blue"> 주문목록 </font>
				</th>
			</tr>
		</thead>
		<p>
		<thead>
			<tr>
				<th colspan=3 style="padding: 0px">상품 이미지</th>
				<th colspan=3>상품 이름</th>
				<th colspan=2>상품 가격</th>
				<th colspan=2>수량</th>
				<th colspan=2>금액</th>


			</tr>
		</thead>
		<%
		while (rs6.next()) {
			String p_id = rs6.getString("p_id");
			int ord_no2 = rs6.getInt("ord_no");
			int ord_qty = rs6.getInt("ord_qty");

			String jsql7 = "SELECT p_price,p_name FROM product WHERE p_id = ?";
			PreparedStatement pstmt7 = con.prepareStatement(jsql7);
			pstmt7.setString(1, p_id);
			ResultSet rs7 = pstmt7.executeQuery();
			String jsql8 = "SELECT * FROM ticket WHERE t_id = ?";
			PreparedStatement pstmt8 = con.prepareStatement(jsql8);
			pstmt8.setString(1, p_id);
			ResultSet rs8 = pstmt8.executeQuery();

			while (rs7.next()) {
				String p_name = rs7.getString("p_name");
				int p_price = rs7.getInt("p_price");
				int p_sum = 0;
				p_sum = ord_qty * p_price;
		%>
		<tbody>
			<tr>
				<td class="p_img" colspan=3 align="center">
					<div>
						<a href="../product/manager_product_detail.jsp?p_id=<%=p_id%>">
							<img src="../../img/product/<%=p_id%>.jpg" width=250px height=200px>
						</a>
					</div>

				</td>
				<th colspan=3>
					<a href="../product/manager_product_detail.jsp?p_id=<%=p_id%>"><%=p_name%></a>
				</th>
				<td colspan=2>
					<fmt:formatNumber value="<%=p_price%>" />
					원
				</td>
				<td colspan=2><%=ord_qty%></td>
				<td colspan=2>
					<fmt:formatNumber value="<%=p_sum%>" />
					원
				</td>
			</tr>
		</tbody>
		<%
		} // rs7
		int ord_qty_a = rs6.getInt("ord_qty_a");
		int ord_qty_t = rs6.getInt("ord_qty_t");
		int ord_qty_c = rs6.getInt("ord_qty_c");

		while (rs8.next()) {
		String p_name = rs8.getString("t_name");
		int t_price_adult = rs8.getInt("t_price_adult");
		int t_price_teen = rs8.getInt("t_price_teen");
		int t_price_child = rs8.getInt("t_price_child");

		int t_a_sum = 0;
		int t_t_sum = 0;
		int t_c_sum = 0;
		int t_sum = 0;
		int t_ord_qty = 0;

		t_ord_qty = ord_qty_a + ord_qty_t + ord_qty_c;

		t_a_sum = ord_qty_a * t_price_adult;
		t_t_sum = ord_qty_t * t_price_teen;
		t_c_sum = ord_qty_c * t_price_child;

		t_sum = t_a_sum + t_t_sum + t_c_sum;
		%>
		<tbody>
			<tr>
				<td class="p_img" colspan=3 align="center">
					<a href="../tickets/manager_tickets.jsp?t_id=<%=p_id%>">
						<img src="../../img/tickets/<%=p_id%>.jpg" border=0 width=250px height=200px>
					</a>

				</td>
				<th colspan=3>
					<a href="../tickets/manager_tickets.jsp?t_id=<%=p_id%>"><%=p_name%></a>
				</th>
				<td colspan=2>
					성인 :
					<fmt:formatNumber value="<%=t_price_adult%>" />
					원<br> 청소년 :
					<fmt:formatNumber value="<%=t_price_teen%>" />
					원<br> 어린이 :
					<fmt:formatNumber value="<%=t_price_child%>" />
					원
				</td>
				<td colspan=2>
					성인(<%=ord_qty_a%>)<br> 청소년(<%=ord_qty_t%>)<br> 어린이(<%=ord_qty_c%>)
				</td>
				<td colspan=2>
					<fmt:formatNumber value="<%=t_sum%>" />
					원
				</td>
			</tr>
		</tbody>
		<%
		} // rs6

		}
		}
		%>

	</table>

	<%
	} catch (Exception e) {
	out.println(e);
	}
	%>
	</body>

</center>
<%@ include file="../../layout/footer.jsp"%>
</html>