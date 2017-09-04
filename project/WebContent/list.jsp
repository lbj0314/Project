<%@page import="com.dto.notice.PageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


<!-- jQeury문 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#perPage").on("change", function(event) {

			//ajax코드
			$.ajax({
				type : "get",
				url : "NoticePerPageServlet",
				data : {
					perPage : $("#perPage").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);

					///$("#result").text(responseData);

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});

	});
</script>






</head>
<body>
	<h1 align=center>
		&nbsp;&nbsp;&nbsp;공지사항<small>&nbsp;&nbsp;&nbsp;관리자만 CRUD가능</small>
	</h1>

	<div class="container">
		<table class="table table-board">



			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:set value="${list}" var="dto" scope="request" />

			<c:set value="${dto.getList()}" var="list1" scope="request" />
			<c:choose>


				<c:when test="${list.getList().size()==0}">


					<tr>
						<td colspan=4>레코드가 없습니다.</td>
					</tr>
				</c:when>


				<c:otherwise>
					<c:forEach var="xx" items="${list1}">




						<tr>
							<td>${xx.nonum}</td>
							<td><a href="NoticeRetrieveServlet?nonum=${xx.nonum}">${xx.notitle}</a></td>
							<td>${xx.nowriteDay}</td>
							<td>${xx.noreadCnt}</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="4">
					<!-- ajax 처리하여 페이지 보여줄 갯수 처리를 위하여 남겨놓음 --> <!-- <form action="NoticePerPageServlet" class="form-inline"> -->
					페이지에서 보여줄 갯수 <select name="perPage" class="form-inline"
					id="perPage">
						<option value="3">3</option>
						<option value="5">5</option>
						<option value="10">10</option>
				</select> <!--  <input type="submit" value="검색" class="btn btn-primary"> -->
					<!-- </form> -->

					<form action="NoticeListServlet" class="form-inline">
						<div class="form-group" align=center>
							<!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
							<select name="searchName" class="form-control">
								<option value="title">제목</option>
							</select> <input type="text" name="searchValue" class="form-control">
							<input type="submit" value="검색" class="btn btn-primary">
						</div>
					</form>
				</td>
			</tr>

			<c:if test="${list.getList().size()!=0}">
				<tr>
					<td colspan="5"><jsp:include page="page.jsp" flush="true" /></td>
				</tr>
			</c:if>


		</table>


		<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='NoticeWriteUIServlet';">글쓰기</button>
		</div>
	</div>


</body>
</html>







