
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 각 카테고리 클릭 시
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function category_top() {
	if (categorys.compList.value == "") {
		swal('상품 옵션을 선택 후 클릭해주세요'); //경고창 띄움 
	}
	else if (categorys.compList.value == "default") {
		var str = categorys.compList.value;
		var frm = document.categorys;
		frm.action = "goods_group.jsp";
		frm.submit();
	}
	else {
		var str = categorys.compList.value;
		var frm = document.categorys;
		frm.action = "goods_group_category.jsp";
		frm.submit();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 상품 정렬
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function popular_list() {
	var str = categorys.compList.value;
	var frm = document.categorys;
	frm.action = "goods_group_popular.jsp";
	frm.submit();
}

function price_high() {
	var str = categorys.compList.value;
	var frm = document.categorys;
	frm.action = "goods_group_high.jsp";
	frm.submit();
}
function price_low() {
	var str = categorys.compList.value;
	var frm = document.categorys;
	frm.action = "goods_group_low.jsp";
	frm.submit();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 상품 검색
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function keyword_check() {
	let form = document.forms.headerSearchForm;
	var key = form.elements.keyword;
	if (!key.value) { //검색어가 없을 경우  
		alert('검색어를 입력하세요'); //경고창 띄움 
		key.focus(); //다시 검색창으로 돌아감 
		return false;
	}
	else {
		var str = headerSearchForm.keyword.value;
		var frm = document.headerSearchForm;
		frm.action = "goods_group_search.jsp";
		frm.submit();
	}
}