function goPopup() {
	var pop = window.open("../join/juso_popup.jsp", "pop",
		"width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadFullAddr) {
	$("#Addr").val(roadFullAddr);
}

function goPopup_() {
	var pop = window.open("../join/juso_popup.jsp", "pop",
		"width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadFullAddr) {
	$("#Addr_").val(roadFullAddr);
}

/* 적립금 사용 */
function chkPoint(amt, pnt, min, unit) {
	//input값을 전체 마일리지로 설정 > minusPoint 
	//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
	var v_point = 0; //사용할 포인트 (input 입력값)

	if (document.getElementById("chk_use").checked) {
		if (pnt < min)  //최소 사용 단위보다 작을 때
		{
			v_point = 0;
		} else {
			v_point = pnt - pnt % unit; //사용할 포인트 = 전체 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
		}

		if (pnt > amt) { //결제금액보다 포인트가 더 클 때
			v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
		}

	}
	document.getElementById("use_pnt").value = v_point; //input 값 설정

	changePoint(amt, pnt, min, unit);
}

function changePoint(amt, pnt, min, unit) {
	//input값을 불러옴 > left_pnt 변경 > 최종결제 변경
	//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
	var v_point = parseInt(document.getElementById("use_pnt").value); //사용할 포인트 (input 입력값)
	if (v_point > pnt) //입력값이 사용가능 포인트보다 클때
	{
		v_point = pnt;
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	}

	if (v_point > amt) { //결제금액보다 포인트가 더 클 때
		v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	}

	if (v_point < min)  //최소 사용 단위보다 작을 때
	{
		v_point = 0;
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	} else {
		v_point = v_point - v_point % unit; //사용할 포인트 = 사용할 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
	}

	var v_left = document.getElementsByName("left_pnt"); //사용가능 마일리지, 남은 포인트 값 설정
	for (var i = 0; i < v_left.length; i++) {

		v_left[i].innerHTML = pnt - v_point; //= 전체 포인트 중에 사용할 포인트빼고 남은 포인트

	}

	var money = amt - v_point;

	var reulst_pnt = Number(money).toLocaleString();
	var reulst_pnt_ = Number(money).toLocaleString();


	document.getElementById("result_pnt").value = money; //최종 결제금액 = 결제금액 - 사용할 포인트
	document.getElementById("result_pnt_show").innerHTML = reulst_pnt_; //최종 결제금액 = 결제금액 - 사용할 포인트
	document.getElementById("result_pnt_main_show").innerHTML = reulst_pnt_; //최종 결제금액 = 결제금액 - 사용할 포인트
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  order.jsp 및 directOrder.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function check_val()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.form.receiver.value == "") {
		swal("주문자 이름은 반드시 기입을 해야 합니다. ");
		document.form.receiver.focus();
		return false;
	}
	if (document.form.rcvAddress.value == "") {
		swal("주문자 주소를 반드시 기입을 해야 합니다. ");
		document.form.rcvAddress.focus();
		return false;
	}
	if (document.form.phone1.value == "") {
		swal("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone1.focus();
		return false;
	}
	if (document.form.phone2.value == "") {
		swal("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone2.focus();
		return false;
	}
	if (document.form.phone3.value == "") {
		swal("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone3.focus();
		return false;
	}

	if (document.form.receiver.value == "") {
		swal("수령인 성명은 반드시 기입을 해야 합니다. ");
		document.form.receiver.focus();
		return false;
	}

	if (document.form.rcvAddress.value == "") {
		swal("수령인 주소는 반드시 기입을 해야 합니다. ");
		document.form.rcvAddress.focus();
		return false;
	}

	if (document.form.phone1.value == "") {
		swal("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone1.focus();
		return false;
	}
	if (document.form.phone2.value == "") {
		swal("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone2.focus();
		return false;
	}
	if (document.form.phone3.value == "") {
		swal("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.phone3.focus();
		return false;
	}
	if (document.form.cardNo.value == "" && document.form.bank.value == 0) {
		swal("결제방법 중 하나는 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;
	}

	if (document.form.cardNo.value != "" && document.form.bank.value != 0) {
		swal("결제방법 중 하나만 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;
	}

	if (document.form.cardNo.value != "" && document.form.cardPass.value == "") {
		swal("카드 비밀번호는 반드시 기입을 해야 합니다. ");
		document.form.cardNo.focus();
		return false;
	}
	swal({
	  title: "구매하시겠습니까",
	  text: "다시 확인을 원하시면 아니요를 눌러주세요",
	  icon: "info",
	  buttons: {
		text: "예",	
		cancel: "아니요",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		document.form.submit();
	  } else {
	    swal.close();
	  }
	});
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  새로운 배송지 클릭 및 회원정보와 동일 일 때 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

document.getElementById("chk").addEventListener("click", check, false);
    function check() {
        var n = document.getElementById("chk");
        if(n.checked){
            document.getElementById("receiver").value =
                document.getElementById('sender_name').value;

            document.getElementById("rcvAddress").value =
                document.getElementById('sender_address').value;

			document.getElementById("phone1").value =
                document.getElementById('sender_phone0').value;

			document.getElementById("phone2").value =
                document.getElementById('sender_phone1').value;

			document.getElementById("phone3").value =
                document.getElementById('sender_phone2').value;

			document.getElementById("email1").value =
                document.getElementById('sender_email1').value;

			document.getElementById("domainName").value =
                document.getElementById('sender_email2').value;
        } else {
            document.getElementById("receiver").value = "";
            document.getElementById("rcvAddress").value = "";
			document.getElementById("phone1").value = "";
			document.getElementById("phone2").value = "";
			document.getElementById("phone3").value = "";
			document.getElementById("email1").value = "";
			document.getElementById("domainName").value = "";
        }
    }