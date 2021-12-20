<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel = "stylesheet" href = "../../css/review_style.css?a">
	
	<!--<body> -> header.jsp에 있음-->
	<div align="center">

		

			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";
				
				String t_id = request.getParameter("t_id");
				String p_id = request.getParameter("p_id");
				
				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

				String jsql = "SELECT * FROM product where p_id = ?";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				pstmt.setString(1, p_id);
				ResultSet rs = pstmt.executeQuery();

				String jsql2 = "SELECT * FROM ticket where t_id = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, t_id);
				ResultSet rs2 = pstmt2.executeQuery();
			%>
				<table id = 'review_p_list_table' border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
					
			<%
				if(rs.next()){
					%>
					<tr id = 'review_p_list_title_line' height = 30>
						<td width="100">작성일</td>
						<td width="150">작성자</td>
						<td width="200">상품 이름</td>
						<td width="100">배송 만족도</td>
						<td width="100">상품 만족도</td>
					</tr>
					<%
					String p_name = rs.getString("p_name");
					
					String jsql3 = "SELECT * FROM review where r_product = ?";
					PreparedStatement pstmt3 = con.prepareStatement(jsql3);
					pstmt3.setString(1, p_name);
					ResultSet rs3 = pstmt3.executeQuery();
					
					while(rs3.next()){
						String r_writer = rs3.getString("r_writer");
						String r_product = rs3.getString("r_product");
						String r_date = rs3.getString("r_date");
						String d_satisfy = rs3.getString("d_satisfy");
						String p_satisfy = rs3.getString("p_satisfy");
						String r_content = rs3.getString("r_content");
					
			%>
						<tr id = 'review_p_list_content_line'>
							<td>
								<%=r_date%>
							</td>
							<td>
								<%=r_writer%>
							</td>
							<td>
								<%=r_product%>
							</td>
							<td>
								<%=d_satisfy%>
							</td>
							<td>
								<%=p_satisfy%>
							</td>
						</tr>
						<tr id = 'review_p_list_content_down_line'>
							<td width="100"><b>후기 내용</b></td>
							<td colspan="4" align="left"  height = 20 style=" text-overflow:ellipsis; overflow:hidden">
								<%=r_content%>
							</td>
						</tr>
			<%
					}
				}
				else{
					%>
					<tr id = 'review_p_list_title_line' height = 30>
						<td width="100">작성일</td>
						<td width="150">작성자</td>
						<td width="200">상품 이름</td>
						<td width="100">e-티켓 만족도</td>
						<td width="100">현장 만족도</td>
					</tr>
				<%
					rs2.next();
					String t_name = rs2.getString("t_name");
					
					String jsql4 = "SELECT * FROM review where r_product = ?";
					PreparedStatement pstmt4 = con.prepareStatement(jsql4);
					pstmt4.setString(1, t_name);
					ResultSet rs4 = pstmt4.executeQuery();
					
					while(rs4.next()){
						String r_writer2 = rs4.getString("r_writer");
						String r_product2 = rs4.getString("r_product");
						String r_date2 = rs4.getString("r_date");
						String d_satisfy2 = rs4.getString("d_satisfy");
						String p_satisfy2 = rs4.getString("p_satisfy");
						String r_content2 = rs4.getString("r_content");
					
			%>
						<tr id = 'review_p_list_content_line'>
							<td>
								<%=r_date2%>
							</td>
							<td>
								<%=r_writer2%>
							</td>
							<td>
								<%=r_product2%>
							</td>
							<td>
								<%=d_satisfy2%>
							</td>
							<td>
								<%=p_satisfy2%>
							</td>
						</tr>
						<tr id = 'review_p_list_content_down_line'>
							<td width="100"><b>후기 내용</b></td>
							<td colspan="4" align="left"  height = 20 style=" text-overflow:ellipsis; overflow:hidden">
								<%=r_content2%>
							</td>
						</tr>
					<%
				}
				}
					%>
					</table>
					<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>