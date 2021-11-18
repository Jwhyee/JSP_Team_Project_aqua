<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project";
     String DB_ID="aqua"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("notice_no");
	 
     String jsql = "delete from notice where notice_no=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();
 	 
	 String jsql2 = "ALTER TABLE `notice` AUTO_INCREMENT=1";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);

	 pstmt2.executeUpdate();
	 
	 String jsql3 = "SET @COUNT = 0";
	 PreparedStatement pstmt3 = con.prepareStatement(jsql3);

	 pstmt3.executeUpdate();
	 
	 String jsql4 = "UPDATE `notice` SET notice_no = @COUNT:=@COUNT+1";
	 PreparedStatement pstmt4 = con.prepareStatement(jsql4);

	 pstmt4.executeUpdate();
%>
	<jsp:forward page="manager_notice.jsp" />

	<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>