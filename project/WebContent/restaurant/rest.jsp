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
<h1>음식점 목록</h1>
<table border=1>
	<tr>
		<td><b>번호</b></td>
		<td><b>제목</b></td>
		<td><b>작성자</b></td>
		<td><b>작성일</b></td>
		<td><b>조회수</b></td>
	</tr>
	<c:set value="${restlist}" var="restdto" scope="request"/>
		<c:set value="${restdto.restlist}" var="restlist2" scope="request"/>
		${restlist.getRestlist().size==0}
	<c:if test="${empty restdto}">
		<tr>
			<td colspan=5 align=center><b>레코드가 없습니다.</b></td>
		</tr>
	</c:if>
	${restlist.getRestlist().size()!=0}
	<c:if test="${!empty restlist}">
		<c:forEach var="r" items="${restdto}">
			<tr>
				<td>${r.num}</td>
				<td><a href="MyBoardRetrieveServlet?num=${r.restnum}">${r.resttitle}</a></td>
				<td>${r.restname}</td>
				<td>${r.restwriteday}</td>
				<td>${r.restreadCnt}</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
	<td colspan=5><jsp:include page="../rest_page.jsp" flush="true" /></td>
	</tr>
</table>
<c:if test="${!empty sessionScope.login.entname}">
		<a href="NoticeWriteUIServlet">글쓰기</a>
	</c:if>