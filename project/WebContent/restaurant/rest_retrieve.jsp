<%@page import="com.dto.restaurant.RestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<%
   RestDTO restdto = (RestDTO)request.getAttribute("restretrieve");
   int restnum = restdto.getRestnum();
   String resttitle = restdto.getResttitle();
   String restcontent = restdto.getRestcontent();
   String restwriteDay = restdto.getRestwriteDay();
   int restreadCnt = restdto.getRestreadCnt();
%>
<h1>글 자세히 화면</h1>
<form action="RestUpdateServlet" method="post">
<input type="hidden" name="restnum" value="<%= restnum%>">
<div class="form-group">
<b>글번호:&nbsp;</b><%= restnum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>작성일:&nbsp;</b><%= restwriteDay %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>조회수:&nbsp;</b><%= restreadCnt %><br>
 </div>
 <div class="form-group">
제목<input type="text" name="resttitle" value="<%= resttitle%>" class="form-control"><br>
</div>
<div class="form-group">
내용<textarea rows="10" cols="10" name="restcontent" class="form-control"><%= restcontent%></textarea>
 <input type="submit" value="수정">
 
</div>
</form>
<a href="RestListServlet">목록</a>
<a href="RestDeleteServlet?restnum=<%=restnum%>">삭제</a>

</body>
</html>




