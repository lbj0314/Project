<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">
	$("#result").on("click", function(event) {
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

	$(document).ready(function() {

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

<form action="/test/loginX/noticeUpdate" method="post">
	 <input type="hidden" name="packReviewNum"
		value="${rdto.packReviewNum }">
	
		<b>글번호:&nbsp;</b>${rdto.packReviewNum }
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b>${rdto.packReviewWriteDay }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b>조회수:&nbsp;</b>${rdto.packReviewRcnt}<br>
	
	좋아요수: <span id="re1">${rdto.packReviewGoods}</span>
	<c:if test="${!empty sessionScope.comLogin}">

		<span id="result"></span>
		<button type="button" id="xxx" class="btn btn-default btn-xs">


			<img src="/test/images/goods.png">
		</button>
	</c:if>
<br>
	패키지 다녀왔던 곳<br> 패키지 이름:${odto.packName}&nbsp;&nbsp;&nbsp;&nbsp;출발
	날짜:${odto.startDay}&nbsp;&nbsp;&nbsp;&nbsp;종료
	날짜${odto.endDay}&nbsp;&nbsp;&nbsp;&nbsp; 결제했던
	수단:${odto.payment}&nbsp;&nbsp;&nbsp;&nbsp;결제했던
	가격:${odto.price}&nbsp;&nbsp;&nbsp;&nbsp;어른
	인원수:${odto.adult}&nbsp;&nbsp;&nbsp;&nbsp; 어린이
	인원수:${odto.kid}&nbsp;&nbsp;자세히보기<input type="button" value="+"
		class="hideNshow btn btn-info" data-num="${odto.packOrderNum}"
		id="${odto.packOrderNum}hideNshow"> <br> <br>

	<table border=1 id="${odto.packOrderNum}table1" style="display: none"
		class="table1">
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
				<td align=center>${cc.name}</td>
				<td align=center>${cc.location}</td>
				<td align=center>${cc.style}</td>
				<td align=center>${cc.adultPrice}</td>
				<td align=center>${cc.kidPrice}</td>
				<td align=center>${cc.phone}</td>
			</tr>
		</c:forEach>

	</table>
	<div id="conta">
	<div class="form-group">
		제목<input type="text" name="notitle" value="${rdto.packTitle }"
			class="form-control"><br>
	</div>
	<div class="form-group">
		내용
		<textarea rows="10" cols="10" name="nocontent" class="form-control">${rdto.packContent }</textarea>
		<c:if test="${!empty sessionScope.admLogin}">
			<input type="submit" value="수정" class="btn btn-primary">
		</c:if>

	</div>
	</div>
</form>

<%-- <a href="/test/noticeList" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.admLogin}">
	<a href="/test/loginX/noticeDelete?nonum=${retrieve.nonum }"
		class="btn btn-primary"> 삭제</a>
</c:if> --%>



