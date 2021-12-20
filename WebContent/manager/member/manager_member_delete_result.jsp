<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/header.jsp"%>
<%
try {
 	String DB_URL="jdbc:mysql://localhost:3306/aqua_project";   //  DB명이 project임
    String DB_ID="aqua"; 
    String DB_PASSWORD="1234";
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
 	String key = request.getParameter("id");
 	String jsql = "delete from member where m_id=?"; 
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);
	 
	String jsql2 = "delete from cart where m_id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, sid);
	pstmt2.executeUpdate();
		
	String jsql3 = "delete from review where r_writer = ?";
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1, sid);
	pstmt3.executeUpdate();
		
	String jsql4 = "delete from dibs where m_id = ?";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, sid);
	pstmt4.executeUpdate();
		
	String jsql5 = "delete from qna where m_id = ?";
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	pstmt5.setString(1, sid);
	pstmt5.executeUpdate();
	
	String jsql6 = "delete from temp_recent where m_id = ?";
	PreparedStatement pstmt6 = con.prepareStatement(jsql6);
	pstmt6.setString(1, sid);
	pstmt6.executeUpdate();
			
	 
	 pstmt.executeUpdate();
%>
<jsp:forward page="manager_member_select.jsp"/>
</body>
<%} catch(Exception e) { 
		out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
</html>