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
<h1 id="jjab">
	<strong>Welcome!</strong>
</h1>


<a href="/test/setChangeLocale.do?locale=ko">한국어</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=en">ENGLISH</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=zh">中国</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=de">Deutsch</a> &nbsp;&nbsp;
<!-- <a href="/test/setChangeLocale.do?locale=jp">日本人</a> &nbsp;&nbsp; -->
<a href="/test/setChangeLocale.do?locale=fr">Français</a> &nbsp;&nbsp;
<a href="/test/setChangeLocale.do?locale=it">italiano</a> &nbsp;&nbsp;


<h5 id="i1818">
<spring:message code="spring.mesg" var="xx"/>
</h5>

${xx}<br>

<div id="conta">

	<a class="btn dropdown-toggle btn-lg" href="<c:url value="/"/>">
		home </a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



	<div class="btn-group" id="conta">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			introduce <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/NoticeListServlet">notice</a><br></li>

			<li><a href="#">event</a><br></li>
			<li><a href="#">good package</a></li>
		</ul>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			tour <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="tourList">tour</a><br></li>
			<li><a href="mustgo100">mustgo100</a></li>
			<li><a href="fesList">festival</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			restaurant <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/RestListServlet">restaurant information</a></li>
			<li><a href="https://guide.michelin.co.kr/en/" target="_blank">michelin guide Seoul</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			stay <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/StayBoardListServlet">stay information</a></li>
			<li><a href="http://english.visitkorea.or.kr/enu/ACM/AC_ENG_1.jsp" target="_blank">Goodstay</a></li>
			<li><a href="https://eng.templestay.com/index2.asp?" target="_blank">Temple Stay</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			board <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#">review</a><br></li>
			<li><a href="#">QnA</a><br></li>
			<li><a href="<c:url value="/guide"/>">guide</a></li>
		</ul>
	</div>
</div>
