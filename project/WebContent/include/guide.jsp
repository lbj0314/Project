<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
/* Popup container - can be anything you want */
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* The actual popup */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/project/css/style.css">

<script type="text/javascript">

	$(document).ready(function() {
		$("body").find("[href]").css("font-size", "20px");
	});//end href css

	function myFunction() {
		var popup = document.getElementById("myPopup");
		popup.classList.toggle("show");
	}//팝업 함수

</script>

</head>
<body>
	<jsp:include page="/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/include/top.jsp" flush="true" /><br>

	<br>
	<br>
	<br>
	<br>

	<div class="popup" onclick="myFunction()">
		사이트 방문을 환영합니다! <span class="popuptext" id="myPopup">만나서 반가워요</span>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<a href="/project/StayBoardListServlet">숙박 보기</a>
	<br>
	<a href="/project/RestListServlet">음식점 보기</a>
	<br>
	<a href="/project/TourListServlet">관광명소 보기</a>
	<br>

	<br> 마음에 드는 숙박, 음식점, 관광명소를 선택하신 후
	<br> 자유롭게 패키지를 설정하실 수 있습니다
	<br>
	<br>
	<a href="">패키지 설정하러 가기!</a>
	<br>
	<br>
	<br>
	<br> 업체를 운영중이신 경우
	<br>
	<a href="/project/JoinFormServlet" target="_blank">기업 회원가입 바로가기</a>
	<br>
	<a href="">업체 등록 바로가기</a>
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="/include/copyright.jsp" flush="true" />

</body>
</html>