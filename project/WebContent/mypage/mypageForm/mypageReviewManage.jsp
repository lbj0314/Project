<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form action="ReviewManageRetrieveServlet" method="get">
후기글 번호로 검색하세요 <input type="text" name="reviewnum"><input type="submit" value="검색" class="btn btn-default">
<a href="MemberManageServlet" class="btn btn-default">회원 관리로</a>
</form>