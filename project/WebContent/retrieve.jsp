<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<body>
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
 <input type="submit" value="수정">
 
</div>
</form>
<a href="NoticeListServlet">목록</a>
<a href="NoticeDeleteServlet?nonum=<%=nonum%>">삭제</a>

</body>
</html>




