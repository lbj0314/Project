<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>패키지 주문</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<c:if test="${!empty orderForm}">
		<jsp:include page="orderForm/orderForm.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty tourOrderForm}">
		<jsp:include page="../tour/tourList.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty orderDone}">
		<jsp:include page="orderForm/orderDone.jsp" flush="true"/>
	</c:if>
	<c:if test="${!empty restOrderForm}">
		<jsp:include page="../restaurant/restList.jsp" flush="true" />
	</c:if>
	<c:if test="${!empty stayOrderForm}">
		<jsp:include page="../stay/stay_list.jsp" flush="true" />
	</c:if>
	<jsp:include page="../include/copyright.jsp" flush="true" />


</body>
</html>