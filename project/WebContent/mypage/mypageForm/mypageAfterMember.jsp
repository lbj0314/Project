<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty sessionScope.comdto }">
	<form action="MyPageChangeMemberServlet" method="get">
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comdto.comid }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="compasswd" 
					value="${sessionScope.comdto.compasswd }"></td>
			</tr>
			<tr>
				<td>성함</td>
				<td><input type="text" name="comname"
					value="${sessionScope.comdto.comname }"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comdto.comssn }"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" name="comphone"
					value="${sessionScope.comdto.comphone }"></td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comdto.comgrade }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="comemail"
					value="${sessionScope.comdto.comemail }"></td>
			</tr>
			<tr>
				<td>도로주소</td>
				<td><input type="text" name="comaddr1"
					value="${sessionScope.comdto.comaddr1 }"></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><input type="text" name="comaddr2"
					value="${sessionScope.comdto.comaddr2 }"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="post1"
					value="${sessionScope.comdto.compost1 }">-<input
					type="text" name="post2" value="${sessionScope.comdto.compost2 }"></td>
			</tr>
			<input type="submit" value="탈퇴 시키기" class="btn btn-default">
			<a href="MemberManageServlet" class="btn btn-default">회원 관리로 돌아가기</a>
		</table>
	</form>
</c:if>
<c:if test="${!empty sessionScope.entdto }">
	<form action="MyPageChangeMemberServlet" method="get">
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
				<td><input type="text" name="entpasswd"
					value="${sessionScope.entdto.entpasswd }"></td>
			</tr>
			<tr>
				<td>성함</td>
				<td><input type="text" name="entname"
					value="${sessionScope.entdto.entname }"></td>
			</tr>
			<tr>
				<td>업소 지역</td>
				<td><input type="text" name="entlocation"
					value="${sessionScope.entdto.entlocation }"></td>
			</tr>
			<tr>
				<td>업소 번호</td>
				<td><input type="text" name="entphone"
					value="${sessionScope.entdto.entphone }"></td>
			</tr>
			<tr>
				<td>업주 핸드폰번호</td>
				<td><input type="text" name="entcellphone"
					value="${sessionScope.entdto.entcellphone }"></td>
			<tr>
				<td>업소 팩스번호</td>
				<td><input type="text" name="entfax"
					value="${sessionScope.entdto.entfax }"></td>
			</tr>
			<tr>
				<td>업소 사업장등록번호</td>
				<td><input type="text" name="entin"
					value="${sessionScope.entdto.entin }"></td>
			</tr>
			<tr>
				<td>업소 종류</td>
				<td><input type="text" name="enttype"
					value="${sessionScope.entdto.enttype }"></td>
			</tr>
		</table>
		<input type="submit" value="탈퇴 시키기" class="btn btn-default">
		<a href="ReviewManageServlet" class="btn btn-default">후기글 관리로 돌아가기</a>
	</form>
</c:if>