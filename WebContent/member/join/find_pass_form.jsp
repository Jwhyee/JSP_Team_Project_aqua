<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>


<script language="javascript" src="../../js/find_pass.js" charset="utf-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String s_m_id = (String)session.getAttribute("s_m_id"); 
%>

<body onLoad="id_focus()">



<div class="frame user-frm">
<article class="card-body" style="max-width: 400px; margin: auto;">
    <!-- find form태그 시작 -->
	<form name="find_pass" method="post" action="find_pass.jsp" target=parent>
		     <h2 class="form-signin-heading  text-center">
         		<font color="blue">비밀번호를</font> 잊으셨나요? 
         	</h2><br>
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
	        <input name="joomin1" class="form-control" placeholder="주민번호 앞 자리 입력 " type="text" maxlength="6" required/> - 
			<input name="joomin2" class="form-control" placeholder="주민번호 뒷 자리 입력 " type="password" maxlength="7" required/>
	    </div> <!-- form-group// -->
	    
	    <div class="fg-x400 form-group">
	        <a href="javascript:find_pass()"><button type="button" class="btn btn-primary btn-block"> 비밀번호 찾기  </button></a>
	    </div> <!-- form-group// -->
	   	</form>
	   	
</article>

</div>

<br><br>
<%@ include file="../../layout/footer.jsp" %>
</body>

