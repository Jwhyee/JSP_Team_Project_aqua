<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../layout/header.jsp" %>

<script language="javascript" src="../../js/js_package.js" charset="utf-8"></script>

<%
	request.setCharacterEncoding("UTF-8");
	String s_m_id = (String)session.getAttribute("s_m_id"); 
%>
<body onLoad="login_focus()">


<div class="frame user-frm">
<article class="card-body" style="max-width: 400px; margin: auto;">
    <!-- 로그인 form태그 시작 -->
	<form name="login" method="post" action="login_ok.jsp" target=parent>
		<div class="form-group input-group fg-x400">
			<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
			 </div>
			 <c:choose>
			 	<c:when test = "${empty s_m_id}">
			 		<input name="id" class="form-control" placeholder="Id 입력" type="text" required/>
			 	</c:when>
			 	<c:otherwise>
			 		<input name="id" class="form-control" placeholder="Id 입력" type="text" value="<%=s_m_id%>" required/>
			 	</c:otherwise>
			 </c:choose>
	    </div> <!-- form-group// -->
	    
	    <div class="form-group input-group fg-x400">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
			</div>
	        <input name="pass" class="form-control" placeholder="비밀번호 입력" type="password" required/>
	    </div> <!-- form-group// -->
	    
	    <div class="fg-x400 form-group">
	        <a href="javascript:login_check()"><button type="button" class="btn btn-primary btn-block"> 로그인  </button></a>
	    </div> <!-- form-group// -->
	   	</form>
	   	<!-- 로그인 form태그 끝 -->
	   	
	   	<div class="links">
	        <a href="../join/find_id_form.jsp">아이디 찾기</a> | <a href="../join/find_pass_form.jsp">비밀번호 찾기</a> | <a href="../join/insert_member.jsp">회원가입</a>
	    </div>
</article>

</div>

<br><br>
</body>
<%@ include file="../../layout/footer.jsp" %>
