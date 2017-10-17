<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty sessionScope.comdto and !empty requestScope.commember }">
	<form action="memberManageDelete" method="get">
	<input type="hidden" name="category" value="com">
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comid }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" readonly=""  
					value="${sessionScope.comdto.compasswd }"></td>
			</tr>
			<tr>
				<td>성함</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comname }"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comdto.comssn }"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comphone }"></td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comdto.comgrade }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comemail }"></td>
			</tr>
			<tr>
				<td>도로주소</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comaddr1 }"></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.comaddr2 }"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.comdto.compost1 }">-<input
					type="text" readonly="" value="${sessionScope.comdto.compost2 }"></td>
			</tr>
			<input type="submit" value="탈퇴 시키기" class="btn btn-default">
			<a href="memberManage" class="btn btn-default">회원 관리로 돌아가기</a>
		</table>
	</form>
</c:if>
<c:if test="${!empty sessionScope.entdto and !empty requestScope.entmember }">
	<form action="memberManageDelete" method="get">
	<input type="hidden" name="category" value="ent">
		<table border='1'>
			<tr>
				<td>
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly=""
					value="${sessionScope.entdto.entid }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" readonly=""
					value="${sessionScope.entdto.entpasswd }"></td>
			</tr>
			<tr>
				<td>성함</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.entname }"></td>
			</tr>
			<tr>
				<td>업소 지역</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.entlocation }"></td>
			</tr>
			<tr>
				<td>업소 번호</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.entphone }"></td>
			</tr>
			<tr>
				<td>업주 핸드폰번호</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.entcellphone }"></td>
			<tr>
				<td>업소 팩스번호</td>
				<td><input type="text" readonly="" name="fax" 
					value="${sessionScope.entdto.entfax }"></td>
			</tr>
			<tr>
				<td>업소 사업장등록번호</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.entin }"></td>
			</tr>
			<tr>
				<td>업소 종류</td>
				<td><input type="text" readonly="" 
					value="${sessionScope.entdto.enttype }"></td>
			</tr>
		</table>
		<input type="submit" value="탈퇴 시키기" class="btn btn-default">
		<a href="reviewManage" class="btn btn-default">후기글 관리로 돌아가기</a>
	</form>
</c:if>