<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp" %>

	<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project";
     String DB_ID="aqua"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("t_id");
	 
     String jsql = "delete from ticket where t_id=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();
%>
	<jsp:forward page="manager_tickets.jsp" />

	<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>