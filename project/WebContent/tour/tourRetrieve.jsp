<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${!empty requestScope.cart}">
		<script>
			alert('${requestScope.cart}');
		</script>

	</c:if>

<FORM name="goodRetrieveForm" method="GET" action="#">
	<input type="hidden" name="gImage" value="${GoodsRetrieve.gImage}">
	<input type="hidden" name="gCode" value="${GoodsRetrieve.gCode}">
	<input type="hidden" name="gName" value="${GoodsRetrieve.gName}">
	<input type="hidden" name="gPrice" value="${GoodsRetrieve.gPrice}">

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
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
							src="images/items/${GoodsRetrieve.gImage}.gif" border="0"
							align="center" width="300" /></td>
						<td class="td_title">제품코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${GoodsRetrieve.gCode}
						</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${GoodsRetrieve.gName}</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>




						<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
								type="currency" value="${GoodsRetrieve.gPrice}"
								pattern="\###,###" var="gPri" /> <c:out value="${gPri}" /></td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_SIZE" id="GOODS_SIZE">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_COLOR"
							id="GOODS_COLOR">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="GOODS_AMOUNT" value="1" id="GOODS_AMOUNT"
							style="text-align: right; height: 18px"> <img
							src="images/up.PNG" id="up" onclick="upCount()"> <img
							src="images/down.PNG" id="down" onclick="downCount()"></td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	<br>
	<button onclick="reqCheck('order')">구매</button>
	&nbsp;&nbsp;
	<button onclick="cartAdd(goodRetrieveForm)">장바구니</button>





</FORM>

<script>
	function upCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount + 1;
		document.getElementById("GOODS_AMOUNT").value = amount;

	}

	function downCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount - 1;
		if (amount == 0) {
			amount = 1;
		}

		document.getElementById("GOODS_AMOUNT").value = amount;

	}
	
	function cartAdd(f){
		f.action="CartAddServlet";
	}
	
</script>

