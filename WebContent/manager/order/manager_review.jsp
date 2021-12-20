<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp" %>
<link rel="stylesheet" href="../../css/mypage_qna.css?abc">
	<div align="center">
	<font color="blue" size='6'><b>[전체 리뷰 조회]</b></font>
		<p>

		<table id = 'manager_q_sel_table' border="1" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<tr>
				<td id = 'manager_q_sel_title' width = 50>No.</td>
				<td id = 'manager_q_sel_title' width = 100>작성자</td>
				<td id = 'manager_q_sel_title' width = 70>카테고리</td>
				<td id = 'manager_q_sel_title' width = 100>상품명</td>
				<td id = 'manager_q_sel_title' width = 300>리뷰 내용</td>
				<td id = 'manager_q_sel_title' width = 100>작성 일자</td>
				<td id = 'manager_q_sel_title' width = 100>배송 만족도</td>
				<td id = 'manager_q_sel_title' width = 100>상품 만족도</td>
			</tr>

			<%
			
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String jsql2 = "SELECT * FROM review ORDER BY r_category";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				
				ResultSet rs = pstmt2.executeQuery();

				while (rs.next()) {
					int r_no = rs.getInt("r_no");
					String r_category = rs.getString("r_category");
					Date r_date = rs.getDate("r_date");
					String r_product = rs.getString("r_product");
					String r_writer = rs.getString("r_writer");
					String r_content = rs.getString("r_content");
					String d_satisfy = rs.getString("d_satisfy");
					String p_satisfy = rs.getString("p_satisfy");
			%>
			<tr>
				<td align="center">
					<a><%=r_no%></a>
				</td>
				<td align="center">
					<a><%=r_writer%></a>
				</td>
				<td align="center">
					<a><%=r_category%></a>
				</td>
				<td align="center">
					<a><%=r_product%></a>
				</td>
				<td align="center" height=50 style="text-overflow: ellipsis; overflow: hidden">
					<a><%=r_content%></a>
				</td>
				<td align="center">
					<a><%=r_date%></a>
				</td>
				<td align="center">
					<a><%=d_satisfy%></a>
				</td>
				<td align="center">
					<a><%=p_satisfy%></a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
		<%
    } catch (Exception e) {
      out.println(e);	
}
%>

	</div>
</body>
</html>