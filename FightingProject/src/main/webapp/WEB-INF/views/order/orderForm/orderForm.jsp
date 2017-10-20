<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript" src="/test/js_daumaddress/jquery.tablednd.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#plus").on("click", function() {
		
			if (parseInt($("#term").val().substring(2, 3)) <= 8) {
				var one = parseInt($("#term").val().substring(0, 1)) + 1;
				var two = parseInt($("#term").val().substring(2, 3)) + 1;
				$("#term").val(one + "박" + two + "일");
				$("#termGoodsTable tr:nth-child("+(one + 1)+")").after('<tr id="'+(one + 1)+'-termTr'+'" class="nodrag"><td>'+(one + 1)+'일</td><td id="'+(one + 1)+'-1td'+'"></td><td id="'+(one + 1)+'-2td'+'"></td><td id="'+(one + 1)+'-3td'+'"></td><td id="'+(one + 1)+'-4td'+'"></td><td id="'+(one + 1)+'-5td'+'"></td><td id="'+(one + 1)+'-6td'+'"></td><td id="'+(one + 1)+'-7td'+'"></td></tr>');
			} else {
				$("#span").text("값이 8박9일보다 높습니다.");
			}
		});

	$("#minus").on("click",function() {
		if (parseInt($("#term").val().substring(0, 1)) >= 2) {
			var one2 = parseInt($("#term").val().substring(0, 1)) - 1;
			var two2 = parseInt($("#term").val().substring(2, 3)) - 1;
			$("#term").val(one2 + "박"+ two2+ "일");
			$("#termGoodsTable tr:nth-child("+(one2+3)+")").remove();
		} else {
			$("#span").text("값이 1박2일보다 낮습니다.");
		}
		
		
	});	
});
	$(function() {
		$("#termGoodsTable").tableDnD({onDrop: function(table, row) {
			
		}});
		
	});
</script>
<style type="text/css">

tr.noDrag{
cursor:point;
}

</style>

<form action="" method="get" name="myForm" id="myForm">
	<input type="hidden" name="kind" value="" id="kind"> <input
		type="hidden" name="attAdd" value="attAdd" id="attAdd"> <input
		type="hidden" name="resAdd" value="resAdd" id="resAdd"> <input
		type="hidden" name="stayAdd" value="stayAdd" id="stayAdd">
	<h3>[ 패키지 만들기 ]</h3>
	<br> <input type="text" readonly="" value="1박2일" id="term">
	<input type="button" id="plus" value="+"> <input type="button"
		id="minus" value="-"> <span id="span" style="color: red;">8박9일
		까지만 가능</span><br>
	<table border='1' id="termGoodsTable" >
		<tr class="nodrag">
			<td>시간</td>
			<td>아침</td>
			<td>오전</td>
			<td>점심</td>
			<td>오후</td>
			<td>저녁</td>
			<td>밤</td>
			<td>숙박</td>
		</tr>
		<tr id="1-termTr" class="nodrag">
			<td>1일</td>
			<td id="1-1td"></td>
			<td id="1-2td"></td>
			<td id="1-3td"></td>
			<td id="1-4td"></td>
			<td id="1-5td"></td>
			<td id="1-6td"></td>
			<td id="1-7td"></td>
		</tr>
		<tr id="2-termTr" class="nodrag">
			<td>2일</td>
			<td id="2-1td"></td>
			<td id="2-2td"></td>
			<td id="2-3td"></td>
			<td id="2-4td"></td>
			<td id="2-5td"></td>
			<td id="2-6td"></td>
			<td id="2-7td"></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr id="notDragTr" class="nodrag">
			<td>상품 리스트</td>
			<td>업소 분류</td>
			<td>업소명</td>
			<td>업소 지역</td>
			<td>업소 종류</td>
			<td>성인 가격</td>
			<td>어린이 가격</td>
			<td>업소 전화번호</td>
		</tr>
		<c:forEach var="item" items="${sessionScope.orderTourList}"
			varStatus="status">
			<c:if test="${!empty item.attNum }">
				<tr id="${item.attNum }+attTr">
					<td></td>
					<td id="${item.attNum }+att1td">관광지</td>
					<td id="${item.attNum }+att2td">${item.attName }</td>
					<td id="${item.attNum }+att3td">${item.attLocation }</td>
					<td id="${item.attNum }+att4td">${item.attType }</td>
					<td id="${item.attNum }+att5td">${item.attAdultPrice }</td>
					<td id="${item.attNum }+att6td">${item.attKidPrice }</td>
					<td id="${item.attNum }+att7td">${item.attPhone }</td>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="item" items="${sessionScope.orderRestList}"
			varStatus="status">
			<c:if test="${!empty item.restNum }">
				<tr id="${item.restNum }+restTr">
					<td></td>
					<td id="${item.restNum }+rest1td">음식점</td>
					<td id="${item.restNum }+rest2td">${item.restName }</td>
					<td id="${item.restNum }+rest3td">${item.restLocation }</td>
					<td id="${item.restNum }+rest4td">${item.restType }</td>
					<td id="${item.restNum }+rest5td">${item.restPrice }</td>
					<td id="${item.restNum }+rest6td">성인가격 어린이가격으로 구분해서 추가바람</td>
					<td id="${item.restNum }+rest7td">${item.restPhone }</td>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="item" items="${sessionScope.orderStayList}"
			varStatus="status">
			<c:if test="${!empty item.stayNum }">
				<tr id="${item.stayNum }+stayTr">
					<td></td>
					<td id="${item.stayNum }+stay1td">숙박소</td>
					<td id="${item.stayNum }+stay2td">${item.stayName }</td>
					<td id="${item.stayNum }+stay3td">${item.stayLocation }</td>
					<td id="${item.stayNum }+stay4td">${item.stayType }</td>
					<td id="${item.stayNum }+stay5td">${item.stayAdultPrice }</td>
					<td id="${item.stayNum }+stay6td">${item.stayKidPrice }</td>
					<td id="${item.stayNum }+stay7td">${item.stayPhone }</td>
				</tr>
			</c:if>
		</c:forEach>

	</table>
	<a href="tourList?tourForm=tourForm" class="btn btn-default">관광지	추가하기</a>
	<a href="restList?restForm=restForm" class="btn btn-default">음식점 추가하기</a>
	<a href="stayList?stayForm=stayForm" class="btn btn-default">숙박업소 추가하기</a>
</form>