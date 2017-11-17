<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 글쓰기</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/test/css/style.css">


</head>
<body>
<div id="conright">
<jsp:include page="/WEB-INF/views/login/loginForm.jsp" flush="true"/><br>

</div>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="true"/><br>
<jsp:include page="/WEB-INF/views/event/event/eventWrite.jsp" flush="true"/><br>
<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true"/><br>


</body>
</html>