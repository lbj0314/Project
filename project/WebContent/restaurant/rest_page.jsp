<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set value="${restlist}" var="restdto" />
<c:set value="${restdto.getRestcurPage}" var="restcurPage" />
<c:set value="${restdto.getRearchName()}" var="restsearchName" />
<c:set value="${restdto.getRestsearchValue()}" var="restsearchValue" />
<c:set value="${restdto.getRestperPage()}" var="restperPage" />
<c:set value="${restdto.getResttotalCount()}" var="resttotalCount" />
<c:set value="${restdto.getRestperBlock()}" var="restperBlock" />

<fmt:parseNumber value="${resttotalCount/restperPage}"
	integerOnly="true" var="resttotalNum" />
<c:if test="${resttotalCount%restperPage!=0}">
	<c:set var="totalNum" value="${resttotalNum+1}" />
	<fmt:parseNumber value="${resttotalNum}" integerOnly="true"
		var="resttotalNum" />
</c:if>

<fmt:parseNumber
	value="${restcurPage / restperBlock + (1 - (restcurPage / restperBlock % 1)) % 1}"
	integerOnly="true" var="restcurBlock" />

${restcurBlock}

<c:set value="${( restcurBlock - 1 ) * restperBlock + 1}"
	var="reststartPage" />

<c:set value="${reststartPage + restperBlock - 1}" var="restendPage" />

<c:if test="${restendPage > resttotalNum }">

	<c:set value="${resttotalNum}" var="restendPage" />
</c:if>
restcurBlock${restcurBlock} reststartPage${reststartPage }
restendPage${restendPage } restcurPage${restcurPage }
restperPage${restperPage } resttotalNum${resttotalNum }

<c:if test="${restcurPage == 1}">
처음 

</c:if>

<c:if test="${restcurPage != 1}">
	<a
		href='RestListServlet?restcurPage=1&restsearchName=${restsearchName}&restsearchValue=${restsearchValue}'>처음</a>
&nbsp;
</c:if>

<c:if test="${reststartPage == 1}">

&lt;&lt;
</c:if>

<c:if test="${reststartPage != 1}">
	<a
		href='RestListServlet?restcurPage=${reststartPage -1}&restsearchName=${restsearchName }&restsearchValue= ${restsearchValue}'>&lt;&lt;</a>
	 
&nbsp;
</c:if>

<c:if test="${restcurPage == 1}">
&lt;
</c:if>

<c:if test="${restcurPage != 1}">
	<a
		href='RestListServlet?restcurPage=${restcurPage -1}&restsearchName=${restsearchName}&restsearchValue=${restsearchValue}'>&lt;</a>

&nbsp;
</c:if>

<c:forEach begin="${reststartPage}" end="${restendPage-1}" var="r">
	<c:if test="${restcurPage == r}">
${r}
</c:if>
	<c:if test="${restcurPage != r}">
		<a
			href='RestListServlet?restcurPage=${r}&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }'>${r}</a> 
		&nbsp;
		</c:if>
</c:forEach>

<c:if test="${restcurPage == restendPage }">
${restendPage}
</c:if>
<c:if test="${restcurPage != restendPage }">
	<a
		href='RestListServlet?restcurPage=${restendPage }&restsearchName=${restsearchName }&restsearchValue=${restsearchValue}'>${restendPage}</a>

</c:if>

&nbsp;
<c:if test="${restcurPage == resttotalNum }">
&gt;
</c:if>
<c:if test="${restcurPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${restcurPage +1 }&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }'>&gt;</a>
</c:if>

&nbsp;
<c:if test="${restendPage == resttotalNum }">
&gt;&gt;
</c:if>
<c:if test="${restendPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${restendPage +1 }&restsearchName=${restsearchName }&restsearchValue= ${restsearchValue }'>&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${restcurPage == resttotalNum }">
마지막
</c:if>
<c:if test="${restcurPage != resttotalNum }">
	<a
		href='RestListServlet?restcurPage=${resttotalNum}&restsearchName=${restsearchName }&restsearchValue=${restsearchValue }'>마지막</a>
</c:if>
