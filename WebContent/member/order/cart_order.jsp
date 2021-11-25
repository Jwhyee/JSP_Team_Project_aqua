
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*"%>

<script language="javascript" src="../../js/js_package.js">
</script>

<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문하기</h1>
		</div>
	</div>
	<div align="center">

		<%
		//    (1) (17행~120행): 장바구니 내역을 그대로 보여주기  => showCart.jsp의 13행~116행과 
		try { //         완전히 동일한 코드임
			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
			String DB_ID = "aqua";
			String DB_PASSWORD = "1234";

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String ct_no = session.getId(); //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장

			// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
			// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
			//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
			//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
			String jsql = "select * from cart where ct_no = ? ";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, ct_no);

			ResultSet rs = pstmt.executeQuery();
			
			String jsql7 = "select * from cart_t where ct_no = ? ";
			PreparedStatement pstmt7 = con.prepareStatement(jsql7);
			pstmt7.setString(1, ct_no);

			ResultSet rs7 = pstmt7.executeQuery();
		%>

		<%
		if (!rs.next() && !rs7.next()) // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
		{ //  따라서,  !rs.next()의 값은 true가 됨
		%>
		장바구니가 비었습니다.
		<%
		} else {
		%>
	
	<div class="container">
		<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p align="center">
						<font size="2" color="#ECFAE4"><strong>상품번호</strong></font></td>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p>
						<font size="2" color="#ECFAE4"><strong>상품명</strong></font></td>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p>
						<font size="2" color="#ECFAE4"><strong>상품단가(원)</strong></font></td>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p>
						<font size="2" color="#ECFAE4"><strong>주문수량(개)</strong></font></td>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p>
						<font size="2" color="#ECFAE4"><strong>주문액(원)</strong></font></td>
				<td bgcolor="#002C57" width=120 height="30" align="center"><p>
						<font size="2" color="red"><b>[상품삭제]</b></font></td>
			</tr>

			<%
			//  [78행~113행 설명] :
			//  장바구니에 담긴 상품내역을 웹페이지상에 보여주고자 할 때, 각각의 항목들이
			//  상품번호(prdNo),  상품명(prdName),  상품단가(prdPrice),  주문수량(ctQty), 
			//  주문액(prdPrice*ctQty ),  전체주문총액(total)으로 구성되고 있음에 유의할 것! 
			//   => 장바구니담기 실행 후 보여지는 해당 웹페이지의 출력결과를 토대로 각 구성요소들을 확인 요망!

			//  cart 테이블:  상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 올 수 있음.
			//  goods 테이블:  상품명(prdName)과 상품단가(prdPrice) 값을 추출해 올 수 있음.
			//  따라서, cart테이블과 goods테이블로부터, 동일한 상품번호(prdNo)에 해당하는 각 항목들의 값을 
			//  추출해 올 수 있다. (mysql상에서 cart테이블과 goods테이블에 어떠한 필드들이 존재하는지 확인 요망!)
			//  =>  <알고리즘 설명>:  cart테이블로부터 상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 오고, 
			//         여기서 추출한 상품번호(prdNo)에 근거하여 goods테이블로부터
			//         상품명(prdName)과 상품단가(prdPrice) 를 추출해 낸다.
			//         이를 토대로, 주문액(prdPrice*ctQty )과  전체주문총액(total)을 계산해 낸다.
			//         그런 다음, 추출해 낸 각 필드들 및 계산된 결과값들을 웹브라우저상에 출력해 준다. 
			//         이후, 이러한 레코드단위의 필드추출 및 웹브라우저로의 출력하는 과정을 
			//         더 이상 장바구니에 상품레코드가 없을 때까지(총 상품레코드 수 만큼) 반복한다.  

			String jsql2 = "select p_id, ct_qty from cart where ct_no = ? order by p_id";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1, ct_no);

			ResultSet rs2 = pstmt2.executeQuery();

			int total = 0;

			while (rs2.next()) {
				String p_id = rs2.getString("p_id"); //  cart테이블로부터 상품번호 추출
				int ct_qty = rs2.getInt("ct_qty"); //  cart테이블로부터 주문수량 추출 

				String jsql3 = "select p_name, p_price from product where p_id = ?";
				PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				pstmt3.setString(1, p_id);

				ResultSet rs3 = pstmt3.executeQuery();
				rs3.next();

				String p_name = rs3.getString("p_name"); //  goods 테이블로부터 상품명 추출
				int p_price = rs3.getInt("p_price"); //  goods 테이블로부터 상품단가 추출

				int amount = p_price * ct_qty; //  주문액 계산
				total = total + amount; //  전체 주문총액 계산
			%>
			<tr>
				<td bgcolor="#eeeede" height="30" align="center"><font size="2"><%=p_id%></font></td>
				<td bgcolor="#eeeede" height="30" align="center"><font size="2"><%=p_name%></font></td>
				<td bgcolor="#eeeede" height="30" align="center" align=right><font
					size="2"><fmt:formatNumber value="<%=p_price%>" type="number" /></font></td>
				<td bgcolor="#eeeede" height="30" align="center" align=right><font
					size="2"><%=ct_qty%></font></td>
				<td bgcolor="#eeeede" height="30" align="right"><font size="2"><fmt:formatNumber value="<%=amount%>" type="number" />
						원</font></td>
				<td bgcolor="#eeeede" height="30" align="center"><a
					href="cart_delete.jsp?p_id=<%=p_id%>"><font size="2" color=blue><b>삭제</b></a></font></td>
			</tr>
			<%
			} // while문의 끝
			%>
			<%
			String jsql5 = "select t_id, ct_qty_a, ct_qty_t, ct_qty_c from cart_t where ct_no = ? order by t_id";
			PreparedStatement pstmt5 = con.prepareStatement(jsql5);
			pstmt5.setString(1, ct_no);

			ResultSet rs5 = pstmt5.executeQuery();
			
			while (rs5.next()) {
				String t_id = rs5.getString("t_id"); //  cart테이블로부터 상품번호 추출
				int ct_qty_a = rs5.getInt("ct_qty_a");	                //  cart_t테이블로부터 주문수량 추출 
	    		int ct_qty_t = rs5.getInt("ct_qty_t");	
	    		int ct_qty_c = rs5.getInt("ct_qty_c");	
	    		int ct_qty_sum = ct_qty_a + ct_qty_t + ct_qty_c;

				String jsql6 = "select t_name, t_price_adult, t_price_teen, t_price_child from ticket where t_id = ?";
				PreparedStatement pstmt6 = con.prepareStatement(jsql6);
				pstmt6.setString(1, t_id);

				ResultSet rs6 = pstmt6.executeQuery();
				rs6.next();

				String t_name = rs6.getString("t_name"); //  goods 테이블로부터 상품명 추출
				int t_price_adult =  rs6.getInt("t_price_adult");                 //  goods 테이블로부터 상품단가 추출
				int t_price_teen =  rs6.getInt("t_price_teen");
				int t_price_child =  rs6.getInt("t_price_child");

				int amount_t = (t_price_adult * ct_qty_a) + (t_price_teen * ct_qty_t) + (t_price_child * ct_qty_c);
				total = total + amount_t; //  전체 주문총액 계산
			%>
			<tr>
				<td bgcolor="#eeeede" height="30" align="center"><font size="2"><%=t_id%></font></td>
				<td bgcolor="#eeeede" height="30" align="center"><font size="2"><%=t_name%></font></td>
				<td bgcolor="#eeeede" height="30" align="center" align=right>
					<font size="2">
						성인 : <fmt:formatNumber value="<%=t_price_adult%>" type="number" /><br>
						청소년 : <fmt:formatNumber value="<%=t_price_teen%>" type="number" /><br>
						어린이 : <fmt:formatNumber value="<%=t_price_child%>" type="number" />
					</font>
				</td>
				<td bgcolor="#eeeede" height="30" align="center" align=right>
					<font size="2">
						성인(<%=ct_qty_a%>)<br>
						청소년(<%=ct_qty_t%>)<br>
						어린이(<%=ct_qty_c%>)
					</font>
				</td>
				<td bgcolor="#eeeede" height="30" align="right"><font size="2"><fmt:formatNumber value="<%=amount_t%>" type="number" />
						원</font></td>
				<td bgcolor="#eeeede" height="30" align="center"><a
					href="cart_delete.jsp?t_id=<%=t_id%>"><font size="2" color=blue><b>삭제</b></a></font></td>
			</tr>
			<%
			} // while문의 끝
			%>
			<tr>
				<td colspan=4 align=center><font size="2" color="red"><b>전체
							주문총액</b></font></td>
				<td bgcolor="#eeeede" height="30" align=right><font size="2"
					color="red"><b><fmt:formatNumber value="<%=total%>" type="number" />원</b></font></td>
				<td align=center><font size=2 color=green>(선택물품 총합)</font></td>
			</tr>
		</table>

		<%
		// (2)주문자 정보 출력 - 회원 테이블 정보 출력
		String myid = (String) session.getAttribute("sid"); // 로그인했었던 주문자 정보(즉, 아이디)를 받아옮

		String jsql4 = "select m_name, m_phone, m_address from member where m_id = ?";
		PreparedStatement pstmt4 = con.prepareStatement(jsql4);
		pstmt4.setString(1, myid);

		ResultSet rs4 = pstmt4.executeQuery();
		rs4.next();
		String name = rs4.getString("m_name");
		String phone = rs4.getString("m_phone");
		String address = rs4.getString("m_address");
		%>
		<form name="form" method="Post" action="cart_order_ok.jsp">
			<!--  폼의 이름이 form으로 지정됨 -->
			<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td rowspan=3 width="155" align="center" bgcolor="#002C57"><font
						size="2" color="#ECFAE4"> <strong>주문자 정보</strong>
					</font></td>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>이 름 </td>
					<td width=470><%=name%></td>
				</tr>
				<tr>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>전 화</strong>
					</font></td>
					<td width=470><input type="text" name="memTel" size=40
						value=<%=phone%>></td>
				</tr>
			</table>


			<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td rowspan=3 width="155" align="center" bgcolor="#002C57"><font
						size="2" color="#ECFAE4"> <strong>수령인 정보</strong>
					</font></td>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>이 름</strong>
					</font></td>
					<td width=470><input type="text" name="receiver" size=40></td>
				</tr>
				<tr>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>주 소</strong>
					</font></td>
					<td width=470><input type="text" name="rcvAddress" size=40></td>
				</tr>
				<tr>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>전 화</strong>
					</font></td>
					<td width=470><input type="text" name="rcvPhone" size=40></td>
				</tr>
			</table>


			<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
				<tr>
					<td rowspan=2 align="center" width="155" bgcolor="#002C57">
						<font size="2" color="#ECFAE4"> <strong>결제 방법</strong>
						</font>
					</td>
					<td align="center" width=110 bgcolor="#002C57"><font size="2" color="#ECFAE4"> 
						<strong>신용카드 번호 
					</td>
					<td width=120><input type="text" name="cardNo"></td>
					<td align="center" width=112 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>비밀번호</strong>
					</font></td>
					<td width=120><input type="password" name="cardPass"></td>
				</tr>
				<tr>
					<td align="center" width=110 bgcolor="#002C57"><font size="2"
						color="#ECFAE4"> <strong>무통장 입금</strong>
					</font></td>
					<td colspan=3 width=474><select name="bank">
							<option value="0" selected>다음 중 선택</option>
							<option value="우리은행">우리은행 ( 324-01-123400 / (주)aqua)</option>
							<option value="국민은행">국민은행 ( 011-02-300481 / (주)aqua)</option>
							<option value="외환은행">외환은행 ( 327-56-333002 / (주)aqua)</option>
							<option value="신한은행">신한은행 ( 987-25-202099 / (주)aqua)</option>
							<option value="하나은행">하나은행 ( 698-00-222176 / (주)aqua)</option>
					</select> <font size=1 color=blue>(카드 or 무통장입금 중 택일!)</font></td>
					</td>
				</tr>
			</table>


			<table border=1 style="font-size: 13pt; font-family: 맑은 고딕">
				<tr>
					<td colspan=2 align="center" width="275" bgcolor="#002C57"><font
						color="red"> <strong>전체 주문 총액(원)</strong>
					</font></td>
					<!-- 왜 hidden 처리를 해야만 하는지 orderOK.jsp를 분석하면서 곰곰히 생각해 볼 것!    -->
					<td width=470 align=right><input type="hidden" name="pay"
						value="<%=total%>"><font color="red"><fmt:formatNumber value="<%=total%>" type="number" /></font>&nbsp(원)</td>
				</tr>
			</table>
			<br>

			<table>
				<tr>
					<!-- onClick 이벤트가 사용되고 있고, input태그의 type 속성값이 "button"임에 유의할 것! -->
					<!--  "js_package.js"에 정의된 자바스크립트 check_val() 함수를 확인 요망! -->
					<td><input class="btn btn-success" type=button value="주문확인" OnClick="check_val()"></td>
					<td><input class="btn btn-danger" type="reset" value="주문취소" name="reset" ></td>
				</tr>
			</table>


		</form>
	</div>
	</div>
	<%
	} //  if-else문의 끝
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>
