<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel = "stylesheet" href = "../css/about_us_style.css">
	<title>aqua | 공지 사항</title>
</head>
<body>
	<nav>
	
	</nav>
	<div align="center">

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
			<tr id = 'notice_title_line'>
				<td align=center width = 100>공지번호</td>
				<td align=center width = 150>공지 작성일</td>
				<td align=center width = 500>공지 제목</td>
			</tr>

			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

				String jsql = "SELECT * FROM notice";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					int notice_no = rs.getInt("notice_no");
					Date notice_date = rs.getDate("notice_date");
					String notice_title = rs.getString("notice_title");
			%>
			<tr id = 'notice_line' style = "cursor:pointer;">
				<td align="center">
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_no%></a>
				</td>
				<td align="center">
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_date%></a>
				</td>
				<td align="center" height = 50 style=" text-overflow:ellipsis; overflow:hidden">
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_title%></a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
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