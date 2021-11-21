<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="/layout/header.jsp"%>
<!DOCTYPE html>
<html>

<%
try {
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String mpass = null;

	String m_id = request.getParameter("id");
	String joomin1 = request.getParameter("joomin1");
	String joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String jsql = "SELECT m_password FROM member WHERE m_id=? AND m_joomin=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, m_id);
	pstmt.setString(2, joomin);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		mpass = rs.getString("m_password");
	}
%>

<body>
	<%
		if(mpass == null){
	%>
		   <font color=blue size=6><비밀번호 찾기 실패></font><p><br><br>
           <font color=black size=3>
                입력하신 정보로 가입 된 비밀번호 존재하지 않습니다.<p>
		        로그인 페이지로 돌아가시려면 
		 	    <a href="login.jsp">여기</a>를 클릭하시고, <p>
		 	    비밀번호 찾기 페이지로 돌아가실려면
			    <a href="find_pass_form.jsp">여기</a>를 클릭하세요!
		   </font>   
	<%} 
		else{
	%>		
			찾으시는 비밀번호는
			<%=mpass%>
			입니다.<br>
			<a href="login.jsp">로그인</a> 
			<a href="find_pass_form">비밀번호 찾기</a>
<%} %>
</body>
<%
} catch (Exception e) {
out.println(e);
}
%>
</html>