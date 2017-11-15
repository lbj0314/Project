<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<h1>공지사항</h1>

<form action="/test/loginX/noticeUpdate" method="post">
<input type="hidden" name="nonum" value="${retrieve.nonum }">

<b>글번호:&nbsp;</b>${retrieve.nonum } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b>${retrieve.nowriteDay }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b>${retrieve.noreadCnt}<br>


제목<input type="text" name="notitle" value="${retrieve.notitle }" class="form-control"><br>


내용<textarea rows="10" cols="10" name="nocontent" class="form-control">${retrieve.nocontent }</textarea>
	
 


<c:if test="${!empty sessionScope.admLogin}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 	<a href="/test/noticeList" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.admLogin}">
<a href="/test/loginX/noticeDelete?nonum=${retrieve.nonum }" class="btn btn-primary"> 삭제</a>
</c:if>
</form>






