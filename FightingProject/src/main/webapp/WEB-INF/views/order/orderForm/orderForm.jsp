<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#plus")
								.on(
										"click",
										function() {
											if (parseInt($("#term").val()
													.substring(2, 3)) <= 8) {
												var one = parseInt($("#term")
														.val().substring(0, 1)) + 1;
												var two = parseInt($("#term")
														.val().substring(2, 3)) + 1;
												$("#term").val(
														one + "박" + two + "일");
												$("#termTable")
														.append(
																'<tr><td>'
																		+ (one + 1)
																		+ '일</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>');
											} else {
												$("#span").text(
														"값이 8박9일보다 높습니다.");
											}
										});

						$("#minus")
								.on(
										"click",
										function() {
											if (parseInt($("#term").val()
													.substring(0, 1)) >= 2) {
												var one2 = parseInt($("#term")
														.val().substring(0, 1)) - 1;
												var two2 = parseInt($("#term")
														.val().substring(2, 3)) - 1;
												$("#term")
														.val(
																one2 + "박"
																		+ two2
																		+ "일");
												$("#termTable tr:last-child")
														.remove();

											} else {
												$("#span").text(
														"값이 1박2일보다 낮습니다.");
											}
										});

					});
</script>
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
	<table border='1' id="termTable">
		<tr>
			<td>시간</td>
			<td>아침</td>
			<td>오전</td>
			<td>점심</td>
			<td>오후</td>
			<td>저녁</td>
			<td>&nbsp;밤&nbsp;</td>
			<td>숙박</td>
		</tr>
		<tr>
			<td>1일</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>2일</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>

	</table>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<table border='1' id="goodTable">
		<tr>
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
				<tr>
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
				<tr>
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
				<tr>
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

	</table>
	<a href="tourList?tourForm=tourForm" 
	class="btn btn-default">관광지 추가하기</a> 
	<a href="restList?restForm=restForm" 
	class="btn btn-default">음식점 추가하기</a> 
	<a href="stayList?stayForm=stayForm" 
	class="btn btn-default">숙박업소 추가하기</a> 
</form>