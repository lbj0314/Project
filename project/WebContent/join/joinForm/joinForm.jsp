<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="../../jquery-3.2.1.js"></script>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<script type="text/javascript">
    
	$(document).ready(function() {

		$("#category").on("change", function() {
			if ($("#category option:selected").val() == "ent") {
				$("#name").attr("disabled", false);
				$("#ssn").attr("disabled", false);
				$("#phone1").attr("disabled", false);
				$("#email").attr("disabled", false);
				$("#addr1").attr("disabled", true);
				$("#addr2").attr("disabled", false);
				$("#post1").attr("disabled", true);
				$("#post2").attr("disabled", true);
				$("#location").attr("disabled", false);
				$("#phone2").attr("disabled", false);
				$("#fax").attr("disabled", false);
				$("#in").attr("disabled", false);
				$("#kind").attr("disabled", false);
				$("#button").attr("disabled", false);
			} else if ($("#category option:selected").val() == "com") {
				$("#name").attr("disabled", false);
				$("#ssn").attr("disabled", false);
				$("#phone1").attr("disabled", false);
				$("#email").attr("disabled", false);
				$("#addr1").attr("disabled", false);
				$("#addr2").attr("disabled", false);
				$("#post1").attr("disabled", false);
				$("#post2").attr("disabled", false);
				$("#location").attr("disabled", true);
				$("#phone2").attr("disabled", true);
				$("#fax").attr("disabled", true);
				$("#in").attr("disabled", true);
				$("#kind").attr("disabled", true);
				$("#button").attr("disabled", false);
			} else {
				$("#name").attr("disabled", true);
				$("#ssn").attr("disabled", true);
				$("#phone1").attr("disabled", true);
				$("#email").attr("disabled", true);
				$("#addr1").attr("disabled", true);
				$("#addr2").attr("disabled", true);
				$("#post1").attr("disabled", true);
				$("#post2").attr("disabled", true);
				$("#location").attr("disabled", true);
				$("#phone2").attr("disabled", true);
				$("#fax").attr("disabled", true);
				$("#in").attr("disabled", true);
				$("#kind").attr("disabled", true);
				$("#button").attr("disabled", true);
			}
		});

	});
</script>
<form action="JoinServlet" method="get">
<select id="category" name="category">
	<option value="com">일반회원</option>
	<option value="ent">기업회원</option>
	<option value="adm">관리자</option>
</select>
<table border='1'>
	<tr>
		<td>이름</td>
		<td><input type="text" id="name" name="name"></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="userid"></td>
	</tr>
	<tr>
		<td>비밀 번호</td>
		<td><input type="text" name="passwd"></td>
	</tr>
	<tr>
		<td>주민 번호</td>
		<td><input type="text" placeholder="주민 번호(-제외)" id="ssn" name="ssn"></td>
	</tr>
	<tr>
		<td>핸드폰 번호</td>
		<td><input type="text" placeholder="휴대폰 번호(-제외)" id="phone1" name="phone1"></td>
	</tr>
	<tr>
		<td>이메일 주소</td>
		<td><input type="text" id="email" name="email"></td>
	</tr>
	
	<!-- 다음주소 시작-->
	<tr><td>우편 번호</td><td><input name="post1" id="post1" size="5" readonly=""> -
	<input name="post2" id="post2" size="5" readonly="">
	<input onclick="openDaumPostcode()" type="button" value="우편번호찾기" id="button"></td></tr>
	<tr><td>도로명 주소</td><td>
	<input name="addr1" id="addr1" size="40" readonly=""
		placeholder="도로명주소">
	</td></tr>
	<tr><td>지번 주소</td><td>
	<input name="addr2" id="addr2" size="40" placeholder="지번주소(기업회원의 경우 업소 지역)"></td></tr>
<!-- 다음주소 끝 -->
	<tr>
		<td>업소 지역</td>
		<td><input type="text" id="location" disabled="true" name="location"></td>
	</tr>
	<tr>
		<td>업소 전화번호</td>
		<td><input type="text" id="phone2" disabled="true" name="phone2"></td>
	</tr>
	<tr>
		<td>업소 팩스번호</td>
		<td><input type="text" id="fax" disabled="true" name="fax"></td>
	</tr>
	<tr>
		<td>사업장 등록번호</td>
		<td><input type="text" id="in" disabled="true" name="in"></td>
	</tr>
	<tr>
		<td>업소 종류</td>
		<td><select id="kind" disabled="true" name="kind"><option value="tour">관광 명소</option>
				<option value="restaurant">음식점</option>
				<option value="stay">숙박 업소</option></select></td>
	</tr>
</table>
<input type="submit" value="가입하기" class="btn btn-default">

</form>

