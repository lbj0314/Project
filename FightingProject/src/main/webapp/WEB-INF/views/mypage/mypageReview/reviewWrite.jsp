<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">


	$(document).ready(function() {
		
	 $(".hideNshow").click(function(){
		
		 var num=$(this).attr("data-num");
		 console.log(num);
		 if($("#"+num+"hideNshow").val() == '+')
		 { 
        	$("#"+num+"table1").show();
        	$("#"+num+"hideNshow").val('-');
		 }
		 
		 else if($("#"+num+"hideNshow").val() == '-')
		 { 
        	$("#"+num+"table1").hide();
        	$("#"+num+"hideNshow").val('+');
		 }
	        
	    });
	    
	
	
});


</script>
<form action="/test/reviewInsert">
	
	
	<br>
	<br>
<h1>패키지 글쓰기</h1>
	<div class="container-fluid">
		


제목<input type="text" name="packTitle" class="form-control"><br>
	<input type="hidden" name=comNum value="${order.comNum}">
	<input type="hidden" name=packOrderNum value="${order.packOrderNum}">
패키지 다녀왔던 곳<br>
패키지 이름:${order.packName}&nbsp;&nbsp;&nbsp;&nbsp;출발 날짜:${order.startDay}&nbsp;&nbsp;&nbsp;&nbsp;종료 날짜${order.endDay}&nbsp;&nbsp;&nbsp;&nbsp;
	결제했던 수단:${order.payment}&nbsp;&nbsp;&nbsp;&nbsp;결제했던 가격:${order.price}&nbsp;&nbsp;&nbsp;&nbsp;어른 인원수:${order.adult}&nbsp;&nbsp;&nbsp;&nbsp;			
	어린이 인원수:${order.kid}&nbsp;&nbsp;자세히보기<input type="button" value="+" class="hideNshow btn btn-info"
		data-num="${order.packOrderNum}" id="${order.packOrderNum}hideNshow">
	<br>
	<br>

	<table border=1 id="${order.packOrderNum}table1" style="display:none" class="table1 table table-striped table-condensed">
		<tr>
			<td align=center><b>일자</b></td>
			<td align=center><b>타입</b></td>
			<td align=center><b>업소이름</b></td>
			<td align=center><b>업소지역</b></td>
			<td align=center><b>업소타입</b></td>
			<td align=center><b>성인가격</b></td>
			<td align=center><b>어린이가격</b></td>
			<td align=center><b>전화번호</b></td>
		</tr>
		<c:forEach var="cc" items="${order.packrelist}" varStatus="status">
			<tr>
				<td align=center>${cc.day}</td>
				<td align=center>${cc.type}</td>
				<td align=center>${cc.name}</td>
				<td align=center>${cc.location}</td>
				<td align=center>${cc.style}</td>
				<td align=center>${cc.adultPrice}</td>
				<td align=center>${cc.kidPrice}</td>
				<td align=center>${cc.phone}</td>
			</tr>
		</c:forEach>
		
	</table>


위의 다녀왔던 곳을 참고하면서 패키지의 글을 작성하여 주세요!<textarea rows="10" cols="10" name="packContent" class="form-control"></textarea>
 <input type="submit" value="글쓰기" class="form-control">





</div>

	</form>

<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='/test/reviewList';">목록</button>
		</div>



