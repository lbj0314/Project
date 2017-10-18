<%@page import="com.dto.restaurant.RestPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set value="${restlist}" var="dto" />
<c:set value="${dto.getCurPage()}" var="curPage" />
<c:set value="${dto.getSearchName()}" var="searchName" />
<c:set value="${dto.getSearchValue()}" var="searchValue" />
<c:set value="${dto.getPerPage()}" var="perPage" />
<c:set value="${dto.getRestLocation()}" var="restLocation" />
<c:set value="${dto.getRestType()}" var="restType" />
<c:set value="${dto.getTotalCount()}" var="totalCount" />
<c:set value="${dto.getPerBlock()}" var="perBlock" />
<c:set value="${dto.getSortRest()}" var="sortRest" />

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




<c:set value="${( curBlock - 1 ) * perBlock + 1}" var="startPage" />




<c:set value="${startPage + perBlock - 1}" var="endPage" />

<div id="conta">

<c:if test="${endPage > totalNum }">

	<c:set value="${totalNum}" var="endPage" />
</c:if>

<c:if test="${curPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">처음 </a>


</c:if>


<c:if test="${curPage != 1}">
	<a
		href='restList?curPage=1&searchName=${searchName}&searchValue=${searchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">처음</a>
&nbsp;
</c:if>

<c:if test="${startPage == 1}">


<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;&lt; </a>
</c:if>


<c:if test="${startPage != 1}">
	<a
		href='restList?curPage=${startPage -1}&searchName=${searchName }&searchValue= ${searchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&lt;&lt;</a>
	 
&nbsp;
</c:if>


<c:if test="${curPage == 1}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&lt;</a>
</c:if>


<c:if test="${curPage != 1}">
	<a
		href='restList?curPage=${curPage -1}&searchName=${searchName}&searchValue=${searchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&lt;</a>

&nbsp;
</c:if>






<c:forEach begin="${startPage}" end="${endPage-1}" var="aa">
	<c:if test="${curPage == aa}">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${aa}</a>
</c:if>
	<c:if test="${curPage != aa}">
		<a
			href='restList?curPage=${aa}&searchName=${searchName }&searchValue=${searchValue }&restLocation=${restLocation}&restType=${restType}&sortAtt=${sortRest}' class="btn btn-primary btn-sm active" role="button">${aa}</a> 
		&nbsp;
		</c:if>
</c:forEach>



<c:if test="${curPage == endPage }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">${endPage}</a>
</c:if>
<c:if test="${curPage != endPage }">
	<a
		href='restList?curPage=${endPage }&searchName=${searchName }&searchValue=${searchValue}&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">${endPage}</a>


</c:if>


&nbsp;
<c:if test="${curPage == totalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;</a>
</c:if>
<c:if test="${curPage != totalNum }">
	<a
		href='restList?curPage=${curPage +1 }&searchName=${searchName }&searchValue=${searchValue }&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&gt;</a>
</c:if>

&nbsp;
<c:if test="${endPage == totalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">&gt;&gt;</a>
</c:if>
<c:if test="${endPage != totalNum }">
	<a
		href='restList?curPage=${endPage +1 }&searchName=${searchName }&searchValue= ${searchValue }&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">&gt;&gt;</a>
</c:if>
&nbsp;
<c:if test="${curPage == totalNum }">
<a href="#" class="btn btn-primary btn-sm disabled" role="button">마지막</a>
</c:if>
<c:if test="${curPage != totalNum }">
	<a
		href='restList?curPage=${totalNum}&searchName=${searchName }&searchValue=${searchValue }&restLocation=${restLocation}&restType=${restType}&sortRest=${sortRest}' class="btn btn-primary btn-sm active" role="button">마지막</a>
</c:if>

</div>


