<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/header.jsp"%>

 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <link rel="stylesheet" href="../../css/style-mypage.css?v=124">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<body>
  
     <section id="visual">
        <div class="msg">
          <a><%=sid %> 님 환영합니다 </a>
        </div>
    </section>
    <!--  menu list 시작  -->
    <section id="menu">
		 <ul class="hbox-menu">
		    <li><a href="#">회원정보</a></li>
		    <li><a href="#">구매내역</a></li>
		    <li><a href="#">문의내역</a></li>
		    <li><a href="#">장바구니</a></li>
	    </ul>
	</section>
    
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>