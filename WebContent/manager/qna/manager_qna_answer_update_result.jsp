<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp" %>
	<%
	request.setCharacterEncoding("utf-8");
	// QnA DB
	String qna_m_id = request.getParameter("m_id");
	String qna_answer_or_not = request.getParameter("qna_answer_or_not");
	
	// QnA Answer DB
	int qna_ref_no = Integer.parseInt(request.getParameter("qna_ref_no"));
	String qna_answer_m_id = request.getParameter("m_id");
	String qna_comment_date = request.getParameter("qna_comment_date");
	String qna_comment = request.getParameter("qna_comment");
	
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

		String jsql = "UPDATE qna_answer SET qna_comment_date=?, qna_comment=? where qna_ref_no=?";

		PreparedStatement pstmt = con.prepareStatement(jsql);

		pstmt.setString(1, qna_comment_date);
		pstmt.setString(2, qna_comment);
		pstmt.setInt(3, qna_ref_no);
		
		pstmt.executeUpdate();
		
		String jsql2 = "UPDATE qna SET qna_answer_or_not=? WHERE qna_no=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setBoolean(1, true);
		pstmt2.setInt(2, qna_ref_no);

		pstmt2.executeUpdate();
		
		String jsql3 = "SELECT * FROM qna, qna_answer WHERE qna_no=? AND qna_ref_no = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setInt(1, qna_ref_no);
		pstmt3.setInt(2, qna_ref_no);

		ResultSet rs = pstmt3.executeQuery();
		while(rs.next()){
			int qna_no = rs.getInt("qna_no");
			String m_id = rs.getString("m_id");
			String qna_category = rs.getString("qna_category");
			String qna_title = rs.getString("qna_title");
			String qna_content = rs.getString("qna_content");
			String as_manager_id = rs.getString("manager_id");
			Date as_qna_comment_date = rs.getDate("qna_comment_date");
			String as_qna_comment = rs.getString("qna_comment");
		
	%>
	<div align="center">
		<font color="blue" size='6'><b>[등록된 답변 정보]</b></font>
		<p>
		<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td width="100">QnA No</td>
				<td width="300"><%=qna_no%></td>
			</tr>
			<tr>
				<td width="100">질문자 아이디</td>
				<td width="300"><%=m_id%></td>
			</tr>
			<tr>
				<td width="100">질문 카테고리</td>
				<td width="300"><%=qna_category%></td>
			</tr>
			<tr>
				<td width="100">질문 제목</td>
				<td width="300"><%=qna_title%></td>
			</tr>
			<tr>
				<td width="100">질문 내용</td>
				<td width="300"><%=qna_content%></td>
			</tr>
			<tr>
				<td width="100">답변 작성일</td>
				<td width="300"><%=as_qna_comment_date%></td>
			</tr>
			<tr>
				<td width="100">답변 작성자</td>
				<td width="300"><%=as_manager_id%></td>
			</tr>

			<tr>
				<td width="100">답변 내용</td>
				<td width="300"><%=as_qna_comment%></td>
			</tr>
			<%
			}
			%>
		</table>
		<p>
			<%
			} catch (Exception e) {
			out.println(e);
			}
			%>
		
		<p>
			<a href="manager_qna.jsp" style="font-size: 10pt; font-family: 맑은 고딕">전체 QnA 조회</a>
			<br> <br>
	</div>
</body>
</html>