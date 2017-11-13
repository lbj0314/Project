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
/* 드롭다운 메뉴 css */
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}


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
<div id="siteTitle">
<h1 id="jjab">
<strong>Welcome!</strong>
</h1>
</div>
<img id="siteImage" src="/test/images/dnfltkdlxmdlfmawhdwjdgody.png"  style="width: 500px; height: auto;"/>
<br><br><br><br>


<div id="conta">

	<a class="btn dropdown-toggle btn-lg" href="<c:url value="/"/>">
		home </a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



	<div class="btn-group" id="conta">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			introduce <span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="/test/noticeList">notice</a><br></li>
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
			<li><a href="/test/tourList">tour</a><br></li>
			<li><a href="/test/mustgo100">mustgo100</a></li>
			<li><a href="/test/fesList">festival</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			restaurant <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/restList">restaurant information</a></li>
			<li><a href="https://guide.michelin.co.kr/en/" target="_blank">michelin guide Seoul</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			stay <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/stayList">stay information </a></li>
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
