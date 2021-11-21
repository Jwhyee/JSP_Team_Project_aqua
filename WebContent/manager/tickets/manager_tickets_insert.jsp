<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/header_manager.jsp" %>
<body onload="m_t_init();">
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<div align="center">
		<font color="blue" size="6"><b>[티켓 등록]</b></font>
		<form name="t_insert"method="post" action="manager_tickets_insert_result.jsp">
			<table border="2" cellpadding="10" style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td>티켓 ID</td>
					<td>
						<input type="text" name="t_id">
					</td>
				</tr>
				<tr>
					<td>티켓 등록일</td>
					<td>
						<input type="text" name="t_in_date" value="<%= sf.format(nowTime) %>" readonly>
					</td>
				</tr>
				<tr>
					<td>관람 장소</td>
					<td>
						<input type="text" name="t_place" value="AAA Tower 1F" readonly>
					</td>
				</tr>
				<tr>
					<td>티켓 이름</td>
					<td>
						<input type="text" name="t_name">
					</td>
				</tr>
				<tr>
					<td>티켓 가격</td>
					<td>
						성  인(만 19세 이상)<br><input type="text" name="t_price_adult">  원
						<input type="button" value=" 계산 " onclick="cal_price();"><br><br>
						청소년(만 13세 ~ 18세)<br><input type="text" name="t_price_teen" readonly>  원<br><br>
						어린이(만 4세 ~ 12세)<br><input type="text" name="t_price_child" readonly>  원
					</td>
				</tr>
				<tr>
					<td>티켓 설명</td>
					<td>
						<textarea name="t_description" rows="5" cols="30">티켓은 구입일로부터 1달간 사용가능합니다.</textarea>
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" value="티켓 등록">
				<input type="reset" value="취 소">
		</form>
	</div>
</body>
<script type="text/javascript" src="../../js/tickets.js?abc"></script>
</html>