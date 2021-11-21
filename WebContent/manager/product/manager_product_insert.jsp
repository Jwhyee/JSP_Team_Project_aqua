<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>상품등록</title></head>
<body>
<font color="blue" size="6"><b>[상품 등록]</b></font>
<form method="post" action="manager_product_result.jsp" >
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td>상품 번호 :  </td>
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
<input type="submit" value="상품등록">
<input type="reset" value="취 소">
</form>
</body>
</html>

