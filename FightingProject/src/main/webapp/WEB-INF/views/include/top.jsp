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
	<strong>맛집, 숙소, 관광지 정보를 제공해주고 자유롭게 패키지를 설정하면 할인해주는 사이트. 기업인이 직접 업소를 등록할 수도 있습니다. 이거 너무 기니까 빨리 사이트 이름 정해봐요</strong>
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

<!-- 
	<button id="ko">한국어</button>
	<button id="us" >English</button>
	<button id="ch">中国</button>
	<br />
 -->
<!-- i18181818i181818코드 -->
<%--     
<span style="float: right">   
    <a href="?lang=en">en</a>   
    |   
    <a href="?lang=de">de</a>   
    
    <input type="submit" value="<spring:message code="spring.mesg"/>"/>
</span>  

 --%>

<div id="conta">

	<a class="btn dropdown-toggle btn-lg" href="<c:url value="/"/>">
		홈으로 </a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



	<div class="btn-group" id="conta">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			소개 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/NoticeListServlet">공지사항</a><br></li>

			<li><a href="#">이벤트</a><br></li>
			<li><a href="#">추천패키지</a></li>
		</ul>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			관광명소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="tourList">관광 명소</a><br></li>
			<li><a href="/project/tour/mustgo100view.jsp">관광100</a></li>
			<li><a href="/project/FesListServlet">축제</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			맛집 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/RestListServlet">음식점 정보</a></li>
		</ul>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="btn-group">
		<a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
			숙소 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="/project/StayBoardListServlet">숙박업소 정보</a></li>
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
			<li><a href="<c:url value="/guide"/>">사이트 이용법</a></li>
		</ul>
	</div>
</div>
