<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel = "stylesheet" href = "../css/about_us_style.css">
	<title>aqua | 문의 내역</title>
</head>
<body>
	<nav>
	
	</nav>
	<div align="center">

			<%
			request.setCharacterEncoding("utf-8");
			
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_category = request.getParameter("qna_category");
			
			String qna_date = request.getParameter("qna_date");
			String qna_answer_or_not = request.getParameter("qna_answer_or_not");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			
			String m_id = request.getParameter("m_id");
			
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String jsql = "INSERT INTO qna (qna_no, qna_answer_or_not, qna_category, qna_date, qna_title, qna_content, m_id) VALUES (null, ?, ?, ?, ?, ?, ?)";

				PreparedStatement pstmt = con.prepareStatement(jsql);
				
				pstmt.setBoolean(1, false);
				pstmt.setString(2, qna_category);
				pstmt.setString(3, qna_date);
				pstmt.setString(4, qna_title);
				pstmt.setString(5, qna_content);
				pstmt.setString(6, m_id);
				
				pstmt.executeUpdate();
				%>
				<div align="center">
					<font color="blue" size='6'><b>[등록된 공지 정보]</b></font>
					<p>
					<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
						<tr>
							<td width="100">qna_no</td>
							<td width="300"><%=qna_no%></td>
						</tr>
						<tr>
							<td width="100">qna_category</td>
							<td width="300"><%=qna_category%></td>
						</tr>
						<tr>
							<td width="100">qna_answer_or_not</td>
							<td width="300"><%=qna_answer_or_not%></td>
						</tr>
						<tr>
							<td width="100">qna_title</td>
							<td width="300"><%=qna_title%></td>
						</tr>
						<tr>
							<td width="100">qna_content</td>
							<td width="300"><%=qna_content%></td>
						</tr>
					</table>
					<p>
					<jsp:forward page="mypage_inquiries.jsp"/>
						<%
						
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<footer>
	
	</footer>
</body>
</html>