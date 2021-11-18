<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">

		<%
		try {
			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
			String DB_ID = "aqua";
			String DB_PASSWORD = "1234";

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String key = request.getParameter("notice_no");

			String jsql = "select * from notice where notice_no = ?";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			int notice_no = rs.getInt("notice_no");
			String manager_id = rs.getString("manager_id");
			Date notice_date = rs.getDate("notice_date");
			String notice_title = rs.getString("notice_title");
			String notice_content = rs.getString("notice_content");
		%>

		<font color="blue" size='6'><b>[공지 삭제 확인]</b></font>
		<p>
			<br> <br>
		<h4>다음 공지를 삭제하시겠습니까?</h4>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td width=100>공지 번호</td>
				<td width=200><%=notice_no%></td>
			</tr>
			<tr>
				<td>매니저 아이디</td>
				<td><%=manager_id%></td>
			</tr>
			<tr>
				<td>공지 작성일</td>
				<td><%=notice_date%></td>
			</tr>
			<tr>
				<td>공지 제목</td>
				<td><%=notice_title%></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><%=notice_content%></td>
			</tr>
		</table>
		<p>

			<a href="manager_notice_delete_result.jsp?notice_no=<%=notice_no%>" style="font-size: 10pt; font-family: 맑은 고딕">삭제</a>
			&nbsp;&nbsp;
			<a href="manager_notice.jsp" style="font-size: 10pt; font-family: 맑은 고딕">취소</a>
			<%
    } catch (Exception e) {
    	out.println(e);
}
%>
		
	</div>
</body>
</html>