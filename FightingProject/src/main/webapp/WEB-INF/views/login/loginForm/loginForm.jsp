<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<script>
	$(document).ready(function() {

		//$("#loout").attr("href", "https://accounts.google.com/logout");
		$("#loout").attr("href", "/test/googleLogout");
		$("#loout2").attr("href", "/test/naverLogout");

		$("#loin2").attr("href", "/test/naverLogout");

	});
</script>



<c:if test="${!empty sessionScope.comLogin}">
	${sessionScope.comLogin.comname }님 안녕하세요&nbsp;
	<a href="logout" class="btn btn-default">로그아웃</a>&nbsp;
	<a href="myPageForm" class="btn btn-default">마이페이지</a>&nbsp;
	<a href="packageOrderForm" class="btn btn-default">패키지바로가기</a>&nbsp;
</c:if>
<c:if test="${!empty sessionScope.entLogin}">
	${sessionScope.entLogin.entname }님 안녕하세요&nbsp;
	<a href="logout" class="btn btn-default">로그아웃</a>&nbsp;
	<a href="myPageForm" class="btn btn-default">마이페이지</a>&nbsp;
</c:if>
<c:if test="${!empty sessionScope.admLogin}">
	관리자님 안녕하세요&nbsp;
	<a href="logout" class="btn btn-default">로그아웃</a>&nbsp;
	<a href="myPageForm" class="btn btn-default">DB관리</a>&nbsp;
</c:if>
<c:if test="${!empty sessionScope.google}">

	<c:if test="${!empty aa}">
		<script>
			
			$(document).ready(function() {
				opener.parent.location.reload();
				window.close();
			});
			
		</script>
	</c:if>
	${sessionScope.google}&nbsp;
	<a id="loout"
		onclick="window.open('https://accounts.google.com/logout','win','width=500,height=500,toolbar=0,scrollbars=0,resizable=0');"
		class="btn btn-default">로그아웃</a>

</c:if>
<c:if test="${!empty sessionScope.naver}">
	<c:if test="${!empty bb}">
		<script>
		$(document).ready(function() {
			opener.parent.location.reload();
			window.close();
		});
		</script>
	</c:if>
	${sessionScope.naver}&nbsp;
	<a id="loout2"
		onclick="window.open('http://nid.naver.com/nidlogin.logout','win','width=500,height=500,toolbar=0,scrollbars=0,resizable=0');"
		class="btn btn-default">로그아웃</a>

</c:if>
<c:if
	test="${empty sessionScope.entLogin and empty sessionScope.comLogin and empty sessionScope.admLogin and empty sessionScope.google and empty sessionScope.naver}">
	<div id="conright" class="form-group">
		<form action="login" method="get" class="form-inline" id="loginForm">
			<select name="wholog" class="form-control">
				<option value="com">일반회원</option>
				<option value="ent">기업회원</option>
				<option value="adm">관리자</option>
			</select> 아이디<input type="text" name="userid" class="form-control"
				placeholder="아이디를 입력하세요."> 비밀번호<input type="password"
				name="passwd" class="form-control" placeholder="비밀번호를 입력하세요.">
			<input type="submit" value="로그인" class="btn btn-default"> <a
				href="joinForm" class="btn btn-default">회원가입</a>
		</form>
		<br> <span id="google_id_login" style="text-align: center">
			<a id="loin" href="#" onclick="window.open('${google_url}','win','width=500,height=500,toolbar=0,scrollbars=0,resizable=0')"><img
				src="images/google.jpg"></a> </span> 
		<jsp:include
				page="/WEB-INF/views/oauth/oauthtest.jsp" flush="true" />&nbsp; 


	</div>

</c:if>

<!-- /* href="${google_url}"*/ -->

