<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">


	$('.dropdown-toggle').dropdown()
</script>

<style>
body,head { text-align: center;  }

h1 {
	display: block;
	font-size: 2em;
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	text-align: center;
}

h5 {
	display: block;
	/*  font-size: 2em; */
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	text-align: center;
}

.language{
	color:#0404B4;
}

#siteTitle{
	width:150px;
	height:100px;
	text-align:center;
	background-color:blue;
	position: relative;
	top: -60px;
	left: 90px;
}

/* a:link {
    color: #99994d;
}

/* mouse over link */
/* a:hover {
    color: #994d00;
} */
*

</style>

<!-- 타이틀은 대한민국 구석구석 짭 -->
<div id="siteTitle">
<h1 id="jjab">
	<strong text><p style="color:white;">대한민국<br>모아모아<p><p style="color:yellow;">패키지여행<p></strong>
</h1>
</div>


<a href="/test/setChangeLocale.do?locale=ko" class="language">한국어</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=en" class="language">ENGLISH</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=zh" class="language">中国</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=de" class="language">Deutsch</a> &nbsp;&nbsp;
<!-- <a href="/test/setChangeLocale.do?locale=jp">日本人</a> &nbsp;&nbsp; -->
<a href="/test/setChangeLocale.do?locale=fr" class="language">Français</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=it" class="language">italiano</a> &nbsp;&nbsp;


<h5 id="i1818">
<spring:message code="spring.mesg" var="xx"/>
</h5>

${xx}<br>

<div id="conta">

	<a class="btn dropdown-toggle btn-lg" style="color:green;" href="<c:url value="/"/>">
		홈으로 </a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



	<div class="btn-group" id="conta">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" style="color:green;" href="#">
			소개 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/noticeList">공지사항</a><br></li>

			<li><a href="#">이벤트</a><br></li>
			<li><a href="#">추천패키지</a></li>
		</ul>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" style="color:green;" href="#">
			관광명소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/tourList">관광 명소</a><br></li>
			<li><a href="mustgo100">관광100</a></li>
			<li><a href="/test/fesList">축제</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" style="color:green;" href="#">
			맛집 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/restList">음식점 정보</a></li>
			<li><a href="https://guide.michelin.co.kr/ko/" target="_blank">미슐랭 가이드 서울</a></li>
		</ul>
	</div> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" style="color:green;" href="#">
			숙소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/stayList">숙박업소 정보</a></li>
			<li><a href="http://korean.visitkorea.or.kr/kor/goodstay3/index.jsp"  target="_blank">우수 숙박시설</a></li>
			<li><a href="http://www.gocamping.or.kr/" target="_blank">캠핑</a></li>
			<li><a href="https://www.templestay.com/" target="_blank">템플 스테이</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" style="color:green;" href="#">
			게시판 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#">후기</a><br></li>
			<li><a href="#">QnA</a><br></li>
			<li><a href="<c:url value="/guide"/>">사이트 이용법</a></li>
		</ul>
	</div>
</div>
