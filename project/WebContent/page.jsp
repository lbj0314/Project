<%@page import="com.dto.notice.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:set value="${list}" var="dto" />
<c:set value="${dto.getCurPage()}" var="curPage" />
<c:set value="${dto.getSearchName()}" var="searchName" />
<c:set value="${dto.getSearchValue()}" var="searchValue" />
<c:set value="${dto.getPerPage()}" var="perPage" />
<c:set value="${dto.getTotalCount()}" var="totalCount" />
<c:set value="${dto.getPerBlock()}" var="perBlock" />


<fmt:parseNumber value="${totalCount/perPage}" integerOnly="true"
	var="totalNum" />
<c:if test="${totalCount%perPage!=0}">
	<c:set var="totalNum" value="${totalNum+1}" />
	<fmt:parseNumber value="${totalNum}" integerOnly="true" var="totalNum" />
</c:if>


<%-- <c:set value="${totalCount/perPage}" var="totalNum" /> --%>

<fmt:parseNumber
	value="${curPage / perBlock + (1 - (curPage / perBlock % 1)) % 1}"
	integerOnly="true" var="curBlock" />

${curBlock}




<c:set value="${( curBlock - 1 ) * perBlock + 1}" var="startPage" />




<c:set value="${startPage + perBlock - 1}" var="endPage" />

<c:if test="${endPage > totalNum }">

	<c:set value="${totalNum}" var="endPage" />
</c:if>
curBlock${curBlock} startPage${startPage } endPage${endPage }
curPage${curPage } perPage${perPage } totalNum${totalNum }


<c:if test="${curPage == 1}">
처음 


</c:if>


<c:if test="${curPage != 1}">
	<a
		href='NoticeListServlet?curPage=1&searchName=${searchName}&searchValue=${searchValue}'>처음</a>
&nbsp;
</c:if>

<c:if test="${startPage == 1}">


&lt;&lt;
</c:if>


<c:if test="${startPage != 1}">
	<a
		href='NoticeListServlet?curPage=${startPage -1}&searchName=${searchName }&searchValue= ${searchValue}'>&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${curPage == 1}">
&lt;
</c:if>


<c:if test="${curPage != 1}">
	<a
		href='NoticeListServlet?curPage=${curPage -1}&searchName=${searchName}&searchValue=${searchValue}'>&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${startPage}" end="${endPage-1}" var="aa">
	<c:if test="${curPage == aa}">
${aa}
</c:if>
	<c:if test="${curPage != aa}">
		<a
			href='NoticeListServlet?curPage=${aa}&searchName=${searchName }&searchValue=${searchValue }'>${aa}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${curPage == endPage }">
${endPage}
</c:if>
<c:if test="${curPage != endPage }">
	<a
		href='NoticeListServlet?curPage=${endPage }&searchName=${searchName }&searchValue=${searchValue}'>${endPage}</a>


</c:if>


&nbsp;
<c:if test="${curPage == totalNum }">
&gt;
</c:if>
<c:if test="${curPage != totalNum }">
	<a
		href='NoticeListServlet?curPage=${curPage +1 }&searchName=${searchName }&searchValue=${searchValue }'>&gt;</a>
</c:if>

&nbsp;
<c:if test="${endPage == totalNum }">
&gt;&gt;
</c:if>
<c:if test="${endPage != totalNum }">
	<a
		href='NoticeListServlet?curPage=${endPage +1 }&searchName=${searchName }&searchValue= ${searchValue }'>&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${curPage == totalNum }">
마지막
</c:if>
<c:if test="${curPage != totalNum }">
	<a
		href='NoticeListServlet?curPage=${totalNum}&searchName=${searchName }&searchValue=${searchValue }'>마지막</a>
</c:if>



