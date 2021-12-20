<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../layout/mypage_header.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/review_style.css?aa">
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<!--  menu list 시작  -->
    <section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage.jsp">회원정보</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_order.jsp">구매내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_qna.jsp">문의내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_cart.jsp">장바구니</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_dibs.jsp">찜목록</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_review.jsp" style="color:black">리뷰</a></li>
	    </ul>
	</section>
	<div align = "center">
	<br>
		<h3>aa</h3>
	<br>
	<%
	request.setCharacterEncoding("utf-8");
	
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	String r_category = request.getParameter("r_category");
	String r_product = request.getParameter("r_product");
	String r_writer = request.getParameter("r_writer");
	String r_content = request.getParameter("r_content");
	String r_date = request.getParameter("r_date");
	String d_satisfy = request.getParameter("d_satisfy");
	String p_satisfy = request.getParameter("p_satisfy");
	
	
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
		String DB_ID = "aqua";
		String DB_PASSWORD = "1234";
	
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		
		String jsql = "INSERT INTO review (r_no, r_product, r_category, r_writer, r_content, r_date, d_satisfy, p_satisfy) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setInt(1, r_no);
		pstmt.setString(2, r_product);
		pstmt.setString(3, r_category);
		pstmt.setString(4, r_writer);
		pstmt.setString(5, r_content);
		pstmt.setString(6, r_date);
		pstmt.setString(7, d_satisfy);
		pstmt.setString(8, p_satisfy);
		
		pstmt.executeUpdate();
		
		 %>
		 <jsp:forward page="mypage_review.jsp"/>
		 <%
}catch (Exception e) {
	out.println("잘못된 접근입니다.");
}
%>
	</div>
</body>
<%@ include file="../../layout/footer.jsp"%>
<script type="text/javascript" src="../../js/review.js"></script>
</html>