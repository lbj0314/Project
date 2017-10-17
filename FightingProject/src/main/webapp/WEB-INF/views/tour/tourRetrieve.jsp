<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/project/js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<%-- <c:if test="${!empty requestScope.goodok}">
	<script>
		alert('${requestScope.goodok}');
	</script>

</c:if> --%>


<script type="text/javascript">
	$(document).ready(
			function() {

				$("#xxx").on("click", function(event) {
					//event.preventDefault();
					//ajax 지역별 통신
					$.ajax({
						type : "get",
						url : "TourGoodServlet",
						dataType : "text",
						data : {
							attNum : $("#attNum").val()
						},

						success : function(responseData, status, xhr) {
							console.log(responseData);

							$("#result").text(responseData);
							$("#re1").css("display", "none");

						},
						error : function(xhr, status, e) {
							console.log(status, e);

						}

					});

				});
				$("#attlo > option[value=${tourRetrieve.attLocation}").attr(
						"selected", "true");
				$("#attty > option[value=${tourRetrieve.attType}").attr(
						"selected", "true");

			});
</script>


<FORM action="loginX/tourUpdate" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="attNum" value="${tourRetrieve.attNum}"
		id="attNum"> <input type="hidden" name="attImage"
		value="${tourRetrieve.attImage}"> <input type="hidden"
		name="entNum" value="${sessionScope.entLogin.entnum}">
	<table align="center" width="100%" cellspacing="0" cellpadding="0"
		style='margin-left: 18%'>
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>



				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>

					<tr>
						<td class="td_default" align="center"><font size="5"><b>업소
									정보 </b></font> &nbsp;</td>

					</tr>

					<tr>
						<td>업소 번호:${tourRetrieve.attNum}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록날짜:${tourRetrieve.attWriteDay}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수:${tourRetrieve.attReadCnt}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> 좋아요수: <span
							id="re1">${tourRetrieve.attGoods}</span> <c:if
								test="${!empty sessionScope.comLogin}">

								<span id="result"></span>
								<button type="button" id="xxx" class="btn btn-default btn-xs">


									<img src="/test/images/goods.png">
								</button>
							</c:if>
						</td>





					</tr>


					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<div class="form-inline">



						<c:if
							test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == tourRetrieve.entNum)}">
							<tr>
								<!-- 이미지 수정부 -->
								<td rowspan="13"><input type="file" name="attImage"
									id="imgInp"> <img id="imgview"
									src="image/${tourRetrieve.attImageClone}"
									alt="사진을 바꾸시려면 눌러주세요." border="0" align="center" width="300" />

									<br>현재파일:${tourRetrieve.attImage}</td>
						</c:if>
						<c:if
							test="${!empty sessionScope.admLogin || !empty sessionScope.comLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum != tourRetrieve.entNum))
						|| (empty sessionScope.entLogin && empty sessionScope.comLogin && empty sessionScope.admLogin)}">
							<tr>
								<!-- 이미지 화면부 -->
								<td rowspan="12"><img
									src="image/${tourRetrieve.attImageClone}" border="0"
									align="center" width="300" /><br> <a
									class="btn btn-primary"
									href="/test/do?attImageClone=${tourRetrieve.attImageClone}&attImage=${tourRetrieve.attImage}">다운받기</a>

								</td>
						</c:if>

						<td class="td_title">업소 이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="attName" value="${tourRetrieve.attName}"
							class="form-control"></td>

						</tr>

					</div>
					<div class="form-inline">
						<td class="td_title">업소 제목</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="attTitle" value="${tourRetrieve.attTitle}"
							class="form-control"></td>

					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">업소 지역</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="attLocation" class="form-control" id="attlo">
									<option>지역선택</option>
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
							</select>
							</td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">업소 타입</td>

							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="attType" class="form-control" id="attty">
									<option value="def">타입선택</option>
									<option value="자연">자연</option>
									<option value="체험">체험</option>
									<option value="역사">역사</option>
									<option value="테마">테마</option>
									<option value="쇼핑">쇼핑</option>

							</select>
							</td>
						</tr>
						<!-- 다음주소 시작-->
						<c:if test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == tourRetrieve.entNum)}">
						<tr>
							<div class="form-inline">
								<div class="form-group">
								<td class="td_title">우편 번호:</td>
								
								<td class="td_default" colspan="2" style='padding-left: 30px'>
								
								<input id="post1" size="5" readonly=""
									class="form-inline"> - <input id="post2"
									size="5" readonly="" class="form-inline"> <input
									onclick="openDaumPostcode()" type="button" value="우편번호찾기"
									id="button" class="btn btn-default btn-xs"></td>
								</div>
						
						</div>
					</tr>
					</c:if>
					<tr>
						<div class="form-group">
							<td class="td_title">도로명 주소</td>
							
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="attAddr1" value="${tourRetrieve.attAddr1}" placeholder="도로명주소" id="addr1" size="40" readonly=""
							class="form-control"></td>
							
					
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td class="td_title">지번 주소</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="attAddr2" value="${tourRetrieve.attAddr2}" placeholder="지번주소" id="addr2" size="40" readonly=""
							class="form-control"></td>
						</div>
					</tr>
					<!-- 다음주소 끝 -->
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">업소 성인가격</td>




							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${tourRetrieve.attAdultPrice}"
									pattern="\###,###" var="aap" /> <input type="text"
								name="attAdultPrice" value="${tourRetrieve.attAdultPrice}"
								class="form-control"></td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">업소 어린이가격</td>




							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${tourRetrieve.attKidPrice}"
									pattern="\###,###" var="akp" /> <input type="text"
								name="attKidPrice" value="${tourRetrieve.attKidPrice}"
								class="form-control"></td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">업소 전화번호</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<input type="text" name="attPhone"
								value="${tourRetrieve.attPhone}" class="form-control">


							</td>
						</tr>
					</div>
					<tr>
						<td class="td_title">업소 설명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
							<input type="text" name="attContent"
							value="${tourRetrieve.attContent}" class="form-control">

						</td>
					</tr>
					<c:if test="${empty sessionScope.admLogin}">

						<tr>
							<td class="td_title">업소사이트 바로가기</td>

							<c:if test="${tourRetrieve.attSite == '홈페이지 주소 없음'}">
								<td class="td_default" colspan="2" style='padding-left: 30px'>
									${tourRetrieve.attSite}</td>
							</c:if>
							<c:if test="${tourRetrieve.attSite != '홈페이지 주소 없음'}">
								<td class="td_default" colspan="2" style='padding-left: 30px'>
									<a href="${tourRetrieve.attSite}">${tourRetrieve.attSite}</a>
								</td>

							</c:if>
						</tr>
					</c:if>

					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == tourRetrieve.entNum)}">
						<tr>
							<td class="td_title">업소사이트 수정</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>

								<input type="text" name="attSite"
								value="${tourRetrieve.attSite}">

							</td>
						</tr>

					</c:if>

				</table>

			</td>

		</tr>

	</table>


	<!-- 구글맵 위치정보  -->
	<br>
	<jsp:include page="/WEB-INF/views/include/tourgooglemap.jsp" flush="true" />


	<h3 align=center>위치</h3>

	<div id="myMap" style="width: 50%; height: 450px; margin: auto">

	<!-- 구글맵 끝 -->

	</div>

	<div id="conta">

		<c:if test="${!empty sessionScope.comLogin}">
			<a href="orderFormServlet?attNum=${tourRetrieve.attNum}"
				class="btn btn-default">패키지에 추가하기</a>
			
	&nbsp;&nbsp;
</c:if>

		<c:if
			test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == tourRetrieve.entNum)}">


			<input type="submit" class="btn btn-default" value="수정 하기">
		</c:if>
		<c:if
			test="${!empty sessionScope.admLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == tourRetrieve.entNum))}">
			<a href="loginX/tourDelete?attNum=${tourRetrieve.attNum}"
				class="btn btn-default">삭제 하기</a>
		</c:if>


		<a href="tourList" class="btn btn-default">목록으로</a>

	</div>




</FORM>
<!-- 
<script>
	function upCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount + 1;
		document.getElementById("GOODS_AMOUNT").value = amount;

	}

	function downCount() {
		var amount = parseInt(document.getElementById("GOODS_AMOUNT").value);

		amount = amount - 1;
		if (amount == 0) {
			amount = 1;
		}

		document.getElementById("GOODS_AMOUNT").value = amount;

	}

	function cartAdd(f) {
		f.action = "CartAddServlet";
	}
</script>
 -->
