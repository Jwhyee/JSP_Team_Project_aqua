<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link href="../../css/styles.css" rel="stylesheet" media="screen">

</script>

<%
java.util.Date date = new java.util.Date();
String curDate = date.toLocaleString();
%>

<center>
	<br>

	<font size=6>
		<b> [ 아쿠아리움: 관리자 모드 ] </b>
	</font>
	<p>
		<br>
		<font size=3>
			<table>
				<tr>
					<td>접속관리자 ID:</td>
					<td>
						&nbsp;&nbsp;&nbsp;<%=manager_id%></td>
				</tr>
				<tr>
					<td>접속 시각:</td>
					<td>
						&nbsp;&nbsp;&nbsp;<%=curDate%></td>
				</tr>
			</table>
			<p>
		</font>
		<br>
</center>


</body>
<%@ include file="../../layout/footer.jsp"%>
</html>