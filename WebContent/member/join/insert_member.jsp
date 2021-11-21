<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp" %>
    
    <script language="javascript" src="../js/js_package.js?ver=123" charset="utf-8"></script>
    
<body onLoad="name_focus()">
<div class="frame user-frm">
<article class="card-body" style="max-width: 700px; margin: auto;">
    <!-- 회원가입 form태그 시작 -->
	<form name="newMem" method=post action=insert_member_result.jsp>
	<div class="form-group input-group fg-x700">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="name" class="form-control" placeholder="이름 입력" type="text" required/>
        <input name="sex" type="radio" value="남"required checked/>남자 &nbsp
		<input name="sex" type="radio" value="여"required/>여자  
    </div> <!--이름 form-group// -->
    
	<div class="form-group input-group fg-x700">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="id" class="form-control" placeholder="Id 입력" type="text" required/>
        <a href="javascript:checkID()"> 
        	<button class="btn btn-small btn-primary"type="button">아이디 중복확인</button>
       	</a>
    </div> <!--아이디 form-group// -->
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="password" class="form-control" placeholder="비밀번호 입력" type="password" required>
    </div> <!-- 비밀번호 form-group// -->
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="Email 입력" type="email" required/>
    </div> <!-- 이메일 form-group// -->
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
    	<input name="joomin1" class="form-control" placeholder="주민번호 앞 자리 입력 " type="text" maxlength="6" required/> - 
		<input name="joomin2" class="form-control" placeholder="주민번호 뒷 자리 입력 " type="text" maxlength="7" required/>
    </div> <!-- 주민번호 form-group// -->
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
    	<input name="date" class="form-control" placeholder="생년월일" type="date" required/>&nbsp
		<input name="solar" type="radio" value="양력" required checked/>양력 &nbsp
		<input name="solar" type="radio" value="음력"required/>음력 
    </div>
    
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
		<select name=phone1 class="input">
			<option value="010" selected>010
			<option value="011">011
			<option value="016">016
			<option value="017">017
			<option value="018">018
			<option value="019">019
		</select> -
    	<input name="phone2" class="form-control" placeholder="중간번호 4자리 입력 " type="text" maxlength="4" required/> - 
		<input name="phone3" class="form-control" placeholder="뒷 4자리 입력 " type="text" maxlength="4" required/>
    </div> <!-- form-group// -->
    
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		<input name="address" id="Addr" class="form-control" placeholder="주소 검색을 눌러 입력" type="text" required onkeypress="return false;" style="caret-color: transparent !important;" />
		<input type="button" value="주소 검색" onclick="goPopup();" />
	</div> <!-- form-group end.// --> 

    
    <div class="fg-x700 form-group">
        <button type="submit" class="btn btn-primary btn-block"> 회원 가입  </button>
    </div> <!-- form-group// -->      
                                                                    
</form>
</article>
</div> <!-- card.// -->

<!--container end.//-->

<br><br>
</body>
<%@ include file="../../layout/footer.jsp"%>
<script language="javascript" charset="utf-8">



function goPopup(){
    var pop = window.open("juso_popup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadFullAddr){
	$("#Addr").val(roadFullAddr);
}

</script>
