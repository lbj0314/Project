<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form action="MyPageChangeMemberServlet" method="get">
<table border='1'>
	<tr>
		<td>아이디</td>
		<td><input type="text" readonly="" value="${sessionScope.comLogin.comid }"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="compasswd" value="${sessionScope.comLogin.compasswd }"></td>
	</tr>
	<tr>
		<td>성함</td>
		<td><input type="text" name="comname" value="${sessionScope.comLogin.comname }"></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" readonly="" value="${sessionScope.comLogin.comssn }"></td>
	</tr>
	<tr>
		<td>핸드폰번호</td>
		<td><input type="text" name="comphone" value="${sessionScope.comLogin.comphone }"></td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td><input type="text" readonly="" value="${sessionScope.comLogin.comgrade }"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="comemail" value="${sessionScope.comLogin.comemail }"></td>
	</tr>
	<tr>
		<td>도로주소</td>
		<td><input type="text" name="comaddr1" value="${sessionScope.comLogin.comaddr1 }"></td>
	</tr>
	<tr>
		<td>지번주소</td>
		<td><input type="text" name="comaddr2" value="${sessionScope.comLogin.comaddr2 }"></td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><input type="text" name="post1" value="${sessionScope.comLogin.compost1 }">-<input type="text" name="post2" value="${sessionScope.comLogin.compost2 }"></td>
	</tr>
<input type="submit" value="변경하기" class="btn btn-default"><input type="reset" value="다시하기" class="btn btn-default">
</table>
</form>
