<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>장바구니 비우기</title>
</head>
<body>
<%
try { 
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";
	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String p_id = request.getParameter("p_id");
	
	String jsql = "delete from cart where p_id=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, p_id);
	
	pstmt.executeUpdate();
	response.sendRedirect("cart_show.jsp");    //   <jsp:forward page="showCart.jsp"/>와 같은 의미임
			
    } catch (Exception e) {
      out.println(e);
}
%>
</body>
</html>