<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="../../layout/header.jsp"%>
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

	String mid = null;

	String name = request.getParameter("name");
	String joomin1 = request.getParameter("joomin1");
	String joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String jsql = "SELECT m_id FROM member WHERE m_name=? AND m_joomin=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, name);
	pstmt.setString(2, joomin);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		mid = rs.getString("m_id");
		session.setAttribute("s_m_id", mid);
	}
%>
<center>
<body>
	<%
		if(mid == null){
	%>
		   <font color=blue size=6><아이디 찾기 실패></font><p><br><br>
           <font color=black size=3>
                입력하신 정보로 가입 된 아이디가 존재하지 않습니다.<p>
		        로그인 페이지로 돌아가시려면 
		 	    <a href="../login/login.jsp">여기</a>를 클릭하시고, <p>
		 	    아이디 찾기 페이지로 돌아가실려면
			    <a href="find_id_form.jsp">여기</a>를 클릭하세요!
		   </font>   
	<%} 
		else{
	%>		
			찾으시는 아이디는
			<%=mid%>
			입니다.<br>
			<a href="../login/login.jsp">로그인</a> 
			<a href="find_pass_form.jsp">비밀번호 찾기</a>
<%} %>
</body>
<%
} catch (Exception e) {
out.println(e);
}
%>
</center>
<%@ include file="../../layout/footer.jsp" %>
</html>