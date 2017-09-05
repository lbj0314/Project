<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="NoticeWriteServlet">
	<input type="hidden" name="" value="${sessionScope.login.entname}">
	<input type="hidden" name="" value="${sessionScope.login.entid}">
	제목:<input type="text" name="title" size="33"><br>
	작성자:${sessionScope.login.restname}<br>
	내용:<br>
	<textarea rows="10" cols="40" name="content"></textarea>
	<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="작성">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="다시 작성"><br>
</form>
