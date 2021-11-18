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
		<h3> 공지 사항 </h3>

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String key = request.getParameter("notice_no");

				String jsql = "SELECT * FROM notice where notice_no = ?";
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
			<tr id = 'notice_detail_title'>
				<td align=center width = 100 height = 50 style = "color:#555;">공지</td>
				<td align=left width = 500 height = 50 style = "font-weight:bold"> <%=notice_title%> </td>
			</tr>
			<tr>
				<td align="center" colspan='2' style = "padding-top : 30px">
					<%=notice_content%>
				</td>
			</tr>
		</table>
			<%
    } catch (Exception e) {
      out.println("공지사항이 없습니다.");	
}
%>
		
	</div>
	<footer>
	
	</footer>
</body>
</html>