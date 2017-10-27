<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Guide</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/project/css/style.css">

<style type="text/css">
body, head {
	text-align: center;
}
</style>


</head>
<body>
	<jsp:include page="/WEB-INF/views/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/WEB-INF/views/include/top.jsp" flush="true" /><br>

	<br>
	<br>
	<br>
	<br> 사이트 방문을 환영합니다! 만나서 반가워요
	<br>
	<br>

	<h5>관광명소에 대한 정보</h5>
	자연, 체험, 역사, 테마, 쇼핑
	<br>
	<a href="/test/tourList">관광명소 보기</a><br>

	<h5>맛집에 대한 정보</h5>
	한식, 일식, 중식, 양식, 패스트푸드, 제과
	<br>
	<a href="restList">음식점 보기</a><br>

	<h5>숙박에 대한 선택권도 다양합니다</h5>
	게스트하우스, 아파트, 모텔, 호텔, 호스텔, 펜션, 홈스테이, 템플 스테이로 분류되어 있습니다.
	<br>
	<a href="stayList">숙박 보기</a><br>
	<br> 또한 맛집, 숙박, 관광명소를 상세히 각 지역별로 볼 수 있습니다.
	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>스페셜 포인트</h1>
	<br>숙박, 음식점, 관광명소에 대한 정보를 볼 수 있을 뿐만 아니라
	<br> 마음에 드는 곳을 선택하신 후
	<br> 자유롭게 패키지를 설정하실 수 있습니다
	<br>
	<br>
	<br>
	<br>
	<a href="">패키지 설정하러 가기!</a>
	<br>
	<br>
	<br>
	<br>
	<a href="#top">회원가입은 오른쪽 상단에서 할 수 있습니다</a>
	<br>
	<br> 관광명소, 음식점, 숙박업소를 운영중이신 경우
	<br> 직접 자신의 업체를 등록하실 수 있습니다
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true" />

</body>
</html>