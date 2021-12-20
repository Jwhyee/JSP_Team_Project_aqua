

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function checkID()		// ID를 입력받은 후에 팝업창을 띄워주면서 
{  										//   checkId.jsp (중복검사 수행)를 호출해 주는 자바스크립트 함수
	var id = newMem.id.value;		//  form의 이름이 newMem인 것에 주목할 것!

	if (id == "")				//   11~16행:  ID를 입력없이 ID 중복체크 버튼을 클릭할 경우의 처리
	{
		swal("ID를 입력해 주세요!");
		newMem.id.focus();
		return;
	}

	window.open("id_check.jsp?id=" + id, "win", "width=255, height=145, scrollbars=no, resizable=no");
}                                        // 용례)  =>  window.open("URL", "창이름", "창의 특성");

function checkID2()		// ID를 입력받은 후에 팝업창을 띄워주면서 
{  										//   checkId.jsp (중복검사 수행)를 호출해 주는 자바스크립트 함수
	var id = newMem.id.value;		//  form의 이름이 newMem인 것에 주목할 것!

	if (id == "")				//   11~16행:  ID를 입력없이 ID 중복체크 버튼을 클릭할 경우의 처리
	{
		swal("ID를 입력해 주세요!");
		newMem.id.focus();
		return;
	}

	window.open("../../member/join/id_check.jsp?id=" + id, "win", "width=255, height=145, scrollbars=no, resizable=no");
}                                        // 용례)  =>  window.open("URL", "창이름", "창의 특성");




function checkValue()             // 회원가입폼에서 미입력한 항목이 있을 경우, 경고메시지를 보여주는 함수
{
	if (newMem.id.value == "")     // if(document.newMem.id.value == "")라고 사용해도 동일함
	{
		swal("ID를 입력해 주세요!");  //  문자열이 포함된 경고창을 실행시킴
		newMem.id.focus();					//  작업의 포커스(커서)를 ID를 입력하는 텍스트필드로 이동시킴  
		return;                         //  함수의 실행을 종료함 ( "return false; " 라고 사용해도 동일함)
	}

	if (newMem.password.value == "") {
		swal("비밀번호를 입력해 주세요!");
		newMem.password.focus();
		return;
	}

	if (newMem.name.value == "") {
		swal("성명을 입력해 주세요!");
		newMem.name.focus();
		return;
	}

	if (newMem.joomin1.value == "") {
		swal("주민등록번호 앞자리를 입력해 주세요!");
		newMem.joomin1.focus();
		return;
	}

	if (newMem.joomin2.value == "") {
		swal("주민등록번호 뒷자리를 입력해 주세요!");
		newMem.joomin2.focus();
		return;
	}

	if (newMem.birthYear.value == "") {
		swal("태어난 연도를 입력해 주세요!");
		newMem.birthYear.focus();
		return;
	}

	if (newMem.birthMonth.value == "") {
		swal("태어난 달을 입력해 주세요!");
		newMem.birthMonth.focus();
		return;
	}

	if (newMem.birthDay.value == "") {
		swal("태어난 날짜를 입력해 주세요!");
		newMem.birthDay.focus();
		return;
	}

	if (newMem.telephone.value == "") {
		swal("전화번호를 입력해 주세요!");
		newMem.telephone.focus();
		return;
	}

	if (newMem.address.value == "") {
		swal("주소를 입력해 주세요!");
		newMem.address.focus();
		return;
	}

	if (newMem.hp1.value == "") {
		swal("휴대폰 앞자리 국번을 입력해 주세요!");
		newMem.hp1.focus();
		return;
	}

	if (newMem.hp2.value == "") {
		swal("휴대폰 중간자리 번호를 입력해 주세요!");
		newMem.hp2.focus();
		return;
	}

	if (newMem.hp3.value == "") {
		swal("휴대폰 끝자리 번호를 입력해 주세요!");
		newMem.hp3.focus();
		return;
	}

	newMem.submit();   // 입력한 값들을 모두 서버로 전송함 (전송버튼 클릭하는 것과 같은 효과)
}





function name_focus()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	newMem.name.focus();
	return;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp 내에서 사용되는 자바스크립트 코드의 끝
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  엔터 눌렀을 때 상호작용
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function press() {
	if (event.keyCode == 13) {
		login_check();
	}
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  login.jsp 및 manager.html 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function login_check()      // 로그인시 미입력항목 부분을 체크해주는 자바스크립트 함수
{
	if (document.login.id.value == "") {
		swal("아이디를 입력해 주세요.");
		document.login.id.focus();
		return;
	}

	if (document.login.pass.value == "") {
		swal("비밀번호를 입력해 주세요.");
		document.login.pass.focus();
		return;
	}

	document.login.submit();
}




function login_focus()     // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{											// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	document.login.id.focus();
	return;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  login.jsp 및 manager.html 내에서 사용되는 자바스크립트 코드의 끝
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailProduct.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
{
	var str = product.qty.value;
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()              //  "장바구니담기" 버튼을 클릭시 호출
{
	var str = product.qty.value;
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}


function enlarge()           //  상품이미지 클릭시 팝업창을 띄워주면서 이미지 표시
{
	var no = document.product.prdNo.value;
	window.open("./images/" + no + ".jpg", "win", "width=280, height=280, scrollbars=no, resizable=no");
}



function amountCheck()     //   주문수량에 유효한 값만 들어가도록 처리해 줌
{
	obj = document.product.qty;
	if (isNaN(obj.value))          //    isNaN(a)함수는 a가 숫자가 아닐 경우, true를 return해줌
	{
		obj.value = "1";
		swal('숫자만 입력해주세요');
		return;
	}

	if (obj.value < 1) {
		obj.value = "1";
	}
}


function amountPlus()         //   주문수량을 1 증가 시킴
{
	obj = document.product.qty;
	obj.value = parseInt(obj.value) + 1;
}


function amountMinus()        //   주문수량을 1 감소 시킴
{
	obj = document.product.qty;
	if (parseInt(obj.value) > 1) {
		obj.value = parseInt(obj.value) - 1;
	}
	else {
		swal('더이상 줄일수가 없습니다');
		return;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailProduct.jsp 내에서 사용되는 자바스크립트 코드의 끝
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




