<%@page import="com.dto.restaurant.RestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jQeury문 -->
<script type="text/javascript">

	



	$(document).ready(function() {

		
		
		
		
		
		$("#restlo").on("change", function(event) {

			//ajax 지역별 통신
			$.ajax({
				type : "get",
				url : "RestListServlet",
				data : {
					restLocation : $("#restlo").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);

					$('#aaa').submit();

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		$("#restty").on("change", function(event) {

			//ajax 타입별 통신
			$.ajax({
				type : "get",
				url : "RestListServlet",
				data : {
					restType : $("#restty").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);

					$('#aaa').submit();

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		$("#restsearch").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "RestListServlet",
				data : {
					searchName : $("#restsearch").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);
			
					$('#aaa').submit();

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		
		
		
		// 좋아요,조회순 
		$("#restSo").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "RestListServlet",
				data : {
					sortREst : $('#restSo').val()

					
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					console.log(responseData);

					$('#aaa').submit();
					

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		//$('#changeFrm').append(newitem);
		 //$('#changeFrm').append(newitem2);

		
		
		
		
		
		$("#restlo > option[value=${restlist.restLocation}").attr("selected", "true");
		$("#restty > option[value=${restlist.restType}").attr("selected", "true");
		$("#restsearch > option[value=${restlist.searchName}").attr("selected", "true");
		$("#restSo > option[value=${restlist.sortRest}").attr("selected", "true");
		
	});
</script>

<form action="RestListServlet" id="aaa">
	<input type="hidden" name="btngo" value="1" id="btngo">
	
	<div class="form-inline" id="conta">
		<select name="restLocation" class="form-control" id="restlo">
			<option value="def">지역선택</option>
			<option value="전체">전체</option>
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="광주">광주</option>
			<option value="부산">부산</option>
			<option value="울산">울산</option>
			<option value="세종특별자치시">세종특별자치시</option>
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충청북도">충청북도</option>
			<option value="충청남도">충청남도</option>
			<option value="경상북도">경상북도</option>
			<option value="경상남도">경상남도</option>
			<option value="전라북도">전라북도</option>
			<option value="전라남도">전라남도</option>
			<option value="제주도">제주도</option>
		</select> <select name="restType" class="form-control" id="restty">
			<option value="def">맛집선택</option>
			<option value="한식">한식</option>
			<option value="일식">일식</option>
			<option value="중식">중식</option>
			<option value="양식">양식</option>
			<option value="패스트푸드">패스트푸드</option>
			<option value="제과">제과</option>

		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="searchName" class="form-control" id="restsearch">
			<option value="restTitle">업소명</option>
			<option value="restName">업소제목</option>
		</select> <input type="text" name="searchValue" class="form-control" value = "${restlist.searchValue}"> <input
			type="submit" value="검색" class="btn btn-primary">
		
		<select name="sortRest" class="form-control" id="restSo">
		<option value="restNoSort">선택하세요</option>
			<option value="restGoodSort">좋아요순</option>
		<option value="restSysSort">최신순</option>
		</select>
	</div>

</form>

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


					<c:when test="${restlist.getList().size()==0}">


						<tr>
							<td colspan=4 align=center>검색결과가 없습니다.</td>
						</tr>
					</c:when>


					<c:otherwise>


						<tr>
							<c:forEach var="xxx" items="${restlist.getList()}"
								varStatus="status">

								<td>
									<table style='padding: 15px'>
										<tr>
											<td><a href="RestRetrieveServlet?restNum=${xxx.restNum}">
													<img src="images/${xxx.restImageClone}" border="0"
													align="center" width="200">

											</a></td>
										</tr>
										<tr>

											<td height="10">
										</tr>
										<tr>
											<td class="td_default" align="center"><a class="a_black"
												href="RestRetrieveServlet?restNum=${xxx.restNum}">
													업소제목:${xxx.restTitle}<br>
											</a></td>

										</tr>
										<tr>
											<td class="td_gray" align="center">업소명:${xxx.restName}</td>
										</tr>
										<tr>
											<td class="td_gray" align="center">지역:${xxx.restLocation}</td>
										</tr>

										<tr>
											<td class="td_gray" align="center">업소전화번호:${xxx.restPhone}
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
	<c:if test="${restlist.getList().size()!=0}">
		<tr>
			<td colspan="5"><jsp:include page="/restaurant/restpage.jsp"
					flush="true" /></td>
		</tr>
	</c:if>
	<tr>
	<td colspan=8 align=center>
	<c:if test="${!empty sessionScope.entLogin}">
		<a href="/project/restaurant/restwriteview.jsp" class="btn btn-primary">글쓰기</a>
	</c:if>
	
	<td>
	</tr>
	
</table>



