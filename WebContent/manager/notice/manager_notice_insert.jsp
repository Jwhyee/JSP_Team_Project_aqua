<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/header_manager.jsp" %>
<link rel="stylesheet" href="../../css/about_us_style.css?abc">
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<div align="center">
		<font color="blue" size="6"><b>[공지 등록]</b></font>
		<br><br>
		<form method="post" action="manager_notice_insert_result.jsp">
			<table id = 'manager_n_in_table'border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td id = 'manager_n_in_title'>Notice NO :</td>
					<td>
						<input type="text" name="notice_no">
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_in_title'>MANAGER ID :</td>
					<td>
						<input type="text" name="manager_id" value="<%=manager_id%>">
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_in_title'>공지 작성 날짜</td>
					<td>
						<input type="text" name="notice_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_in_title'>공지 제목 :</td>
					<td>
						<input type="text" name="notice_title">
					</td>
				</tr>
				<tr>
					<td id = 'manager_n_in_title'>공지사항 :</td>
					<td>
						<textarea name="notice_content" rows="10" cols="40"></textarea>
					</td>
				</tr>
			</table>
			<p><br><br>
				<input type="submit" value="공지 등록">
				<input type="reset" value="취 소">
		</form>
	</div>
</body>

</html>