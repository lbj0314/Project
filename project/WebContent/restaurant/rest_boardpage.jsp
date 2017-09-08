<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set value="${restlist}" var="dto" />
<c:set value="${dto.getRestCurPage()}" var="restCurPage" />
<c:set value="${dto.getRestSearchName()}" var="restSearchName" />
<c:set value="${dto.getRestSearchValue()}" var="restSearchValue" />
<c:set value="${dto.getRestPerPage()}" var="restPerPage" />
<c:set value="${dto.getRestLocation()}" var="resttLocation" />
<c:set value="${dto.getRestType()}" var="restType" />
<c:set value="${dto.getRestTotalCount()}" var="restTotalCount" />
<c:set value="${dto.getRestPerBlock()}" var="restPerBlock" />
<c:set value="${dto.getSortRest()}" var="sortRest" />

<fmt:parseNumber value="${restTotalCount/restPerPage}" integerOnly="true"
	var="restTotalNum" />
<c:if test="${restTotalCount%restPerPage!=0}">
	<c:set var="restTotalNum" value="${restTotalNum+1}" />
	<fmt:parseNumber value="${restTotalNum}" integerOnly="true" var="restTotalNum" />
</c:if>


<%-- <c:set value="${totalCount/perPage}" var="totalNum" /> --%>

<fmt:parseNumber
	value="${restCurPage / restPerBlock + (1 - (restCurPage / restPerBlock % 1)) % 1}"
	integerOnly="true" var="restCurBlock" />




<c:set value="${( restCurBlock - 1 ) * restPerBlock + 1}" var="restStartPage" />




<c:set value="${restStartPage + restPerBlock - 1}" var="restEndPage" />
<c:if test="${restEndPage < 0}">
<c:set value="1" var="restEndPage"/>

</c:if>
<div id="conta">

<c:if test="${restEndPage > restTotalNum }">

	<c:set value="${restTotalNum}" var="restEndPage" />
</c:if>

<c:if test="${restCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${restCurPage != 1}">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${restStartPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${restStartPage != 1}">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${restCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${restCurPage != 1}">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${restStartPage}" end="${restEndPage-1}" var="rr">
	<c:if test="${restCurPage == rr}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${rr}</a>
</c:if>
	<c:if test="${restCurPage != rr}">
		<a
			href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">${rr}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${restCurPage == restCurPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${restEndPage}</a>
</c:if>
<c:if test="${restCurPage != restEndPage }">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">${endPage}</a>


</c:if>


&nbsp;
<c:if test="${restCurPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${restCurPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${restEndPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${restEndPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${restCurPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${restCurPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">
마지막</a>
</c:if>

</div>


