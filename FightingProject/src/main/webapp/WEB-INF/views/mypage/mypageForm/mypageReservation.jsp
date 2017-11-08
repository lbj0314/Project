<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<c:forEach var="item" items="${requestScope.order}" varStatus="status">
	${item.packName}&nbsp;&nbsp;&nbsp;&nbsp;${item.startDay}&nbsp;&nbsp;&nbsp;&nbsp;${item.endDay}&nbsp;&nbsp;&nbsp;&nbsp;
	${item.payment}&nbsp;&nbsp;&nbsp;&nbsp;${item.price}&nbsp;&nbsp;&nbsp;&nbsp;${item.adult}&nbsp;&nbsp;&nbsp;&nbsp;			
	${item.kid}&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
	<c:forEach var="cc" items="${item.packrelist}" varStatus="status">
		${cc.day}&nbsp;&nbsp;&nbsp;&nbsp;${cc.type}&nbsp;&nbsp;&nbsp;&nbsp;${cc.name}&nbsp;&nbsp;&nbsp;&nbsp;
		${cc.location}&nbsp;&nbsp;&nbsp;&nbsp;${cc.style}&nbsp;&nbsp;&nbsp;&nbsp;${cc.adultPrice}&nbsp;&nbsp;&nbsp;&nbsp;
		${cc.kidPrice}&nbsp;&nbsp;&nbsp;&nbsp;${cc.phone}&nbsp;&nbsp;&nbsp;&nbsp;<br>
	</c:forEach>				<br><br><br>
</c:forEach>
	