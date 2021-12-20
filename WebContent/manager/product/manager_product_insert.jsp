<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/style-table.css?v=123">
<center>
<font size="6"><b>[상품 등록]</b></font>
<form method="post" action="manager_product_result.jsp" >
<table border="2" cellpadding="10"
		style="font-size: 10pt; font-family: 맑은 고딕" class="detail">
		<tr>
			<th>상품 번호 :  </th>
			<td><input type="text" name="id"></td>
		</tr>		
		<tr>
			<th>상품명 :  </th>
			<td><input type="text" name="name"></td>
		</tr>

		<tr>
			<th>상품가격(원):  </th>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<th>재고수량(개):  </th>
			<td><input type="text" name="stock"></td>
		</tr>
		<tr>
			<th>카테고리분류 :  </th>
			<td>		
			     <select name="ctg">
			        <option value="아쿠아리움관">아쿠아리움관</option>
	        		<option value="파충류관">파충류관</option>
			        <option value="정글존">정글존 </option>
		         </select><p>
			 </td>
		</tr>
		<tr>
			<th>옵션 : </th>
			<td>
				<input type=checkbox name="option" value="1">&nbsp;1&nbsp;&nbsp;
				<input type=checkbox name="option" value="2">&nbsp;2&nbsp;&nbsp;
				<input type=checkbox name="option" value="3">&nbsp;3&nbsp;&nbsp;
				<input type=checkbox name="option" value="4">&nbsp;4&nbsp;
			</td>
		</tr>	
		<tr>
			<th>상품설명 :  </th>
			<td><textarea name="description" rows="5" cols="30"></textarea></td>	
		</tr>
</table><p>
<input type="submit" value="상품등록">
<input type="reset" value="취 소">
</form>
</body>
</center>
<%@ include file="../../layout/footer.jsp" %>
</html>

