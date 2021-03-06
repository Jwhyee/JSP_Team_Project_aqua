<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp" %>
<link rel="stylesheet" href="../../css/mypage_qna.css?abc">
	<div align="center">
	<font color="blue" size='6'><b>[전체 QnA 조회]</b></font>
		<p>

		<table id = 'manager_q_sel_table' border="1" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<tr>
				<td id = 'manager_q_sel_title' width = 50>No.</td>
				<td id = 'manager_q_sel_title' width = 100>질문자</td>
				<td id = 'manager_q_sel_title' width = 70>카테고리</td>
				<td id = 'manager_q_sel_title' width = 300>문의 내용</td>
				<td id = 'manager_q_sel_title' width = 100>작성 일자</td>
				<td id = 'manager_q_sel_title' width = 100>답변 여부</td>
				<td id = 'manager_q_sel_title' width = 100></td>
				
			</tr>

			<%
			
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String jsql2 = "SELECT * FROM qna";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				
				ResultSet rs = pstmt2.executeQuery();

				while (rs.next()) {
					int qna_no = rs.getInt("qna_no");
					String qna_category = rs.getString("qna_category");
					Date qna_date = rs.getDate("qna_date");
					Boolean qna_answer_or_not = rs.getBoolean("qna_answer_or_not");
					String qna_title = rs.getString("qna_title");
					String m_id = rs.getString("m_id");
			%>
			<tr>
				<td align="center">
					<a><%=qna_no%></a>
				</td>
				<td align="center">
					<a><%=m_id%></a>
				</td>
				<td align="center">
					<a><%=qna_category%></a>
				</td>
				<td align="center">
					<a><%=qna_title%></a>
				</td>
				<td align="center" height=50 style="text-overflow: ellipsis; overflow: hidden">
					<a><%=qna_date%></a>
				</td>
				<td align="center">
					<a>
						<%
					if(qna_answer_or_not == true){
						%>
						<font color = "red"><b>
						<%
						out.println("답변 완료");
						%>
						</b></font>
						<%
					}
					else
						out.println("답변 대기");
					%>
					</a>
				</td>
				<td align="center">
					<a href="manager_qna_answer_write.jsp?qna_no=<%=qna_no%>?m_id=<%=m_id%>">
					<%
					if(qna_answer_or_not == true){
						out.println("수정");
					}
					else
						out.println("답변 작성");
					%>
					</a>
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