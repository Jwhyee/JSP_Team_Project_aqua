var realInfoOn = false;
var addressInfoOn = false;
$("#realInfo-box").hide();
$("#addressInfo-box").hide();

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  이미지 스크롤 등 정품인증 js 기능 등 
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
var tab3 = $("#detail-qna-box").offset().top - 100;
var tab4 = $("#detail-purchaseInfo-box").offset().top - 100;


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
		$("#tab-qna").css('border-bottom', '4px solid black');
		$("#tab-qna-a").css('color', 'black');
	} else {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color', '#9a9a9e');
	}

	if (nowY > tab4) {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color', '#9a9a9e');
		$("#tab-purchaseInfo").css('border-bottom', '4px solid black');
		$("#tab-purchaseInfo-a").css('color', 'black');
	} else {
		$("#tab-purchaseInfo").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-purchaseInfo-a").css('color', '#9a9a9e');
	}
});

$("#tab-img-text-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab1 + 10 }, 1000);
});
$("#tab-review-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab2 + 10 }, 1000);
});
$("#tab-qna-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab3 + 10 }, 1000);
});
$("#tab-purchaseInfo-a").click(function(event) {
	event.preventDefault();
	$('html,body').animate({ scrollTop: tab4 + 10 }, 1000);
});



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  수량 선택 추가 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var sell_price_adult;
var sell_price_teen;
var sell_price_child;
var amount_adult;
var amount_teen;
var amount_child;

function init() {
	sell_price_adult = document.product.sell_price_adult.value;
	sell_price_teen = document.product.sell_price_teen.value;
	sell_price_child = document.product.sell_price_child.value;
	amount_adult = document.product.amount_adult.value;
	amount_teen = document.product.amount_teen.value;
	amount_child = document.product.amount_child.value;
	document.product.sum.value = sell_price_adult+sell_price_teen+sell_price_child;
	change();
}

function add_a() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	hm_a.value++;

	sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
}
function add_t() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	hm_t.value++;

	sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
}
function add_c() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	hm_c.value++;

	sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
}

function del_a() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	if (hm_a.value > 0) {
		hm_a.value--;
		sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
	}
}
function del_t() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	if (hm_t.value > 0) {
		hm_t.value--;
		sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
	}
}
function del_c() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;
	if (hm_c.value > 0) {
		hm_c.value--;
		sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
	}
}

function change() {
	hm_a = document.product.amount_adult;
	hm_t = document.product.amount_teen;
	hm_c = document.product.amount_child;
	sum = document.product.sum;

	if (hm_a.value < 0) {
		hm_a.value = 0;
	}
	if (hm_t.value < 0) {
		hm_t.value = 0;
	}
	if (hm_c.value < 0) {
		hm_c.value = 0;
	}
	sum.value = (parseInt(hm_a.value) * sell_price_adult) +
		(parseInt(hm_t.value) * sell_price_teen) +
		(parseInt(hm_c.value) * sell_price_child);
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
function direct_product_order(){  //  "구매하기 버튼 클릭시"
	if (confirm('해당 상품을 구매하시겠습니까?')) {	
			var str=product.amount.value;
			var frm = document.product;
			frm.action = "../order/cart_in.jsp";
			frm.submit();
	}
	else {
		document.product.reset();
	}
}

function add_to_cart() {
	if (confirm('해당 상품을 장바구니에 추가하겠습니까?')) {
			var str=product.amount.value;
			var frm = document.product;
			frm.action = "../order/cart_in.jsp";
			frm.submit();
	}
	else {
		document.product.reset();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 즉시 구매하기  클릭 시
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function direct_product_order()        //  "즉시구매하기" 버튼을 클릭시 호출
{
	var str=product.amount.value;
	var frm = document.product;
	frm.action = "../order/direct_product_order.jsp";
	frm.submit();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  cart_order.jsp 및 direct_product_order.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function check_val()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.form.memTel.value == "") 
	{
		alert("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.memTel.focus();
		return false;			
	}			

	if (document.form.receiver.value == "") 
	{
		alert("수령인 성명은 반드시 기입을 해야 합니다. ");
		document.form.receiver.focus();
		return false;			
	}

	if (document.form.rcvAddress.value == "") 
	{
		alert("수령인 주소는 반드시 기입을 해야 합니다. ");
		document.form.rcvAddress.focus();
		return false;			
	}

	if (document.form.rcvPhone.value == "") 
	{
		alert("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.rcvPhone.focus();
		return false;			
	}
 
	if (document.form.cardNo.value == "" && document.form.bank.value == 0 ) 
	{
		alert("결제방법 중 하나는 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

    	if (document.form.cardNo.value != "" && document.form.bank.value != 0 ) 
	{
		alert("결제방법 중 하나만 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

	if (document.form.cardNo.value != "" && document.form.cardPass.value == "" ) 
	{
		alert("카드 비밀번호는 반드시 기입을 해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

   	document.form.submit();
}
