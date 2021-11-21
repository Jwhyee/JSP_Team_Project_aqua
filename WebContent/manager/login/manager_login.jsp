<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header_manager.jsp"%>
<link href="../../css/styles.css" rel="stylesheet" media="screen">
<script language="javascript" src="../../js/js_package.js">
	
</script>

<body onLoad="login_focus()" id="login">
	<div class="container">
		<form name="login" method="post" action="manager_login_ok.jsp"
			target=_parent class="form-signin">
			<h2 class="form-signin-heading  text-center">관리자 로그인</h2>
			<br>
			<input type="text" class="form-control" placeholder="아이디"
				name="id">
			<input type="password" class="form-control" placeholder="비밀번호"
				name="pass" onkeydown="onEnterSubmit()">
			<div class="text-center">
				<a href="javascript:login_check()">
					<button class="btn btn-large btn-primary" type="button">로그인</button>
				</a>
			</div>
		</form>
	</div>
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>