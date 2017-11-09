<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">

$(document).ready(function() {
	
	
	 $("#hideNshow").click(function(){
		/* var data-num="${xxx.num}"; */
		 if($("#hideNshow").val() == '+')
		 { 
        	$("#table1").show();
        	$("#hideNshow").val('-');
		 }
		 
		 else if($("#hideNshow").val() == '-')
		 { 
        	$("#table1").hide();
        	$("#hideNshow").val('+');
		 }
	        
	    });
	    
	
	
});


</script>



<c:forEach var="item" items="${requestScope.order}" varStatus="status">
	패키지 이름:${item.packName}&nbsp;&nbsp;&nbsp;&nbsp;출발 날짜:${item.startDay}&nbsp;&nbsp;&nbsp;&nbsp;종료 날짜${item.endDay}&nbsp;&nbsp;&nbsp;&nbsp;
	결제했던 수단:${item.payment}&nbsp;&nbsp;&nbsp;&nbsp;결제했던 가격:${item.price}&nbsp;&nbsp;&nbsp;&nbsp;어른 인원수:${item.adult}&nbsp;&nbsp;&nbsp;&nbsp;			
	어린이 인원수:${item.kid}&nbsp;&nbsp;자세히보기<input type="button" value="+"
		class="btn btn-info" id="hideNshow">
	<br>
	<br>

	<table border=1 id="table1" style="display:none">
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
		<c:forEach var="cc" items="${item.packrelist}" varStatus="status">
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
	<br>
	<br>
</c:forEach>

