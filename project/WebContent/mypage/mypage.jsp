<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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


<link rel="stylesheet" type="text/css" href="/project/css/style.css">


</head>
<body>
	<jsp:include page="/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/include/top.jsp" flush="true" />
	<jsp:include page="mypageForm/mypageForm.jsp" flush="true" />
	<c:if test="${!empty requestScope.reservation}">
	<jsp:include page="mypageForm/mypageReservation.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.leave}">
	<jsp:include page="mypageForm/mypageLeave.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.member}">
	<jsp:include page="mypageForm/mypageMember.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.box}">
	<jsp:include page="mypageForm/mypageBox.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.membermanage }">
	<jsp:include page="mypageForm/mypageMemberManage.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.reviewmanage }">
	<jsp:include page="mypageForm/mypageReviewManage.jsp" flush="true" />
	</c:if>
	

	<jsp:include page="/include/copyright.jsp" flush="true" />
</body>
</html>