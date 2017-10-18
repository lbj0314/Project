<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">

				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="6" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
			
				<c:choose>


					<c:when test="${staylist.getList().size()==0}">


						<tr>
							<td colspan=4 align=center>검색결과가 없습니다.</td>
						</tr>
					</c:when>


					<c:otherwise>


						<tr>
							<c:forEach var="xxx" items="${staylist.getList()}"
								varStatus="status">

								<td>
									<table style='padding: 15px'>
										<tr>
											<td><a href="StayBoardRetrieveServlet?stayNum=${xxx.stayNum}">
													<img src="image/${xxx.stayImageClone}" border="0"
													align="center" width="200">

											</a></td>
										</tr>
										<tr>

											<td height="10">
										</tr>
										<tr>
											<td class="td_default" align="center"><a class="a_black"
												href="StayBoardRetrieveServlet?stayNum=${xxx.stayNum}">
													숙박업소제목:${xxx.stayTitle}<br>
											</a></td>

										</tr>
										<tr>
											<td class="td_gray" align="center">숙박업소명:${xxx.stayName}</td>
										</tr>
										<tr>
											<td class="td_gray" align="center">지역:${xxx.stayLocation}</td>
										</tr>

										<tr>
											<td class="td_gray" align="center">숙박업소전화번호:${xxx.stayPhone}
											</td>
										</tr>
									</table>
								</td>

								<c:if test="${(status.index+1)%3==0}">


									<tr>
										<td height="10">
									</tr>

								</c:if>
							</c:forEach>
						</tr>
						</c:otherwise>
						</c:choose>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
	<c:if test="${staylist.getList().size()!=0}">
		<tr>
			<td colspan="5"><jsp:include page="/WEB-INF/views/stay/stay_boardpage.jsp"
					flush="true" /></td>
		</tr>
	</c:if>
	<tr>
	<td colspan=8 align=center>
	<c:if test="${!empty sessionScope.entLogin}">
		<a href="/test/loginX/stayWrite" class="btn btn-primary">글쓰기</a>
	</c:if>
	
	<td>
	</tr>
	
</table>