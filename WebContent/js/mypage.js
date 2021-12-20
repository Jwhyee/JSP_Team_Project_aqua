function member_delete() {  //  "회원정보탈퇴"
	swal({
	  title: "회원탈퇴",
	  text: "회원 탈퇴시 모든 회원 내용이 삭제 되며, 복구가 불가능합니다",
	  icon: "info",
	  buttons: {
		text: "탈퇴",	
		cancel: "돌아가기",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		location.href = "mypage_member_delete.jsp";
	  } else {
	    swal.close();
	  }
	});
}

function member_update() {  //  "회원정보수정"
	swal({
	  title: "회원정보수정",
	  text: "회원 정보를 수정하시겠습니까?",
	  icon: "info",
	  buttons: {
		text: "예",	
		cancel: "아니요",
	 },
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		location.href = "mypage_member_update.jsp";
	  } else {
	    swal.close();
	  }
	});
}
