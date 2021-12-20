<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/header.jsp"%>
<link rel = "stylesheet" href = "../../css/about_us_style.css?aa">

<!--<body> -> header.jsp에 있음-->
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<div align="center">
		<form method="post" action="about_us_qna_write_result.jsp">
			<table border = "0">
				
				<tr id = 'abu_qna_info_title' align=center>
					<td colspan ="2" width = 800 height = 80>궁금하신 점을 적어주시면 성심성의 껏 답변해드리겠습니다.</td>
				</tr>
				<tr id = 'abu_qna_title_under' >
					<td colspan = "2">
						<input id = "abu_notice_list_btn" type="button" value = "질문 내역 보기" onClick="location.href='../mypage/mypage_qna.jsp'">
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line' >
					<td id = 'abu_qna_subtile' width = 250>카테고리분류</td>
					<td width = 550>
						<select name="qna_category" style = "width : 230px; height : 35px; text-align:left; font-size:15px;">
							<option value="Goods">굿즈</option>
							<option value="Ticket">티켓</option>
							<option value="Etc">기타</option>
						</select>
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line'>
					<td id = 'abu_qna_subtile' >아이디</td>
					<td>
						<input type="text" name="m_id" width="230" value="<%=sid%>" readonly>
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line' style = "display:none;">
					<td id = 'abu_qna_subtile' >작성일</td>
					<td>
						<input type="text" name="qna_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line' style = "display:none;">
					<td id = 'abu_qna_subtile' >번호</td>
					<td>
						<input type="text" name="qna_no" value="1" readonly>
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line' style = "display:none;">
					<td id = 'abu_qna_subtile' >답변 작성 여부</td>
					<td>
						<input type="text" name="qna_answer_or_not" value="false" readonly>
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line'>
					<td id = 'abu_qna_subtile' >제목</td>
					<td>
						<input type="text" name="qna_title">
					</td>
				</tr>
				<tr id = 'abu_qna_subtitle_line'>
					<td colspan ="2" valign="middle" align="center">
					<br>
						<textarea name="qna_content" rows="15" cols="90" placeholder=" 내용을 적어주세요." style = "align:center; resize : none"></textarea>
					</td>
				</tr>
			</table>
			<p>
			<br><br><br>
				<input id = 'abu_qna_submit_btn' type="submit" value="문의등록">
			<br><br><br>
		</form>
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>