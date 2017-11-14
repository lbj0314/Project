<%@page import="com.dto.event.EventDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<h1>글자세히 화면</h1>

<form action="/test/loginX/eventUpdate" method="post">
<input type="hidden" name="eventNonum" value="${retrieve.eventNonum }">
<div class="form-group">
<b>글번호:&nbsp;</b>${retrieve.eventNonum }> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b>${retrieve.eventNowriteDay }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b>${retrieve.eventNoreadCnt}<br>
 </div>
 <div class="form-group">
제목<input type="text" name="eventNotitle" value="${retrieve.eventNotitle }" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="eventNocontent" class="form-control">${retrieve.eventNocontent }</textarea>
	<c:if test="${!empty sessionScope.admLogin}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 
</div>
</form>

<a href="/test/eventList" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.admLogin}">
<a href="/test/loginX/eventDelete?nonum=${retrieve.eventNonum }" class="btn btn-primary"> 삭제</a>
</c:if>



