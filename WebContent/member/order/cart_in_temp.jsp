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
		int ct_qty = Integer.parseInt(request.getParameter("amount")); //  주문수량(장바구니에 담을 상품수량)

		String jsql = "select * from cart where ct_no = ? and p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ct_no);
		pstmt.setString(2, p_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) // 동일 상품이 이미 장바구니에 존재한다면 수량만을 추가시킴.
		{ // 즉, update문을 사용하여 이미 존재하는 상품데이터의 수량부분만을 갱신시킴.
			int sum = rs.getInt("ct_qty") + ct_qty; //  이미 기존에 있는 수량에다 새로 추가시킬 수량을 합산함.

			String jsql2 = "update cart set ct_qty=? where ct_no=? and p_id=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ct_no);
			pstmt2.setString(3, p_id);

			pstmt2.executeUpdate();
		} else // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart (ct_no, p_id, ct_qty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, ct_no);
			pstmt3.setString(2, p_id);
			pstmt3.setInt(3, ct_qty);

			pstmt3.executeUpdate();
		}

	} catch (Exception e) {
		out.println(e);
	} // catch문 닫기		

	%>
</body>
<jsp:forward page="../product/goods_select.jsp" />
</html>
