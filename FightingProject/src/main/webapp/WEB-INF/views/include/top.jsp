<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<script type="text/javascript">
$('.dropdown-toggle').dropdown()
</script>

<div id="conta">

 <a class="btn dropdown-toggle btn-lg" href="/test/">
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
    <li><a href="/test/tourList">관광 명소</a><br></li>
    <li><a href="/test/views/tour/mustgo100view.jsp">관광100</a></li>
    <li><a href="/project/FesListServlet">축제</a></li>
  </ul>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    맛집
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="/project/RestListServlet">음식점 정보</a></li>
  </ul>     
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div class="btn-group">
  <a class="btn dropdown-toggle btn-lg" data-toggle="dropdown" href="#">
    숙소
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li><a href="/project/StayBoardListServlet">숙박업소 정보</a></li>
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
    <li><a href="/project/include/guide.jsp">사이트 이용법</a></li>
  </ul>
</div>
</div>
