<%@page import="java.text.DecimalFormat"%>
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
		<%
		try { // (1)  (34행~151행):  tempcart 테이블에 즉시구매할 상품레코드 저장후, tempcart 내역을 그대로 보여주기 

			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
			String DB_ID = "aqua";
			String DB_PASSWORD = "1234";

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String ct_no = session.getId(); // 세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장

			//   46~50행 부분:   만일, "즉시구매하기" 클릭 후, 주문을 완료하지 않고 중간에 주문을 취소시킬 경우엔, 
			//   주문하려다 취소시킨 상품내역이 그대로 tempcart 테이블에 남아있게 된다. 따라서, 이러한 문제점을 
			//   방지하기 위하여, "즉시구매하기"를 수행하기 직전에 명시적으로 tempcart 테이블을 비워주도록 처리함.
			String jsql5 = "delete from temp_cart where ct_no=?";
			PreparedStatement pstmt5 = con.prepareStatement(jsql5);
			pstmt5.setString(1, ct_no);

			pstmt5.executeUpdate();

			//   54행부터, 실제로 "즉시구매하기"와 관련된 코드부분이 시작됨.
			//  상세정보페이지(폼)으로부터 "즉시구매"하고자 하는 상품번호와 주문수량을 넘겨받는다.
			String p_id = request.getParameter("p_id"); // 상품번호
			int ct_qty = Integer.parseInt(request.getParameter("amount")); //  주문수량

			// tempcart 테이블에 "즉시구매"할  상품레코드를 저장시킴
			String jsql = "insert into temp_cart (ct_no, p_id, ct_qty) values (?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, ct_no);
			pstmt.setString(2, p_id);
			pstmt.setInt(3, ct_qty);

			pstmt.executeUpdate();
		%>
	<center>
		<br>
		<br>
		<font color="blue" size='6'>
			<b>[상품 주문서]</b>
		</font>
	<p>


		<!--  (74행~269행):   order.jsp의 48행~235행과 거의 95%이상 유사한 코드를 사용하고 있음  -->
		<!--  103행에서 cart 테이블이 아니라, tempcart 테이블을 사용하고 있음에 유의할 것!              -->
	<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
		<tr>
			<td bgcolor="#002C57" width=120 height="30" align="center">
				<p align="center">
					<font size="2" color="#ECFAE4">
						<strong>상품번호</strong>
					</font>
			</td>
			<td bgcolor="#002C57" width=120 height="30" align="center">
				<p>
					<font size="2" color="#ECFAE4">
						<strong>상품명</strong>
					</font>
			</td>
			<td bgcolor="#002C57" width=120 height="30" align="center">
				<p>
					<font size="2" color="#ECFAE4">
						<strong>상품단가(원)</strong>
					</font>
			</td>
			<td bgcolor="#002C57" width=120 height="30" align="center">
				<p>
					<font size="2" color="#ECFAE4">
						<strong>주문수량(개)</strong>
					</font>
			</td>
			<td bgcolor="#002C57" width=120 height="30" align="center">
				<p>
					<font size="2" color="#ECFAE4">
						<strong>주문액(원)</strong>
					</font>
			</td>
			<td bgcolor="#002C57" width=114 height="30" align="center">
				<p>
					<font size="2" color="red">
						<b>비 고</b>
					</font>
			</td>
		</tr>


		<%
		//  [103행~151행 설명] :
		//  tempcart 테이블(cart 테이블 아님!)에 담긴 상품내역을 웹페이지상에 보여주고자 할 때, 각각의 항목들이
		//  상품번호(prdNo),  상품명(prdName),  상품단가(prdPrice),  주문수량(ctQty), 
		//  주문액(prdPrice*ctQty ),  전체주문총액(total)으로 구성되고 있음에 유의할 것! 
		//   => "즉시구매하기" 실행 후 보여지는 해당 웹페이지의 출력결과를 토대로 각 구성요소들을 확인 요망!

		//  tempcart 테이블:  상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 올 수 있음.
		//  goods 테이블:  상품명(prdName)과 상품단가(prdPrice) 값을 추출해 올 수 있음.
		//  따라서, tempcart테이블과 goods테이블로부터, 동일한 상품번호(prdNo)에 해당하는 각 항목들의 값을 
		//  추출해 올 수 있다. (mysql상에서 tempcart테이블과 goods테이블에 어떠한 필드들이 존재하는지 확인 요망!)
		//  =>  <알고리즘 설명>:  tempcart테이블로부터 상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 오고, 
		//         여기서 추출한 상품번호(prdNo)에 근거하여 goods테이블로부터
		//         상품명(prdName)과 상품단가(prdPrice) 를 추출해 낸다.
		//         이를 토대로, 주문액(prdPrice*ctQty )과  전체주문총액(total)을 계산해 낸다.
		//         그런 다음, 추출해 낸 각 필드들 및 계산된 결과값들을 웹브라우저상에 출력해 준다. 

		String jsql2 = "select p_id, ct_qty from temp_cart where ct_no = ?"; //  tempcart 테이블을 사용함에 유의!
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ct_no);

		ResultSet rs2 = pstmt2.executeQuery();

		int total = 0; //  130행 참조

		//	while(rs2.next()) 
		//	{			                   

		rs2.next(); //  즉시구매하기의 경우, 즉시구매할 상품레코드만 가리켜주면 됨(while문은 불필요함!)

		String p_id2 = rs2.getString("p_id"); //  tempcart 테이블로부터 상품번호 추출
		int ct_qty2 = rs2.getInt("ct_qty"); //  tempcart 테이블로부터 주문수량 추출 

		String jsql3 = "select p_name, p_price from product where p_id = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, p_id2);

		ResultSet rs3 = pstmt3.executeQuery();
		rs3.next();

		String p_name = rs3.getString("p_name"); //  goods 테이블로부터 상품명 추출
		int p_price = rs3.getInt("p_price"); //  goods 테이블로부터 상품단가 추출

		int amount = p_price * ct_qty2; //  주문액 계산
		total = total + amount; //  전체 주문총액 계산
		%>


		<tr>
			<td bgcolor="#eeeede" height="30" align="center">
				<font size="2"><%=p_id%></font>
			</td>
			<td bgcolor="#eeeede" height="30" align="center">
				<font size="2"><%=p_name%></font>
			</td>
			<td bgcolor="#eeeede" height="30" align="center" align=right>
				<font size="2">
					<fmt:formatNumber value="<%=p_price%>" type="number" />
				</font>
			</td>
			<td bgcolor="#eeeede" height="30" align="center" align=right>
				<font size="2"><%=ct_qty%></font>
			</td>
			<td bgcolor="#eeeede" height="30" align="right">
				<font size="2">
					<fmt:formatNumber value="<%=amount%>" type="number" />
					원
				</font>
			</td>
			<td bgcolor="#eeeede" height="30" align="center">
				<a href="cart_delete.jsp?p_id=<%=p_id%>">
					<font size="2" color=blue>
						<b>삭제</b>
				</a>
				</font>
			</td>
		</tr>
		<%

		%>
		<tr>
			<td colspan=4 align=center>
				<font size="2" color="red">
					<b>전체 주문총액</b>
				</font>
			</td>
			<td bgcolor="#eeeede" height="30" align=right>
				<font size="2" color="red">
					<b><fmt:formatNumber value="<%=total%>" type="number" />원</b>
				</font>
			</td>
			<td align=center>
				<font size=2 color=green>(선택물품 총합)</font>
			</td>
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
	<form name="form" method="Post" action="direct_product_order_ok.jsp">
		<!--  폼의 이름이 form으로 지정됨 -->
		<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td rowspan=3 width="155" align="center" bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>주문자 정보</strong>
					</font>
				</td>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>이 름 
				</td>
				<td width=470><%=name%></td>
			</tr>
			<tr>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>전 화</strong>
					</font>
				</td>
				<td width=470>
					<input type="text" name="memTel" size=40 value=<%=phone%>>
				</td>
			</tr>
		</table>


		<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td rowspan=3 width="155" align="center" bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>수령인 정보</strong>
					</font>
				</td>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>이 름</strong>
					</font>
				</td>
				<td width=470>
					<input type="text" name="receiver" size=40>
				</td>
			</tr>
			<tr>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>주 소</strong>
					</font>
				</td>
				<td width=470>
					<input type="text" name="rcvAddress" size=40>
				</td>
			</tr>
			<tr>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>전 화</strong>
					</font>
				</td>
				<td width=470>
					<input type="text" name="rcvPhone" size=40>
				</td>
			</tr>
		</table>


		<table border=1 style="font-size: 10pt; font-family: 맑은 고딕">
			<tr>
				<td rowspan=2 align="center" width="155" bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>결제 방법</strong>
					</font>
				</td>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>신용카드 번호 
				</td>
				<td width=120>
					<input type="text" name="cardNo">
				</td>
				<td align="center" width=112 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>비밀번호</strong>
					</font>
				</td>
				<td width=120>
					<input type="password" name="cardPass">
				</td>
			</tr>
			<tr>
				<td align="center" width=110 bgcolor="#002C57">
					<font size="2" color="#ECFAE4">
						<strong>무통장 입금</strong>
					</font>
				</td>
				<td colspan=3 width=474>
					<select name="bank">
						<option value="0" selected>다음 중 선택</option>
						<option value="우리은행">우리은행 ( 324-01-123400 / (주)aqua)</option>
						<option value="국민은행">국민은행 ( 011-02-300481 / (주)aqua)</option>
						<option value="외환은행">외환은행 ( 327-56-333002 / (주)aqua)</option>
						<option value="신한은행">신한은행 ( 987-25-202099 / (주)aqua)</option>
						<option value="하나은행">하나은행 ( 698-00-222176 / (주)aqua)</option>
					</select>
					<font size=1 color=blue>(카드 or 무통장입금 중 택일!)</font>
				</td>
				</td>
			</tr>
		</table>


		<table border=1 style="font-size: 13pt; font-family: 맑은 고딕">
			<tr>
				<td colspan=2 align="center" width="275" bgcolor="#002C57">
					<font color="red">
						<strong>전체 주문 총액(원)</strong>
					</font>
				</td>
				<!-- 왜 hidden 처리를 해야만 하는지 orderOK.jsp를 분석하면서 곰곰히 생각해 볼 것!    -->
				<td width=470 align=right>
					<input type="hidden" name="pay" value="<%=total%>">
					<font color="red">
						<fmt:formatNumber value="<%=total%>" type="number" />
					</font>
					&nbsp(원)
				</td>
			</tr>
		</table>
		<br>

		<table>
			<tr>
				<!-- onClick 이벤트가 사용되고 있고, input태그의 type 속성값이 "button"임에 유의할 것! -->
				<!--  "js_package.js"에 정의된 자바스크립트 check_val() 함수를 확인 요망! -->
				<td>
					<input class="btn btn-success" type=button value="주문확인"
						OnClick="check_val()">
				</td>
				<td>
					<input class="btn btn-danger" type="reset" value="주문취소"
						name="reset">
				</td>
			</tr>
		</table>


	</form>
	</div>
	</center>
	<%
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>
