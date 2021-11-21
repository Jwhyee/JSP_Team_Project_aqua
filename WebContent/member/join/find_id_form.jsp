<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<!-- bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<script language="javascript" src="../../js/find_id.js" charset="utf-8"></script>
<body onLoad="name_focus()">


	<div class="frame user-frm">
		<article class="card-body" style="max-width: 400px; margin: auto;">
			<!-- find form태그 시작 -->
			<form name="find_id" method="post" action="find_id.jsp" target=parent>
				<h2 class="form-signin-heading  text-center">아이디를 잊어버리셨나요?</h2>
				<br>
				<div class="form-group input-group fg-x400">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="name" class="form-control" placeholder="이름 입력"
						type="text" required />
				</div>
				<!-- form-group// -->

				<div class="form-group input-group fg-x400">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input name="joomin1" class="form-control"
						placeholder="주민번호 앞 자리 입력 " type="text" maxlength="6" required />
					- <input name="joomin2" class="form-control"
						placeholder="주민번호 뒷 자리 입력 " type="password" maxlength="7" required />
				</div>
				<!-- form-group// -->

				<div class="fg-x400 form-group">
					<a href="javascript:find_id()"><button type="button"
							class="btn btn-primary btn-block">아이디 찾기</button></a>
				</div>
				<!-- form-group// -->
			</form>

		</article>

	</div>

	<br>
	<br>
	<%@ include file="../../layout/footer.jsp" %>
</body>