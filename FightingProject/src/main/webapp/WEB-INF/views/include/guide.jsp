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
	<br> <h1>사이트 방문을 환영합니다! 만나서 반가워요</h1><br>
	<img src="/test/images/guide/welcome.jpg" width="500px" height=*/>
	<br><br><br><br><br><br>
	<br>

	<h4>관광명소에 대해 지역별은 물론 <br>
	자연, 체험, 역사, 테마, 쇼핑 별로 보실 수 있습니다</h4><br>
	<a href="/test/tourList"><img src="/test/images/guide/tourguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/tourList">관광명소에 대한 정보를 보시려면 그림이나 여기를 클릭!</a><br>
<br><br><br><br><br><br>
	<h4>맛집에 대해서도 지역별은 물론 <br>
	한식, 일식, 중식, 양식, 패스트푸드, 제과 별로 보실 수 있습니다</h4><br>
	<a href="/test/restList"><img src="/test/images/guide/restguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/restList">음식점에 대한 정보를 보시려면 그림이나 여기를 클릭!</a><br>
<br><br><br><br><br><br>
	<h4>숙박에 대한 선택권도 다양합니다<br>
	지역별 / 게스트하우스, 아파트, 모텔, 호텔, 호스텔, 펜션, 홈스테이, 템플 스테이로 분류되어 있습니다.</h4><br>
	<a href="/test/stayList"><img src="/test/images/guide/sleepguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/stayList">숙박에 대한 정보를 보시려면 그림이나 여기를 클릭!</a><br>
	<br>
<br><br><br><br><br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1><strong>스페셜 포인트!</strong></h1>
	<img src="/test/images/guide/spe.jpg" width="500px" height=*/>
	<br><h4>숙박, 음식점, 관광명소에 대한 정보를 볼 수 있을 뿐만 아니라
	<br> 마음에 드는 곳을 선택하신 후
	<br> 자유롭게 패키지를 설정하실 수 있습니다</h4>
	<br>
	<br>
	<br>
	<br>
	<h1><a href="/test/packageOrderForm">패키지 설정하러 가기!</a></h1>
	<br><br>
	<br>
	<br>
	<br>
	회원가입은 <a href="#top">오른쪽 상단</a>에서 하실 수 있습니다
	<br>
	<br> 관광명소, 음식점, 숙박업소를 운영중이신 경우
	<br> 직접 자신의 업체를 등록하실 수 있습니다<br>
	문의사항은 010-0000-0000 이나 QnA 게시판에 남겨주시면 답변 드립니다
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true" />

</body>
</html>