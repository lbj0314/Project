<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${requestScope.sessionclose==true }">
	<script>
		alert("로그아웃 되었습니다.");
	</script>
</c:if>

<c:if test="${!empty requestScope.loginfail }">
	<script>
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	</script>
</c:if>

<c:if test="${!empty sessionScope.admLogin and sessionScope.alert==true}">
	<script>
		alert("관리자로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<c:if test="${!empty sessionScope.comLogin and sessionScope.alert==true}">
	<script>
		alert("일반 회원으로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<c:if test="${!empty sessionScope.entLogin and sessionScope.alert==true}">
	<script>
		alert("기업 회원으로 로그인 되었습니다.");
	</script>
	<c:set value="false" var="alert" scope="session"/>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="/project/css/style.css">

</head>
<body>
	<jsp:include page="/login/loginForm.jsp" flush="true" /><br>
	<jsp:include page="/include/top.jsp" flush="true" /><br>
	<jsp:include page="/include/main.jsp" flush="true" /><br>
	<jsp:include page="/include/copyright.jsp" flush="true" />


	<table border="1">
		<thead>
			<tr>
				<td>서울</td>
				<td>부산</td>
				<td>제주</td>
				<td>전주</td>
				<td><a href="http://www.kma.go.kr/weather/main.jsp">기상청</a></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<!-- 서울 -->
				<td valign=top style="padding: 0;"><iframe
						src="https://rp5.ru/htmla.php?id=12514&lang=ko&um=00000&bg=%23ffffff&ft=%23ffffff&fc=%23919191&c=%23000000&f=Arial&s=12&sc=4"
						width=100% height=250 frameborder=0 scrolling=no
						style="margin: 0;"></iframe></td>
				<!-- 부산 -->
				<td valign=top style="padding: 0;"><iframe
						src="https://rp5.ru/htmla.php?id=12554&lang=ko&um=00000&bg=%23ffffff&ft=%23ffffff&fc=%23fe2020&c=%23000000&f=Arial&s=12&sc=4"
						width=100% height=250 frameborder=0 scrolling=no
						style="margin: 0;"></iframe></td>
				<!-- 제주 -->
				<td valign=top style="padding: 0;"><iframe
						src="https://rp5.ru/htmla.php?id=12565&lang=ko&um=00000&bg=%23ffffff&ft=%23ffffff&fc=%23ff790a&c=%23000000&f=Arial&s=12&sc=4"
						width=100% height=250 frameborder=0 scrolling=no
						style="margin: 0;"></iframe></td>
				<!-- 전주 -->
				<td valign=top style="padding: 0;"><iframe
						src="https://rp5.ru/htmla.php?id=12547&lang=ko&um=00000&bg=%23ffffff&ft=%23ffffff&fc=%232054fe&c=%23000000&f=Arial&s=12&sc=4"
						width=100% height=250 frameborder=0 scrolling=no
						style="margin: 0;"></iframe></td>
				<td><a href="http://www.kma.go.kr/weather/main.jsp">다른 도시</a></td>
		</tbody>
	</table>
</body>
</html>