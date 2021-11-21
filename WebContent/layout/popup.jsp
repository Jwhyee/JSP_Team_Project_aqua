<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/style-popup.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- layer popup content -->
	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox">
			<h4 class="title">FineApple 공지사항</h4>
			<div class="cont">
				<p>
					<img src="../img/product/1.jpg" width=350 height=500 usemap="#popup"
						alt="event page">
				</p>
			</div>
			<form name="pop_form">
				<div id="check">
					<input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
					<label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
				</div>
				<div id="close">
					<a href="javascript:closePop();">닫기</a>
				</div>
			</form>
		</div>
	</div>


</body>

<script language="JavaScript">
//head 태그 안에 스크립트 선언
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
</script>
 <script language="Javascript">
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>
</html>