<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link rel = "stylesheet" href = "../../css/mypage_qna.css?a">
<%@ include file="../../layout/mypage_header.jsp"%>
<!--<body> -> header.jsp에 있음-->
<!--  menu list 시작  -->
    
		<%
			request.setCharacterEncoding("utf-8");
			try {
				String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
				String DB_ID = "aqua";
				String DB_PASSWORD = "1234";

				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				Boolean state = Boolean.parseBoolean(request.getParameter("state"));
				
				String jsql = "SELECT * FROM qna where m_id = ? AND qna_answer_or_not = ?";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				pstmt.setString(1, sid);
				pstmt.setBoolean(2, state);
				ResultSet rs = pstmt.executeQuery();
				
				String jsql2 = "SELECT * FROM qna where m_id = ? AND qna_answer_or_not = 1";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, sid);
				ResultSet rs2 = pstmt2.executeQuery();
				
				String jsql3 = "SELECT * FROM qna where m_id = ? AND qna_answer_or_not = '0'";
				PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				pstmt3.setString(1, sid);
				ResultSet rs3 = pstmt3.executeQuery();
				
				int count2 = 0;
				int count3 = 0;
				
				while (rs2.next()) {
					count2 = count2 + 1;
				}

				while (rs3.next()) {
					count3 = count3 + 1;
				}

				int sum = count2 + count3;
		%>
		<section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage.jsp">회원정보</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_order.jsp">구매내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_qna.jsp" style="color:black">문의내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_cart.jsp">장바구니</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_dibs.jsp">찜목록</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_review.jsp">리뷰</a></li>
	    </ul>
	</section>
	
	<div align="center">
	<ul class="mylist">
		<li>
			<a href="mypage_qna.jsp">
				전체보기(<%=sum%>)
			</a>
		</li>
		<li>
			<a href="mypage_qna_state.jsp?state=1">
				답변완료(<%=count2%>)
			</a>
		</li>
		<li>
			<a href="mypage_qna_state.jsp?state=0">
				답변대기(<%=count3%>)
			</a>
		</li>
	</ul>
		<table border="0" style="font-family: 맑은 고딕; table-layout:fixed">
			<tr id = 'mp_qna_info_title'>
				<td align=center colspan="5">질문 내역</td>
			</tr>
			<tr id = 'mp_qna_title'>
				<td align=center width = 100>카테고리</td>
				<td align=center width = 350>문의 제목</td>
				<td align=center width = 150>작성 일자</td>
				<td align=center width = 200>답변 여부</td>
				<td align=center width = 150></td>
			</tr>
					
			<%
				

				while (rs.next()) {
					int qna_no1 = rs.getInt("qna_no");
					String qna_category1 = rs.getString("qna_category");
					Date qna_date1 = rs.getDate("qna_date");
					Boolean qna_answer_or_not1 = rs.getBoolean("qna_answer_or_not");
					String qna_title1 = rs.getString("qna_title");
					String m_id1 = rs.getString("m_id");
			%>
			<tr id = 'mp_qna_content_list'>
				<td align="center">
					<a><%=qna_category1%></a>
				</td>
				<td align="center">
					<a><b><%=qna_title1%></b></a>
				</td>
				<td align="center" height = 50 style=" text-overflow:ellipsis; overflow:hidden">
					<a><%=qna_date1%></a>
				</td>
				<td align="center">
					<a>
					<%
					if(qna_answer_or_not1 == true){%>
					<font color = "blue"><b>
					<%
						out.println("답변 완료");
					%>
					</b></font>
					<%}
					else
						out.println("답변 대기");
					%>
					</a>
				</td>
				<td align="center">
					<a href="../mypage/mypage_qna_detail_view.jsp?qna_no=<%=qna_no1%>?m_id=<%=m_id1%>" style="color : #369">자세히 보기</a>
				</td>
			</tr>
			<%
	 }
%>
		</table>
		<br><br>
			<%
    } catch (Exception e) {
      out.println(e);	
}
%>
		
	</div>
	<%@ include file="../../layout/footer.jsp"%>
</body>
</html>