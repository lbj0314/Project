<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
});

</script>
<h3>[ 패키지 만들기 ]<h3>
<br>
<form action="" method="get">
<table border='1'>
<tr><td>공백</td><td>관광명소</td><td>맛집</td><td>숙박업소</td><td>공백</td>
</tr>
<tr><td>업소명</td><td>관광명소명</td><td>맛집명</td><td>숙박업소명</td><td>공백</td>
</tr>
<tr><td>업소 지역</td><td>관광명소 지역</td><td>맛집 지역</td><td>숙박업소 지역</td><td>공백</td>
</tr>
<tr><td>업소 종류</td><td>관광명소 종류</td><td>맛집 종류</td><td>숙박업소 종류</td><td>공백</td>
</tr>
<tr><td>성인 가격</td><td>성인가격X명수</td><td>성인가격X명수</td><td>성인가격X명수</td><td>공백</td>
</tr>
<tr><td>어린이 가격</td><td>어린이X명수</td><td>어린이X명수</td><td>어린이X명수</td><td>공백</td>
</tr>
<tr><td>업소 전화번호</td><td>관광명소 전화번호</td><td>맛집 전화번호</td><td>숙박업소 전화번호</td><td>공백</td>
</tr>
<tr><td>공백</td><td>관광명소 가격 총합</td><td>맛집 가격 총합</td><td>숙박 가격 총합</td><td>총 패키지 가격</td>
</tr>
<tr><td>공백</td><td><input type="button" name="attAdd" value="관광명소 추가하기" onclick="location.href='orderFormListSevlet'"></td><td><input type="button" name="resAdd" value="맛집 추가하기" onclick="location.href='orderFormListSevlet'"></td><td><input type="button" name="stayAdd" value="숙박업소 추가하기" onclick="location.href='orderFormListSevlet'"></td><td>공백</td>
</tr>
</form>


</table>

