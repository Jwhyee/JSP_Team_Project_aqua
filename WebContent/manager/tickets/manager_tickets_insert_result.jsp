<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ include file="../../layout/header_manager.jsp" %>
	<%
	request.setCharacterEncoding("utf-8");
	
	
	String t_id = request.getParameter("t_id");
	String t_in_date = request.getParameter("t_in_date");
	String t_place = request.getParameter("t_place");
	String	t_name = request.getParameter("t_name");
	int t_price_adult = Integer.parseInt(request.getParameter("t_price_adult"));
	int t_price_teen = Integer.parseInt(request.getParameter("t_price_teen"));
	int t_price_child = Integer.parseInt(request.getParameter("t_price_child"));
	String	t_description = request.getParameter("t_description");

	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		


		String jsql = "INSERT INTO ticket (t_id, t_in_date, t_place, t_name, t_price_adult, t_price_teen, t_price_child, t_description) VALUES  (?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(jsql);

		pstmt.setString(1, t_id);
		pstmt.setString(2, t_in_date);
		pstmt.setString(3, t_place);
		pstmt.setString(4, t_name);
		pstmt.setInt(5, t_price_adult);
		pstmt.setInt(6, t_price_teen);
		pstmt.setInt(7, t_price_child);
		pstmt.setString(8, t_description);
		
		pstmt.executeUpdate();
		
	%>
	<div align="center">
		<font color="blue" size='6'><b>[등록된 티켓 정보]</b></font>
		<p>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td width="100">티켓 ID</td>
				<td width="300"><%=t_id%></td>
			</tr>
			<tr>
				<td width="100">티켓 등록일</td>
				<td width="300"><%=t_in_date%></td>
			</tr>
			<tr>
				<td width="100">관람 장소</td>
				<td width="300"><%=t_place%></td>
			</tr>
			<tr>
				<td width="100">티켓 이름</td>
				<td width="300"><%=t_name%></td>
			</tr>
			<tr>
				<td width="100">티켓 가격</td>
				<td width="300">
					성  인(만 19세 이상) <%=t_price_adult%>  원<br><br>
					청소년(만 13세 ~ 18세) <%=t_price_teen%>  원<br><br>
					어린이(만 4세 ~ 12세) <%=t_price_child%>  원
				</td>
			</tr>
			<tr>
				<td width="100">티켓 설명</td>
				<td width="300"><%=t_description%></td>
			</tr>
		</table>
		<p>
			<%
			} catch (Exception e) {
			out.println(e);
			}
			%>
		
		<p>
			<a href="manager_tickets.jsp" style="font-size: 10pt; font-family: 맑은 고딕">전체 티켓 조회</a>
			<br>
			<br>
	</div>
</body>
</html>