<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.restaurant.RestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
<!-- jQeury문 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#restperPage").on("change", function(event) {
			$.ajax({
				type:"get",
				url:"RestPerPageServlet",
				data:{
					restperPage:$("#restperPage").val()
				},
				dataType:"text",
				success:function(responseData, status, xhr){
					console.log(responseData);
					$("#r").submit();
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
			<c:set value="${restlist}" var="restdto" scope="request" />

			<c:set value="${restdto.getRestlist()}" var="restlist" scope="request" />
			<c:choose>


				<c:when test="${restlist.getRestlist().size()==0}">


					<tr>
						<td colspan=4>레코드가 없습니다.</td>
					</tr>
				</c:when>


				<c:otherwise>
					<c:forEach var="r" items="${restlist}">




						<tr>
							<td>${r.restnum}</td>
							<td><a href="NoticeRetrieveServlet?nonum=${r.restnum}">${r.resttitle}</a></td>
							<td>${r.restwriteDay}</td>
							<td>${r.restreadCnt}</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="4">	
					<div class="form-group" align="center">
					<!-- 검색 -->
					<form action="RestListServlet" class="form-inline" id="r">
						페이지에서 보여줄 개수 <select name="restperPage" class="form-inline" id="restperPage">
							<option value="def">선택하세요</option>
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="8">8</option>
							</select>
							<select name="restsearchName" class="form-inline">
								<option value="resttitle">제목</option>
							</select> <input type="text" name="restsearchValue" class="form-control">
							<input type="submit" value="검색" class="btn btn-primary">
						
					</form>
					</div>
					
				</td>
			</tr>
			
			<c:if test="${restlist.getRestlist().size()!=0}">
				<tr>
					<!--  <td colspan="5"><jsp:include page="rest_page.jsp" flush="true" /></td>-->
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
