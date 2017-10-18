<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
	$('.dropdown-toggle').dropdown()
</script>
<!-- 	
<script type="text/javascript">
	$(document).ready(function(){
		$("#ko").on("click", function(event) {
			$.ajax({
				type : "get",
				/* url : "MesCont",
				dataType : "text",
				data : {
				}, */

				success : function returnmsg(){
					return "<spring:message code='spring.mesg'/>";
					},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});
	});
	</script> -->

<!-- i18 적용 실험 버튼 -->

<%-- <spring:message code='spring.mesg'/> --%>
<div>
<spring:message code="spring.mesg"/>
</div>

<a href="/test/setChangeLocale.do?locale=ko">한국어</a>
<a href="/test/setChangeLocale.do?locale=en">ENGLISH</a>

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

	<a class="btn dropdown-toggle btn-lg" href="/WEB-INF/views/home.jsp">
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
			<li><a href="/WEB-INF/views/guide.jsp">사이트 이용법</a></li>
		</ul>
	</div>
</div>
