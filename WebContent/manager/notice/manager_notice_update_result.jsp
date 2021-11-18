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
		request.setCharacterEncoding("utf-8");

		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		String manager_id = request.getParameter("manager_id");
		
		String	notice_date_year = request.getParameter("notice_date_year");
		String	notice_date_month = request.getParameter("notice_date_month");
		String	notice_date_day = request.getParameter("notice_date_day");
		String	notice_date = notice_date_year + "-" +notice_date_month + "-" + notice_date_day;
		
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");

		try {
			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
			String DB_ID = "aqua";
			String DB_PASSWORD = "1234";

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
			
			String jsql = "UPDATE notice SET manager_id=?, notice_date=?, notice_title=?, ";
			jsql = jsql + "notice_content=? WHERE notice_no=?";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, manager_id);
			pstmt.setString(2, notice_date);
			pstmt.setString(3, notice_title);
			pstmt.setString(4, notice_content);
			pstmt.setInt(5, notice_no);

			pstmt.executeUpdate();
			
			String jsql2 = "SELECT * FROM notice WHERE notice_no=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, notice_no);

			ResultSet rs = pstmt2.executeQuery();
			rs.next();
		%>

		<font color="blue" size='6'><b> 수정된 공지는 다음과 같습니다.</b></font>
		<p>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td>공지 번호</td>
				<td><%=rs.getInt("notice_no")%></td>
			</tr>
			<tr>
				<td>매니저 아이디</td>
				<td><%=rs.getString("manager_id")%>
				</td>
			</tr>
			<tr>
				<td>공지 날짜</td>
				<td><%=rs.getDate("notice_date")%>
				</td>
			</tr>
			<tr>
				<td>공지 제목</td>
				<td><%=rs.getString("notice_title")%></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td width=300><%=rs.getString("notice_content")%></td>
			</tr>
		</table>
		<p>
			<a href="manager_notice.jsp" align=center style="font-size: 10pt; font-family: 맑은 고딕">전체 공지 조회</a>
			<%
    } catch (Exception e) {
    	out.println(e);
}
%>
		
	</div>
</body>
</html>