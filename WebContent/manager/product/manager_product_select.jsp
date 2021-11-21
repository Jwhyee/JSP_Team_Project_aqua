<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/style-table.css?v=123">

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project"; 
     String DB_ID="aqua";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from product";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font size='6'><b>[전체 굿즈 조회]   </b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:맑은 고딕">
<thead>
	<tr>
		<th>상품 이미지 </th><th>상품아이디 </th><th>상품명 </th><th>상품 가격</th><th>재고수량 </th><th>카테고리 분류 </th>	
		<th>옵션 </th><th>상품설명 </th><th><b>[수정]</b></th><th><b>[삭제]</b></th>
	</tr>
</thead>	

<%
		while(rs.next()){
		    String p_id = rs.getString("p_id");
			String p_name = rs.getString("p_name");
		   	int p_price =  Integer.parseInt(rs.getString("p_price")); 
			int p_stock =  Integer.parseInt(rs.getString("p_stock")); 
			String p_category = rs.getString("p_category");
			String p_description = rs.getString("p_description");
			String p_option = rs.getString("p_option");
%>
<tbody>
   <tr>           
  	  <td align="center"><a href="manager_product_detail.jsp?p_id=<%=p_id%>"><img src="../../img/product/<%=p_id%>.jpg" width="100" height="100" border=0></a></td>
 	  <td> <a href="manager_product_detail.jsp?p_id=<%=p_id%>"><%=p_id%></a></td>
      <td><%=p_name%></td>
	  <td><%=p_price%></td>
	  <td><%=p_stock%></td>
	  <td><%=p_category%></td>	
	  <td><%=p_option%></td>
 	  <td><%=p_description%></td> 
	  <td align=center><a href="manager_product_update.jsp?p_id=<%=p_id%>">Yes</a></td>
  	  <td align=center><a href="manager_product_delete_result.jsp?p_id=<%=p_id%>">Yes</a></td>
  </tr>
</tbody>
<%
		}  // while문의 끝
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:맑은 고딕">관리자모드 메인페이지</a>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
<%@ include file="../../layout/footer.jsp" %>
</html>