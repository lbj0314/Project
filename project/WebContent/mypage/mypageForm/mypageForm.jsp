<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty sessionScope.comLogin }">
<a href="MyPageReservationServlet" class="btn btn-default">예약 확인하기</a>
<a href="MyPageBoxServlet" class="btn btn-default">다녀온 패키지</a> <!-- 여기에 다녀온패키지와 연관해서 작성된 후기 바로가는 버튼링크 달기 -->
<a href="MyPageMemberServlet" class="btn btn-default">내정보 변경하기</a>
<a href="MyPageLeaveServlet" class="btn btn-default">탈퇴하기</a>
</c:if>
<c:if test="${!empty sessionScope.entLogin }">
<!-- <a href="MyPageEnterListServlet  class="btn btn-default">내 등록업소 보기</a> -->
<a href="MyPageMemberServlet" class="btn btn-default">내정보 변경하기</a>
<a href="MyPageLeaveServlet" class="btn btn-default">탈퇴하기</a>
</c:if>
<c:if test="${!empty sessionScope.admLogin}">
<a href="MemberManageServlet" class="btn btn-default">회원 관리하기</a>
<a href="ReviewManageServlet" class="btn btn-default">후기글 관리하기</a>
</c:if>
<c:if test="${empty sessionScope.comLogin and empty sessionScope.entLogin and empty sessionScope.admLogin}">
	세션이 만료 되었습니다.세션이 만료 되었습니다.
	세션이 만료 되었습니다.세션이 만료 되었습니다.
	세션이 만료 되었습니다.세션이 만료 되었습니다.
	세션이 만료 되었습니다.세션이 만료 되었습니다.
	세션이 만료 되었습니다.세션이 만료 되었습니다.
</c:if>