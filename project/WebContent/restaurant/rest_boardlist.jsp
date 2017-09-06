<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.restaurant.RestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
<!-- jQeury문 --> 
<script type="text/javascript">
	$(document).ready(function() {
		$("#restPerPage").on("change", function(event) {
			$.ajax({
				type:"get",
				url:"RestPerPageServlet",
				data:{
					restperPage:$("#restPerPage").val()
				},
				dataType:"text",
				success:function(responseData, status, xhr){
					console.log(responseData);
					$('#rr').submit();
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}

			});
			
		});
	});
</script>
	<h1 align=center>
		음식점 목록
	</h1>
	<div class="container">
		<table class="table table-board">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:set value="${restList}" var="restdto" scope="request" />

			<c:set value="${restdto.getRestList()}" var="restList" scope="request" />
			<c:choose>


				<c:when test="${restList.getRestList().size()==0}">


					<tr>
						<td colspan=4>레코드가 없습니다.</td>
					</tr>
				</c:when>


				<c:otherwise>
					<c:forEach var="r" items="${restList}">




						<tr>
							<td>${rr.restNum}</td>
							<td><a href="RestRetrieveServlet?restnum=${rr.restNum}">${rr.restTitle}</a></td>
							<td>${rr.restWriteDay}</td>
							<td>${rr.restReadCnt}</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="4">	
					<div class="form-group" align="center">
					<!-- 검색 -->
					<form action="RestListServlet" class="form-inline" id="r">
						페이지에서 보여줄 개수 <select name="restPerPage" class="form-inline" id="restPerPage">
							<option value="def">선택하세요</option>
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="20">20</option>
							</select>
							<select name="restSearchName" class="form-inline">
								<option value="restTitle">제목</option>
							</select> <input type="text" name="restSearchValue" class="form-control">
							<input type="submit" value="검색" class="btn btn-primary">
						
					</form>
					</div>
					
				</td>
			</tr>
			
			<c:if test="${restList.getRestList().size()!=0}">
				<tr>
					<td colspan="5"><jsp:include page="rest_boardpage.jsp" flush="true" /></td>
				</tr>
			</c:if>


		</table>

<c:if test="${!empty sessionScope.login}">

		<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='RestWriteUIServlet';">글쓰기</button>
		</div>
		</c:if>
	</div>
