<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">
	$(document).ready(function() {

		$("#xxx2").on("click", function(event) {
			//event.preventDefault();
			//ajax 지역별 통신
			$.ajax({
				type : "get",
				url : "/test/loginX/packReviewGoods",
				dataType : "text",
				data : {
					packReviewNum : $("#packReviewNum").val()
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					$("#result").text(responseData);
					$("#re1").css("display", "none");
				},
				error : function(xhr, status, e) {
					console.log(status, e);
				}
			});
		});

		$(".hideNshow").click(function() {

			var num = $(this).attr("data-num");
			console.log(num);
			if ($("#" + num + "hideNshow").val() == '+') {
				$("#" + num + "table1").show();
				$("#" + num + "hideNshow").val('-');
			}

			else if ($("#" + num + "hideNshow").val() == '-') {
				$("#" + num + "table1").hide();
				$("#" + num + "hideNshow").val('+');
			}

		});

	});
</script>



<h1>후기 게시글 보기</h1>

<form action="/test/loginX/packReviewUpdate">
	<input type="hidden" id="packReviewNum" name="packReviewNum"
		value="${rdto.packReviewNum }"> <b>글번호:&nbsp;</b>${rdto.packReviewNum }
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b>${rdto.packReviewWriteDay }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<b>조회수:&nbsp;</b>${rdto.packReviewRcnt}&nbsp;&nbsp;&nbsp;&nbsp; <b>좋아요수:</b> <span id="re1">${rdto.packReviewGoods}</span>
	<c:if test="${!empty sessionScope.comLogin  && rdto.comNum != comNum1}">

		<span id="result"></span>
		<button type="button" id="xxx2" class="btn btn-default btn-xs">


			<img src="/test/images/goods.png">
		</button>
	</c:if>
	<br><b> 패키지 다녀왔던 곳</b><br><br> <b>패키지
	이름:</b>${odto.packName}&nbsp;&nbsp;&nbsp;&nbsp;<b>출발
	날짜:</b>${odto.startDay}&nbsp;&nbsp;&nbsp;&nbsp;<b>종료
	날짜:</b>${odto.endDay}&nbsp;&nbsp;&nbsp;&nbsp; <b>결제했던
	수단:</b>${odto.payment}&nbsp;&nbsp;&nbsp;&nbsp;<b>결제했던
	가격:</b>${odto.price}<br><b>어른
	인원수:</b>${odto.adult}&nbsp;&nbsp;&nbsp;&nbsp; <b>어린이
	인원수:</b>${odto.kid}&nbsp;&nbsp;<b>자세히보기</b><input type="button" value="+"
		class="hideNshow btn btn-info" data-num="${odto.packOrderNum}"
		id="${odto.packOrderNum}hideNshow"> <br> <br>

	<table border=1 id="${odto.packOrderNum}table1" style="display: none"
		class="table1 table table-striped table-condensed">
		<tr>
			<td align=center><b>일자</b></td>
			<td align=center><b>타입</b></td>
			<td align=center><b>업소이름</b></td>
			<td align=center><b>업소지역</b></td>
			<td align=center><b>업소타입</b></td>
			<td align=center><b>성인가격</b></td>
			<td align=center><b>어린이가격</b></td>
			<td align=center><b>전화번호</b></td>
		</tr>

		<c:forEach var="cc" items="${ldto}" varStatus="status">
			<tr>
				<td align=center>${cc.day}</td>
				<td align=center>${cc.type}</td>
				<c:if test="${cc.type == '관광지' }">
				<td align=center><a href="/test/tourRetrieve?attNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<c:if test="${cc.type == '숙박업소' }">
				<td align=center><a href="/test/stayRetrieve?stayNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<c:if test="${cc.type == '음식점' }">
				<td align=center><a href="/test/restRetrieve?restNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<td align=center>${cc.location}</td>
				<td align=center>${cc.style}</td>
				<td align=center>${cc.adultPrice}</td>
				<td align=center>${cc.kidPrice}</td>
				<td align=center>${cc.phone}</td>
			</tr>
		</c:forEach>

	</table>
	
	
			제목<input type="text" name="packTitle" value="${rdto.packTitle }"
				class="form-control"><br>

	
			내용
			<textarea rows="10" cols="10" name="packContent" class="form-control">${rdto.packContent}</textarea>
			





	<div id="conta">
		<c:if
			test="${!empty sessionScope.comLogin && (rdto.comNum == comNum1)}">


			<input type="submit" class="btn btn-default" value="수정 하기">
		</c:if>
		<c:if
			test="${!empty sessionScope.admLogin || (!empty sessionScope.comLogin && (rdto.comNum == comNum1))}">
			<a href="/test/loginX/packReviewDelete/packReviewNum/${rdto.packReviewNum}"
				class="btn btn-default">삭제 하기</a>
		</c:if>

		<a href="/test/reviewList" class="btn btn-primary">목록</a>

	</div>
</form>



