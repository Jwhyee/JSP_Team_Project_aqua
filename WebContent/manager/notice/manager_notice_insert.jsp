<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_insert</title>
</head>
<body>
	<div align="center">
		<font color="blue" size="6"><b>[공지 등록]</b></font>
		<form method="post" action="manager_notice_result.jsp">
			<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td>Notice NO :</td>
					<td>
						<input type="text" name="notice_no">
					</td>
				</tr>
				<tr>
					<td>MANAGER ID :</td>
					<td>
						<input type="text" name="manager_id">
					</td>
				</tr>
				<tr>
					<td>공지 작성 날짜</td>
					<td>
						<input type="text" name="notice_date_year">년 
						<input type="text" name="notice_date_month">월 
						<input type="text" name="notice_date_day">일 
					</td>
				</tr>
				<tr>
					<td>공지 제목 :</td>
					<td>
						<input type="text" name="notice_title">
					</td>
				</tr>
				<tr>
					<td>공지사항 :</td>
					<td>
						<textarea name="notice_content" rows="5" cols="30"></textarea>
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" value="공지 등록">
				<input type="reset" value="취 소">
		</form>
	</div>
</body>

</html>