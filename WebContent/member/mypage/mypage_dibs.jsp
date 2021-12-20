<%@page import = "java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/mypage_header.jsp"%>

<!--  menu list 시작  -->
    <section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage.jsp">회원정보</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_order.jsp">구매내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_qna.jsp">문의내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_cart.jsp">장바구니</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_dibs.jsp" style="color:black">찜목록</a></li>
		     <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_review.jsp">리뷰</a></li>
	    </ul>
	</section>
	<%
	try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";
		 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
		 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String dibs_no = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장

	String jsql = "select * from dibs where m_id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, sid);

	ResultSet rs = pstmt.executeQuery();

	if (!rs.next()) // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{ //  따라서,  !rs.next()의 값은 true가 됨
%>
	<center>
	찜목록이 비었습니다. <br><br>
	<a href="../product/goods_group.jsp" class="btn btn-secondary" style="color:white;">쇼핑 계속하기</a>
	</center>
	<br>
	<%
		}
		else
		{
	%>
	<div class="container">
		<div class="row">
			<table width=100%>
				<tr>
					<td align="left"><a href="../dibs/dibs_all_delete.jsp?id=<%=sid %>" class="btn btn-danger" style="color:white;">찜목록 비우기</a></td>
				</tr>
			</table>
		</div>

		<div style="padding-top: 50px;">
			<!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
			<table class="table table-hover">
				<tr>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>비고</th>
					<th>비고</th>
				</tr>


				<%

				String jsql2 = "select * from dibs where m_id = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, sid);		

				ResultSet rs2 = pstmt2.executeQuery(); 

				while(rs2.next()) 
		  		{			                   
					String p_id = rs2.getString("p_id");	//  cart테이블로부터 상품번호 추출 

		    		String jsql3 = "select p_name from product where p_id = ?";
			    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				    pstmt3.setString(1, p_id);
				    
					ResultSet rs3 = pstmt3.executeQuery(); 
					rs3.next();

					String	p_name =  rs3.getString("p_name");	  //  goods 테이블로부터 상품명 추출
		
						
				%>
				<tr>
					<td><img src="../../img/product/<%=p_id%>.jpg"width="50" height="50"></td>
					<td><%=p_name %></td>
					<td><a href="../dibs/dibs_cart_in.jsp?p_id=<%=p_id%>" class="badge badge-success" style="color:white;">장바구니에 추가</a></td>
					<td><a href="../dibs/dibs_delete.jsp?p_id=<%=p_id%>" class="badge badge-danger" style="color:white;">삭제</a></td>
				</tr>
				<% 
					}
				%>
			</table>
			<a href="../product/goods_group.jsp" class="btn btn-secondary" style="color:white;">상품 보러 가기
				&raquo;</a>
		</div>

		<hr />
	</div>
</body>

<%
}
} catch (Exception e) {
out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
</html>