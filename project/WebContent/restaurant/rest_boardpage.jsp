<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


 

<c:set value="${restList}" var="restdto" />
<c:set value="${restdto.getRestCurPage()}" var="restCurPage" />
<c:set value="${restdto.getRestSearchName}" var="restSearchName" />
<c:set value="${restdto.getRestSearchValue()}" var="restSearchValue" />
<c:set value="${restdto.getRestPerPage()}" var="restPerPage" />
<c:set value="${restdto.getRestTotalCount()}" var="restTotalCount" />
<c:set value="${restdto.getRestPerBlock()}" var="restPerBlock" />


<fmt:parseNumber value="${restTotalCount/restPerPage}" integerOnly="true"
	var="restTotalNum" />
<c:if test="${restTotalCount%restPerPage!=0}">
	<c:set var="restTotalNum" value="${resttotalNum+1}" />
	<fmt:parseNumber value="${resttotalNum}" integerOnly="true" var="restTotalNum" />
</c:if>

<fmt:parseNumber
	value="${restCurPage / restPerBlock + (1 - (restCurPage / restPerBlock % 1)) % 1}"
	integerOnly="true" var="restCurBlock" />




<c:set value="${( restCurBlock - 1 ) * restPerBlock + 1}" var="restStartPage" />




<c:set value="${restStartPage + restPerBlock - 1}" var="restEndPage" />

<div id="conta">

<c:if test="${restEndPage > restTotalNum }">

	<c:set value="${restTotalNum}" var="restEndPage" />
</c:if>

<c:if test="${restCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${restcurPage != 1}">
	<a
		href='RestBoardListServlet?restCurPage=1&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${restStartPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${restStartPage != 1}">
	<a
		href='RestBoardListServlet?restCurPage=${restStartPage -1}&restSearchName=${restSearchName }&restSearchValue= ${restSearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${restCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${restCurPage != 1}">
	<a
		href='RestBoardListServlet?restcurPage=${restCurPage -1}&restSearchName=${restSearchName}&restSearchValue=${restSearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${restStartPage}" end="${restEndPage-1}" var="rr">
	<c:if test="${restCurPage == rr}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${rr}</a>
</c:if>
	<c:if test="${restCurPage != rr}">
		<a
			href='RestBoardListServlet?restCurPage=${rr}&restSearchName=${restSearchName }&restSearchValue=${restSearchValue }' class="btn btn-primary btn-sm active" role="button">${rr}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${restCurPage == restEndPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${restEndPage}</a>
</c:if>
<c:if test="${restCurPage != restEndPage }">
	<a
		href='RestBoardListServlet?restCurPage=${restEndPage }&restSearchName=${restSearchName }&restSearchValue=${restSearchValue}' class="btn btn-primary btn-sm active" role="button">${restEndPage}</a>


</c:if>


&nbsp;
<c:if test="${restCurPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${restCurPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=${restCurPage +1 }&restSearchName=${restSearchName }&restSearchValue=${restSearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${restEndPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${restEndPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=${restEndPage +1 }&restSearchName=${restSearchName }&restSearchValue= ${restSearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${restCurPage == restTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${restCurPage != restTotalNum }">
	<a
		href='RestBoardListServlet?restCurPage=${restTotalNum}&restSearchName=${restSearchName }&restSearchValue=${restSearchValue }' class="btn btn-primary btn-sm active" role="button">마지막</a>
</c:if>

</div>


