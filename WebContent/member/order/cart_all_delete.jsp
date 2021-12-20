<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="../../css/style-cart.css?v12123">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script language="javascript" src="../../js/order.js?v1123"></script>
<body>

	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String ct_no = session.getId(); //  세션번호(장바구니번호)를 가져옴
		String case_no = request.getParameter("case");

		String jsql = "delete from cart where ct_no=?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ct_no);

		pstmt.executeUpdate();

		String jsql2 = "delete from cart_t where ct_no=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ct_no);

		pstmt2.executeUpdate();
		

		if (case_no != null) //  (1) 주문완료로 인한 장바구니 비우기 수행하고 난 후의 주문완료 메시지 출력
		{ 
			
			String jsql3 = "SELECT * FROM order_info ORDER BY ord_no DESC LIMIT 1";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			ResultSet rs3 = pstmt3.executeQuery();
			rs3.next();

			String ord_date = rs3.getString("ord_date");
			String ord_receiver = rs3.getString("ord_receiver");
			String ord_rcv_phone = rs3.getString("ord_rcv_phone");
			String ord_rcv_address = rs3.getString("ord_rcv_address");
			String ord_pay = rs3.getString("ord_pay");
			String ord_bank = rs3.getString("ord_bank");
			String ord_card_no = rs3.getString("ord_card_no");
			String ord_card_pass = rs3.getString("ord_card_pass");
			String ord_message = rs3.getString("ord_message");
			String ord_email = rs3.getString("m_email");
	%>
	<div id="backbody">
		<div id="frame">
			<div id="frame2">
				<span style="font-size: 14pt; font-weight: bold;">성공적으로 구매가 됐습니다. 아래의 결제 정보를 확인해주세요</span>
			</div>
			<%

			String jsql4 = "select * from member where m_id = ?";
			PreparedStatement pstmt4 = con.prepareStatement(jsql4);
			pstmt4.setString(1, sid);

			ResultSet rs4 = pstmt4.executeQuery();
			rs4.next();
			String name = rs4.getString("m_name");
			String phone = rs4.getString("m_phone");
			String address = rs4.getString("m_address");
			String email = rs4.getString("m_email");
			String reserves = rs4.getString("m_reserves");
			%>
			<br /> <br />
			<!-- 배송자 정보 -->
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;구매자정보</span>
			<table class="delivery">
				<thead>
					<tr>
						<td class="deliverytd">
							보내시는 분&nbsp;
						</td>
						<td>
							<%=name%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							주소&nbsp;
						</td>
						<td>
							<%=address%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							휴대전화&nbsp;
						</td>
						<td>
							<%=phone%>
						</td>
					</tr>
				</thead>
			</table>
			<br> <br>
			<!-- 배송 정보 -->
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;배송정보</span>
			<table class="delivery">
				<thead>
					<tr>
						<td class="deliverytd">
							받으시는 분&nbsp;
						</td>
						<td>
							<%=ord_receiver%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							주소&nbsp;
						</td>
						<td>
							<%=ord_rcv_address%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							휴대전화&nbsp;
						</td>
						<td>
							<%=ord_rcv_phone%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							이메일&nbsp;
						</td>
						<td>
							<%=ord_email%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">배송메세지</td>
						<td>
							<textarea rows="5" style="resize:none;" cols="100" name="massage" readonly><%=ord_message%></textarea>
						</td>
					</tr>
				</thead>
			</table>
			<br />

			<!-- 결제 정보 테이블 -->
			
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;결제정보</span>
			<table class="delivery">
				<thead>
					<%if(ord_bank.equals("0")){ %>
					<tr>
						<td class="deliverytd">
							카드번호&nbsp;
						</td>
						<td>
							<%=ord_card_no%>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							카드 비밀번호&nbsp;
						</td>
						<td>
							<%=ord_card_pass%>
						</td>
					</tr>
					<%}else{ %>
					<tr>
						<td class="deliverytd">
							무통장 입금 은행&nbsp;
						</td>
						<td>
							<%=ord_bank%>
						</td>
					</tr>
					<%} %>
					<tr>
						<td class="deliverytd">
							결제 금액&nbsp;
						</td>
						<td>
							<fmt:formatNumber value="<%=ord_pay%>" type="number" /> 원
						</td>
					</tr>
					<tr>
						<td class="deliverytd">남은 적립금</td>
						<td>
							<fmt:formatNumber value="<%=reserves%>" type="number" /> 원
						</td>
					</tr>
				</thead>
			</table>
			<br />
			<a href="../mypage/mypage_order.jsp" style="font-size:10pt;font-family:맑은 고딕; color : white; border : none;" class ="btn btn-large btn-primary">구매내역 이동</a>
		</div>
	</div>
	<%
	} else //  (2) 주문과 상관없이 장바구니 비우기를 수행한 경우의 출력
	{
	response.sendRedirect("cart_show.jsp");
	%>

	<%
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>