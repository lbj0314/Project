<%@page import="com.dto.stay.StayPageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.stay.StayDTO"%>
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
		$("#stayperPage").on("change", function(event) {
			$.ajax({
				type:"get",
				url:"StayPerPageServlet",
				data:{
					stayperPage:$("#stayperPage").val()
				},
				dataType:"text",
				success:function(responseData, status, xhr){
					console.log(responseData);
					$('#ss').submit();
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}

			});
			
		});
	});
</script>
	<h1 align=center>
		숙박업소 목록
	</h1>
	<div class="container">
		<table class="table table-board">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:set value="${staylist}" var="staydto" scope="request" />

			<c:set value="${staydto.getStaylist()}" var="staylist" scope="request" />
			<c:choose>


				<c:when test="${staylist.getStaylist().size()==0}">


					<tr>
						<td colspan=4>레코드가 없습니다.</td>
					</tr>
				</c:when>


				<c:otherwise>
					<c:forEach var="ss" items="${staylist}">




						<tr>
							<td>${ss.staynum}</td>
							<td><a href="StayRetrieveServlet?staynum=${ss.staynum}">${ss.staytitle}</a></td>
							<td>${ss.staywriteDay}</td>
							<td>${ss.stayreadCnt}</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="4">	
					<div class="form-group" align="center">
					<!-- 검색 -->
					<form action="StayListServlet" class="form-inline" id="ss">
						페이지에서 보여줄 개수 <select name="stayperPage" class="form-inline" id="stayperPage">
							<option value="def">선택하세요</option>
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="8">8</option>
							</select>
							<select name="staysearchName" class="form-inline">
								<option value="staytitle">제목</option>
							</select> <input type="text" name="staysearchValue" class="form-control">
							<input type="submit" value="검색" class="btn btn-primary">
						
					</form>
					</div>
					
				</td>
			</tr>
			
			<c:if test="${staylist.getStaylist().size()!=0}">
				<tr>
					<td colspan="5"><jsp:include page="stay_page.jsp" flush="true" /></td>
				</tr>
			</c:if>


		</table>

<c:if test="${!empty sessionScope.login}">

		<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='StayWriteUIServlet';">글쓰기</button>
		</div>
		</c:if>
	</div>
