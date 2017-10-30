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
			
			/* 밀리세컨드 단위 1000/60/60/24 초/분/시간/일 왜 빨간줄 그어져 있는진 모르겠음 */
			var betweenDay = (endObj.getTime() - startObj.getTime())/1000/60/60/24;
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
		//전체 선택하기 주문하려는 친구제외
		$("#allCheck").on("click",function(){
			if($("#allCheck").prop("checked")){
				$("#allCheckTr").nextAll("tr").find("input[name=chk]").prop("checked",true);
			}else{
				$("#allCheckTr").nextAll("tr").find("input[name=chk]").prop("checked",false);
			}
		});
		//주문하기 상품리스트 친구 제외
		$("#reservation").on("click",function(){
			
			var reservArray = new Array();
			var tourJson = new Object();
			var restJson = new Object();
			var stayJson = new Object();
			
			$("#allCheckTr").prevAll("tr[name=reservTr]").each(function(index, item){
				
				//1일차 일경우
				if($(item).prev().attr("id")==undefined){
					var reservDate = 1;
					var reservNum = $(item).attr("id");
					var numLeng = reservNum.length;
					if(reservNum.substring(numLeng-6, numLeng)=="tourTr"){
						reservNum = reservNum.slice(0,-6);
						tourJson.date = reservDate;
						tourJson.num = reservNum;
						tourJson.type = "tour";
						reservArray.push(tourJson);
					}
					if(reservNum.substring(numLeng-6, numLeng)=="restTr"){
						reservNum = reservNum.slice(0,-6);
						restJson.date = reservDate;
						restJson.num = reservNum;
						restJson.type = "rest";
						reservArray.push(restJson);
					}
					if(reservNum.substring(numLeng-6, numLeng)=="stayTr"){
						reservNum = reservNum.slice(0,-6);
						stayJson.date = reservDate;
						stayJson.num = reservNum;
						stayJson.type = "stay";
						reservArray.push(stayJson);
					}
					$("#afterReserv").prepend($(item));
					
					//2일차부터
				}else{
					var reservDate = $(item).prev().attr("id");
					var reservNum = $(item).attr("id");
					var numLeng = reservNum.length;
					if(reservNum.substring(numLeng-6, numLeng)=="tourTr"){
						
						reservDate = reservDate.slice(0,-7);
						reservNum = reservNum.slice(0,-6);
						tourJson.date = reservDate;
						tourJson.num = reservNum;
						reservArray.push(tourJson);
					}
					if(reservNum.substring(numLeng-6, numLeng)=="restTr"){
						reservDate = reservDate.slice(0,-7);
						reservNum = reservNum.slice(0,-6);
						restJson.date = reservDate;
						restJson.num = reservNum;
						reservArray.push(restJson);
					}
					if(reservNum.substring(numLeng-6, numLeng)=="stayTr"){
						reservDate = reservDate.slice(0,-7);
						reservNum = reservNum.slice(0,-6);
						stayJson.date = reservDate;
						stayJson.num = reservNum;
						reservArray.push(stayJson);
					}
					$("#afterReserv").prepend($(item));
				}
			});
			/* $("#reserveArrayHidden").val(reservArray);
			$("#myForm").attr("action","/test/reservationPackage");
			$("#myForm").attr("method","post");
			$("#myForm").submit(); */
			
			 $.ajax({
				   url:"/test/reservationPackage",
				   //타입은 get으로 주면안됨
				   type:"post",
				   //헤더정보에 json객체라는걸 알려줘야함
				   ContentType:"application/json;charset=UTF-8",
				   //json객체모양의 !!문자열!!(이게중요함)을 스프링 jackson lib가 자동으로 자바 객체로 바인드시켜줌
				   //json객체를 문자열로 변환시켜주는 메서드
			   		data:JSON.stringify(reservArray),
			   		processData : true,
			   		dataType : 'json',
			   		
				   success:function(responseData,status,xhr){
					  
				   },
				   error:function(request,status,error){
					   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
			   });
		});
			
	});
</script>
<style type="text/css">
tr.noDrag {
	cursor: point;
}
</style>

<form action="/test/packageOrderForm" method="get" name="myForm"
	id="myForm">
	<input type="hidden" name="reservArray" id="reserveArrayHidden">
	<input type="hidden" name="betweenDay" id="betweenDay"
		value="${sessionScope.betweenDay }"> <input type="hidden"
		name="startDay" id="startDay" value="${sessionScope.startDay }">
	<input type="hidden" name="endDay" id="endDay"
		value="${sessionScope.endDay }">
	<h3>[ 패키지 만들기 ]</h3>
	<br>
	<p>여행 시작날짜:</p>
	<input type="date" id="startDate" name="startDate"><br>
	<p>여행 종료날짜:</p>
	<input type="date" id="endDate" name="endDate"><input
		type="button" value="날짜 변경하기" id="dayButton" class="btn btn-default"><br>
	<br>
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
			<tr id="afterReserv">
				<td colspan="8">&nbsp;&nbsp;여기 tr 없애지 마시오!!!!&nbsp;&nbsp;</td>
			</tr>

			<tr id="allCheckTr" class="nodrag">
				<td align="center"><input type="checkbox" name="allCheck"
					id="allCheck"> <strong>전체선택</strong></td>
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
					<tr id="${item.attNum }tourTr" name="reservTr">
						<td align="center"><input type="checkbox" name="chk"></td>
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
					<tr id="${item.restNum }restTr" name="reservTr">
						<td align="center"><input type="checkbox" name="chk"></td>
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
					<tr id="${item.stayNum }stayTr" name="reservTr">
						<td align="center"><input type="checkbox" name="chk"></td>
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
	<a href="" class="btn btn-default" id="">선택 삭제하기</a> <input
		type="button" class="btn btn-default" value="주문하기" id="reservation"><br>
	<a href="tourList?tourForm=tourForm" class="btn btn-default">관광지
		추가하기</a> <a href="restList?restForm=restForm" class="btn btn-default">음식점
		추가하기</a> <a href="stayList?stayForm=stayForm" class="btn btn-default">숙박업소
		추가하기</a>
</form>