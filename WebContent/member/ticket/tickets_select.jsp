<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel="stylesheet" href="../../css/tickets_style.css?a">


<!--<body> -> header.jsp에 있음-->
	<div align="center">
			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

				String jsql = "SELECT * FROM ticket";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String t_id = rs.getString("t_id");
					Date t_in_date = rs.getDate("t_in_date");
					String t_place = rs.getString("t_place");
					String t_name = rs.getString("t_name");
					int t_price_adult = rs.getInt("t_price_adult");
					int t_price_teen = rs.getInt("t_price_teen");
					int t_price_child = rs.getInt("t_price_child");
					String t_description = rs.getString("t_description");
			%>
			<div class='t_select_wrap'>
				<a href="tickets_detail.jsp?t_id=<%=t_id%>">
					<table id = 't_select' border="0">
					<tr>
						<td align=center rowspan="6" width = "200px">
							<img src="../../img/tickets/<%=t_id%>.jpeg" width="160" height="160">
						</td>
						<td id = 't_name_head' colspan="3">&nbsp&nbsp<%=t_name %></td>
					</tr>
					<tr>
						<td id='t_title'>
							<b>&nbsp&nbsp장소</b>
						</td>
						<td id='t_desc' colspan="2">
							<%=t_place%>
						</td>
					</tr>
					<tr>
						<td id='t_title' rowspan="3" style="vertical-align: top;">
							<b>&nbsp&nbsp가격</b>
						</td>
						<td id='t_desc' colspan="2">
							성인(만 19세 이상) : <%=t_price_adult%>원
						</td>
					</tr>
					<tr>
						<td id='t_desc' colsrpan="2">
							청소년(만 13세 ~ 18세) : <%=t_price_teen%>원
						</td>
					</tr>
					<tr>
						<td id='t_desc' colspan="2">
							어린이(만 4세 ~ 12세) : <%=t_price_child%>원
						</td>
					</tr>
				</table>
			</a>
		</div>
		<br>
				<%
		 }
	%>

			<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>

</html>