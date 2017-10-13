<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<br><br>
<c:if test="${!empty sessionScope.comLogin }">
<form action="MyPageLeaveMemberServlet" method="get">
아이디 ${sessionScope.comLogin.comid }
비밀번호 ${sessionScope.comLogin.compasswd }
정말로 삭제 하시겠습니까?
<input type="submit" value="탈퇴하기" class="btn btn-default"><a href="MyPageFormServlet" class="btn btn-default">돌아가기</a>
</form>
</c:if>
<c:if test="${!empty sessionScope.entLogin }">
<form action="MyPageLeaveMemberServlet" method="get">
아이디 ${sessionScope.entLogin.entid }
비밀번호 ${sessionScope.entLogin.entpasswd }
정말로 삭제 하시겠습니까?
<input type="submit" value="탈퇴하기" class="btn btn-default"><a href="MyPageFormServlet" class="btn btn-default">돌아가기</a>
</form>
</c:if>