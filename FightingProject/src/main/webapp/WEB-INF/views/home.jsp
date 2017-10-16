<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${requestScope.sessionclose==true }">
	<script>
		alert("로그아웃 되었습니다.");
	</script>
</c:if>

<c:if test="${!empty requestScope.loginfail }">
	<script>
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	</script>
</c:if>

<c:if test="${!empty sessionScope.admLogin and sessionScope.alert==true}">
	<script>
		alert("관리자로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<c:if test="${!empty sessionScope.comLogin and sessionScope.alert==true}">
	<script>
		alert("일반 회원으로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<c:if test="${!empty sessionScope.entLogin and sessionScope.alert==true}">
	<script>
		alert("기업 회원으로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="/project/css/style.css">

</head>
<body>
	<jsp:include page="/views/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/views/include/top.jsp" flush="true" /><br>
	<jsp:include page="/views/include/main.jsp" flush="true" /><br>
	<jsp:include page="/views/include/bottom.jsp" flush="true" /><br>
	<jsp:include page="/views/include/copyright.jsp" flush="true" />
	
	
	
	
	
</body>
</html>