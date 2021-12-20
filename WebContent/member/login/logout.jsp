<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String sid = (String) session.getAttribute("sid");
String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
String DB_ID = "aqua";
String DB_PASSWORD = "1234";

Class.forName("org.gjt.mm.mysql.Driver");  
 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	
    session.invalidate();    //  세션설정을 무효화시킴
    response.sendRedirect("../../index.jsp");  
%>