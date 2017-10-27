<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeView</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/project/css/style.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
<body>
	<div id="conright">
		<jsp:include page="/WEB-INF/views/login/loginForm.jsp" flush="true" /><br>
	</div>
	<jsp:include page="/WEB-INF/views/include/top.jsp" flush="true" /><br>
	<jsp:include page="/WEB-INF/views/fes/fesList.jsp" flush="true" /><br>
	<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true" /><br>
</body>
</html>