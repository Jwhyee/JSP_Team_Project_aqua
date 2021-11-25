<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*"%>

<body>

	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String ct_no = session.getId(); //  세션번호(장바구니번호)를 가져옴

		String jsql = "delete from temp_cart_t where ct_no=?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ct_no);

		pstmt.executeUpdate();

	
	%>
	<br>
	<br>
	<center>
	<font size=6 color=blue><b>[상품 주문 완료]</b></font>
	<p>
		상품 주문이 완료되었습니다.<br>
		<br> 주문하신 상품은 주문 완료 후 2일 이내에 배송될 예정입니다.<br>
		<br> 남서울 멀티쇼핑몰(주)을 이용해 주셔서 감사합니다!
	</p>
	</center>
<%
 } catch (Exception e) {
 out.println(e);
 }
 %>
		<%@ include file="../../layout/footer.jsp"%>
	
</body>
</html>