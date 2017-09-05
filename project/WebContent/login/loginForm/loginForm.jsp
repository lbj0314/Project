<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="conright" class="form-group">

	<c:if test="${!empty sessionScope.admlogin}">
     	<font size="6">안녕하세요 관리자님!!!!</font>
     	
	<a href="/project/LogoutFormServlet" class="btn btn-default">로그아웃</a>&nbsp;
	</c:if>
	<c:if test="${empty sessionScope.admlogin}">
	<form action="LoginServlet" method="get" class="form-inline">
		<select name="wholog" class="form-control">
			<option value="com">일반회원</option>
			<option value="ent">기업회원</option>
			<option value="adm">관리자</option>
		</select> 아이디<input type="text" name="userid" class="form-control"
			placeholder="아이디를 입력하세요."> 비밀번호<input type="password"
			name="passwd" class="form-control" placeholder="비밀번호를 입력하세요.">
		<input type="submit" value="로그인" class="btn btn-default">
	</form>
	</c:if>
</div>




