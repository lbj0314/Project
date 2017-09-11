<%@page import="com.dto.stay.StayDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jQeury문 -->
<script type="text/javascript">
	$(document).ready(function() {
		 var desc = "<input type='hidden' name='stayBtn' value='cc'>";
		 var asc = "<input type='hidden' name='stayBtn' value='dd'>";
		$("#staylo").on("change", function(event) {
			//ajax 지역별 통신
			$.ajax({
				type : "get",
				url : "StayBoardListServlet",
				data : {
					stayLocation : $("#staylo").val()
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
		$("#stayty").on("change", function(event) {
			//ajax 타입별 통신
			$.ajax({
				type : "get",
				url : "StayBoardListServlet",
				data : {
					stayType : $("#stayty").val()
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
		$("#staySearch").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "StayBoardListServlet",
				data : {
					staySearchName : $("#staySearch").val()
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
		$("#staySo").on("change", function(event) {

			//ajax 검색종류별 통신
			$.ajax({
				type : "get",
				url : "StayBoardListServlet",
				data : {
					sortStay : $('#staySo').val()

					
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

		
		
		
		
		
		$("#staylo > option[value=${staylist.stayLocation}").attr("selected", "true");
		$("#stayty > option[value=${staylist.stayType}").attr("selected", "true");
		$("#staysearch > option[value=${staylist.staySearchName}").attr("selected", "true");
		$("#staySo > option[value=${staylist.sortStay}").attr("selected", "true");
		
	});
</script>

<form action="StayBoardListServlet" id="aaa">
	<input type="hidden" name="btngo" value="1" id="btngo">
	
	<div class="form-inline" id="conta">
		<select name="stayLocation" class="form-control" id="staylo">
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
		</select> <select name="stayType" class="form-control" id="stayty">
			<option value="def">타입선택</option>
			<option value="게스트 하우스">게스트 하우스</option>
			<option value="아파트">아파트</option>
			<option value="모텔">모텔</option>
			<option value="호텔">호텔</option>
			<option value="호스텔">호스텔</option>
			<option value="펜션">펜션</option>
			<option value="홈스테이">홈스테이</option>
			<option value="템플스테이">템플스테이</option>

		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="staySearchName" class="form-control" id="staySearch">
			<option value="stayTitle">숙박업소명</option>
			<option value="stayName">숙박업소제목</option>
		</select> <input type="text" name="searchValue" class="form-control" value = "${staylist.staySearchValue}"> <input
			type="submit" value="검색" class="btn btn-primary">
		
		<select name="sortStay" class="form-control" id="staySo">
		<option value="stayNoSort">선택하세요</option>
			<option value="stayGoodSort">좋아요순</option>
		<option value="staySysSort">최신순</option>
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
													<img src="images/${xxx.stayImageClone}" border="0"
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
			<td colspan="5"><jsp:include page="/stay/stay_boardpage.jsp"
					flush="true" /></td>
		</tr>
	</c:if>
	<tr>
	<td colspan=8 align=center>
	<c:if test="${!empty sessionScope.entLogin}">
		<a href="/project/stay/stay_writeview.jsp" class="btn btn-primary">글쓰기</a>
	</c:if>
	
	<td>
	</tr>
	
</table>



