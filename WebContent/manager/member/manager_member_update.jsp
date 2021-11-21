<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../layout/header.jsp"%>
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("id");
	String jsql = "select * from member where m_id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String id = rs.getString("m_id");
	String password = rs.getString("m_password");
	String name = rs.getString("m_name");
	String birth = rs.getString("m_date");
	String sex = rs.getString("m_gender");
	String email = rs.getString("m_email");
	String phone = rs.getString("m_phone");
	String joomin = rs.getString("m_joomin");
	String address = rs.getString("m_address");
	String solar = rs.getString("m_solar");
%>


<div class="frame user-frm">
	<article class="card-body" style="max-width: 700px; margin: auto;">
		<!-- 회원가입 form태그 시작 -->
		<form name="newMem" method=post action=insert_member_result.jsp>
			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-user"></i>
					</span>
				</div>
				<input name="name" class="form-control" placeholder="이름 입력"
					type="text" value="<%=name%>" required />
				<input name="sex" type="radio" value="남" required checked />
				남자 &nbsp
				<input name="sex" type="radio" value="여" required />
				여자
			</div>
			<!--이름 form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-user"></i>
					</span>
				</div>
				<input name="id" class="form-control" placeholder="Id 입력"
					type="hidden" value="<%=id%>" required />&nbsp &nbsp<%=id%>
			</div>
			<!--아이디 form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-lock"></i>
					</span>
				</div>
				<input name="password" class="form-control" placeholder="비밀번호 입력"
					type="password" value="<%=password%>" required>
			</div>
			<!-- 비밀번호 form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-envelope"></i>
					</span>
				</div>
				<input name="email" class="form-control" placeholder="Email 입력"
					type="email" vlaue="<%=email%>" required />
			</div>
			<!-- 이메일 form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-user"></i>
					</span>
				</div>
				<input name="joomin1" class="form-control"
					<%String[] joominArr = joomin.split("-");%>
					placeholder="주민번호 앞 자리 입력 " type="text" maxlength="6"
					value=<%=joominArr[0]%> required />
				-
				<input name="joomin2" class="form-control"
					placeholder="주민번호 뒷 자리 입력 " type="text" maxlength="7"
					value=<%=joominArr[1]%> required />
			</div>
			<!-- 주민번호 form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-user"></i>
					</span>
				</div>
				<input name="date" class="form-control" placeholder="생년월일"
					type="date" value <%=birth%> required />
				&nbsp
				<%
				if (solar.equals("양력")) {
				%>
				<input type=radio name=solar value="양력" checked>
				양력
				<input type=radio name=solar value="음력">
				음력
				<%
				} else {
				%>
				<input type=radio name=solar value="양력">
				양력
				<input type=radio name=solar value="음력" checked>
				음력
				<%
				}
				%>
			</div>


			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-phone"></i>
					</span>
				</div>
				<%
				String[] hpArr = phone.split("-");
				String[] hpSelected = new String[6];
				if (hpArr[0].equals("010")) {
					hpSelected[0] = "selected";
				} else if (hpArr[0].equals("011")) {
					hpSelected[1] = "selected";
				} else if (hpArr[0].equals("016")) {
					hpSelected[2] = "selected";
				} else if (hpArr[0].equals("017")) {
					hpSelected[3] = "selected";
				} else if (hpArr[0].equals("018")) {
					hpSelected[4] = "selected";
				} else if (hpArr[0].equals("019")) {
					hpSelected[5] = "selected";
				}
				%>
				<select name=phone1 class="input">
					<option value="010" <%=hpSelected[0]%>>010
					<option value="011" <%=hpSelected[1]%>>011
					<option value="016" <%=hpSelected[2]%>>016
					<option value="017" <%=hpSelected[3]%>>017
					<option value="018" <%=hpSelected[4]%>>018
					<option value="019" <%=hpSelected[5]%>>019
				</select>
				-
				<input name="phone2" class="form-control" placeholder="중간번호 4자리 입력 "
					type="text" maxlength="4" value="<%=hpArr[1]%>" required />
				-
				<input name="phone3" class="form-control" placeholder="뒷 4자리 입력 "
					type="text" maxlength="4" value="<%=hpArr[1]%>" required />
			</div>
			<!-- form-group// -->

			<div class="form-group input-group fg-x700">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-building"></i>
					</span>
				</div>
				<input name="address" id="Addr" class="form-control"
					placeholder="주소 검색을 눌러 입력" type="text" value="<%=address%>"
					required onkeypress="return false;"
					style="caret-color: transparent !important;" />
				<input type="button" value="주소 검색" onclick="goPopup();" />
			</div>
			<!-- form-group end.// -->


			<div class="fg-x700 form-group">
				<button type="submit" class="btn btn-primary btn-block">수정완료</button>
			</div>
			<!-- form-group// -->

		</form>
	</article>
</div>
<!-- card.// -->

<!--container end.//-->

<br>
<br>
</body>
<%
} catch (Exception e) {
out.println(e);
}
%>
<%@ include file="../../layout/footer.jsp"%>
<script language="javascript" charset="utf-8">
	function goPopup() {
		var pop = window.open("juso_popup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr) {
		$("#Addr").val(roadFullAddr);
	}
</script>