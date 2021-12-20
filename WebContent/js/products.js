var realInfoOn = false;
var addressInfoOn = false;
$("#realInfo-box").hide();
$("#addressInfo-box").hide();

function jalert(msg){
	$("#alertBox").dialog({
		open: $("#alertBox").text(msg),
		title: "확인",
		autoOpen: true,
		modal: true,
		buttons: {
			OK: function () {
			$("#alertBox").dialog("close");
			}
		}
	});
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  이미지 스크롤 등 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var mySwiper = new Swiper('.swiper-container', {
	direction: 'horizontal',
	loop: true,
	centeredSlides: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev'
	}
});

function realInfoBox() {
	if (realInfoOn == false) {
		realInfoOn = true;
		$("#realInfo-box").show();
	} else {
		realInfoOn = false;
		$("#realInfo-box").hide();
	}
};

function addressInfoBox() {
	if (addressInfoOn == false) {
		addressInfoOn = true;
		$("#addressInfo-box").show();
	} else {
		addressInfoOn = false;
		$("#addressInfo-box").hide();
	}
}

var tab1 = $("#detail-img-text-box").offset().top - 100;
var tab2 = $("#detail-review-box").offset().top - 100;
var tab3 = $("#detail-purchaseInfo-box").offset().top - 100;


$(window).on("scroll", function() {
	var nowY = $(this).scrollTop();

	if (nowY > tab1) {
		$("#tab-img-text").css('border-bottom', '4px solid black');
		$("#tab-img-text-a").css('color', 'black');
	} else {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color', '#9a9a9e');
	}

	if (nowY > tab2) {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color', '#9a9a9e');
		$("#tab-review").css('border-bottom', '4px solid black');
		$("#tab-review-a").css('color', 'black');
	} else {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color', '#9a9a9e');
	}

	if (nowY > tab3) {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color', '#9a9a9e');
		$("#tab-purchaseInfo").css('border-bottom', '4px solid black');
		$("#tab-purchaseInfo-a").css('color', 'black');
	} else {
		$("#tab-purchaseInfo").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-purchaseInfo-a").css('color', '#9a9a9e');
	}
});

$("#tab-img-text-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab1 }, 1000);
});
$("#tab-review-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab2 }, 1000);
});
$("#tab-purchaseInfo-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab3 }, 1000);
});



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  수량 선택 추가 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var sell_price;
var amount;

function init() {
	sell_price = document.product.sell_price.value;
	amount = document.product.amount.value;
	stock = document.product.stock.value;
	document.product.sum.value = sell_price;
	change();
}

function add() {

	if(parseInt(hm.value) < stock){
		hm = document.product.amount;
		sum = document.product.sum;
		hm.value++;
		sum.value = parseInt(hm.value) * sell_price;
	}
	else{
		swal({
		  title: "경고 메시지",
		  text: "최대 수량입니다. 다시 선택해주세요!",
		  icon: "warning",
		  buttons: {
			text: "예",	
			cancel: "아니요",
		 },
		  dangerMode: true,
		})

	}
}

function del() {
	hm = document.product.amount;
	sum = document.product.sum;
	if (hm.value > 1) {
		hm.value--;
		sum.value = parseInt(hm.value) * sell_price;
	}
}

function change() {
	hm = document.product.amount;
	sum = document.product.sum;

	if (hm.value < 0) {
		hm.value = 0;
	}
	sum.value = parseInt(hm.value) * sell_price;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 로그인 없이 상품 클릭 했을 경우
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function need_login() {
	Swal.fire({
		title: '로그인이 필요한 기능입니다.',
		text: '로그인하시겠습니까?',
		icon: 'info',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '로그인',
		cancelButtonText: '페이지 머물기',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = '../login/login.jsp';
		} else {
			swal.close();
		}
	})
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 장바구니 및 즉시 구매하기
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function direct_product_order() {  //  "구매하기 버튼 클릭시"
	swal({
	  title: "즉시 구매",
	  text: "해당 상품을 구매하시겠습니까?",
	  icon: "info",
	  buttons: {
		text: "예",	
		cancel: "아니요",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		var str=product.amount.value;
		var frm = document.product;
		frm.action = "../order/direct_product_order.jsp";
		frm.submit();
	  } else {
	    swal.close();
	  }
	});
}

function add_to_cart() {
	swal({
	  title: "장바구니 추가",
	  text: "장바구니에 추가 됐습니다. 이동하시겠습니까?",
	  icon: "success",
	  buttons: {
	  text: "예",	
	  cancel: "아니요",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		var str = product.amount.value;
		var frm = document.product;
		frm.action = "../order/cart_in.jsp";
		frm.submit();
	  } else {
	   	var str = product.p_id.value;
		var frm = document.product;
		frm.action = "../order/cart_in_temp.jsp";
		frm.submit();
	  }
	});
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 찜하기 버튼 클릭 시
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function add_to_dibs() {
	swal({
	  title: "찜목록 추가",	
	  text: "찜목록에 추가 됐습니다. 바로 이동하시겠습니까?",
	  icon: "success",
	  buttons: {
		text: "예",	
		cancel: "아니요",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		var str = product.p_id.value;
		var frm = document.product;
		frm.action = "../dibs/dibs_in_direct.jsp";
		frm.submit();
	  } else {
	    var str = product.p_id.value;
		var frm = document.product;
		frm.action = "../dibs/dibs_in.jsp";
		frm.submit();
	  }
	});
}

function rmv_to_dibs() {
	swal({
	  title: "찜목록 삭제",
	  text: "찜목록에서 삭제 됐습니다",
	  icon: "warning",
	  buttons: {
		text: "확인",	
	 },
	})
	.then((willDelete) => {
	  if (willDelete) {
		var str = product.p_id.value;
		var frm = document.product;
		frm.action = "../dibs/dibs_in.jsp";
		frm.submit();
	  } else {
		document.product.reset();
	  }
	});
	
	
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  cart_order.jsp 및 direct_product_order.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function check_val()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.form.memTel.value == "") {
		swal("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.memTel.focus();
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

	if (document.form.rcvPhone.value == "") {
		swal("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.rcvPhone.focus();
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

	document.form.submit();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 품절 상품 구매하기 클릭시
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function sold_out() {
	Swal.fire({
		title: '품절',
		text: '품절 상품입니다. 다른 상품을 구매해주세요',
		icon: 'warning',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '다른 상품 보러가기',
		cancelButtonText: '페이지 머물기',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = 'http://localhost:8080/aqua/member/product/goods_group.jsp ';
		} else {
			swal.close();
		}
	})
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 수량 입력 제한
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function inNumber(){
          if(event.keyCode<48 || event.keyCode>57){
             event.returnValue=false;
          }
}

$(".numberOnly").on("keydown", function(e) {
    if(!((e.keyCode > 95 && e.keyCode < 106) || (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8 || e.keyCode == 9)) {
        return false;
    }
});