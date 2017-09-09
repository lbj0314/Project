<%@page import="com.dto.fes.FesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
List<FesDTO> list=(List<FesDTO>)request.getAttribute("list");
%>


<!-- FesNum,FesName,FesPrice,FesTitle,FesContent,FesImage,FesReadCnt,FesSite -->
</head>
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
</table>


</body>
</html>


