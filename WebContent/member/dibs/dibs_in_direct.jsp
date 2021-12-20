<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/header.jsp"%>
<%
try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String dibs_no = session.getId(); 
		String p_id = request.getParameter("p_id"); 

		String jsql = "SELECT * FROM dibs WHERE m_id = ? AND p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, sid);
		pstmt.setString(2, p_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) 
		{ 
			String jsql2 = "DELETE FROM dibs WHERE m_id=? AND p_id = ?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1, sid);
			pstmt2.setString(2, p_id);

			pstmt2.executeUpdate();
		} else 
		{
			String jsql2 = "INSERT INTO dibs (dibs_no, p_id, m_id) VALUES (?,?,?)";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1, dibs_no);
			pstmt2.setString(2, p_id);
			pstmt2.setString(3, sid);
			pstmt2.executeUpdate();
		} 
		
	} catch (Exception e) {
		out.println(e);
	} // catch문 닫기		

	
	%>
	<jsp:forward page = "../mypage/mypage_dibs.jsp"/>;
</body>
</html>
<%@ include file="../../layout/footer.jsp"%>
