<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<html><head><title>상품 정보 수정</title></head>
<body>

<%
try {
	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project"; 
     String DB_ID="aqua";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

 	 String key = request.getParameter("p_id");

	 String jsql = "SELECT * FROM product WHERE p_id = ?";       
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

	 ResultSet rs = pstmt.executeQuery();//SQL문 실행	
	 rs.next();

	 String p_id = rs.getString("p_id");
	 String p_name = rs.getString("p_name");
	 int p_price =  Integer.parseInt(rs.getString("p_price")); // String => int 변환
	 int p_stock =  Integer.parseInt(rs.getString("p_stock")); // String => int 변환
	 String p_category = rs.getString("p_category");
	 String p_description = rs.getString("p_description");
	 String p_option = rs.getString("p_option");
%>

<font color="blue" size='6'><b>[상품 정보 수정]</b></font><p>
<form method="post" action="updateGoodsResult.jsp">
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">		
		<tr>
			<td>상품 아이디 :  </td>
			<td><input type="text" name="id"></td>
		</tr>		
		<tr>
			<td>상품명 :  </td>
			<td><input type="text" name="name"></td>
		</tr>

		<tr>
			<td>상품가격 :  </td>
			<td><input type="text" name="price"> 원</td>
		</tr>
		<tr>
			<td>재고수량:  </td>
			<td><input type="text" name="stock"> 개</td>
		</tr>
		<tr>
			<td>카테고리분류 :  </td>
			<td>		
			     <select name="ctg">
			        <option value="상">상</option>
	        		<option value="중">중</option>
			        <option value="하">하</option>
		         </select><p>
			 </td>
		</tr>
		<tr>
			<td>옵션 : </td>
			<td>
				<input type=checkbox name="option" value="1">1
				<input type=checkbox name="option" value="2">2
				<input type=checkbox name="option" value="3">3
				<input type=checkbox name="option" value="4">4
			</td>
		</tr>	
		<tr>
			<td>상품설명 :  </td>
			<td><textarea name="description" rows="5" cols="30"></textarea></td>	
		</tr>
</table><p> 

<br>
<img src="../images/<%=key%>_detail.jpg" width=700 height=700 border=0>
<br><br><br>

<input type="submit" value="수정완료">
</form>
<br><br><br>


<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>