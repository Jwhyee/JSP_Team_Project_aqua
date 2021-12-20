<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../css/style-table.css?v=1">
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("ord_no");

	String jsql = "select * from order_info where ord_no = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String m_id = rs.getString("m_id");
	int ord_no = rs.getInt("ord_no");
	String ord_date = rs.getString("ord_date");
	String ord_receiver = rs.getString("ord_receiver");
	String ord_rcv_address = rs.getString("ord_rcv_address");
	String ord_rcv_phone = rs.getString("ord_rcv_phone");
	String ord_pay = rs.getString("ord_pay");
	String ord_bank = rs.getString("ord_bank");
	String ord_card_no = rs.getString("ord_card_no");
	String ord_card_pass = rs.getString("ord_card_pass");
	String ord_state = rs.getString("ord_state");
%>


<center>
	<form name="newMem" method=post action=manager_order_update_result.jsp>
		<table style="font-size: 10pt; font-family: 맑은 고딕" class="detail">
			<tr>
				<th colspan="2" style="font-size: 16px"><font color="blue">
						[<%=m_id%>회원님의 주문정보입니다]
					</font></th>
			</tr>

			<tr>
				<th>ID</th>
				<td>
					<input name="m_id" class="form-control" type="hidden"
						value="<%=m_id%>" required />
					&nbsp &nbsp<%=m_id%>
				</td>
			</tr>

			<tr>
				<th>주문번호</th>
				<td>
					<input name="ord_no" class="form-control" type="hidden"
						value="<%=ord_no%>" required /><%=ord_no%>
				</td>
			</tr>

			<tr>
				<th>주문일자</th>
				<td>
					<input name="ord_date" class="form-control" type="hidden"
						value="<%=ord_date%>" required /><%=ord_date%>
				</td>
			</tr>

			<tr>
				<th>수령자</th>
				<td>
					<input name="ord_receiver" class="form-control"
						placeholder="수령자 입력" type="text" value="<%=ord_receiver%>"
						required />
				</td>
			</tr>

			<tr>
				<th>수령자 주소</th>
				<td>
					<input name="ord_rcv_address" id="Addr" class="form-control"
						placeholder="주소 검색을 눌러 입력" type="text"
						value="<%=ord_rcv_address%>" required onkeypress="return false;"
						style="caret-color: transparent !important;" />
					<br> <br>
					<input type="button" value="주소 검색" onclick="goPopup();" />
				</td>
			</tr>

			<tr>
				<th>수령자 번호</th>
				<td>
					<input name="ord_rcv_phone" class="form-control"
						placeholder="수령자 입력" type="text" value="<%=ord_rcv_phone%>"
						required />
				</td>
			</tr>

			<tr>
				<th>가격</th>
				<td>
					<input name="ord_pay" class="form-control" type="hidden"
						value="<%=ord_pay%>" required /><%=ord_pay%>
				</td>
			</tr>
			<%
			if (ord_card_no.equals("")) {
			%>
			<tr>
				<th>결제 은행</th>
				<td>
					<input name="ord_bank" class="form-control" type="hidden"
						value="<%=ord_bank%>" required /><%=ord_bank%>
				</td>
			</tr>
			<tr>
				<th>결제 카드</th>
				<td>
					<input name="ord_bank" class="form-control" type="hidden"
						value="<%=ord_card_no%>" required /><font color=red>무통장 결제입니다.</font>
				</td>
			</tr>

			<tr>
				<th>카드 비밀번호</th>
				<td>
					<input name="ord_bank" class="form-control" type="hidden"
						value="<%=ord_card_no%>" required /><font color=red>무통장 결제입니다.</font>
				</td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<th>결제 은행</th>
				<td>
					<input name="ord_bank" class="form-control" type="hidden"
						value="<%=ord_bank%>" required /><font color=red>카드 결제입니다.</font>
				</td>
			</tr>
			<tr>
				<th>결제 카드</th>
				<td>
					<input name="ord_card_no" class="form-control" type="text"
						value="<%=ord_card_no%>" required />
				</td>
			</tr>

			<tr>
				<th>카드 비밀번호</th>
				<td>
					<input name="ord_card_pass" class="form-control" type="text"
						value="<%=ord_card_pass%>" required />
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<th>배송상태</th>
				<td>
					<select name="ord_state">
					
				        <option value="입금확인중">입금확인중</option>
		        		<option value="배송준비중">배송준비중</option>
				        <option value="배송시작">배송시작 </option>
				        <option value="배송완료">배송완료 </option>
		         	</select>
				</td>
			</tr>
		</table>
		<input type=submit class="btn btn-large btn-primary" type="button"
			value="수정완료">
	</form>

	<br> <br>
	</body>
	<%
} catch (Exception e) {
out.println(e);
}
%>
</center>
<%@ include file="../../layout/footer.jsp"%>
<script language="javascript" charset="utf-8">
	function goPopup() {
		var pop = window.open("../../member/join/juso_popup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr) {
		$("#Addr").val(roadFullAddr);
	}
</script>