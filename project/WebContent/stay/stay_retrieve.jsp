<%-- <%@page import="com.dto.stay.StayDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
   StayDTO dto = (StayDTO)request.getAttribute("retrieve");
   int stayNum = dto.getStayNum();
   String stayTitle = dto.getStayTitle();
   String staycontent = dto.getstayContent();
   String staywriteDay = dto.getstayWriteDay();
   int stayreadCnt = dto.getstayReadCnt();
%>

 

<h1>숙박업소 글 자세히 화면</h1>

<form action="stayUpdateServlet" method="post">
<input type="hidden" name="staynum" value="<%= staynum%>">
<div class="form-group">
<b>글번호 : &nbsp;</b><%= staynum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b><%= staywriteDay %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b><%= stayreadCnt %><br>
 </div>
 <div class="form-group">
제목<input type="text" name="staytitle" value="<%= stayTitle%>" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="staycontent" class="form-control"><%= stayContent%></textarea>
	<c:if test="${!empty sessionScope.login}">
 	<input type="submit" value="수정" class="btn btn-primary">
 	</c:if>
 
</div>
</form>

<a href="StayListServlet" class="btn btn-primary">목록</a>
<c:if test="${!empty sessionScope.login}">
<a href="StayDeleteServlet?stayNum=<%=stayNum%>" class="btn btn-primary"> 삭제</a>
</c:if>



 --%>