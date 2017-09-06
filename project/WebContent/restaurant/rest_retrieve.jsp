<%@page import="com.dto.restaurant.RestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<%
   RestDTO dto = (RestDTO)request.getAttribute("retrieve");
   int restnum = dto.getRestnum();
   String resttitle = dto.getResttitle();
   String restcontent = dto.getRestcontent();
   String restwriteDay = dto.getRestwriteDay();
   int restreadCnt = dto.getRestreadCnt();
%>



<h1>음식점 글 자세히 화면</h1>

<form action="RestUpdateServlet" method="post">
<input type="hidden" name="restnum" value="<%= restnum%>">
<div class="form-group">
<b>글번호 : &nbsp;</b><%= restnum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b><%= restwriteDay %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b><%= restreadCnt %><br>
 </div>
 <div class="form-group">
제목<input type="text" name="resttitle" value="<%= resttitle%>" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="restcontent" class="form-control"><%= restcontent%></textarea>
	<c:if test="${!empty sessionScope.login}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 
</div>
</form>

<a href="NoticeListServlet" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.login}">
<a href="RestDeleteServlet?restnum=<%=restnum%>" class="btn btn-primary"> 삭제</a>
</c:if>



