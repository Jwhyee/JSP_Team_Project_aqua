<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Ticket</title>
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

			String key = request.getParameter("t_id");

			String jsql = "select * from ticket where t_id = ?";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			
			String t_id = rs.getString("t_id");
			Date t_in_date = rs.getDate("t_in_date");
			String t_place = rs.getString("t_place");
			String t_name = rs.getString("t_name");
			int t_price_adult = rs.getInt("t_price_adult");
			int t_price_teen = rs.getInt("t_price_teen");
			int t_price_child = rs.getInt("t_price_child");
			String t_description = rs.getString("t_description");
		%>

		<font color="blue" size='6'><b>[티켓 삭제 확인]</b></font>
		<p>
			<br> <br>
		<h4>다음 티켓 삭제하시겠습니까?</h4>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td width=100>티켓 ID</td>
				<td width=200><%=t_id%></td>
			</tr>
			<tr>
				<td>티켓 등록일</td>
				<td><%=t_in_date%></td>
			</tr>
			<tr>
				<td>관람 장소</td>
				<td><%=t_place%></td>
			</tr>
			<tr>
				<td>티켓 이름</td>
				<td><%=t_name%></td>
			</tr>
			<tr>
				<td>티켓 가격</td>
				<td>
					성  인(만 19세 이상) <%=t_price_adult%>  원<br><br>
					청소년(만 13세 ~ 18세) <%=t_price_teen%>  원<br><br>
					어린이(만 4세 ~ 12세) <%=t_price_child%>  원
				</td>
			</tr>
			<tr>
				<td>티켓 설명</td>
				<td><%=t_description%></td>
			</tr>
		</table>
		<p>

			<a href="manager_tickets_delete_result.jsp?t_id=<%=t_id%>" style="font-size: 10pt; font-family: 맑은 고딕">삭제</a>
			&nbsp;&nbsp;
			<a href="manager_tickets.jsp" style="font-size: 10pt; font-family: 맑은 고딕">취소</a>
			<%
    } catch (Exception e) {
    	out.println(e);
}
%>
		
	</div>
</body>
</html>