<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../css/style-table.css?v=123">
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("p_id");
	String jsql = "select * from product where p_id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String p_id = rs.getString("p_id");
	String p_name = rs.getString("p_name");
	int p_price = Integer.parseInt(rs.getString("p_price"));
	int p_stock = Integer.parseInt(rs.getString("p_stock"));
	String p_category = rs.getString("p_category");
	String p_description = rs.getString("p_description");
	String p_option = rs.getString("p_option");
%>

<center>
	<form name="newMem" method=post action=manager_product_update_result.jsp>
		<table style="font-size: 10pt; font-family: 맑은 고딕" class="detail">
			<tr>
				<th>ID</th>
				<div class="form-group input-group fg-x700">
					<td>
						<input name="id" type="hidden" value="<%=p_id%>" required />
						&nbsp &nbsp<%=p_id%></td>
				</div>
			</tr>
			<tr>
				<th>상품이름</th>
				<td>
					<input name="name" class="" placeholder="상품 이름 입력"
						type="text" value="<%=p_name%>" required>
				</td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td>
					<input name="price" class="" placeholder="가격 입력" type="text"
						value="<%=p_price%>" required />
					
				</td>
			</tr>
			<tr>
				<th>재고</th>
				<td>
					<input name="stock" class="" placeholder="재고 입력" type="text"
						value="<%=p_stock%>" required />
				</td>

			</tr>
			<tr>
				<th>카테고리</th>

				<td>
					<div class="">
						<%
						String[] cate = p_category.split("");
						String[] cate_select = new String[3];
						if (cate[0].equals("상")) {
							cate_select[0] = "selected";
						} else if (cate[0].equals("중")) {
							cate_select[1] = "selected";
						} else if (cate[0].equals("하")) {
							cate_select[2] = "selected";
						}
						%>
						<select name=ctg class="">
							<option value="010" <%=cate_select[0]%>>상
							<option value="011" <%=cate_select[1]%>>중
							<option value="011" <%=cate_select[2]%>>하
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>설명</th>
				<div class="">
					<td>
						<textarea name="description" rows="5" cols="30"
							value="<%=p_description%>" required /><%=p_description%>
						</textarea>
					</td>
				</div>
			</tr>
			<tr>
				<th>옵션</th>
				<td>
					<%
					String[] option_arr = p_option.split(" ");

					String[] checked = new String[4];

					for (int i = 0; i < option_arr.length; i++) {
						if (option_arr[i].equals("1")) {
							checked[0] = "checked";
						} else if (option_arr[i].equals("2")) {
							checked[1] = "checked";
						} else if (option_arr[i].equals("3")) {
							checked[2] = "checked";
						} else if (option_arr[i].equals("4")) {
							checked[3] = "checked";
						}
					}
					%>
					<input type="checkbox" name="option" value="1" <%=checked[0]%>>
					1
					<input type="checkbox" name="option" value="2" <%=checked[1]%>>
					2
					<input type="checkbox" name="option" value="3" <%=checked[2]%>>
					3
					<input type="checkbox" name="option" value="4" <%=checked[3]%>>
					4
				</td>
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
