
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>


<%@ page import="java.sql.*"%>

<style type="text/css">
a:link {
	text-decoration: none;
	color: black;
}

<!--
클릭하기전의 설정은 선없고 검정색 -->a:visited {
	text-decoration: none;
	color: black;
}

<!--
방문한뒤의 설정은 밑줄없고 검정 -->a:hover {
	text-decoration: underline;
	color: gray;
}
<!--
마우스가
 
올라갈때
 
설정은
 
아랫줄있고
 
파랑
 
-->
</style>


<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	request.setCharacterEncoding("utf-8");

	String ct_no = session.getId(); //  세션번호(장바구니번호) 를 ctNo에 저장
							//  주문자정보를 위해 추후 필요함.
	String oName = request.getParameter("name");
	String oTel = request.getParameter("memTel");
	String oReceiver = request.getParameter("receiver");
	String oRcvAddress = request.getParameter("rcvAddress");
	String oRcvPhone = request.getParameter("rcvPhone");
	String oCardNo = request.getParameter("cardNo");
	String oCardPass = request.getParameter("cardPass");
	String oBank = request.getParameter("bank");
	String oPay = request.getParameter("pay");

	// 새로운 주문번호(ordNo)를 부여하기 위해, 주문테이블에 있는 마지막 주문번호를 가져옴.
	// 주문이 들어올 때마다 주문번호는 1씩 증가하므로, MAX(ordNo)은 ordNo의 최대값, 즉 
	//  마지막 주문번호를 의미함.
	String jsql = "select MAX(ord_no) from order_info order by ord_no";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery();

	int o_num;
	if (rs.next()) // 주문번호가 orderinfo 테이블에 존재한다면,  "이전 주문번호" + 1 을 수행
		o_num = rs.getInt(1) + 1; //  rs.getInt(1)의 의미:   rs.next()가 가리키고 있는 레코드의 첫번째 필드에 
							//  해당하는 필드값을 의미함 
							//  이 경우, rs.getInt(1)는  rs.getInt("MAX(ordNo)")와 동일한 의미가 됨.
							//  => mysql상에서 sql문을 실행하여 왜 동일의미가 되는지 꼭 확인해 볼 것!
	else
		o_num = 1; // 주문번호가 존재하지 않는다면, 주문번호를 1부터 시작하도록 함
			// (아직 단 한건의 주문도 접수받지 않은 상태라면, 주문번호가 존재하지 않을 수도 있음) 

	String jsql2 = "select p_id, ct_qty from cart where ct_no = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ct_no);

	ResultSet rs2 = pstmt2.executeQuery();

	//  장바구니 테이블(cart)에 있는 내역들을 읽어와서,
	//  주문상품 테이블(ordProduct)에 주문번호(ordNo), 상품번호(prdNo), 주문수량(ordQty)을 저장시킴!
	while (rs2.next()) // 주문상품테이블(orderProduct)에 주문번호(ordNo), 상품번호(prdNo), 
	{ // 주문수량(ordQty)을 저장하기 위해, 장바구니테이블(cart)로부터
		//  prdNo과 ctQty를 가져온다.
		String p_id = rs2.getString("p_id"); //  cart테이블로부터 상품번호 추출
		int ct_qty = rs2.getInt("ct_qty"); //  cart테이블로부터 주문수량 추출 

		String jsql3 = "INSERT INTO order_product (ord_no, p_id, ord_qty) VALUES (?,?,?)";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, Integer.toString(o_num));
		pstmt3.setString(2, p_id);
		pstmt3.setInt(3, ct_qty);

		pstmt3.executeUpdate();
	}
	
	//티켓
	
	String jsql5 = "select t_id, ct_qty_a, ct_qty_t, ct_qty_c from cart_t where ct_no = ?";
	
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	pstmt5.setString(1, ct_no);

	ResultSet rs5 = pstmt5.executeQuery();

	//  장바구니 테이블(cart)에 있는 내역들을 읽어와서,
	//  주문상품 테이블(ordProduct)에 주문번호(ordNo), 상품번호(prdNo), 주문수량(ordQty)을 저장시킴!
	while (rs5.next()) // 주문상품테이블(orderProduct)에 주문번호(ordNo), 상품번호(prdNo), 
	{ // 주문수량(ordQty)을 저장하기 위해, 장바구니테이블(cart)로부터
		//  prdNo과 ctQty를 가져온다.
		String t_id = rs5.getString("t_id"); //  cart테이블로부터 상품번호 추출
		int ct_qty_a = rs5.getInt("ct_qty_a"); //  cart테이블로부터 주문수량 추출
		int ct_qty_t = rs5.getInt("ct_qty_t");
		int ct_qty_c = rs5.getInt("ct_qty_c");

		String jsql6 = "INSERT INTO order_product (ord_no, p_id, ord_qty_a, ord_qty_t, ord_qty_c) VALUES (?,?,?,?,?)";
		PreparedStatement pstmt6 = con.prepareStatement(jsql6);
		pstmt6.setString(1, Integer.toString(o_num));
		pstmt6.setString(2, t_id);
		pstmt6.setInt(3, ct_qty_a);
		pstmt6.setInt(4, ct_qty_t);
		pstmt6.setInt(5, ct_qty_c);

		pstmt6.executeUpdate();
	}

	//  주문정보 테이블(ordInfo)에 저장시킬 필드들을 저장 
	String jsql4 = "INSERT INTO order_info (ord_no, m_id, ord_date, ord_receiver, ord_rcv_address, ord_rcv_phone, ord_pay, ord_bank, ord_card_no, ord_card_pass)  VALUES(?,?,?,?,?,?,?,?,?,?)";

	// 주문일을 오늘 날짜로 ordInfo테이블에 저장
	java.util.Date date = new java.util.Date(); //   Date 타입의 객체 date 생성
	String oDate = date.toLocaleString(); //   변수 oDate에 현재 시각(년.월.일 시:분:초)을 저장

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(o_num));
	pstmt4.setString(2, sid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, oReceiver);
	pstmt4.setString(5, oRcvAddress);
	pstmt4.setString(6, oRcvPhone);
	pstmt4.setString(7, oPay);
	pstmt4.setString(8, oBank);
	pstmt4.setString(9, oCardNo);
	pstmt4.setString(10, oCardPass);

	pstmt4.executeUpdate();

	//  주문정보와 관련된 일체의 정보들을 각각 orderproduct 테이블과 orderinfo 테이블에 
	//  저장시킨 후, 장바구니 비우기를 수행함.
	//  단,  i) 주문 후에 장바구니를 비우는 것과, ii) 주문없이 장바구니를 비우는 것을 각각
	//  구분하기 위하여, case=1을 deleteAllCart.jsp 수행시 함께 넘겨줌으로써 이를 구별시킴.
	//  즉,  deleteAllCart.jsp?case=1 :  주문처리 완료 후에 장바구니를 비우는 경우를 의미함.
	//         deleteAllCart.jsp :  주문없이 "장바구니비우기"를 클릭하여 장바구니 비우는 경우를 의미함
	//  forward 액션태그를 사용해도 동일함

} catch (Exception e) {
	out.println(e);
}
%>
<jsp:forward page="cart_all_delete.jsp?case=1.jsp" />
<%@ include file="../../layout/footer.jsp"%>
</body>
</html>
