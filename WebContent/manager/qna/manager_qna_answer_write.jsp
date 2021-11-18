<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/about_us_style.css">
<title>manager | QnA 답변 작성</title>
</head>
<body>
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<nav></nav>
	<div align="center">
		<h3>QnA</h3>

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String key = request.getParameter("qna_no");

				String jsql = "SELECT * FROM qna where qna_no = ?";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				pstmt.setString(1, key);
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				int qna_no = rs.getInt("qna_no");
			   	String qna_category = rs.getString("qna_category");
				Date qna_date = rs.getDate("qna_date");
				String m_id = rs.getString("m_id");
				String qna_title = rs.getString("qna_title");
				String qna_content = rs.getString("qna_content");
			%>
			<tr id='notice_detail_title'>
				<td align=center width=100 height=50 style="color: #555;"><%=qna_category%></td>
				<td align=left width=500 height=50 style="font-weight: bold">
					<%=qna_title%>
				</td>
			</tr>
			<tr>
				<td align="center" colspan='2' style="padding-top: 30px">
					<%=qna_content%>
				</td>
			</tr>
		</table>

		<hr>
		<h3>답변</h3>
		<form method="post" action="manager_qna_answer_result.jsp">
		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<tr id='qna_detail_title'>
				<td id='table_subtitle_padding'>QnA 번호</td>
				<td>
					<input type="text" name="qna_ref_no" value = "<%=qna_no%>" readonly>
				</td>
			</tr>
			<tr id='qna_detail_title'>
				<td id='table_subtitle_padding'>질문자 ID</td>
				<td>
					<input type="text" name="m_id" value = "<%=m_id%>" readonly>
				</td>
			</tr>
			<tr id='qna_detail_title' style="display: none;">
				<td id='table_subtitle_padding'>답변 작성 여부</td>
				<td>
					<input type="text" name="qna_answer_or_not" value="true" readonly>
				</td>
			</tr>
			<tr id='qna_detail_title' style="display: none;">
				<td id='table_subtitle_padding'>답변 작성일</td>
				<td>
					<input type="text" name="qna_comment_date" value="<%= sf.format(nowTime) %>" readonly>
				</td>
			</tr>
			<tr id='qna_detail_title'>
				<td id='table_subtitle_padding'>Manager ID</td>
				<td>
					<input type="text" name="manager_id">
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="qna_comment" rows="20" cols="100"></textarea>
				</td>
			</tr>
		</table>
			<input type="submit" value="답변 등록">
			<input type="reset" value="취 소">
		</form>
	<%
	    } catch (Exception e) {
	      out.println(e);	
	}
%>
		
	</div>
	<footer> </footer>
</body>
</html>