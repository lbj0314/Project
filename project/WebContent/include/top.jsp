<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

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
    <li><a href="/project/TourListServlet">축제</a><br></li>
    
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
    <li><a href="/project/RestBoardListServlet">음식점 정보</a></li>
  </ul>     

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    숙소
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
=======
  <ul class="dropdown-menu">
    <li><a href="/project/StayListServlet">호텔,모텔</a><br></li>
    <li><a href="/project/StayListServlet">민박</a><br></li>
    <li><a href="/project/StayListServlet">캠핑</a><br></li>
    <li><a href="/project/StayListServlet">템플스테이</a></li>
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
