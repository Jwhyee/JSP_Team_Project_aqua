<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %> 
<html><head><title>상품 등록 처리 결과</title></head>
<body>

<% 
	request.setCharacterEncoding("utf-8");  // 입력폼에서 전송된 한글데이터 처리

	// 입력폼에서 받는 데이터는 모두 String형임
    String p_id = request.getParameter("id");
	String p_name = request.getParameter("name");
   	int p_price =  Integer.parseInt(request.getParameter("price")); // String => int 변환
	int p_stock =  Integer.parseInt(request.getParameter("stock")); // String => int 변환
	String p_category = request.getParameter("ctg");
	String p_description = request.getParameter("description");
	
	String[ ] p_option=request.getParameterValues("option");
	String p_option_list = " ";
	if(p_option != null) 
	{
		for(int i=0;i<p_option.length;i++) 	
		{
			p_option_list +=p_option[i];
			p_option_list +="  ";   // 문자열을 공백으로 초기화
		}
	}
	else
		p_option_list = "옵션 없음";


try {
	 String DB_URL="jdbc:mysql://localhost:3306/aqua_project";   //  DB명이 project임
	 String DB_ID="aqua"; 
     String DB_PASSWORD="1234";
	 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
     // DB에 접속           

	//SQL문 작성 : 테이블 필드명
    String jsql = "INSERT INTO product  (p_id, p_name, p_price, p_stock, p_category, p_description, p_option) VALUES  (?, ?, ?, ?, ?, ?, ?)"; 
      
    //PreparedStatement 생성(SQL문의 형틀을 정의함)
	PreparedStatement pstmt = con.prepareStatement(jsql); 

	//위의 SQL문에서 ?에 해당되는 곳에 다음의 값들을 하나씩 할당함 (인수 전달)
	//정수형의 경우에는 setInt()를 사용함
    pstmt.setString(1, p_id); 
    pstmt.setString(2, p_name);
	pstmt.setInt(3, p_price);  //정수값인 경우
	pstmt.setInt(4, p_stock); //정수값인 경우
	pstmt.setString(5, p_category);
	pstmt.setString(6, p_description);
	pstmt.setString(7, p_option_list);
	pstmt.executeUpdate(); // SQL문 실행
%>
<center>
<font color="blue" size='6'><b>[등록된 상품 정보]</b></font><p>
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">
		<tr><td width="100">상품 아이디 </td><td width="300"><%=p_id%></td></tr>
		<tr><td width="100">상품명</td><td width="300"><%=p_name%></td></tr>
		<tr><td width="100">상품가격</td><td width="300"><%=p_price%> 원</td></tr>
		<tr><td width="100">재고수량</td><td width="300"><%=p_stock%> 개</td></tr>
		<tr><td width="100">카테고리 분류 </td><td width="300"><%=p_category%></td></tr>
		<tr><td width="100">옵션 </td><td width="300"><%=p_option_list%></td></tr>
		<tr><td width="100">상품설명</td><td width="300"><%=p_description%></td></tr>
</table><p>
<% 
  } catch(Exception e) { 
		out.println(e);
}
%>
<p>
<a href = "manager_product_select.jsp" style="font-size:10pt;font-family:맑은 고딕">전체 등록상품  조회</a><br><br>
</center>
</body>
</html>