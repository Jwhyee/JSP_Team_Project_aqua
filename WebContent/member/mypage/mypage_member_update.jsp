<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@ include file="../../layout/mypage_header.jsp"%>
<link rel="stylesheet" type="text/css" href="../../css/table_style_ver2.css?a">
<%
try {
	String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
	String DB_ID = "aqua";
	String DB_PASSWORD = "1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "select * from member where m_id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, sid);

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

<center>
	<form name="newMem" method=post action=mypage_member_update_result.jsp>
		<table style="font-size: 10pt; font-family: 맑은 고딕" class="detail">
			<tr>
				<th colspan="2" class="table_title">회원 정보 수정</th>
			</tr>
			<tr>
				<th>ID</th>
				<td>
					<input name="id" class="form-control" placeholder="Id 입력"
						type="hidden" value="<%=id%>" required />
					&nbsp; &nbsp;<%=id%></td>
				</div>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="password" class="form-control" placeholder="비밀번호 입력"
						type="password" value="<%=password%>" required>
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input name="name" class="form-control" placeholder="이름 입력"
						type="text" value="<%=name%>" required />
				</td>
			</tr>
			<tr>
				<th>주민번호</th>

				<td>
					<div class="form-group input-group fg-x700">
						<input name="joomin1" class="form-control"
							<%String[] joominArr = joomin.split("-");%>
							placeholder="주민번호 앞 자리 입력 " type="text" maxlength="6"
							value=<%=joominArr[0]%> required />
						&nbsp; - &nbsp;
						<input name="joomin2" class="form-control"
							placeholder="주민번호 뒷 자리 입력 " type="text" maxlength="7"
							value=<%=joominArr[1]%> required />
					</div>
				</td>

			</tr>
			<tr>
				<th>생년월일</th>
				<td>

					<input name="date" class="form-control" placeholder="생년월일"
						type="date" value <%=birth%> required />
					<br> (<%
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
					%>)
				</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>

				<td>
					<div class="form-group input-group fg-x700">
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
						<select name=phone1 class="form-control">
							<option value="010" <%=hpSelected[0]%>>010
							<option value="011" <%=hpSelected[1]%>>011
							<option value="016" <%=hpSelected[2]%>>016
							<option value="017" <%=hpSelected[3]%>>017
							<option value="018" <%=hpSelected[4]%>>018
							<option value="019" <%=hpSelected[5]%>>019
						</select>
						&nbsp;&nbsp;-&nbsp;&nbsp;
						<input name="phone2" class="form-control"
							placeholder="중간번호 4자리 입력 " type="text" maxlength="4"
							value="<%=hpArr[1]%>" required />
						&nbsp;&nbsp;-&nbsp;&nbsp;
						<input name="phone3" class="form-control" placeholder="뒷 4자리 입력 "
							type="text" maxlength="4" value="<%=hpArr[1]%>" required />
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<div class="form-group input-group fg-x700">
					<td>
						<input name="email" class="form-control" placeholder="Email 입력"
							type="email" value="<%=email %>" required />
					</td>
				</div>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input name="address" id="Addr" class="form-control"
						placeholder="주소 검색을 눌러 입력" type="text" value="<%=address%>"
						required onkeypress="return false;"
						style="caret-color: transparent !important;" />
					<br>
					<input type="button" class="btn btn-large btn-primary" style ="font-size : 10px;"value="주소 검색" onclick="goPopup();" />
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input name="sex" type="radio" value="남" required checked />
					남자 &nbsp
					<input name="sex" type="radio" value="여" required />
					여자
				</td>
			</tr>
		</table>
		<input type=submit class="btn btn-large btn-primary" type="button"
			value="수정완료">
	</form>

	<br> <br>
	</body>
	<%
} catch (Exception e) {
out.println(e);
}
%>
</center>
<%@ include file="../../layout/footer.jsp"%>
<script language="javascript" charset="utf-8">
	function goPopup() {
		var pop = window.open("../../member/join/juso_popup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr) {
		$("#Addr").val(roadFullAddr);
	}
</script>