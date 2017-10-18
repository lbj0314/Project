<%@page import="com.dto.stay.StayPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set value="${staylist}" var="dto" />
<c:set value="${dto.getStayCurPage()}" var="stayCurPage" />
<c:set value="${dto.getStaySearchName()}" var="staySearchName" />
<c:set value="${dto.getStaySearchValue()}" var="staySearchValue" />
<c:set value="${dto.getStayPerPage()}" var="stayPerPage" />
<c:set value="${dto.getStayLocation()}" var="stayLocation" />
<c:set value="${dto.getStayType()}" var="stayType" />
<c:set value="${dto.getStayTotalCount()}" var="stayTotalCount" />
<c:set value="${dto.getStayPerBlock()}" var="stayPerBlock" />
<c:set value="${dto.getSortStay()}" var="sortStay" />

<fmt:parseNumber value="${stayTotalCount/stayPerPage}" integerOnly="true"
	var="stayTotalNum" />
<c:if test="${stayTotalCount%stayPerPage!=0}">
	<c:set var="stayTotalNum" value="${stayTotalNum+1}" />
	<fmt:parseNumber value="${stayTotalNum}" integerOnly="true" var="stayTotalNum" />
</c:if>


<%-- <c:set value="${totalCount/perPage}" var="totalNum" /> --%>

<fmt:parseNumber
	value="${stayCurPage / stayPerBlock + (1 - (stayCurPage / stayPerBlock % 1)) % 1}"
	integerOnly="true" var="stayCurBlock" />




<c:set value="${( stayCurBlock - 1 ) * stayPerBlock + 1}" var="stayStartPage" />




<c:set value="${stayStartPage + stayPerBlock - 1}" var="stayEndPage" />

<div id="conta">

<c:if test="${stayEndPage > stayTotalNum }">

	<c:set value="${stayTotalNum}" var="stayEndPage" />
</c:if>

<c:if test="${stayCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${stayCurPage != 1}">
	<a
		href='stayList?stayCurPage=1&staySearchName=${staySearchName}&staySearchValue=${staySearchValue}&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${stayStartPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${stayStartPage != 1}">
	<a
		href='stayList?curPage=${stayStartPage -1}&staySearchName=${staySearchName }&staySearchValue= ${staySearchValue}&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${stayCurPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${stayCurPage != 1}">
	<a
		href='stayList?curPage=${stayCurPage -1}&staySearchName=${staySearchName}&staySearchValue=${staySearchValue}&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${stayStartPage}" end="${stayEndPage-1}" var="aa">
	<c:if test="${stayCurPage == aa}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${aa}</a>
</c:if>
	<c:if test="${stayCurPage != aa}">
		<a
			href='stayList?stayCurPage=${aa}&staySearchName=${staySearchName }&staySearchValue=${staySearchValue }&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">${aa}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${stayCurPage == stayEndPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${stayEndPage}</a>
</c:if>
<c:if test="${stayCurPage != stayEndPage }">
	<a
		href='stayList?stayCurPage=${stayEndPage }&staySearchName=${staySearchName }&staySearchValue=${staySearchValue}&stayLocation=${stayLocation}&stayType=${StayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">${stayEndPage}</a>


</c:if>


&nbsp;
<c:if test="${stayCurPage == stayTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${stayCurPage != stayTotalNum }">
	<a
		href='stayList?stayCurPage=${stayCurPage +1 }&staySearchName=${staySearchName }&staySearchValue=${staySearchValue }&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${stayEndPage == stayTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${stayEndPage != stayTotalNum }">
	<a
		href='stayList?stayCurPage=${stayEndPage +1 }&staySearchName=${staySearchName }&staySearchValue= ${staySearchValue }&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${stayCurPage == stayTotalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${stayCurPage != stayTotalNum }">
	<a
		href='stayList?stayCurPage=${stayTotalNum}&staySearchName=${staySearchName }&staySearchValue=${staySearchValue }&stayLocation=${stayLocation}&stayType=${stayType}&sortStay=${sortStay}' class="btn btn-primary btn-sm active" role="button">마지막</a>
</c:if>

</div>


