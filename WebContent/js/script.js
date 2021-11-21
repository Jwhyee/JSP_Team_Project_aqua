
/*************************  member/register_form.jsp *************************/

//regform id 중복확인
function checkid() {
	if(regForm.id.value == "") {
		alert("id를 입력하시오.");
		regForm.id.focus();
	} else {
		url = "check_id.jsp?id=" + regForm.id.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(
				url, 
				"id check", "toolbar=no, width=350, height=150, top=150, left=150");
	}
}

//우편번호찾기 새창열기
function checkzip() {
	//새창열기
	url = "check_zip.jsp?check=y";
	window.open(
			url, 
			"post", 
			"toolbar=no, width=350,height=300,top=200,left=300.status=yes,scrollbars=yes,menubar=no");
}


//회원가입 입력검사
function inputCheck(){
	if(regForm.id.value == "") {
		alert("id를 입력하시오.");
		regForm.id.focus();
		return;
	} 
	
	if(regForm.pass.value == "") {
		alert("passwd를 입력하시오.");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.pass.value !== regForm.repass.value) {
		alert("비밀번호 불일치!");
		regForm.passwd.focus();
		return;
	} 
	// 이름, 이메일, 전화번호 - 정규표현식
	if(regForm.job.value === "0") {
		alert("직업을 선택하시오.");
		regForm.job.focus();
		return;
	}
	regForm.submit();
}


/*************************  guest/login.jsp *************************/


function funcLogin() {
	if (loginForm.id.value === "") {
		alert("아이디 입력");
		loginForm.id.focus();
	} else if (loginForm.passwd.value === "") {
		alert("비밀번호 입력");
		loginForm.passwd.focus();
	} else {
		loginForm.action = "login_action.jsp";
		loginForm.method = "post";
		loginForm.submit();
	}
}

function funcHome() {
	location.href = "../index.jsp";
}

/******************  member/modify_member_form.jsp ******************/

//회원정보 수정 입력검사
function memberModify(){
	if(regForm.id.value == "") {
		alert("id를 입력하시오.");
		regForm.id.focus();
		return;
	} 
	
	if(regForm.pass.value == "") {
		alert("passwd를 입력하시오.");
		regForm.pass.focus();
		return;
	}
	
	if(regForm.pass.value !== regForm.repass.value) {
		alert("비밀번호 불일치!");
		regForm.pass.focus();
		return;
	} 
	// 이름, 이메일, 전화번호 - 정규표현식
	if(regForm.job.value === "0") {
		alert("직업을 선택하시오.");
		regForm.job.focus();
		return;
	}
	regForm.submit();
}

//회원정보 수정 취소
function memberModifyCancel(){
	location.href = "../index.jsp";
}

//회원정보 삭제
function memberDelete(id){
	var deletepass = prompt("비밀번호를 입력하세요");
	post_to_url("delete_member_form.jsp",{'id':id,'pass':deletepass});
}

//javascript에서 post방식으로 데이터 전송 (id/pw 확인용)
function post_to_url(path,params,method){
	method = method||"post";
	
  var form = document.createElement("form");
  form.setAttribute("method", method);
  form.setAttribute("action", path);

  //히든으로 값을 주입시킨다.
  for(var key in params) {
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", key);
      hiddenField.setAttribute("value", params[key]);

      form.appendChild(hiddenField);
  }

  document.body.appendChild(form);
  form.submit();
}

/******************  guest/productlist.jsp ******************/

function productDetail(no){
	document.detailFrm.no.value=no;
	document.detailFrm.submit();
}

/******************  admin/membermanager.jsp ******************/

//관리자 회원정보보기
function admin_modify_member(id){
	document.modifyFrm.id.value=id;
	document.modifyFrm.submit();
}

/******************  admin/member_modify_admin_form.jsp ******************/

//관리자 회원정보수정
function admin_modify_member_action(){
	document.modifyFormAdmin.submit();
}

//관리자 회원정보수정 취소
function admin_modify_member_cancel(){
	location.href="membermanager.jsp";
}

//관리자 회원삭제
function admin_modify_member_delete(id){
	//포스트 방식으로 id 값을 넘김
	post_to_url("member_delete_admin.jsp",{'id':id});
}

/******************  admin/productmanager.jsp ******************/

function productDetail_admin(no){
	document.detailFrm.no.value=no;
	document.detailFrm.submit();
}

/******************  admin/productdetail_admin.jsp ******************/

function productUpdate(no){
	document.updateFrm.no.value=no;
	document.updateFrm.submit();
}
function productDelete(no){
	document.delFrm.no.value=no;
	document.delFrm.submit();
}

/******************  admin/product_insert, product_update ******************/

//이미지 프리뷰 를 위한 처리(ajax)
var xhr;
function filePreview() {
	//form 전체를 formData 객체로 전환
	var form = document.productFrm;
	var formData = new FormData(form);
	//formData.append("upload_file",file);
	
	//xhr 객체 생성
	xhr = new XMLHttpRequest();
	
	//데이터를 전달할 타겟 설정
	xhr.open("post", "product_Image_Preview.jsp", true);
	
	//데이터가 정상적으로 전달 됐을 때  결과값을 받아왔을때의 실행내용
	xhr.onreadystatechange = function() { //폴백
		if (xhr.readyState == 4) {
			if (xhr.status == 200) { //200은 잘넘어왔단 것이다.
				previewProcess(form);
			} else {
				alert("요청오류 : " + xhr.status);
			}
		}
	}
	//데이터 전송
	xhr.send(formData); 
}
//비동기 방식으로 받아온 데이터를 처리
function previewProcess(form){
	//결과값은 저장된 preview 파일 이름
	var data = xhr.responseText;
	var previewName = data.trim();
	
	//preview image에 preview 폴더에 들어간 파일을 가져와서 뿌려줌
	form.preview.src = "../images/preview/"+previewName;
}

//리셋버튼 누를 경우 미리보기 리셋
function resetInsertData(){
	var form = document.productFrm.preview.src="../images/product/noimage.jpg";
}






