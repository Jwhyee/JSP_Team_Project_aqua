<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel = "stylesheet" href = "../../css/about_us_style.css">
	
	<!--<body> -> header.jsp에 있음-->
	<div align="center">

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
			<tr id = 'abu_notice_title_line'>
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
			<tr id = 'abu_notice_list'>
				<td align="center" width = 100>
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_no%></a>
				</td>
				<td align="center" width = 150 style="display:none;">
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_date%></a>
				</td>
				<td align="left" width = 700 height = 100 style=" text-overflow:ellipsis; overflow:hidden">
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>"><%=notice_title%></a>
				</td>
				<td align="right" width = 100 height = 100>
					<a href="about_us_notice_detail_view.jsp?notice_no=<%=notice_no%>">>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
		<br><br>
			<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>