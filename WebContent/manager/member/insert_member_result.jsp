<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../layout/header.jsp" %>
<html>
	<head>
	<title>회원 가입 결과 </title>
	</head>
<body>



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

	 String jsql = "INSERT INTO member (m_id, m_password, m_name, m_date, m_gender, m_email, m_phone, m_joomin, m_address, m_solar) values(?,?,?,?,?,?,?,?,?,?)";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,password);
	 pstmt.setString(3,name);
	 pstmt.setString(4,birth);
	 pstmt.setString(5,sex);
	 pstmt.setString(6,email);
	 pstmt.setString(7,phone);
	 pstmt.setString(8,joomin);
	 pstmt.setString(9,address);
	 pstmt.setString(10,solar);
	 
	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}
%>

<br><br><br>
    <h3> 축하합니다.  다음과 같이 회원 가입되었습니다! </h3><p>
	<br><br>
	<font color="blue" size='6'><b>[회원 가입 내역]</b></font><p>

	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td width=100>ID</td>
		<td width=200><%=id%></td>
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
 <a href="login.jsp" style="font-size:10pt;font-family:맑은 고딕" >로그인</a>
<%@ include file="../../layout/footer.jsp"%>
</body>
</html>