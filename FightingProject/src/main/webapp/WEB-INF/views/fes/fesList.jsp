<%@page import="com.dto.fes.FesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- <style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 28px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border-radius: 8px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button0 {
	background-color: black;
	color: white;
	border: 2px solid #000000;
}

.button0:hover {
	background-color: #000000;
	color: white;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #ff8080;
}

.button1:hover {
	background-color: #ff8080;
	color: white;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #0040ff;
}

.button2:hover {
	background-color: #0040ff;
	color: white;
}

.button3 {
	background-color: white;
	color: black;
	border: 2px solid #993300;
}

.button3:hover {
	background-color: #993300;
	color: white;
}

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #666666;
}

.button4:hover {
	background-color: #666666;
	color: white;
}
</style> -->
</head>
<body>


<%-- 	<form action="fesList" id="aaa">

		<c:forEach var="fff" items="${fesList}">
		</c:forEach>

		<input type="hidden" name="btngo" value="1" id="btngo"> <input
			type="hidden" value="${fff.FesImage}" id="btngo">
		<div class="form-inline" id="conta"> --%>
			<button onclick="/test/fesList?fesSeason=all">전체</button>
			<button onclick="/test/fes/fesList?fesSeason=spring">봄</button>
			<button onclick="/test/fesList?fesSeason=summer">여름</button>
			<button onclick="/test/fesList?fesSeason=fall">가을</button>
			<button onclick="/test/fesList?fesSeason=winter">겨울</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- </div> -->
		
		<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<c:forEach var="xxx" items="${fesList}" varStatus="status">
						<td>
							<table style='padding: 15px'>
								<tr>
									<td><a href="fesList?fesNum=${xxx.fesNum}">${xxx.fesName}
									</a></td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align="center">${xxx.fesContent}</td>
								</tr>
								<tr>
									<td class="td_gray" align="center">${xxx.FesImage}</td>
								</tr>
								<tr>
									<td class="td_gray" align="center">${xxx.FesSite}</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align="center"><font color="red">
												${xxx.fesPrice}</font></td>
								</tr>
							</table>
						</td>
${(status.index+1)%4==0}
  					<c:if test="${(status.index+1)%4==0}">
							<tr>
								<td height="10">
							</tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
		

	<%-- </form>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
						<c:forEach var="xxx" items="${fesList}" varStatus="status" >

						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="fesRetrieve?fesSeason=${xxx.fesSeason}"> 
											<img src="images/items/${xxx.gImage}.gif" border="0" align="center" width="200">
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href="GoodsRetrieveServlet?gCode=${xxx.gCode}"> 
										${xxx.gName}<br>
										</a>
										<font color="gray">
										 --------------------
										</font>
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center">
										${xxx.gContent}
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									${xxx.gPrice}	</strong></font></td>
								</tr>
							</table>
						</td>
${(status.index+1)%4==0}
  					<c:if test="${(status.index+1)%4==0}">
  					
  						
						     <tr>
								<td height="10">
							</tr>
					
		</c:if>
</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>

<c:if test="${!empty sessionScope.admLogin}">

		<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='/test/loginX/noticeWriteUI';">글쓰기</button>
		</div>
		</c:if>
	</div>

</body>
</html>

 --%>



<%-- <html>
<body>
<h1>축제 리스트</h1>
<table border="1">
<tr>
<td>축제 번호</td>
<td>축제 이름</td>
<td>축제 가격</td>
<td>축제 내용</td>
<td>축제 이미지</td>
<td>축제 사이트</td>
<td>조회수</td>
</tr>
<c:forEach var="fff" items="${fesList}">
${fff}
</c:forEach>

</table>
</body>
</html> --%>
