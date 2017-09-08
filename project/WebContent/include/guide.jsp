<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<jsp:include page="/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/include/top.jsp" flush="true" /><br>


	<br>
	<br>
	<br>
	<br>
	
	저희 사이트에 오신것을 환영합니다!<br>
	<br>
	<br>
	<br>
	<a href="">숙박 보기</a><br>
	<a href="/project/RestBoardListServlet">음식점 보기</a><br>
	<a href="/project/TourListServlet">관광명소 보기</a><br>
	<!-- error.jsp가 뜨는데 경로가 잘못된건지 뭔지 모르겠다 -->
	
	마음에 드는 숙박, 음식점, 관광명소를 선택하신 후<br>
	자유롭게 패키지를 설정하실 수 있습니다<br>
	<br>
	<a href="">패키지 설정하러 가기!</a>
	<br>
	<br>
	<br>
	<br>
	
	업체를 운영중이신 경우 <br>
	<a href="">기업 회원가입 바로가기</a><br>
	<a href="">업체 등록 바로가기</a><br>
	<br>
	<br>
	<br>
	<br>

	
	<jsp:include page="/include/copyright.jsp" flush="true" />

</body>
</html>