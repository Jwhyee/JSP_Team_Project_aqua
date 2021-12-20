<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>\
<link rel = "stylesheet" href = "../../css/mypage_qna.css?aa">

<!--<body> -> header.jsp에 있음-->
	<div align="center">
		<table style=" font-family: 맑은 고딕; table-layout:fixed">
			<tr id = 'mp_qna_detail_info_title'>
				<td colspan = "3" width = "700">QnA</td>
			</tr>
			<tr>
				<td colspan='3' style = "border-top : none;">
					<input id = "mp_qna_detail_list_btn" type="button" value = "목록 보기" onClick="location.href='mypage_qna.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan='3' style = "border-top : none;">
				</td>
			</tr>
			<%
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				request.setCharacterEncoding("utf-8");
				String key = request.getParameter("qna_no");
				String p_id = request.getParameter("p_id");

				String jsql = "SELECT * FROM qna, qna_answer where qna_no = ? and qna_ref_no = ?";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				pstmt.setString(1, key);
				pstmt.setString(2, key);
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				int qna_no = rs.getInt("qna_no");
			   	String qna_category = rs.getString("qna_category");
				Date qna_date = rs.getDate("qna_date");
				String qna_title = rs.getString("qna_title");
				String qna_content = rs.getString("qna_content");
				String qna_comment = rs.getString("qna_comment");
				String qna_comment_date = rs.getString("qna_comment_date");
				String manager_id = rs.getString("manager_id");
				
				qna_comment = qna_comment.replace("\r\n","<br>");
			%>
			<tr id = 'mp_qna_detail_title'>
				<td align=center width = 100 style = "color:#555;"><%=qna_category %></td>
				<td align=left width = 400  colspan='2' style = "font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=qna_title%></td>
			</tr>
			<tr id = 'mp_qna_detail_mem_content'>
				<td align="center" colspan='3' style = "padding : 50px">
					<%=qna_content%>
				</td>
			</tr>
			<tr id = 'mp_qna_detail_manager_title'>
				<td align=center width = 50 style = "color:#555;"><%=qna_comment_date %></td>
				<td align=center width = 150 style = "font-weight:bold"><%=manager_id%> </td>
				<td align=left width = 500 style = "padding:20px;"><%=qna_comment%> </td>
			</tr>
			
		</table>
		<%
    	} catch (Exception e) {
		%>
		<table style="table-layout:fixed">
			<%
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				
				String key = request.getParameter("qna_no");

				String jsql2 = "SELECT * FROM qna where qna_no = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, key);
				ResultSet rs2 = pstmt2.executeQuery();
				
				rs2.next();
				int qna_no = rs2.getInt("qna_no");
			   	String qna_category = rs2.getString("qna_category");
				Date qna_date = rs2.getDate("qna_date");
				String qna_title = rs2.getString("qna_title");
				String qna_content = rs2.getString("qna_content");
			%>
			<tr id = 'mp_qna_detail_title'>
				<td align=center width = 100 style = "color:#555;"><%=qna_category %></td>
				<td align=left width = 600  colspan='2' style = "font-weight:normal;"><%=qna_title%></td>
			</tr>
			<tr id = 'mp_qna_detail_mem_content'>
				<td align="center" colspan='3' style = "padding : 50px">
					<%=qna_content%>
				</td>
			</tr>
			<tr id = 'mp_qna_detail_manager_title'>
				<td colspan="3" style = "text-align:center;color:#555;"><b>아직 답변이 등록되지 않았습니다.</b></td>
			</tr>
			
		</table>
		<%
		}
		%>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>