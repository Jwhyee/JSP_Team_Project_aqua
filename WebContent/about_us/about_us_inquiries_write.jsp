<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "../css/about_us_style.css">
<title>aqua | QnA</title>
</head>
<body>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>



	<div align="center">
		<form method="post" action="about_us_inquiries_write_result.jsp">
			<table border = "0">
				<tr id = 'qna_title_line' align=center>
					<td colspan ="2">궁금하신 점을 적어주시면 성심성의 껏 답변해드리겠습니다.</td>
				<tr id = 'qna_detail_title' >
					<td id = 'table_subtitle_padding' width = 200>카테고리분류</td>
					<td>
						<select name="qna_category" style = "width : 230px; height : 35px; text-align:left; font-size:15px;">
							<option value="Goods">굿즈</option>
							<option value="Ticket">티켓</option>
							<option value="Etc">기타</option>
						</select>
					</td>
				</tr>
				<tr id = 'qna_detail_title'>
					<td id = 'table_subtitle_padding' >아이디</td>
					<td>
						<input type="text" name="m_id">
					</td>
				</tr>
				<tr id = 'qna_detail_title' style = "display:none;">
					<td id = 'table_subtitle_padding' >작성일</td>
					<td>
						<input type="text" name="qna_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr id = 'qna_detail_title' style = "display:none;">
					<td id = 'table_subtitle_padding' >번호</td>
					<td>
						<input type="text" name="qna_no" value="1" readonly>
					</td>
				</tr>
				<tr id = 'qna_detail_title' style = "display:none;">
					<td id = 'table_subtitle_padding' >답변 작성 여부</td>
					<td>
						<input type="text" name="qna_answer_or_not" value="false" readonly>
					</td>
				</tr>
				<tr id = 'qna_detail_title'>
					<td id = 'table_subtitle_padding' >제목</td>
					<td>
						<input type="text" name="qna_title">
					</td>
				</tr>
				<tr id = 'qna_detail_title'>
					<td colspan ="2">
						<textarea name="qna_content" rows="15" cols="60" placeholder=" 내용을 적어주세요." style = "align:center;"></textarea>
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" value="문의등록">
		</form>
	</div>
</body>
</html>