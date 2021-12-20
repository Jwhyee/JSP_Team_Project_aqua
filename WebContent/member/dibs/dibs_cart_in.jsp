<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*"%>

<html>
<body>
	<%
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String ct_no = session.getId(); //세션 번호를 장바구니 번호(ctNo)로서 이용하기 위해 ctNo에 저장
		String p_id = request.getParameter("p_id"); // 상품번호

		String jsql = "select * from cart where ct_no = ? and p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ct_no);
		pstmt.setString(2, p_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			int sum = rs.getInt("ct_qty") + 1;

			String jsql2 = "update cart set ct_qty=? where ct_no=? and p_id=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ct_no);
			pstmt2.setString(3, p_id);

			pstmt2.executeUpdate();
		} else {

			String jsql3 = "insert into cart (ct_no, p_id) values (?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, ct_no);
			pstmt3.setString(2, p_id);
			pstmt3.executeUpdate();
		}

		String jsql4 = "DELETE FROM dibs WHERE p_id = ?";
		PreparedStatement pstmt4 = con.prepareStatement(jsql4);
		pstmt4.setString(1, p_id);
		pstmt4.executeUpdate();

	} catch (Exception e) {
		out.println(e);
	}

	response.sendRedirect("../order/cart_show.jsp");
	%>
</body>
</html>
