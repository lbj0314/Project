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

<style>
.btn-info{
  background:#1AAB8A;
  color:#fff;
  border:none;
  outline:none;
}

</style>

<br>
<br>


<hr style="border: double 10px #C0C0C0;">


<c:forEach var="item" items="${requestScope.order}" varStatus="status">



	<form action="/test/Review">
	<input type="hidden" name=comNum value="${item.comNum}">
	<input type="hidden" name=packName value="${item.packName}">
	<input type="hidden" name=startDay value="${item.startDay}">
	<input type="hidden" name=endDay value="${item.endDay}">
	<input type="hidden" name=payment value="${item.payment}">
	<input type="hidden" name=price value="${item.price}">
	<input type="hidden" name=adult value="${item.adult}">
	<input type="hidden" name=kid value="${item.kid}">
	<input type="hidden" name=packOrderNum value="${item.packOrderNum}">
	
	
	
	
	패키지 이름:${item.packName}&nbsp;&nbsp;&nbsp;&nbsp;출발 날짜:${item.startDay}&nbsp;&nbsp;&nbsp;&nbsp;종료 날짜${item.endDay}&nbsp;&nbsp;&nbsp;&nbsp;
	결제했던 수단:${item.payment}&nbsp;&nbsp;&nbsp;&nbsp;결제했던 가격:${item.price}&nbsp;&nbsp;&nbsp;&nbsp;어른 인원수:${item.adult}&nbsp;&nbsp;&nbsp;&nbsp;			
	어린이 인원수:${item.kid}&nbsp;&nbsp;자세히보기<input type="button" value="+" class="hideNshow btn btn-info"
		data-num="${item.packOrderNum}" id="${item.packOrderNum}hideNshow">
	<br>
	<br>
	<%-- <input type="hidden" name=packrelist value="${item.packrelist}"> --%>
	<table border=1 id="${item.packOrderNum}table1" style="display:none" class="table1 table table-striped table-condensed">
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
		<input type="hidden" name="packrelist[${status.index}].day" value="${cc.day}">
		<input type="hidden" name="packrelist[${status.index}].type" value="${cc.type}">
		<input type="hidden" name="packrelist[${status.index}].name" value="${cc.name}">
		<input type="hidden" name="packrelist[${status.index}].location" value="${cc.location}">
		<input type="hidden" name="packrelist[${status.index}].style" value="${cc.style}">
		<input type="hidden" name="packrelist[${status.index}].adultPrice" value="${cc.adultPrice}">
		<input type="hidden" name="packrelist[${status.index}].kidPrice" value="${cc.kidPrice}">
		<input type="hidden" name="packrelist[${status.index}].phone" value="${cc.phone}">
			<tr>
				<td align=center>${cc.day}</td>
				<td align=center>${cc.type}</td>
				<c:if test="${cc.type == '관광지' }">
				<td align=center><a href="/test/tourRetrieve?attNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<c:if test="${cc.type == '숙박업소' }">
				<td align=center><a href="/test/stayRetrieve?stayNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<c:if test="${cc.type == '음식점' }">
				<td align=center><a href="/test/restRetrieve?restNum=${cc.listnum }" target="_blank">${cc.name}</a></td>
				</c:if>
				<td align=center>${cc.location}</td>
				<td align=center>${cc.style}</td>
				<td align=center>${cc.adultPrice}</td>
				<td align=center>${cc.kidPrice}</td>
				<td align=center>${cc.phone}</td>
			</tr>
		</c:forEach>
		
	</table>
	<%-- <a href="/test/Review/packOrderNum/${item.packOrderNum}/state/${item.state}" class="btn btn-info">후기 작성하러 가기</a> --%>
	<br>
	
	<input type="submit" value="후기 등록하러 가기" class="btn btn-info"><br>
	</form>
	
	<br>
<br>


<hr style="border: dashed 6px #C0C0C0;">
</c:forEach>



