<%@page import="com.dto.fes.FesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<body>
<h1>축제 리스트</h1>
<table border="1">
<tr>
<td>축제 번호</td>
<td>축제 이름</td>
<td>축제 가격</td>
<td>축제 내용</td>
<td>축제 이미지</td>
<td>축제 사이트</td>
<td>조회수</td>
</tr>
<c:forEach var="fff" items="${fesList}">
${fff}
</c:forEach>

</table>
</body>
</html>
<!-- <!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
	}
	//w3school 코드 끝
	
	/* 
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>
<title>축제 보기</title>
FesNum,FesName,FesPrice,FesTitle,FesContent,FesImage,FesReadCnt,FesSite
</head>
<body>
<h1>축제 리스트</h1>
<table border="1">
<tr>
<td>축제 번호</td>
<td>축제 이름</td>
<td>축제 가격</td>
<td>축제 내용</td>
<td>축제 이미지</td>
<td>축제 사이트</td>
<td>조회수</td>


</tr>
</table>

form!!!!!!!!!!!!!!!!!!!!!!
	<form action="/fesList" id="Fesform">
	<input type="hidden" value="FesSeason">
	<div
		class="w3-sidebar w3-bar-block w3-card-2 w3-top w3-xlarge w3-animate-left"
		style="display: none; z-index: 2; width: 40%; min-width: 300px"
		id="mySidebar">
		 <a href="/fesList?spring" onclick="w3_close()" class="w3-bar-item w3-button">Spring</a> 
		<a href="/fesList?summer" onclick="w3_close()" class="w3-bar-item w3-button">Summer</a>
		<a href="/fesList?fall" onclick="w3_close()" class="w3-bar-item w3-button">Fall</a>
		<a href="/fesList?winter" onclick="w3_close()" class="w3-bar-item w3-button">Winter</a>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
	</div>
	</form>
	Top menu
	<div class="w3-top">
		<div class="w3-white w3-xlarge" style="max-width: 1200px; margin: auto">
			<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
			<div class="w3-right w3-padding-16">festival</div>
			<div class="w3-center w3-padding-16">계절 별 축제 보기</div>
		</div>
	</div>

	First Photo Grid
	<div class="w3-row-padding w3-padding-16 w3-center" id="fes">
		<div class="w3-quarter">
			<img src="/WEB-INF/views/images/catcute.gif">
			<h3>축제1</h3>
			<p>축제 내용</p>
		</div>
	</div>

	</body>
</html>	 -->
