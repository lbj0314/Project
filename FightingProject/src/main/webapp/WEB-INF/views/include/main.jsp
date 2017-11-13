<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
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

<!-- jQeury문 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel()

	});
</script>
<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div align="center" class="carousel-inner" role="listbox">
		<div class="item active">
			<a href="#"><img src="/test/images/seoul.png" alt="서울지역 추천 패키지" width=* height=*></a>
			<div class="carousel-caption">....</div>
		</div>
		<div class="item">
			<a href="#"><img src="/test/images/pusan.png" alt="부산지역 추천 패키지" width=* height=*></a>
			<div class="carousel-caption">....</div>
		</div>
		<div class="item">
			<a href="#"><img src="/test/images/jeju.png" alt="제주지역 추천 패키지" width=* height=*></a>
			<div class="carousel-caption">....</div>
		</div>
		
	</div>



	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
	<br><br>
	
	<hr>
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


<a href="/test/guide" class="btn btn-default">패키지 가이드 보기</a>
<br><br><br><br>