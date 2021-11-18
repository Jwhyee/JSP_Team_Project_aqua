<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice result</title>
</head>
<body>
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
		


		String jsql = "INSERT INTO notice (notice_no, manager_id, notice_date, notice_title, notice_content) VALUES  (null, ?, ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(jsql);

		pstmt.setString(1, manager_id);
		pstmt.setString(2, notice_date);
		pstmt.setString(3, notice_title);
		pstmt.setString(4, notice_content);
		
		pstmt.executeUpdate();
		
		 String jsql2 = "ALTER TABLE `notice` AUTO_INCREMENT=1";
		 PreparedStatement pstmt2 = con.prepareStatement(jsql2);

		 pstmt2.executeUpdate();
		 
		 String jsql3 = "SET @COUNT = 0";
		 PreparedStatement pstmt3 = con.prepareStatement(jsql3);

		 pstmt3.executeUpdate();
		 
		 String jsql4 = "UPDATE `notice` SET notice_no = @COUNT:=@COUNT+1";
		 PreparedStatement pstmt4 = con.prepareStatement(jsql4);

		 pstmt4.executeUpdate();
		
	%>
	<div align="center">
		<font color="blue" size='6'><b>[등록된 공지 정보]</b></font>
		<p>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td width="100">Notice No</td>
				<td width="300"><%=notice_no%></td>
			</tr>
			<tr>
				<td width="100">매니저 아이디</td>
				<td width="300"><%=manager_id%></td>
			</tr>
			<tr>
				<td width="100">공지 작성일</td>
				<td width="300"><%=notice_date%></td>
			</tr>
			<tr>
				<td width="100">공지 제목</td>
				<td width="300"><%=notice_title%></td>
			</tr>
			<tr>
				<td width="100">공지 내용</td>
				<td width="300"><%=notice_content%></td>
			</tr>
		</table>
		<p>
			<%
			} catch (Exception e) {
			out.println(e);
			}
			%>
		
		<p>
			<a href="manager_notice.jsp" style="font-size: 10pt; font-family: 맑은 고딕">전체 공지 조회</a>
			<br>
			<br>
	</div>
</body>
</html>