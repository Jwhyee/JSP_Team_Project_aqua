<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/mypage_header.jsp"%>

<!--  menu list 시작  -->
    <section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_member.jsp">회원정보</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_order.jsp">구매내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_qna.jsp">문의내역</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_cart.jsp" style="color:black">장바구니</a></li>
		    <li><a href="${pageContext.request.contextPath}/member/mypage/mypage_dibs.jsp">찜목록</a></li>
	    </ul>
	</section>
	
<%
		
		try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";
		 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
		 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ct_no = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장


	// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
	// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
	//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
	//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
	String jsql = "select * from cart where ct_no = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ct_no);

	ResultSet rs = pstmt.executeQuery();

	if (!rs.next()) // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{ //  따라서,  !rs.next()의 값은 true가 됨
%>
	<center>
	장바구니가 비었습니다.
	<a href="../product/goods_group.jsp" class="btn btn-secondary">쇼핑 계속하기</a>
	</center>
	<%
		}
		else
		{
	%>

</head>
<body>

	<div class="container">
		<div class="row">
			<table width=100%>
				<tr>
					<td align="left"><a href="cart_all_delete.jsp?id=<%=ct_no %>" class="btn btn-danger">장바구니 비우기</a></td>
					<td align="right"><a href="cart_order.jsp?ct_no=<%=ct_no %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>

		<div style="padding-top: 50px;">
			<!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
			<table class="table table-hover">
				<tr>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>

				<%

				String jsql2 = "select p_id, ct_qty from cart where ct_no = ?";
				PreparedStatement pstmt2 = con.prepareStatement(jsql2);
				pstmt2.setString(1, ct_no);		

				ResultSet rs2 = pstmt2.executeQuery(); 

				int total=0;

				while(rs2.next()) 
		  		{			                   
					String p_id = rs2.getString("p_id");	//  cart테이블로부터 상품번호 추출
		    		int ct_qty = rs2.getInt("ct_qty");	                //  cart테이블로부터 주문수량 추출 

		    		String jsql3 = "select p_name, p_price from product where p_id = ?";
			    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				    pstmt3.setString(1, p_id);
				    
					ResultSet rs3 = pstmt3.executeQuery(); 
					rs3.next();

					String	p_name =  rs3.getString("p_name");	  //  goods 테이블로부터 상품명 추출
					int p_price =  rs3.getInt("p_price");                 //  goods 테이블로부터 상품단가 추출
						
		    		int amount = p_price * ct_qty;    //  주문액 계산
					total = total + amount;                  //  전체 주문총액 계산
						
				%>
				<tr>
					<td><img src="../../img/product/<%=p_id%>.jpg"width="50" height="50"></td>
					<td><%=p_name %></td>
					<td><fmt:formatNumber value="<%=p_price%>" type="number" />원</td>
					<td><%=ct_qty %>개</td>
					<td><fmt:formatNumber value="<%=amount%>" type="number" />원</td>
					<td><a href="cart_delete.jsp?p_id=<%=p_id%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<% 
					}
				%>

				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><fmt:formatNumber value="<%=total%>" type="number" />원</th>
					<th></th>
				</tr>
			</table>
			<a href="../product/goods_group.jsp" class="btn btn-secondary">쇼핑 계속하기
				&raquo;</a>
		</div>

		<hr />
	</div>
	<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>

</body>
<%@ include file="../../layout/footer.jsp"%>
</html>