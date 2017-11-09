<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<script type="text/javascript">

	$('.dropdown-toggle').dropdown()
	
	/* $(documant).ready(function(){
		$("[class*='btn-group']").css("color","black");
	}); */
</script>

<style>
/* @import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
font-family: 'Jeju Gothic', serif; */

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


.language{
	color:#223a5e;
}

/* #siteTitle{
	width:150px;
	height:100px;
	text-align:center;
	background-color:#223a5e;
	position: relative;
	top: -60px;
	left: 90px;
} */

/* a:link {
    color: #99994d;
}

/* mouse over link */
/* a:hover {
    color: #994d00;
} */
*
#titleImage.fixed {
    position: fixed;
    bottom: 0;
    right: 0;
    width: 300px;
   /*  border: 3px solid #73AD21; */
}

/* Style the top navigation bar */
.menumenu {
    /* overflow: hidden; */
    /* border-bottom: 6px solid #223A5E; */
   /*  border: 6px solid #223A5E;
    border-radius: 5px; */
   background-color: white;
   border-bottom: 6px solid white;
    text-color:balck;
}

/* Style the topnav links */
.menumenu a {
    color: black;
  /*   text-align: center;
    padding: 14px 16px; */
    text-color:black;
}

/* Change color on hover */
.menumenu a:hover {
	border-bottom: 6px solid #223A5E; 
    /* background-color: #AF9483; */
    /* color: black; */
    text-color:black;
}


</style>



<body>
<!-- 타이틀은 대한민국 구석구석 짭 -->
<!-- <div id="siteTitle">
<h1 id="jjab">
	<strong><p style="color:white;">대한민국<br>모아모아<p><p style="color:#f6d155;">패키지여행<p></strong>
</h1>
</div> -->
<a href="<c:url value="/"/>"><img id="siteImage" src="/test/images/dnfltkdlxmdlfmawhdwjdgody.png"  style="width: 500px; height: auto;"/></a>
<br><br><br><br>


<div id="conta" class="menumenu">
	<a class="btn dropdown-toggle btn-lg" href="<c:url value="/"/>">
		홈으로 </a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			소개 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/noticeList">공지사항</a><br></li>
			<li><a href="#">이벤트</a><br></li>
			<li><a href="#">추천패키지</a><br></li>
		</ul>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			관광명소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/tourList">관광 명소</a><br></li>
			<li><a href="/test/mustgo100">관광100</a><br></li>
			<li><a href="/test/fesList">축제</a><br></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			맛집 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/restList">음식점 정보</a><br></li>
			<li><a href="https://guide.michelin.co.kr/ko/" target="_blank">미슐랭 가이드 서울</a><br></li>
		</ul>
	</div> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			숙소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/test/stayList">숙박업소 정보</a><br></li>
			<li><a href="http://korean.visitkorea.or.kr/kor/goodstay3/index.jsp"  target="_blank">우수 숙박시설</a><br></li>
			<li><a href="http://www.gocamping.or.kr/" target="_blank">캠핑</a><br></li>
			<li><a href="https://www.templestay.com/" target="_blank">템플 스테이</a><br></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			게시판 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#">후기</a><br></li>
			<li><a href="#">QnA</a><br></li>
			<li><a href="<c:url value="/guide"/>">사이트 이용법</a><br></li>
		</ul>
	</div>
</div>
</body>