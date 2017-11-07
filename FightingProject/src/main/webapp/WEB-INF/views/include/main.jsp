<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- jQeury문 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel()

	});
</script>
<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div align="center" class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="/test/images/catcute.gif" alt="..." width=* height=*>
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="/test/images/cat.jpg" alt="..." width=* height=*>
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="/test/images/sul.gif" alt="..." width=* height=*>
			<div class="carousel-caption">...</div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
	<br><br>
<b style="font-size:20px;color:red;">사이트 방문을 환영합니다! 마음에 드는 음식점, 숙박업소를 선택하신 후, 자유롭게 패키지를 설정 할 수 있습니다.</b><br>
<a href="/test/guide" class="btn btn-default">패키지 가이드 보기</a>