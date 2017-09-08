<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form action="MemberManageRetrieveServlet" method="get">
	회원 아이디로 검색하세요<select name="category"><option value="com">일반 회원</option>
		<option value="ent">기업 회원</option></select> 
		<input type="text" name="userid">
		<input type="submit" value="검색" class="btn btn-default"> 
		<a href="ReviewManageServlet" class="btn btn-default">후기글 관리로</a>
</form>