<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty requestScope.comDelete }">
일반 회원이신${requestScope.comDelete }님을 탈퇴시켰습니다.
</c:if>
<c:if test="${!empty requestScope.entDelete }">
기업 회원이신${requestScope.entDelete }님을 탈퇴시켰습니다.
</c:if>