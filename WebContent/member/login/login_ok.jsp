<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html>
<head>
<title>로그인 결과</title>
</head>

<body>


	<%
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project"; //  DB명이 project임
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	String jsql = "select * from member where m_id = ? ";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		if (pass.equals(rs.getString("m_password"))) {
			session.setAttribute("sid", id);
			response.sendRedirect("../index.jsp");

		} else {
	%>
	<br>
	<br>
	<br>
	<font color=blue size=6>
		<로그인오류!></font>
	<p>
		<br>
		<br>
		<font color=black size=3>
			비밀번호가 잘못 되었습니다. 다시 확인해 주세요!
			<p>
				로그인 페이지로 돌아가시려면
				<a href="login.jsp">여기</a>
				를 클릭하시고,
			<p>
				메인 페이지로 돌아가시려면
				<a href="../index.html">여기</a>
				를 클릭하세요!
		</font>
		<%
		}
		} else {
		%>
		<br>
		<br>
		<br>
		<font color=blue size=6>
			<로그인오류!></font>
	<p>
		<br>
		<br>
		<font color=black size=3>
			아이디가 존재하지 않습니다. 다시 확인해 주세요!
			<p>
				로그인 페이지로 돌아가시려면
				<a href="login.jsp">여기</a>
				를 클릭하시고,
			<p>
				메인 페이지로 돌아가시려면
				<a href="../index.html">여기</a>
				를 클릭하세요!
		</font>

		<%
		}
		%>
	
</body>
</html>