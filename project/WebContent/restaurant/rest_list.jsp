<%@page import="com.dto.restaurant.RestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
						<c:forEach var="rrr" items="${restList}" varStatus="status" >

						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="RestRetrieveServlet?restNun=${rrr.restNum}"> 
											<img src="images/${rrr.restImage}.gif" border="0" align="center" width="200">
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href="RestRetrieveServlet?restNum=${rrr.restNum}"> 
										${rrr.restName}<br>
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
										${rrr.restContent}
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									${rrr.restPrice}	</strong></font></td>
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