<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel = "stylesheet" href = "../css/about_us_style.css">
	<title>aqua | 문의 내역</title>
</head>
<body>
	<nav>
	
	</nav>
	<div align="center">

		<table border="0" style="font-size: 10pt; font-family: 맑은 고딕; table-layout:fixed">
			<tr id = 'notice_title_line'>
				<td align=center width = 100>No.</td>
				<td align=center width = 100>카테고리</td>
				<td align=center width = 300>문의 내용</td>
				<td align=center width = 150>작성 일자</td>
				<td align=center width = 100>답변 여부</td>
				<td align=center width = 100></td>
			</tr>

			<%
			request.setCharacterEncoding("utf-8");
			
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_category = request.getParameter("qna_category");
			
			String qna_date = request.getParameter("qna_date");
			String qna_answer_or_not = request.getParameter("qna_answer_or_not");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			
			String m_id = request.getParameter("m_id");
			
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
			
				
				String jsql2 = "SELECT * FROM qna where m_id = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, m_id);
				ResultSet rs = pstmt2.executeQuery();

				while (rs.next()) {
					int qna_no1 = rs.getInt("qna_no");
					String qna_category1 = rs.getString("qna_category");
					Date qna_date1 = rs.getDate("qna_date");
					Boolean qna_answer_or_not1 = rs.getBoolean("qna_answer_or_not");
					String qna_title1 = rs.getString("qna_title");
					String m_id1 = rs.getString("m_id");
			%>
			<tr id = 'notice_line'>
				<td align="center">
					<a><%=qna_no1%></a>
				</td>
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
					if(qna_answer_or_not1 == true){
						out.println("답변 완료");
					}
					else
						out.println("답변 대기");
					%>
					</a>
				</td>
				<td align="center">
					<a href="mypage_inquiries_detail_view.jsp?qna_no=<%=qna_no1%>?m_id=<%=m_id1%>">자세히 보기</a>
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
	<footer>
	
	</footer>
</body>
</html>