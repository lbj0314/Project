<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty update}">
	<script>
		alert('${update}');
	</script>

</c:if>
<c:if test="${!empty insert}">
	<script>
		alert('${insert}');
	</script>

</c:if>
<c:if test="${!empty delete}">
		<script>
			alert('${delete}');
		</script>

	</c:if>
<h1>게시판 목록</h1>
<table border=1>
	
	<!--  <tr>
	
	<td colspan=5 align=center>
	<form action="MyBoardListServlet">
	<select name="searchName">
	<option value="title">제목</option>
	<option value="author">작성자</option>
	</select>&nbsp;<input type="text" name="searchValue">
	<input type="submit" value="검색">
	</form>
	<form action="MyBoardPerPageServlet">

					보여줄갯수 <select name="purPage">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
					</select> <input type="submit" value="확인">
				</form>
	</td>
	
	</tr>-->
	
	<tr>
		<td><b>번호</b></td>
		<td><b>제목</b></td>
		<td><b>작성자</b></td>
		<td><b>작성일</b></td>
		<td><b>조회수</b></td>
	</tr>
	<c:set value="${list}" var="dto" scope="request"/>

		<%-- <c:set value="${dto.list}" var="list1" scope="request"/> --%>
		<%-- ${list.getList().size==0} --%>
	<c:if test="${empty dto}">
		<tr>
			<td colspan=5 align=center><b>레코드가 없습니다.</b></td>
		</tr>
	</c:if>
	<%-- ${list.getList().size()!=0} --%>
	<c:if test="${!empty list}">
		<c:forEach var="xxx" items="${dto}">
			<tr>
				<td>${xxx.num}</td>
				<td><a href="MyBoardRetrieveServlet?num=${xxx.num}">${xxx.title}</a></td>
				<td>${xxx.author}</td>
				<td>${xxx.writeday}</td>
				<td>${xxx.readCnt}</td>
			</tr>
		</c:forEach>
	</c:if>
	<%-- <tr>
	<td colspan=5><jsp:include page="page.jsp" flush="true" /></td>
	</tr> --%>
</table>
<a href="NoticeWriteUIServlet">글쓰기</a>
