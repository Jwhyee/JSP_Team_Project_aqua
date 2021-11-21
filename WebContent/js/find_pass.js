function find_pass()      // 로그인시 미입력항목 부분을 체크해주는 자바스크립트 함수
{
	if(document.find_pass.id.value=="")
	{
    	alert("아이디를 입력해 주세요.");
    	document.find_pass.id.focus();
    	return;	
    }

    if(document.find_pass.joomin1.value=="")
	{
    	alert("주민번호 앞자리를 입력해 주세요.");
    	document.find_pass.joomin1.focus();			
    	return;
    }
	if(document.find_pass.joomin2.value=="")
	{
    	alert("주민번호 뒷자리를 입력해 주세요.");
    	document.find_pass.joomin2.focus();			
    	return;
    }
		
    document.find_pass.submit();
}

function id_focus()     // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{											// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
   	document.find_pass.id.focus();
   	return;
}