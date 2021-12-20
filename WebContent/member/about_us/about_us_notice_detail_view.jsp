<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel = "stylesheet" href = "../../css/about_us_style.css?ab">

<!--<body> -> header.jsp에 있음-->
	<div align="center">
		<p style="font-size:25pt; color:#333;">공지사항</p>
		<br>

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
		<tr>
				<td colspan='2' style = "border-top : none;">
					<input id = "abu_notice_list_btn" type="button" value = "목록 보기" onClick="location.href='about_us_notice.jsp'">
				</td>
			</tr>
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
				
				notice_content = notice_content.replace("\r\n","<br>");
			%>
			<tr id = 'abu_notice_detail_title'>
				<td align=center width = 100 style = "color:#555;">공지</td>
				<td align=left width = 700 style="font-weight:normal"> <%=notice_title%> </td>
			</tr>
			<tr>
				<td name ="notice_content"id = 'abu_notice_detail_content' align="center" colspan='2'>
					<img src="../../img/notice/<%=notice_no%>.jpeg" width = 800>
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
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>