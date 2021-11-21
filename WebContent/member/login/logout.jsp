<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%
String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
String DB_ID = "aqua";
String DB_PASSWORD = "1234";

Class.forName("org.gjt.mm.mysql.Driver");  
 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String jsql2 = "delete from cart";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.executeUpdate();
	
	String jsql = "delete from temp_cart";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.executeUpdate();
	
    session.invalidate();    //  세션설정을 무효화시킴
    response.sendRedirect("../index.jsp");     //  <jsp:forward page="index.html"/>과 동일한 의미
%>