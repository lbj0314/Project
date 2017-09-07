<%@page import="com.dto.restaurant.RestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   RestDTO dto = (RestDTO)request.getAttribute("retrieve");
   int restNum = dto.getRestNum();
   String restTitle = dto.getRestTitle();
   String restContent = dto.getRestContent();
   String restWriteDay = dto.getRestWriteDay();
   int restReadCnt = dto.getRestReadCnt();
%>
<h1>음식점 글 자세히 화면</h1>
<form action="RestUpdateServlet" method="post">
<input type="hidden" name="restNum" value="<%= restNum%>">
<div class="form-group">
<b>글번호 : &nbsp;</b><%= restNum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b><%= restWriteDay %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b><%= restReadCnt %><br>
 </div>
 <div class="form-group">
제목<input type="text" name="restTitle" value="<%= restTitle%>" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="restContent" class="form-control"><%= restContent%></textarea>
	<c:if test="${!empty sessionScope.login}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 
</div>
</form>

<a href="RestBoardListServlet" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.login}">
<a href="RestDeleteServlet?restnum=<%=restNum%>" class="btn btn-primary"> 삭제</a>
</c:if>



