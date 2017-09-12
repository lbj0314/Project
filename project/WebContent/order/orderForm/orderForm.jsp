<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

function addList(myForm, kind){
	myForm.action="orderFormListSevlet";
	document.getElementById("kind").value=kind.value;
	myForm.submit();
}

$(document).ready(function() {

});

</script>
<h3>[ 패키지 만들기 ]<h3>
<br>
<form action="" method="get" name="myForm">
<input type="hidden" name="kind" value="" id="kind">
<input type="hidden" name="attAdd" value="attAdd" id="attAdd">
<input type="hidden" name="resAdd" value="resAdd" id="resAdd">
<input type="hidden" name="stayAdd" value="stayAdd" id="stayAdd">
<table border='1'>
<tr><td>공백</td><td>관광명소</td><td>맛집</td><td>숙박업소</td><td>공백</td>
</tr>
<tr><td>업소명</td><td>관광명소명</td><td>맛집명</td><td>숙박업소명</td><td>공백</td>
</tr>
<tr><td>공백</td><td>관광명소 가격 총합</td><td>맛집 가격 총합</td><td>숙박 가격 총합</td><td>총 패키지 가격</td>
</tr>
<tr><td>공백</td><td><input type="button" value="관광명소 추가하기" onclick="addList(myForm ,attAdd)"></td><td><input type="button" value="맛집 추가하기" onclick="addList(myForm, resAdd)"></td><td><input type="button" value="숙박업소 추가하기" onclick="addList(myForm, stayAdd)"></td><td>공백</td>
</tr>
</form>


</table>

