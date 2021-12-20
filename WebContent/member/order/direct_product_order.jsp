<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="../../css/style-cart.css?v123123">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script language="javascript" src="../../js/order.js?v12233"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#emailChoice").bind("change", function() {
			$("#domainName").val($(this).val());
		});
	});
</script>

	<%
		try {

			String DB_URL = "jdbc:mysql://localhost:3306/aqua_project";
			String DB_ID = "aqua";
			String DB_PASSWORD = "1234";

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

			String ct_no = session.getId(); 
			
			String jsql7 = "delete from temp_cart where ct_no=?";
			PreparedStatement pstmt7 = con.prepareStatement(jsql7);
			
			pstmt7.setString(1, ct_no);
			pstmt7.executeUpdate();

			String p_id = request.getParameter("p_id");
			int ct_qty = Integer.parseInt(request.getParameter("amount"));

			String jsql = "insert into temp_cart (ct_no, p_id, ct_qty) values (?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(jsql);
			pstmt.setString(1, ct_no);
			pstmt.setString(2, p_id);
			pstmt.setInt(3, ct_qty);

			pstmt.executeUpdate();
		%>

	


<div id="backbody">
	<div id="frame">
		<form name="form" method="Post" action="direct_product_order_ok.jsp">
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;">즉시구매하기</span>
				<span class="home">홈 > 즉시 구매</span>
				<span></span>
			</div>
			<br />
			<!-- 상품 정보 테이블 -->
			<div>
				<table class="calculation1">
					<thead>
						<tr>
							<th colspan="10" style="text-align: left; padding-left: 10px;">일반상품(1)</th>
						</tr>
						<tr>
							<th style="width: 20%;">
								<span>이미지</span>
							</th>
							<th style="width: 550px;">
								<span>상품정보</span>
							</th>
							<th style="width: 15%;">판매가</th>
							<th style="width: 7%;">수량</th>
							<th style="width: 7%;">적립금</th>
							<th style="width: 10%;">배송구분</th>
							<th style="width: 10%;">배송비</th>
							<th style="width: 10%;">합계</th>
						</tr>
					</thead>

					<%
					String jsql2 = "select p_id, ct_qty from temp_cart where ct_no = ? order by p_id";
					PreparedStatement pstmt2 = con.prepareStatement(jsql2);
					pstmt2.setString(1, ct_no);

					ResultSet rs2 = pstmt2.executeQuery();

					int total = 0;
					int real_total = 0;
					double reserves_p = 0;
					double reserves_t = 0;
					double total_reserves_p = 0;
					double total_reserves_t = 0;

					while (rs2.next()) {
						String p_id2 = rs2.getString("p_id");
						int ct_qty2 = rs2.getInt("ct_qty");

						String jsql3 = "select p_name, p_price from product where p_id = ?";
						PreparedStatement pstmt3 = con.prepareStatement(jsql3);
						pstmt3.setString(1, p_id2);

						ResultSet rs3 = pstmt3.executeQuery();
						rs3.next();

						String p_name = rs3.getString("p_name");
						int p_price = rs3.getInt("p_price");

						int amount = p_price * ct_qty;
						total = total + amount;
						reserves_p = total * 0.005;
						total_reserves_p = total_reserves_p + reserves_p;
						real_total = total + 2500;
					%>
					<c:set var="reserves_p" value="<%=reserves_p%>" />

					<tbody>
						<tr style="height: 90x; background-color: #fff;">
							<td style="border-left: none;">
								<img style="width: 75px; height: 100px;" src="../../img/product/<%=p_id%>.jpg">
							</td>
							<td style="text-align: center; padding-left: 10px; border-left: none; font-weight: bold;"><%=p_name%></td>
							<td>
								<span style="padding-left: 10px;">
									<fmt:formatNumber value="<%=p_price%>" type="number" />
									원
								</span>
							</td>
							<td style="width: 80px;">
								<span><%=ct_qty%>
									개
								</span>
							</td>
							<td>
								<fmt:formatNumber type="number" pattern="0" value="${ ((reserves_p*10) - ((reserves_p*10)%1)) * (1/10)} " />
								원
							<td>기본배송</td>
							<td>2,500원</td>
							<td>
								<span></span>
								<fmt:formatNumber value="<%=amount%>" type="number" />
								원
							</td>
						</tr>
					</tbody>
					<%
					}
					%>
					
					<%
					double total_reserves = total_reserves_p + total_reserves_t;
					%>
					<tfoot>
						<tr style="height: 60px;">
							<td colspan="5" style="border-right: none; text-align: left; padding-left: 10px;">
								<span>[기본배송]</span>
							</td>
							<td colspan="5" style="border-left: none; text-align: right; padding-left: 10px;">
								상품금액
								<span>
									<fmt:formatNumber value="<%=total%>" type="number" />
								</span>
								+
								<span>배송비 2,500 = 합계</span>
								&nbsp;
								<span style="font-weight: bold; font-size: 16px;">
									<fmt:formatNumber value="<%=real_total%>" type="number" />
								</span>
							</td>
						</tr>
					</tfoot>
				</table>
				<div style="border: solid 1px #e0e0eb; border-right: none; padding: 11px 0; background-color: #ffc0cb;">
					<!-- <img src="/sasdfasfd/asdf.png" style="margin-left: 5px postion:relative; top 4.5px;">-->
					<span style="font-size: 10pt; color: red;">&nbsp; 상품의 옵션 및 수량 변경은 상품상세 페이지에서 가능합니다.</span>
				</div>
				<div style="margin: 10px; padding-bottom: 50px; border-bottom: solid 1px gray;"></div>
				<span class="clearboth"></span>
			</div>

			<%
			// 구매자 정보
			String myid = (String) session.getAttribute("sid"); // 로그인했었던 주문자 정보(즉, 아이디)를 받아옮

			String jsql4 = "select m_name, m_phone, m_address, m_email, m_reserves from member where m_id = ?";
			PreparedStatement pstmt4 = con.prepareStatement(jsql4);
			pstmt4.setString(1, myid);

			ResultSet rs4 = pstmt4.executeQuery();
			rs4.next();
			String name = rs4.getString("m_name");
			String phone = rs4.getString("m_phone");
			String address = rs4.getString("m_address");
			String email = rs4.getString("m_email");
			String reserves = rs4.getString("m_reserves");

			String[] phoneArr = phone.split("-");
			String[] emailArr = email.split("@");
			String[] emailSelected = new String[8];

			if (emailArr[1].equals("naver.com")) {
				emailSelected[0] = "selected";
			} else if (emailArr[1].equals("google.com")) {
				emailSelected[1] = "selected";
			} else if (emailArr[1].equals("daum.net")) {
				emailSelected[2] = "selected";
			} else if (emailArr[1].equals("nate.com")) {
				emailSelected[3] = "selected";
			}
			%>
			<br/><br/>
			<!-- 배송자 정보 -->
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;구매자정보</span>
			<table class="delivery">
				<thead>
					<tr>
						<td class="deliverytd">
							보내시는 분&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="hidden" name="sender_name" id="sender_name" value="<%=name%>"/>
							<%=name%>
						</td>
					</tr>
					
					<tr>
						<td class="deliverytd">
							주소&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="hidden" name="sender_address" id="sender_address" value="<%=address%>"/>
							<%=address%>
						</td>
					</tr>
					
					<tr>
						<td class="deliverytd">
							휴대전화&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="hidden" name="sender_phone" id="sender_phone0" value="<%=phoneArr[0]%>"/>
							<input type="hidden" name="sender_phone" id="sender_phone1" value="<%=phoneArr[1]%>"/>
							<input type="hidden" name="sender_phone" id="sender_phone2" value="<%=phoneArr[2]%>"/>
							<%=phone %>
						</td>
					</tr>
					
					<tr>
						<td class="deliverytd">
							이메일주소&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="hidden" value="<%=emailArr[0]%>" name="email1" id="sender_email1">
							<input type="hidden" value="<%=emailArr[1]%>" name="email2" id="sender_email2">
							<%=email%>
						</td>
					</tr>
				</thead>
			</table>
			<br> <br>
			<!-- 배송 정보 -->
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;배송정보</span>
			<table class="delivery">
				<thead>
					<tr>
						<td class="deliverytd">배송지 선택</td>
						<td>
							<input type="checkbox" name="chk" id="chk" onclick="check(this)">
							<label>회원정보와 동일</label>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							받으시는 분&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="text" name="receiver" id="receiver" value="" />
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							주소&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="text" step="margin-bottom: 10px;" size="50" name="rcvAddress" id="rcvAddress" value="" />
							&nbsp;&nbsp;
							<!--<button type="button" style="padding: 5px; cursor: pointer; margin-bottom: 10px; background-color: #fff; border-width: 1px;" onclick="goPopup()";>우편번호 찾기</button> -->
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							휴대전화&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="text" size="10" maxlength="3" value="" name="phone1" id="phone1">
							-
							<input type="text" size="10" maxlength="4" value="" name="phone2" id="phone2">
							-
							<input type="text" size="10" maxlength="4" value="" name="phone3" id="phone3">
						</td>
					</tr>
					<tr>
						<td class="deliverytd">
							이메일&nbsp;
							<span style="color: red;">*</span>
						</td>
						<td>
							<input type="text" value="" name="email1" id="email1">
							@
							<input id="domainName" type="text" value="" name="email2">
							&nbsp;
							<select id="emailChoice" style="height: 20px;">
								<option>-이메일 선택-</option>
								<option>직접입력</option>
								<option>naver.com</option>
								<option>google.com</option>
								<option>daum.net</option>
								<option>nate.com</option>
							</select>
							<span style="font-size: 10pt; color: gray;">
								<p>
									이메일을 통해 주문처리 과정을 보내드립니다.<br /> 이메일 주소란에는 반드시 수신 가능한 이메일 주소를 입력해주세요.
								</p>
							</span>
						</td>
					</tr>
					<tr>
						<td class="deliverytd">배송메세지</td>
						<td>
							<textarea style="resize:none;" rows="5" cols="100" name="massage"></textarea>
						</td>
					</tr>
				</thead>
			</table>
			<br/><br/>
			<input type="hidden" name="reserves" value="<%=total_reserves%>">
			<!-- 결제 예정 금액 테이블 -->
			<table class="calcualtion2">
				<tr>
					<th width=280px;>총 상품 금액</th>
					<th width=280px;>총 배송비</th>
					<th width=310px;>적립금 사용<br>
						<span style="font-size: 9pt; color: gray;">
							<span>사용가능 포인트 :</span>
							<span name="left_pnt"><%=reserves%>p</span>
							<span margin-left:10px;"><input type="checkbox" style="border:none" readonly id="chk_use" onclick="chkPoint(<%=real_total%>,<%=reserves%>,10,10)">전체 사용</span>
						</span>				 
					</th>
					<th style="width: 450px; padding: 22px 0;">
						<span>결제예정금액</span>
					</th>
				</tr>
				<tr style="background-color: #fff;">
					<td style="padding: 23px 0;">
						<span class="price">
							<fmt:formatNumber value="<%=total%>" type="number" />
						</span>
						원
					</td>
					<td>
						+
						<span class="price">2,500</span>
						원
					</td>
					<td>
						-
						<span> <input type="number" name="use_pnt" id="use_pnt" min="10" max="<%=real_total%>" onchange="changePoint(<%=real_total%>,<%=reserves%>,10,10)"></span> p 
      					<span> ( 남은포인트 : </span><span name="left_pnt" id="left_pnt"><%=reserves%></span>p )
					</td>
					<td>
						<span class="price">
							<span class="bold txt_red" id="result_pnt_show"><fmt:formatNumber value="<%=real_total%>" type="number" /></span>
							<input type="hidden" style="border:none; text-align:right;" id="result_pnt" name="pay" value="<%=real_total%>"/>
						</span>원
						
					</td>
				</tr>
			</table>
			<br> <br>

			<!--결제하기-->
			<div class="payArea">
				<div class="payment">
					<div style="padding: 18px 10px; font-size: 10pt; border-bottom: solid 1px #e0e0eb;">

						<label>결제 방법을 작성해주세요.</label>
						&nbsp;&nbsp;
					</div>
					<div align="left">
						<table border=1 style="font-size: 10pt; font-family: 맑은 고딕; width: 850px">
							<tr>
								<td rowspan=2 align="center" width="155" bgcolor="#264d73">
									<font size="2" color="#ECFAE4">
										<strong>결제 방법</strong>
									</font>
								</td>
								<td align="center" width=110 bgcolor="#264d73">
									<font size="2" color="#ECFAE4">
										<strong>신용카드 번호 
								</td>
								<td width=120>
									<input type="text" name="cardNo">
								</td>
								<td align="center" width=112 bgcolor="#264d73">
									<font size="2" color="#ECFAE4">
										<strong>비밀번호</strong>
									</font>
								</td>
								<td width=120>
									<input type="password" name="cardPass">
								</td>
							</tr>
							<tr>
								<td align="center" width=110 bgcolor="#264d73">
									<font size="2" color="#ECFAE4">
										<strong>무통장 입금</strong>
									</font>
								</td>
								<td colspan=3 width=474>
									<select name="bank">
										<option value="0" selected>다음 중 선택</option>
										<option value="우리은행 (1241-295-1500) (주)aqua">우리은행 (1241-295-1500) / (주)aqua</option>
										<option value="국민은행 (0291-022-2517) (주)aqua">국민은행 (0291-022-2517) / (주)aqua</option>
										<option value="외환은행 (322-246-21402) (주)aqua">외환은행 (322-246-21402) / (주)aqua</option>
										<option value="신한은행 (757-215-2099) (주)aqua">신한은행 (757-215-2099) / (주)aqua</option>
										<option value="하나은행 (628-0220-2211) (주)aqua">하나은행 (628-0220-2211) / (주)aqua</option>
									</select>
									<font size=1 color=#4b89DC>(카드 or 무통장입금 중 택일!)</font>
								</td>
								</td>
							</tr>
						</table>
						<span style="font-size: 10pt; color: gray; padding-left: 10px;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다</span>
						<br>
					</div>
				</div>
				
				<div class="total">
					<span style="display: inline-block; padding: 20px 10px;">최종 카드결제 금액</span>
					<br/>
					<span style="font-size: 25pt; font-weight: bold; padding: 0px 10px;">
						<span class="bold txt_red" id="result_pnt_main_show"><fmt:formatNumber value="<%=real_total%>" type="number" /></span>원
					</span>
					<br/><br/>
					<input type="button" OnClick="check_val()" class="btn default" style="width: 90%; height: 60px; margin-right: 10px; font-size: 21px;" value="결제하기" />
				</div>
			</div>

			<br><br>

			<!-- 안내 -->
			<div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10pt;">무이자 할부 안내</div>
			<div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; padding-left: 10pt;">
				<span>-</span>
				<span style="font-size: 10pt; color: gray;">무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 시 무이자할부는 적용되지 않습니다.</span>
				<br>
				<span>-</span>
				<span style="font-size: 10pt; color: gray;">무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문해주시기 바랍니다.</span>
			</div>
			<br>
			<div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10pt;">이용안내</div>
			<div style="border: solid 1px #e0e0eb; height: 450px; font-size: 12pt; padding-left: 10px;">
				<br>세금계산서 발행 안내
				<ol style="padding-left: 30px;">
					<li class="lifont">부가가치세 법 제 54조에 의거하여 세금계산서는 배송완료일부터 다음달 10일까지만 요청하실 수 있습니다.</li>
					<li class="lifont">세금계산서는 사업자만 신청하실 수 있습니다.</li>
					<li class="lifont">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
					<li class="lifont">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발행이 가능합니다.</li>
					<li class="lifont">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
				</ol>
				<br> 부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내
				<ol style="padding-left: 30px;">
					<li class="lifont">변경된 부가가치세법에 의거, 2004.07.01 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가능하며</li>
					<li class="lifont">신용카드매출전표로 부가가치세 신고를 하셔야 합니다(부가가치세법 시행령 57조)</li>
					<li class="lifont">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 인지해주시기 바랍니다.</li>
				</ol>
				<br> 현금영수증 이용안내
				<ol style="padding-left: 30px;">
					<li class="lifont">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
					<li class="lifont">현금영수증 발행 금액에는 배송비는 포함되고, 적립금 사용액은 포함되지 않습니다.</li>
					<li class="lifont">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
					<li class="lifont">현금영수증 발행 취소의 경우는 시간 제한이 없습니다 (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
					<li class="lifont">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
				</ol>
			</div>
		</form>
	</div>
</div>
<%

} catch (Exception e) {
out.println(e);
}
%>
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>