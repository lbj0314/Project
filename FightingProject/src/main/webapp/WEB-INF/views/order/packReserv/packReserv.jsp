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
	$(document).ready(function() {
		
		//인원수 조정하기
		$("#plusAdult").on("click",function(){
			$("#adultCount").val($("#adultCount").val()*1+1)
		});
		$("#minusAdult").on("click",function(){
			$("#adultCount").val($("#adultCount").val()*1-1)
		});
		$("#plusKid").on("click",function(){
			$("#kidCount").val($("#kidCount").val()*1+1)
		});
		$("#minusKid").on("click",function(){
			$("#kidCount").val($("#kidCount").val()*1-1)
		});
		
		//총 가격 구하기
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
		$("resultPrice").val(adultResult+kidResult);
		//어른인원수랑 어린이 인원수 바뀔때마다 또 조정해줘야됨 ㅅㅂ;;;;;;;
		//어른 바뀔때
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
			$("resultPrice").val(adultResult+kidResult);
		});
		//어린이 바뀔때
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
			$("resultPrice").val(adultResult+kidResult);
		});
	});
</script>
<style type="text/css">
tr.noDrag {
	cursor: point;
}
</style>

<form action="/test/packageBuy" method="get" name="myForm" id="myForm">
	<h3>[ 패키지 예약하기 ]</h3>
	<br><p>여행 시작날짜:</p>
	<input type="date" id="startDate" name="startDate" readonly value="${startDay }">
	<p>여행 종료날짜:</p>
	<input type="date" id="endDate" name="endDate" readonly value="${endDay }">
	<br>
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
				<tr id="1-termTr" >
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
					<td>${item.restDto.restPrice }</td>
					<td>어린이 가격 추가바람</td>
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
	어른 인원수:<input type="number" id="adultCount" value=1>
	<button id="plusAdult" class="btn btn-default">+</button> 
	<button id="minusAdult" class="btn btn-default">-</button> <br>
	어린이 인원수:<input type="number" id="kidCount" value=1> 
	<button id="plusKid" class="btn btn-default">+</button> 
	<button id="minusKid" class="btn btn-default">-</button> <br>
	총가격:<input type="number" readonly value=""><input type="number" readonly id="resultPrice" name="resultPrice"> <br>
	<a href="" class="btn btn-default">만들기로 돌아가기</a> 
	<input type="submit" value="결제하기" class="btn btn-default">

</form>