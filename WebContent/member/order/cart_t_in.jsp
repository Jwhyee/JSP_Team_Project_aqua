<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		String t_id = request.getParameter("t_id"); // 상품번호
		int ct_qty_a = Integer.parseInt(request.getParameter("amount_adult"));
		int ct_qty_t = Integer.parseInt(request.getParameter("amount_teen"));
		int ct_qty_c = Integer.parseInt(request.getParameter("amount_child"));
		//  주문수량(장바구니에 담을 상품수량)

		String jsql = "select * from cart_t where ct_no = ? and t_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ct_no);
		pstmt.setString(2, t_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) // 동일 상품이 이미 장바구니에 존재한다면 수량만을 추가시킴.
		{ // 즉, update문을 사용하여 이미 존재하는 상품데이터의 수량부분만을 갱신시킴.
			int sum_a = rs.getInt("ct_qty_a") + ct_qty_a; //  이미 기존에 있는 수량에다 새로 추가시킬 수량을 합산함.
			int sum_t = rs.getInt("ct_qty_t") + ct_qty_t;
			int sum_c = rs.getInt("ct_qty_c") + ct_qty_c;
			
			String jsql2 = "update cart_t set ct_qty_a=?, ct_qty_t=?, ct_qty_t=? where ct_no=? and t_id=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum_a);
			pstmt2.setInt(2, sum_t);
			pstmt2.setInt(3, sum_c);
			pstmt2.setString(4, ct_no);
			pstmt2.setString(5, t_id);

			pstmt2.executeUpdate();
		} else // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart_t (ct_no, t_id, ct_qty_a, ct_qty_t, ct_qty_c) values (?,?,?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, ct_no);
			pstmt3.setString(2, t_id);
			pstmt3.setInt(3, ct_qty_a);
			pstmt3.setInt(4, ct_qty_t);
			pstmt3.setInt(5, ct_qty_c);

			pstmt3.executeUpdate();
		}
		
	} catch (Exception e) {
		out.println(e);
	} // catch문 닫기		

	response.sendRedirect("cart_show.jsp");
	%>
</body>
</html>
