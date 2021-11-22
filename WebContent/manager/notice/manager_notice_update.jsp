<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/header_manager.jsp" %>
<link rel="stylesheet" href="../../css/about_us_style.css?abc">
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<div align="center">

		<%
		try {
			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project"; //  접속할 DB명
			String DB_ID = "aqua"; //  접속할 아이디
			String DB_PASSWORD = "1234"; // 접속할 패스워드

			Class.forName("org.gjt.mm.mysql.Driver"); // JDBC 드라이버 로딩
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String key = request.getParameter("notice_no");

			String jsql = "SELECT * FROM notice WHERE notice_no = ?";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();//SQL문 실행	
			rs.next();

			 int notice_no = rs.getInt("notice_no");
		   	 String manage_id = rs.getString("manager_id");
			 Date notice_date = rs.getDate("notice_date");
			 String notice_title = rs.getString("notice_title");
			 String notice_content = rs.getString("notice_content");
		%>

		<font color="blue" size='6'><b>[공지 정보 수정]</b></font>
		<br><br>
		<p>
		<form method="post" action="manager_notice_update_result.jsp">
			<table id = 'manager_n_up_table' border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td id = 'manager_n_up_title'>공지 번호</td>
					<td>
						<input type="hidden" name="notice_no" value="<%=notice_no%>"><%=notice_no%></td>
				</tr>
				<tr>
					<td id = 'manager_n_up_title'>매니저 아이디</td>
					<td>
						<input type=text name="manager_id" value="<%=manager_id%>">
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_up_title'>수정일</td>
					<td>
						<input type=text name="notice_date_year" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_up_title'>공지 제목</td>
					<td>
						<input type=text name="notice_title" value="<%=notice_title%>">
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_up_title'>공지 내용</td>
					<td>
						<textarea name="notice_content" rows="5" cols="30"><%=notice_content%> </textarea>
					</td>
				</tr>
			</table>
			<br><br>
			<input type="submit" value="수정완료">
		</form>
		<br> <br> <br>


		<%
		} catch (Exception e) {
		out.println(e);
		}
		%>
	</div>
</body>
</html>