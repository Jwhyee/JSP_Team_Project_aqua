
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>


<%@ page import="java.sql.*"%>

<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	request.setCharacterEncoding("utf-8");

	String ct_no = session.getId(); 
	String reserves = request.getParameter("reserves");
	String oName = request.getParameter("name");
	String oTel = request.getParameter("memTel");
	String oReceiver = request.getParameter("receiver");
	String oEmail1 = request.getParameter("email1");
	String oEmail2 = request.getParameter("email2");
	String oEmail = oEmail1 + "@" + oEmail2;
	String oMassage = request.getParameter("massage");
	String oRcvAddress = request.getParameter("rcvAddress");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	String oRcvPhone = phone1+"-"+phone2+"-"+phone3;
	String oCardNo = request.getParameter("cardNo");
	String oCardPass = request.getParameter("cardPass");
	String oBank = request.getParameter("bank");
	String oPay = request.getParameter("pay");
	
	String usePnt = request.getParameter("use_pnt");
	
	String jsql0 = "SET SQL_SAFE_UPDATES = 0";
	PreparedStatement pstmt0 = con.prepareStatement(jsql0);
	ResultSet rs0 = pstmt0.executeQuery();

	String jsql = "select MAX(ord_no) from order_info order by ord_no";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery();


	int o_num;
	if (rs.next()) 
		o_num = rs.getInt(1) + 1;
							
	else
		o_num = 1; 

	String jsql5 = "select t_id, ct_qty_a, ct_qty_t, ct_qty_c from temp_cart_t where ct_no = ?";
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	pstmt5.setString(1, ct_no);

	ResultSet rs5 = pstmt5.executeQuery();

	
	while (rs5.next()) 
	{
		String t_id = rs5.getString("t_id"); 
		int ct_qty_a = rs5.getInt("ct_qty_a");
		int ct_qty_t = rs5.getInt("ct_qty_t");
		int ct_qty_c = rs5.getInt("ct_qty_c");

		String jsql6 = "INSERT INTO order_product (ord_no, p_id, ord_qty_a, ord_qty_t, ord_qty_c) VALUES (?,?,?,?,?)";
		PreparedStatement pstmt6 = con.prepareStatement(jsql6);
		pstmt6.setString(1, Integer.toString(o_num));
		pstmt6.setString(2, t_id);
		pstmt6.setInt(3, ct_qty_a);
		pstmt6.setInt(4, ct_qty_t);
		pstmt6.setInt(5, ct_qty_c);

		pstmt6.executeUpdate();
	}
	String jsql7 = "INSERT INTO order_info (ord_no, m_id, ord_date, ord_receiver, ord_rcv_address, ord_rcv_phone, ord_pay, ord_bank, ord_card_no, ord_card_pass, m_email, ord_message)  VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	java.util.Date date = new java.util.Date();
	String oDate = date.toLocaleString();

	PreparedStatement pstmt7= con.prepareStatement(jsql7);
	pstmt7.setString(1, Integer.toString(o_num));
	pstmt7.setString(2, sid);
	pstmt7.setString(3, oDate);
	pstmt7.setString(4, oReceiver);
	pstmt7.setString(5, oRcvAddress);
	pstmt7.setString(6, oRcvPhone);
	pstmt7.setString(7, oPay);
	pstmt7.setString(8, oBank);
	pstmt7.setString(9, oCardNo);
	pstmt7.setString(10, oCardPass);
	pstmt7.setString(11, oEmail);
	pstmt7.setString(12, oMassage);
	pstmt7.executeUpdate();
	
	if(usePnt == null){
		String jsql8 = "UPDATE member SET m_reserves = m_reserves + ? WHERE m_id = ?";
		PreparedStatement pstmt8 = con.prepareStatement(jsql8);
		pstmt8.setString(1, reserves);
		pstmt8.setString(2, sid);
		pstmt8.executeUpdate();
	}else{
		String jsql8 = "UPDATE member SET m_reserves = m_reserves + ? - ? WHERE m_id = ?";
		PreparedStatement pstmt8 = con.prepareStatement(jsql8);
		pstmt8.setString(1, reserves);
		pstmt8.setString(2, usePnt);
		pstmt8.setString(3, sid);
		pstmt8.executeUpdate();
	}
	
	response.sendRedirect("direct_product_order_delete.jsp"); //  forward 액션태그를 사용해도 동일함
} catch (Exception e) {
	out.println(e);
}
%>

<%@ include file="../../layout/footer.jsp"%>
</body>
</html>

