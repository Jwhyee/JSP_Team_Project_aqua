<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<link rel = "stylesheet" href = "../../css/mypage_qna.css">

<!--<body> -> header.jsp에 있음-->
	<div align="center">

		<table border="0" style="table-layout:fixed">
			<tr id = 'mp_qna_info_title'>
				<td align=center colspan="5">질문 내역</td>
			</tr>
			<tr id = 'mp_qna_title'>
				<td align=center width = 100>카테고리</td>
				<td align=center width = 350>문의 제목</td>
				<td align=center width = 150>작성 일자</td>
				<td align=center width = 200>답변 여부</td>
				<td align=center width = 150></td>
			</tr>

			<%
			request.setCharacterEncoding("utf-8");
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
			
				
				String jsql2 = "SELECT * FROM qna where m_id = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, sid);
				ResultSet rs = pstmt2.executeQuery();

				while (rs.next()) {
					int qna_no1 = rs.getInt("qna_no");
					String qna_category1 = rs.getString("qna_category");
					Date qna_date1 = rs.getDate("qna_date");
					Boolean qna_answer_or_not1 = rs.getBoolean("qna_answer_or_not");
					String qna_title1 = rs.getString("qna_title");
					String m_id1 = rs.getString("m_id");
			%>
			<tr id = 'mp_qna_content_list'>
				<td align="center">
					<a><%=qna_category1%></a>
				</td>
				<td align="center">
					<a><%=qna_title1%></a>
				</td>
				<td align="center" height = 50 style=" text-overflow:ellipsis; overflow:hidden">
					<a><%=qna_date1%></a>
				</td>
				<td align="center">
					<a>
					<%
					if(qna_answer_or_not1 == true){%>
					<font color = "blue"><b>
					<%
						out.println("답변 완료");
					%>
					</b></font>
					<%}
					else
						out.println("답변 대기");
					%>
					</a>
				</td>
				<td align="center">
					<a href="mypage_qna_detail_view.jsp?qna_no=<%=qna_no1%>?m_id=<%=m_id1%>">자세히 보기</a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
		<br><br>
			<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>