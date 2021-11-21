<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp" %>

	<div align="center">
		<font color="blue" size='6'><b>[전체 공지 조회]</b></font>
		<p>
		<table border="1" width=1000 style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
			<tr>
				<td align=center>공지번호</td>
				<td align=center>매니저 아이디</td>
				<td align=center>공지 작성일</td>
				<td align=center>공지 제목</td>
				<td align=center>공지 내용</td>
				<td align=center>
					<b><font color=blue>[수정]</font></b>
				</td>
				<td align=center>
					<b><font color=blue>[삭제]</font></b>
				</td>
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
					String manage_id = rs.getString("manager_id");
					Date notice_date = rs.getDate("notice_date");
					String notice_title = rs.getString("notice_title");
					String notice_content = rs.getString("notice_content");
			%>
			<tr>
				<td align="center">
					<%=notice_no%>
				</td>
				<td align="center">
					<%=manage_id%>
				</td>
				<td align="center">
					<%=notice_date%>
				</td>
				<td align="center" style="text-overflow:ellipsis; overflow:hidden">
					<%=notice_title%>
				</td>
				<td align="center" width=300 height=20 style="text-overflow:ellipsis; overflow:hidden">
					<%=notice_content%>
				</td>
				<td>
					<a href="manager_notice_update.jsp?notice_no=<%=notice_no%>">
						<div align="center">Yes</div>
					</a>
				</td>
				<td>
					<a href="manager_notice_delete.jsp?notice_no=<%=notice_no%>">
						<div align="center">Yes</div>
					</a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
		<p>
			<br>
			<a href="manager_notice_insert.jsp" align=center style="font-size: 10pt; font-family: 맑은 고딕">신규 공지 등록</a>
			<br> <br>

			<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
</body>
</html>