<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 리스트</title>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="/test/css/style.css">



</head>
<body>
<c:if test="${!empty requestScope.success}">
	<script>
		alert('${success}');
	</script>
</c:if>

<jsp:include page="/WEB-INF/views/login/loginForm.jsp" flush="true" /><br>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/mypage/mypageReview/reviewlist.jsp" flush="true"/>



<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true"/>
</body>
</html>








