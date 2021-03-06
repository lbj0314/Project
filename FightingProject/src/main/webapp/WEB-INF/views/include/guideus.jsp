<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

h5 {
	display: block;
	font-size: 20px;
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	text-align: center;
	color:#DC4C46;
}
</style>


</head>
<body>


sorry, we will service to join our website for foreign people soon.

<br><br><br><br>

	<a href="/test/setChangeLocale.do?locale=ko" class="language">한국어</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=en" class="language">ENGLISH</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=zh" class="language">中国</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=de" class="language">Deutsch</a> &nbsp;&nbsp;
<!-- <a href="/test/setChangeLocale.do?locale=jp">日本人</a> &nbsp;&nbsp; -->
<a href="/test/setChangeLocale.do?locale=fr" class="language">Français</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=it" class="language">italiano</a> &nbsp;&nbsp;

<br><br>
<h5 id="i1818">
<spring:message code="spring.mesg" var="xx"/>
${xx}<br><br>
</h5>
	<jsp:include page="/WEB-INF/views/include/topus.jsp" flush="true" /><br>

	<br>
	<br>
	<br><br>
	<br> <h1>Welcome to our site! Nice to meet you</h1><br>
	<img src="/test/images/guide/welcome.jpg" width="500px" height=*/>
	<br><br>
	<br>


	<h4>As for the tourist attractions, <br>
	you can be informed Nature, experience, history, theme, shopping</h4><br>
	<a href="/test/tourList"><img src="/test/images/guide/tourguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/tourList">Click on the picture or click here to see information about the attractions!</a><br>
<br><br><br><br><br><br>
	<h4>As for the restaurant, <br>
	you can be informed Korean, Japanese, Chinese, Western, fast food, confectionary</h4><br>
	<a href="/test/restList"><img src="/test/images/guide/restguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/restList">Click on the picture or here to see information about the restaurant!</a><br>
<br><br><br><br><br><br>
	<h4>There are also a variety of options for accommodation<br>
	It is classified as a local / guest house, an apartment, a motel, a hotel, a hostel, a pension, a homestay, and a temple stay.</h4><br>
	<a href="/test/stayList"><img src="/test/images/guide/sleepguide.jpg" width="500px" height=*/></a>
	<br>
	<a href="/test/stayList">Click on the picture or click here to see information about accommodation!</a><br>
	<br>
<br><br><br><br><br>
	<br>
	<br>
	<br>
	<br>

	<br><br>
	<br>
	<br>
	<br>
	
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="/WEB-INF/views/include/copyright_en.jsp" flush="true" />

</body>
</html>