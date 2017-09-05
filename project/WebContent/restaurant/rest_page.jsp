<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set value="${restlist}" var="restdto" />
<c:set value="${restdto.getRestcurPage()}" var="restcurPage" />
<c:set value="${restdto.getRestsearchName}" var="restsearchName" />
<c:set value="${restdto.getRestsearchValue()}" var="restsearchValue" />
<c:set value="${restdto.getRestperPage()}" var="restperPage" />
<c:set value="${restdto.getResttotalCount()}" var="resttotalCount" />
<c:set value="${restdto.getRestperBlock()}" var="restperBlock" />


<fmt:parseNumber value="${resttotalCount/restperPage}" integerOnly="true"
	var="resttotalNum" />
<c:if test="${resttotalCount%restperPage!=0}">
	<c:set var="resttotalNum" value="${resttotalNum+1}" />
	<fmt:parseNumber value="${resttotalNum}" integerOnly="true" var="resttotalNum" />
</c:if>


<%-- <c:set value="${totalCount/perPage}" var="totalNum" /> --%>

<fmt:parseNumber
	value="${restcurPage / restperBlock + (1 - (restcurPage / restperBlock % 1)) % 1}"
	integerOnly="true" var="restcurBlock" />




<c:set value="${( restcurBlock - 1 ) * restperBlock + 1}" var="reststartPage" />




<c:set value="${reststartPage + restperBlock - 1}" var="restendPage" />

<div id="conta">

<c:if test="${restendPage > resttotalNum }">

	<c:set value="${resttotalNum}" var="restendPage" />
</c:if>

<c:if test="${restcurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${restcurPage != 1}">
	<a
		href='RestListServlet?restcurPage=1&restsearchName=${restsearchName}&restsearchValue=${restsearchValue}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${reststartPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${reststartPage != 1}">
	<a
		href='RestListServlet?restcurPage=${reststartPage -1}&restsearchName=${restsearchName }&restsearchValue= ${restsearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${restcurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${restcurPage != 1}">
	<a
		href='RestListServlet?restcurPage=${restcurPage -1}&restsearchName=${restsearchName}&restsearchValue=${restsearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${reststartPage}" end="${restendPage-1}" var="rr">
	<c:if test="${restcurPage == rr}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${rr}</a>
</c:if>
	<c:if test="${restcurPage != rr}">
		<a
			href='RestListServlet?restcurPage=${rr}&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }' class="btn btn-primary btn-sm active" role="button">${rr}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${restcurPage == restendPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${restendPage}</a>
</c:if>
<c:if test="${restcurPage != restendPage }">
	<a
		href='RestListServlet?restcurPage=${restendPage }&restsearchName=${restsearchName }&restsearchValue=${restsearchValue}' class="btn btn-primary btn-sm active" role="button">${restendPage}</a>


</c:if>


&nbsp;
<c:if test="${restcurPage == resttotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${restcurPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${restcurPage +1 }&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${restendPage == resttotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${restendPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${restendPage +1 }&restsearchName=${restsearchName }&restsearchValue= ${restsearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${restcurPage == resttotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${restcurPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${resttotalNum}&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }' class="btn btn-primary btn-sm active" role="button">마지막</a>
</c:if>

</div>


