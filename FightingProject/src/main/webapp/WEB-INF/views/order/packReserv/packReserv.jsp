<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript"
	src="/test/js_daumaddress/jquery.tablednd.js"></script>
<script type="text/javascript">
	// allresult
	function el(){
			if($("#adultCount").val()=='0' && $("#kidCount").val()=='0'){
				alert('최소 한명이상은 가야합니다!');
				return false;
			}
			else{
				return true;
			}
			
		}
	$(document).ready(function() {
		
		//총 가격 구하기
		var adultPriceArray = new Array();
		var kidPriceArray = new Array();



		$("#1th-tbody").children().not("#notDto").each(function(index, item) {
			var adultPrice = $(item).children().eq(5).html();
			console.log(adultPrice);
			var kidPrice = $(item).children().eq(6).html();
			adultPriceArray.push(adultPrice);
			kidPriceArray.push(kidPrice);
		});
		var adultResult = 0;

		for (var i = 0; i < adultPriceArray.length; i++) {
			adultResult += parseInt(adultPriceArray[i]);
		}
		console.log(adultResult);
		adultResult *= $("#adultCount").val();
		console.log(adultResult);
		var kidResult = 0;
		for (var i = 0; i < kidPriceArray.length; i++) {
			kidResult += parseInt(kidPriceArray[i]);
		}
		console.log(kidResult);
		kidResult *= $("#kidCount").val();
		console.log(kidResult)
		$("#resultPrice").val(adultResult + kidResult);

		
		
		
		
		
		//인원수 조정하기
		$("#plusAdult").on("click", function() {

			$("#adultCount").val($("#adultCount").val() * 1 + 1);
			adultResult=0;
			$.ajax({
				type : "post",
				url : "/test/packMulty",
				data : {
					n : $('#adultCount').val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$("#adultCount").val(responseData);
					if (responseData != 0) {
						for (var i = 0; i < adultPriceArray.length; i++) {
							adultResult += parseInt(adultPriceArray[i]);
						}
					}
					console.log("re" + adultResult);
					adultResult *= responseData;
					console.log("re" + adultResult);
					$("#resultPrice").val(adultResult + kidResult);

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		$("#minusAdult").on("click", function() {
			adultResult=0;
			if (($("#adultCount").val()) != 0) {
				$("#adultCount").val($("#adultCount").val() * 1 - 1);
				$.ajax({
					type : "post",
					url : "/test/packMulty",
					data : {
						n : $('#adultCount').val()
					},
					dataType : "text",
					success : function(responseData, status, xhr) {
						//$("#adultCount").val(responseData);
						if (responseData != 0) {
							for (var i = 0; i < adultPriceArray.length; i++) {
								adultResult += parseInt(adultPriceArray[i]);
							}
						}
						console.log("de" + adultResult);
						adultResult *= responseData;
						console.log("de" + adultResult);
						$("#resultPrice").val(adultResult + kidResult);

					},
					error : function(xhr, status, e) {
						console.log(status, e);

					}

				});

			} else {
				alert('0미만의 숫자 입력은 불가능합니다!');
				return false;
			}
		});

		$("#plusKid").on("click", function() {
			kidResult=0;
			$("#kidCount").val($("#kidCount").val() * 1 + 1);

			$.ajax({
				type : "post",
				url : "/test/packMulty",
				data : {
					n : $('#kidCount').val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$("#kidCount").val(responseData);
					if (responseData != 0) {
						for (var i = 0; i < kidPriceArray.length; i++) {
							kidResult += parseInt(kidPriceArray[i]);
						}
						
					}
					kidResult *= responseData;

					$("#resultPrice").val(adultResult + kidResult);

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});
		});
		$("#minusKid").on("click", function() {
			kidResult=0;
			if (($("#kidCount").val()) > 0) {

				$("#kidCount").val($("#kidCount").val() * 1 - 1);
				$.ajax({
					type : "post",
					url : "/test/packMulty",
					data : {
						n : $('#kidCount').val()
					},
					dataType : "text",
					success : function(responseData, status, xhr) {
						$("#kidCount").val(responseData);
						if (responseData != 0) {
							for (var i = 0; i < kidPriceArray.length; i++) {
								kidResult += parseInt(kidPriceArray[i]);
							}
						}
						kidResult *= responseData;

						$("#resultPrice").val(adultResult + kidResult);

					},
					error : function(xhr, status, e) {
						console.log(status, e);

					}

				});
			} else {
				alert('0미만의 숫자 입력은 불가능합니다!');
				return false;
			}
		});

		//어른인원수랑 어린이 인원수 바뀔때마다 또 조정해줘야됨 ㅅㅂ;;;;;;; -> 했음 ㅅㄱ
		//어른 바뀔때
		/*
		$("#adultCount").on("change",function(){
		var adultPriceArray = new Array();
		var kidPriceArray = new Array();
		
		$("#1th-tbody").children().not("#notDto").each(function(index,item){
			var adultPrice = $(item).children().eq(6);
			var kidPrice = $(item).children().eq(7);
			adultPriceArray.push(adultPrice);
			kidPriceArray.push(kidPrice);
		});
		var adultResult = 0;
		for (var i = 0; i < adultPriceArray.length; i++) {
			adultResult+=adultPriceArray[i];
		}
		adultResult*=$("#adultCount").val();
		var kidResult = 0;
		for (var i = 0; i < kidPriceArray.length; i++) {
			kidResult+=kidPriceArray[i];
		}
		kidResult*=$("#kidCount").val();
		$("#resultPrice").val(adultResult+kidResult);
		});
		
		
		 */
		//어린이 바뀔때
		/*
		$("#kidCount").on("change",function(){
			var adultPriceArray = new Array();
			var kidPriceArray = new Array();
			
			$("#1th-tbody").children().not("#notDto").each(function(index,item){
				var adultPrice = $(item).children().eq(6);
				var kidPrice = $(item).children().eq(7);
				adultPriceArray.push(adultPrice);
				kidPriceArray.push(kidPrice);
			});
			var adultResult = 0;
			for (var i = 0; i < adultPriceArray.length; i++) {
				adultResult+=adultPriceArray[i];
			}
			adultResult*=$("#adultCount").val();
			var kidResult = 0;
			for (var i = 0; i < kidPriceArray.length; i++) {
				kidResult+=kidPriceArray[i];
			}
			kidResult*=$("#kidCount").val();
			$("#resultPrice").val(adultResult+kidResult);
			
		}); 
		 */

	});
</script>
<style type="text/css">
tr.noDrag {
	cursor: point;
}
</style>

<form action="/test/packageBuy" method="get" name="myForm" id="myForm" onsubmit="return el()" >
	<h3>[ 패키지 예약하기 ]</h3>
	<br>
	<p>여행 시작날짜:</p>
	<input type="date" id="startDate" name="startDay" readonly
		value="${startDay }">
	<p>여행 종료날짜:</p>
	<input type="date" id="endDate" name="endDay" readonly
		value="${endDay }"> <br>
	<table border='1' id="termGoodsTable">
		<tbody id="1th-tbody">
			<tr id="notDto">
				<th>날짜</th>
				<td>업소 분류</td>
				<td>업소명</td>
				<td>업소 지역</td>
				<td>업소 종류</td>
				<td>성인 가격</td>
				<td>어린이 가격</td>
				<td>업소 전화번호</td>
			</tr>
			<c:forEach var="item" items="${sessionScope.reserv}"
				varStatus="status">
				<c:if test="${item.type=='관광지' }">
					<tr id="1-termTr">
						<td>${item.date}일</td>
						<td>${item.type}</td>
						<td>${item.tourDto.attName }</td>
						<td>${item.tourDto.attLocation }</td>
						<td>${item.tourDto.attType }</td>
						<td>${item.tourDto.attAdultPrice }</td>
						<td>${item.tourDto.attKidPrice }</td>
						<td>${item.tourDto.attPhone }</td>
					</tr>
				</c:if>
				<c:if test="${item.type=='음식점' }">
					<tr id="1-termTr">
						<td>${item.date}일</td>
						<td>${item.type}</td>
						<td>${item.restDto.restName }</td>
						<td>${item.restDto.restLocation }</td>
						<td>${item.restDto.restType }</td>
						<td>${item.restDto.restAdultPrice }</td>
						<td>${item.restDto.restKidPrice }</td>
						<td>${item.restDto.restPhone }</td>
					</tr>
				</c:if>
				<c:if test="${item.type=='숙박업소' }">
					<tr id="1-termTr">
						<td>${item.date}일</td>
						<td>${item.type}</td>
						<td>${item.stayDto.stayName }</td>
						<td>${item.stayDto.stayLocation }</td>
						<td>${item.stayDto.stayType }</td>
						<td>${item.stayDto.stayAdultPrice }</td>
						<td>${item.stayDto.stayKidPrice }</td>
						<td>${item.stayDto.stayPhone }</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	패키지 이름:<input type="text" name="packName"><br>
	어른 인원수:<input type="number" id="adultCount" value=1 name="adultCount"> <input
		type=button id="plusAdult" class="btn btn-default" value="+">
	<input type=button id="minusAdult" class="btn btn-default" value="-"><br>
	어린이 인원수:<input type="number" id="kidCount" value=1 name="kidCount"> <input
		type=button id="plusKid" class="btn btn-default" value="+"> <input
		type=button id="minusKid" class="btn btn-default" value="-"><br>
	총가격:
	<!-- <input type="number" readonly value=""> -->
	<span id="allresult"> <input type="number" readonly
		id="resultPrice" name="resultPrice">
	</span><br> 
	
	
	<table width="100%" >
					<tr>
						<td width="125" height="35" class="td_default"><input
							type="radio" name="payment" value="신용카드" checked>신용카드</input> <input
							type="radio" name="payment" value="계좌이체">계좌이체</input> <input
							type="radio" name="payment" value="무통장입금">무통장 입금</input></td>

					</tr>

				</table>
	
	
	<a href="/test/packageOrderForm" class="btn btn-default">만들기로 돌아가기</a> <input
		type="submit" value="결제하기" class="btn btn-default">

</form>