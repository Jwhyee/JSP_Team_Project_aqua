<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../layout/header_manager.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/style-table.css?v=1">
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project"; 
     String DB_ID="aqua";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font size='6'><b>[전체 회원 조회]   </b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:맑은 고딕">
<thead>
	<tr>
		<th>아이디 </th><th>비밀번호 </th><th>이름 </th><th>생일</th><th>성별 </th><th>이메일 </th>	
		<th>휴대폰 번호 </th><th>주민번호 </th><th>성별</th><th>주소</th><th><b>[수정]</b></th><th><b>[삭제]</b></th>
	</tr>
</thead>
<%
		while(rs.next()){
		    String id = rs.getString("m_id");
			String password = rs.getString("m_password");
		   	String name =  rs.getString("m_name"); 
		   	String birth =  rs.getString("m_date"); 
			String sex = rs.getString("m_gender");
			String email = rs.getString("m_email");
			String phone = rs.getString("m_phone");
			String joomin = rs.getString("m_joomin");
			String address = rs.getString("m_address");
			String solar = rs.getString("m_solar");
%>
<tbody>
   <tr>           
 	  <th><a href="manager_member_detail.jsp?id=<%=id%>"><%=id%></a></th>
      <td><%=password%></td>
	  <td><%=name%></td>
	  <td><%=birth%></td>
	  <td><%=sex%></td>	
	  <td><%=email%></td>
 	  <td><%=phone%></td> 
 	  <td><%=joomin%></td> 
 	  <td><%=solar%></td> 
 	  <td><%=address%></td> 
	  <td align=center><a href="manager_member_update.jsp?p_id=<%=id%>">Yes</a></td>
  	  <td align=center><a href="manager_member_delete.jsp?p_id=<%=id%>">Yes</a></td>
  </tr>
</tbody>
<%
		}  // while문의 끝
%>
</table><p>
<br>
 <a href="../manager_index.jsp" style="font-size:10pt;font-family:맑은 고딕">관리자모드 메인페이지</a>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</center>
<%@ include file="../../layout/footer.jsp" %>
</html>