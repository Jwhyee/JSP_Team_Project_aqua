<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>

<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "delete from dibs where m_id=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, sid);

	pstmt.executeUpdate();
	response.sendRedirect("../mypage/mypage_dibs.jsp"); //   <jsp:forward page="showCart.jsp"/>와 같은 의미임

} catch (Exception e) {
	out.println(e);
}
%>
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>