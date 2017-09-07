<%@page import="com.dto.login.ComDTO"%>
<%@page import="com.dto.restaurant.RestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${!empty requestScope.reservation}">
	<script>
		alert('${requestScope.reservation}');
	</script>

</c:if>

<FORM name="restRetrieveForm" method="GET" action="#">
	<input type="hidden" name="restImage" value="${RestRetrieve.restImage}">
	<input type="hidden" name="restNum" value="${RestRetrieve.restNum}">
	<input type="hidden" name="restName" value="${RestRetrieve.restName}">
	<input type="hidden" name="restPrice" value="${RestRetrieve.restPrice}">

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 음식점 정보
									-</b></font> &nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img
							<%-- src="images/${RestRetrieve.restImage}.jpg" border="0" --%>
								src="../images/1.jpg"
							border="0" align="center" width="300" /></td>
						<td class="td_title">음식점명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${RestRetrieve.restName}</td>
					</tr>
					<tr>
						<td class="td_title">음식점 종류</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${RestRetrieve.restType}
						</td>

					</tr>
					<tr>
						<td class="td_title">평균 가격</td>
						<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
								type="currency" value="${RestRetrieve.restPrice}"
								pattern="\###,###" var="restPrice" /> <c:out
								value="${restPrice}" /></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">인원수</td>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="REST_SIZE" id="REST_SIZE">
								<option selected value="사이즈선택">인원선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
						</select></td>
					</tr>

					<!-- <tr>
						
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="GOODS_AMOUNT" value="1" id="GOODS_AMOUNT"
							style="text-align: right; height: 18px"> <img
							src="images/up.PNG" id="up" onclick="upCount()"> <img
							src="images/down.PNG" id="down" onclick="downCount()"></td>
					</tr> -->
				</table>
			<tr>

			<td class="td_content">음식점 정보</td>
						<td class="td_default" colspan="30" style='padding-left: 30px'>${RestRetrieve.restContent}
						</td>
						
					</tr>
			</td>
		</tr>
		
	</table>

	<br>
	<button onclick="reqCheck('reservation')">예약</button>
	&nbsp;&nbsp;
	<button onclick="reqCheck('cancel')">취소</button>
</FORM>

<script>
	/* function upCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount + 1;
		document.getElementById("GOODS_AMOUNT").value = amount;

	} */

	/* function downCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount - 1;
		if (amount == 0) {
			amount = 1;
		}

		document.getElementById("GOODS_AMOUNT").value = amount;

	} */

	/* 	function cartAdd(f){
	 f.action="CartAddServlet";
	 } */
</script>

