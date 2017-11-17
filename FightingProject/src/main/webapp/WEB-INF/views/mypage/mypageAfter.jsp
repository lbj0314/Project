<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypageAfter</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="/project/css/style.css">


</head>
<body>
	<jsp:include page="../login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="../include/top.jsp" flush="true" />
	<jsp:include page="mypageForm/mypageForm.jsp" flush="true" />
	<c:if test="${!empty requestScope.memberAfter }">
	<jsp:include page="mypageManage/mypageAfterMember.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.reviewAfter }">
	<jsp:include page="mypageManage/mypageAfterMember.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty requestScope.afterDelete }">
	<jsp:include page="mypageManage/afterDeleteMember.jsp" flush="true" />
	</c:if>
	

	<jsp:include page="../include/copyright.jsp" flush="true" />
</body>
</html>