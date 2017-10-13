<%@page import="com.dto.fes.FesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
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
	$(document).ready(function(){
		$("#mySidebar").on("change",function(event){
			$.ajax({
				type:"get",
				url:"FesListServlet",
				data : {
					FesSeason : $("#FesSeason").val()
				},
				dataType:"text",
				success:function(responseData, status, xhr) {
					console.log(responseData);
					$('#FesForm').submit();,
				error:function(xhr, status, e) {
					console.log(status, e);
				
			});
		})
	});//ajax 끝 */
	
	
	
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


<!-- FesNum,FesName,FesPrice,FesTitle,FesContent,FesImage,FesReadCnt,FesSite -->
</head>
<body>

	<!-- form!!!!!!!!!!!!!!!!!!!!!! -->
	<form action="FesListServlet" id="Fesform">
	<input type="hidden" value="FesSeason">
	<div
		class="w3-sidebar w3-bar-block w3-card-2 w3-top w3-xlarge w3-animate-left"
		style="display: none; z-index: 2; width: 40%; min-width: 300px"
		id="mySidebar">
		 <a href="#spring" onclick="w3_close()" class="w3-bar-item w3-button">Spring</a> 
		<a href="#summer" onclick="w3_close()" class="w3-bar-item w3-button">Summer</a>
		<a href="#fall" onclick="w3_close()" class="w3-bar-item w3-button">Fall</a>
		<a href="#winter" onclick="w3_close()" class="w3-bar-item w3-button">Winter</a>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
	</div>
	</form>
	<!-- Top menu -->
	<div class="w3-top">
		<div class="w3-white w3-xlarge" style="max-width: 1200px; margin: auto">
			<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
			<div class="w3-right w3-padding-16">festival</div>
			<div class="w3-center w3-padding-16">계절 별 축제 보기</div>
		</div>
	</div>

	<!-- First Photo Grid-->
	<div class="w3-row-padding w3-padding-16 w3-center" id="food">
		<div class="w3-quarter">
			<img src="/w3images/sandwich.jpg" alt="Sandwich" style="width: 100%">
			<h3>The Perfect Sandwich, A Real NYC Classic</h3>
			<p>Just some random text, lorem ipsum text praesent tincidunt
				ipsum lipsum.</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/steak.jpg" alt="Steak" style="width: 100%">
			<h3>Let Me Tell You About This Steak</h3>
			<p>Once again, some random text to lorem lorem lorem lorem ipsum
				text praesent tincidunt ipsum lipsum.</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/cherries.jpg" alt="Cherries" style="width: 100%">
			<h3>Cherries, interrupted</h3>
			<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
			<p>What else?</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/wine.jpg" alt="Pasta and Wine"
				style="width: 100%">
			<h3>Once Again, Robust Wine and Vegetable Pasta</h3>
			<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
		</div>
	</div>

	<!-- Second Photo Grid-->
	<div class="w3-row-padding w3-padding-16 w3-center">
		<div class="w3-quarter">
			<img src="/w3images/popsicle.jpg" alt="Popsicle" style="width: 100%">
			<h3>All I Need Is a Popsicle</h3>
			<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/salmon.jpg" alt="Salmon" style="width: 100%">
			<h3>Salmon For Your Skin</h3>
			<p>Once again, some random text to lorem lorem lorem lorem ipsum
				text praesent tincidunt ipsum lipsum.</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/sandwich.jpg" alt="Sandwich" style="width: 100%">
			<h3>The Perfect Sandwich, A Real Classic</h3>
			<p>Just some random text, lorem ipsum text praesent tincidunt
				ipsum lipsum.</p>
		</div>
		<div class="w3-quarter">
			<img src="/w3images/croissant.jpg" alt="Croissant"
				style="width: 100%">
			<h3>Le French</h3>
			<p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum
				lipsum.</p>
		</div>
	</div>


	<!-- 리스트--------------------------------------------------------------------------------- -->

	<!-- <h1>축제 리스트</h1>
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
</table> -->
</body>
</html>


