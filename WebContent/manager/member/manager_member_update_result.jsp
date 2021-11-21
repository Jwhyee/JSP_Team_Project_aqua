<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../css/style-table.css?v=123">
<%
	request.setCharacterEncoding("utf-8");

	String  id = request.getParameter("id");   
	String  password = request.getParameter("password");
	String  name = request.getParameter("name");

	String	joomin1 = request.getParameter("joomin1");
	String	joomin2 = request.getParameter("joomin2");
	String  joomin = joomin1 + "-" + joomin2;

	String  birth = request.getParameter("date");

	String	solar = request.getParameter("solar");
	
	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String  phone = phone1 + "-" + phone2 + "-" + phone3;
	
	String	email = request.getParameter("email");
	String	address = request.getParameter("address");

	String	sex = request.getParameter("sex");
			

try {
 	String DB_URL="jdbc:mysql://localhost:3306/aqua_project";   //  DB명이 project임
    String DB_ID="aqua"; 
    String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "UPDATE member set m_password=?, m_name=?, m_date=?, m_gender=?, m_email=?, m_phone=?, m_joomin=?, m_address=?, m_solar=? where m_id=?";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,password);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,sex);
	 pstmt.setString(5,email);
	 pstmt.setString(6,phone);
	 pstmt.setString(7,joomin);
	 pstmt.setString(8,address);
	 pstmt.setString(9,solar);
	 pstmt.setString(10,id);
	 
	 pstmt.executeUpdate();
	 
	 String jsql2 = "select * from member where m_id=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();

%>
<center>
	<font  size='6'>
		<b>[회원 상세정보 조회] </b>
	</font>

	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕" class="detail">
	<tr>
		<td>ID</td>
		<td><%=id%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=password%></td>
	</tr>
	<tr>
		<td>성명</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>주민등록번호</td>
		<td><%=joomin%></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<%=birth%>
			(<%=solar%>)
		</td>
	</tr>
	<tr>
		<td>휴대폰번호</td>
		<td><%=phone%></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email%></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=sex%></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=address %></td>
	</tr>
	</table>
	<p>
<br>
 <a href="manager_member_select.jsp" style="font-size:10pt;font-family:맑은 고딕" >전체회원보기</a>
 </center>
 <%} catch(Exception e) { 
		out.println(e);
}
%>

</body>
<%@ include file="../../layout/footer.jsp"%>
</html>