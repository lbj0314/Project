<%@page import="com.dto.stay.StayPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 


<c:set value="${staylist}" var="staydto" />
<c:set value="${staydto.getStaycurPage()}" var="staycurPage" />
<c:set value="${staydto.getStaysearchName}" var="staysearchName" />
<c:set value="${staydto.getStaysearchValue()}" var="staysearchValue" />
<c:set value="${staydto.getStayperPage()}" var="stayperPage" />
<c:set value="${staydto.getStaytotalCount()}" var="staytotalCount" />
<c:set value="${staydto.getStayperBlock()}" var="stayperBlock" />


<fmt:parseNumber value="${staytotalCount/stayperPage}" integerOnly="true"
	var="staytotalNum" />
<c:if test="${staytotalCount%stayperPage!=0}">
	<c:set var="staytotalNum" value="${staytotalNum+1}" />
	<fmt:parseNumber value="${staytotalNum}" integerOnly="true" var="staytotalNum" />
</c:if>

<fmt:parseNumber
	value="${staycurPage / stayperBlock + (1 - (staycurPage / stayperBlock % 1)) % 1}"
	integerOnly="true" var="staycurBlock" />




<c:set value="${( staycurBlock - 1 ) * stayperBlock + 1}" var="staystartPage" />




<c:set value="${staystartPage + stayperBlock - 1}" var="stayendPage" />

<div id="conta">

<c:if test="${stayendPage > staytotalNum }">

	<c:set value="${staytotalNum}" var="stayendPage" />
</c:if>

<c:if test="${staycurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${staycurPage != 1}">
	<a
		href='StayListServlet?staycurPage=1&staysearchName=${staysearchName}&staysearchValue=${staysearchValue}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${staystartPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${staystartPage != 1}">
	<a
		href='StayListServlet?staycurPage=${staystartPage -1}&staysearchName=${staysearchName }&staysearchValue= ${staysearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${staycurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${staycurPage != 1}">
	<a
		href='StayListServlet?staycurPage=${staycurPage -1}&staysearchName=${staysearchName}&staysearchValue=${staysearchValue}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${staystartPage}" end="${stayendPage-1}" var="ss">
	<c:if test="${staycurPage == ss}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${ss}</a>
</c:if>
	<c:if test="${staycurPage != ss}">
		<a
			href='StayListServlet?staycurPage=${ss}&staysearchName=${staysearchName }&staysearchValue=${staysearchValue }' class="btn btn-primary btn-sm active" role="button">${ss}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${staycurPage == stayendPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${stayendPage}</a>
</c:if>
<c:if test="${staycurPage != stayendPage }">
	<a
		href='StayListServlet?staycurPage=${stayendPage }&staysearchName=${staysearchName }&staysearchValue=${staysearchValue}' class="btn btn-primary btn-sm active" role="button">${stayendPage}</a>


</c:if>


&nbsp;
<c:if test="${staycurPage == staytotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${staycurPage != staytotalNum }">
	<a
		href='StayListServlet?staycurPage=${staycurPage +1 }&staysearchName=${staysearchName }&staysearchValue=${staysearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${stayendPage == staytotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${stayendPage != staytotalNum }">
	<a
		href='StayListServlet?staycurPage=${stayendPage +1 }&staysearchName=${staysearchName }&staysearchValue= ${staysearchValue }' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${staycurPage == staytotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${staycurPage != staytotalNum }">
	<a
		href='StayListServlet?staycurPage=${staytotalNum}&staysearchName=${staysearchName }&staysearchValue=${staysearchValue }' class="btn btn-primary btn-sm active" role="button">마지막</a>
</c:if>

</div>


