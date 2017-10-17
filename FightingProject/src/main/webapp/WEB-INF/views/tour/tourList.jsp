<%@page import="com.dto.tour.TourDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jQeury문 -->
<script type="text/javascript">

	



	$(document).ready(function() {

		
	
		
		
		$("#attlo").on("change", function(event) {

			//ajax 지역별 통신
			$.ajax({
				type : "get",
				url : "tourList",
				data : {
					attLocation : $("#attlo").val(),
					attType : $("#attty").val(),
					sortAtt : $('#attSo').val(),
					searchName : $("#attsearch").val()
					
					
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$('#toajax').html(responseData);
					return false;
				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		$("#attty").on("change", function(event) {

			//ajax 타입별 통신
			$.ajax({
				type : "get",
				url : "tourList",
				data : {
					attLocation : $("#attlo").val(),
					attType : $("#attty").val(),
					sortAtt : $('#attSo').val(),
					searchName : $("#attsearch").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$('#toajax').html(responseData);
					return false;
					
				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		$("#attsearch").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "tourList",
				data : {
					attLocation : $("#attlo").val(),
					attType : $("#attty").val(),
					sortAtt : $('#attSo').val(),
					searchName : $("#attsearch").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$('#toajax').html(responseData);
					return false;

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});
		
		
		
		// 좋아요,조회순 
		$("#attSo").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "tourList",
				data : {
					attLocation : $("#attlo").val(),
					attType : $("#attty").val(),
					sortAtt : $('#attSo').val(),
					searchName : $("#attsearch").val()

					
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					$('#toajax').html(responseData);
					return false;
					

				},
				error : function(xhr, status, e) {
					console.log(status, e);

				}

			});

		});

		
		
		
		$("#attlo > option[value=${tourlist.attLocation}]").attr("selected", "true");
	
		$("#attty > option[value=${tourlist.attType}]").attr("selected", "true");
		$("#attsearch > option[value=${tourlist.searchName}]").attr("selected", "true");
		$("#attSo > option[value=${tourlist.sortAtt}]").attr("selected", "true");
		
	});
</script>

<form action="tourList" id="aaa">
	<input type="hidden" name="btngo" value="1" id="btngo">
	
	<div class="form-inline" id="conta">
		<select name="attLocation" class="form-control" id="attlo">
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
		</select> <select name="attType" class="form-control" id="attty">
			<option value="def">타입선택</option>
			<option value="자연">자연</option>
			<option value="체험">체험</option>
			<option value="역사">역사</option>
			<option value="테마">테마</option>
			<option value="쇼핑">쇼핑</option>

		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="searchName" class="form-control" id="attsearch">
			<option value="attTitle">업소명</option>
			<option value="attName">업소제목</option>
		</select> <input type="text" name="searchValue" class="form-control" value = "${tourlist.searchValue}"> <input
			type="submit" value="검색" class="btn btn-primary">
		
		<select name="sortAtt" class="form-control" id="attSo">
		<option value="attNoSort">선택하세요</option>
			<option value="attGoodSort">좋아요순</option>
		<option value="attSysSort">최신순</option>
		</select>
	</div>

</form>


	<div id="toajax">
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


					<c:when test="${tourlist.getList().size()==0}">


						<tr>
							<td colspan=4 align=center>검색결과가 없습니다.</td>
						</tr>
					</c:when>


					<c:otherwise>


						<tr>
							<c:forEach var="xxx" items="${tourlist.getList()}"
								varStatus="status">

								<td>
									<table style='padding: 15px'>
										<tr>
											<td><a href="tourRetrieve?attNum=${xxx.attNum}">
													<img src="image/${xxx.attImageClone}" border="0"
													align="center" width="200">

											</a></td>
										</tr>
										<tr>

											<td height="10">
										</tr>
										<tr>
											<td class="td_default" align="center"><a class="a_black"
												href="tourRetrieve?attNum=${xxx.attNum}">
													업소제목:${xxx.attTitle}<br>
											</a></td>

										</tr>
										<tr>
											<td class="td_gray" align="center">업소명:${xxx.attName}</td>
										</tr>
										<tr>
											<td class="td_gray" align="center">지역:${xxx.attLocation}</td>
										</tr>

										<tr>
											<td class="td_gray" align="center">업소전화번호:${xxx.attPhone}
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
	<c:if test="${tourlist.getList().size()!=0}">
		<tr>
			<td colspan="5"><jsp:include page="/WEB-INF/views/tour/tourpage.jsp"
					flush="true" /></td>
		</tr>
	</c:if>

	<tr>
	<td colspan=8 align=center>
	<c:if test="${!empty sessionScope.entLogin}">
		<a href="loginX/tourWriteUI" class="btn btn-primary">글쓰기</a>
	</c:if>
	
	<td>
	</tr>
	
</table>

</div>
