<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script type="text/javascript">
	$('.dropdown-toggle').dropdown()

	//i18 적용 jquery
	$(document).ready(function() {
		$("#kr").on("click", function() {
			$.ajax({
				type : "post",
				url : "MesCont/kr",
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);
				},
				error : function(xhr, status, e) {
					console.log(status, e);
				}
			});
		});
		$("#us").on("click", function() {
			$.ajax({
				type : "post",
				url : "MesCont/us",
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);
				},
				error : function(xhr, status, e) {
					console.log(status, e);
				}
			});
		});
		$("#ch").on("click", function() {
			$.ajax({
				type : "post",
				url : "MesCont/ch",
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);
				},
				error : function(xhr, status, e) {
					console.log(status, e);
				}
			});
		});
	});
</script>


<!-- i18 적용 실험 버튼 -->
<form action="MesCont" method="post">
	<button id="kr" value="kr">한국어</button>
	<button id="us" value="us">English</button>
	<button id="ch" value="ch">中国</button>
	<br />

</form>

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
