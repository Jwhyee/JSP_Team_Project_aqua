<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="../../layout/header_manager.jsp" %>
<link rel="stylesheet" href="../../css/mypage_qna.css?abc">
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

	<div align="center">
		<table style="table-layout:fixed">
			<tr id = 'manager_q_detail_info_title'>
				<td colspan = "3" width = "700">QnA</td>
			</tr>
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
				boolean qna_answer_or_not = rs.getBoolean("qna_answer_or_not");
			%>
			<tr id = 'manager_q_detail_title'>
				<td align=center width = 100 style = "color:#555;"><%=qna_category%></td>
				<td align=left width = 400  colspan='2' style = "font-weight:bold;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=qna_title%>
				</td>
			</tr>
			<tr id = 'manager_q_detail_mem_content'>
				<td align="center" colspan='3' style = "padding : 50px">
					<%=qna_content%>
				</td>
			</tr>
			</table>
			<%
			if(qna_answer_or_not == true){
				String jsql2 = "SELECT * FROM qna_answer where qna_ref_no = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, key);
				ResultSet rs2 = pstmt2.executeQuery();
				
				rs2.next();
				String a_manager_id = rs2.getString("manager_id");
				String a_qna_comment = rs2.getString("qna_comment");
			%>
		<br>
		<h3>답변 수정</h3>
		<br>
		<form method="post" action="manager_qna_answer_update_result.jsp">
		<table id = 'manager_q_up_detail_manager_table' border="1" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<tr>
				<td id='manager_q_up_detail_manager_title'>QnA 번호</td>
				<td>
					<input type="text" name="qna_ref_no" value = "<%=qna_no%>" readonly>
				</td>
			</tr>
			<tr>
				<td id='manager_q_up_detail_manager_title'>질문자 ID</td>
				<td>
					<input type="text" name="m_id" value = "<%=m_id%>" readonly>
				</td>
			</tr>
			<tr style="display: none;">
				<td id='manager_q_up_detail_manager_title'>답변 작성 여부</td>
				<td>
					<input type="text" name="qna_answer_or_not" value="true" readonly>
				</td>
			</tr>
			<tr style="display: none;">
				<td id='manager_q_up_detail_manager_title'>답변 작성일</td>
				<td>
					<input type="text" name="qna_comment_date" value="<%= sf.format(nowTime) %>" readonly>
				</td>
			</tr>
			<tr>
				<td id='manager_q_up_detail_manager_title'>Manager ID</td>
				<td>
					<input type="text" name="manager_id" value="<%=manager_id%>" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="qna_comment" style="width:500px; height:300px;"><%=a_qna_comment%></textarea>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="답변 수정">
		<input type="reset" value="취 소">
		</form>
			<%
			}
			else{
			%>
		<br>
		<h3>답변 작성</h3>
		<br>
		<form method="post" action="manager_qna_answer_result.jsp">
		<table id='manager_q_in_detail_manager_table' border="1" style="font-size: 10pt; font-family: 맑은 고딕; table-layout: fixed">
			<tr>
				<td id='manager_q_in_detail_manager_title'>QnA 번호</td>
				<td>
					<input type="text" name="qna_ref_no" value = "<%=qna_no%>" readonly>
				</td>
			</tr>
			<tr>
				<td id='manager_q_in_detail_manager_title'>질문자 ID</td>
				<td>
					<input type="text" name="m_id" value = "<%=m_id%>" readonly>
				</td>
			</tr>
			<tr style="display: none;">
				<td id='manager_q_in_detail_manager_title'>답변 작성 여부</td>
				<td>
					<input type="text" name="qna_answer_or_not" value="true" readonly>
				</td>
			</tr>
			<tr style="display: none;">
				<td id='manager_q_in_detail_manager_title'>답변 작성일</td>
				<td>
					<input type="text" name="qna_comment_date" value="<%= sf.format(nowTime) %>" readonly>
				</td>
			</tr>
			<tr>
				<td id='manager_q_in_detail_manager_title'>Manager ID</td>
				<td>
					<input type="text" name="manager_id" value="<%=manager_id%>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="qna_comment" style="width:500px; height:300px;"></textarea>
				</td>
			</tr>
		</table>
		<br>
			<input type="submit" value="답변 등록">
			<input type="reset" value="취 소">
		</form>
	<%
			}
		}
		catch (Exception e) {
	      out.println(e);
	    }
%>
		
	</div>
</body>
</html>