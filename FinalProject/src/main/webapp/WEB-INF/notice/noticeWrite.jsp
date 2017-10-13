<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="NoticeWriteServlet">
	<input type="hidden" name="author" value="${sessionScope.login.username}">
	<input type="hidden" name="userid" value="${sessionScope.login.userid}">
	제목:<input type="text" name="title"><br>
	작성자:${sessionScope.login.username}<br>
	내용:
	<textarea rows="10" cols="10" name="content"></textarea>
	<br>

	<input type="submit" value="등록">&nbsp;&nbsp;<input type="reset" value="다시쓰기"><br>
	

</form>
