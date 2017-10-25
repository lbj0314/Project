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

		
		//테이블 행 이동
		$(function() {
			$("#termGoodsTable").tableDnD({
				onDrop : function(table, row) {

				}
			});

		});
		
		//날짜 변경
		$("#dayButton").on("click",function(){
			//날짜간 일수 비교
			var startString = $("#startDate").val();
			var startArray = startString.split("-");
			var startObj = new Date(startArray[0],Number(startArray[1])-1,startArray[2]);
			
			var endString = $("#endDate").val();
			var endArray = endString.split("-");
			var endObj = new Date(endArray[0],Number(endArray[1])-1,endArray[2]);
			
			/* 밀리세컨드 단위 1000/60/60/24 초/분/시간/일*/
			var betweenDay = (endObj.getTime() - startObj.getTime())/60000/60/24;
			$("#betweenDay").val(betweenDay);
			$("#startDay").val($("#startDate").val());
			$("#endDay").val($("#endDate").val());
			$("#myForm").submit();
		});
		$("#startDate").val($("#startDay").val());
		$("#endDate").val($("#endDay").val());
		
		//테이블 행 추가
		var between = $("#betweenDay").val();
		for (var i = 1; i <= between-1; i++) {
			console.log("몇번?")
			
			$("#2th-tbody tr:nth-child("+i+")").after("<tr id='"+((i*1)+(2*1))+"-termTr' class='nodrag'><td>"+((i*1)+(2*1))+"일</td><td>야</td><td>야</td><td>야</td><td>야</td><td>야</td><td>야</td><td>야</td></tr>")
		}
		//전체 선택하기
		$("#allCheck").on("click",function(){
			if($("#allCheck").prop("checked")){
				
			}else{
				
			}
		});
			
	});
</script>
<style type="text/css">
tr.noDrag {
	cursor: point;
}
</style>

<form action="/test/packageOrderForm" method="get" name="myForm" id="myForm">
<input type="hidden" name="betweenDay" id="betweenDay" value="${sessionScope.betweenDay }">
<input type="hidden" name="startDay" id="startDay" value="${sessionScope.startDay }">
<input type="hidden" name="endDay" id="endDay" value="${sessionScope.endDay }">
	<h3>[ 패키지 만들기 ]</h3> <br>
		<p>여행 시작날짜:</p><input type="date" id="startDate" name="startDate"><br>
		<p>여행 종료날짜:</p><input type="date" id="endDate" name="endDate"><input type="button" value="날짜 변경하기" id="dayButton"><br><br>
	<table border='1' id="termGoodsTable">
	<tbody id="1th-tbody">
		<tr class="nodrag">
			<th>날짜</th>
			<td>업소 분류</td>
			<td>업소명</td>
			<td>업소 지역</td>
			<td>업소 종류</td>
			<td>성인 가격</td>
			<td>어린이 가격</td>
			<td>업소 전화번호</td>
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
		</tbody>
		<tbody id="2th-tbody">
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
		<tr id="allCheckTr" class="nodrag">
			<td align="center"><input type="checkbox"
				name="allCheck" id="allCheck" > <strong>전체선택</strong></td>
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
					<td align="center"><input type="checkbox" ></td>
					<td>관광지</td>
					<td>${item.attName }</td>
					<td>${item.attLocation }</td>
					<td>${item.attType }</td>
					<td>${item.attAdultPrice }</td>
					<td>${item.attKidPrice }</td>
					<td>${item.attPhone }</td>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="item" items="${sessionScope.orderRestList}"
			varStatus="status">
			<c:if test="${!empty item.restNum }">
				<tr id="${item.restNum }+restTr">
					<td align="center"><input type="checkbox" ></td>
					<td>음식점</td>
					<td>${item.restName }</td>
					<td>${item.restLocation }</td>
					<td>${item.restType }</td>
					<td>${item.restPrice }</td>
					<td>성인가격 어린이가격으로 구분해서 추가바람</td>
					<td>${item.restPhone }</td>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="item" items="${sessionScope.orderStayList}"
			varStatus="status">
			<c:if test="${!empty item.stayNum }">
				<tr id="${item.stayNum }+stayTr">
					<td align="center"><input type="checkbox" ></td>
					<td>숙박소</td>
					<td>${item.stayName }</td>
					<td>${item.stayLocation }</td>
					<td>${item.stayType }</td>
					<td>${item.stayAdultPrice }</td>
					<td>${item.stayKidPrice }</td>
					<td>${item.stayPhone }</td>
				</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>
	<a href="" class="btn btn-default">선택 삭제하기</a>
		<a href="" class="btn btn-default">주문하기</a><br>
	<a href="tourList?tourForm=tourForm" class="btn btn-default">관광지
		추가하기</a> <a href="restList?restForm=restForm" class="btn btn-default">음식점
		추가하기</a> <a href="stayList?stayForm=stayForm" class="btn btn-default">숙박업소
		추가하기</a>
</form>