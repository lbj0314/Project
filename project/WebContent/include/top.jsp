<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/project/css/style.css">

<script type="text/javascript">
$('.dropdown-toggle').dropdown()
</script>

<div id="conta">

 <a class="btn dropdown-toggle btn-lg" href="/project/home.jsp">
    홈으로
  </a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<div class="btn-group" id="conta">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    소개
    <span class="caret"></span>
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
    관광명소
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">축제</a><br></li>
    
    <li><a href="/project/tour/mustgo100view.jsp">관광100</a></li>
  </ul>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    맛집
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">정보</a></li>
  </ul>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    숙소
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">호텔,모텔</a><br></li>
    
    <li><a href="#">캠핑</a><br></li>
    <li><a href="#">템플스테이</a></li>
  </ul>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    게시판
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">후기</a><br></li>
    
    <li><a href="#">QnA</a><br></li>
    <li><a href="#">페이지이용 가이드</a></li>
  </ul>
</div>


</div>