<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
   NoticeDTO dto = (NoticeDTO)request.getAttribute("retrieve");
   int nonum = dto.getNonum();
   String notitle = dto.getNotitle();
   String nocontent = dto.getNocontent();
   String nowriteDay = dto.getNowriteDay();
   int noreadCnt = dto.getNoreadCnt();
%>



<h1>글자세히 화면</h1>

<form action="NoticeUpdateServlet" method="post">
<input type="hidden" name="num" value="<%= nonum%>">
<div class="form-group">
<b>글번호:&nbsp;</b><%= nonum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b><%= nowriteDay %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b><%= noreadCnt %><br>
 </div>
 <div class="form-group">
제목<input type="text" name="title" value="<%= notitle%>" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="content" class="form-control"><%= nocontent%></textarea>
	<c:if test="${!empty sessionScope.admlogin}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 
</div>
</form>

<a href="NoticeListServlet" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.admlogin}">
<a href="NoticeDeleteServlet?nonum=<%=nonum%>" class="btn btn-primary"> 삭제</a>
</c:if>



