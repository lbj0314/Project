<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#restlo > option[value=${restRetrieve.restLocation}").attr(
						"selected", "true");
				$("#restty > option[value=${restRetrieve.restType}").attr(
						"selected", "true");
			});
</script>


<FORM action="RestUpdateServlet" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="restNum" value="${restRetrieve.restNum}">
	<input type="hidden" name="restImage" value="${restRetrieve.restImage}">
	<input type="hidden" name="entNum"
		value="${sessionScope.entLogin.entnum}">
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
						<td class="td_default" align="center"><font size="5"><b>음식점
									정보</b></font> &nbsp;</td>
					</tr>

					<tr>
						<td>음식점 번호 : ${restRetrieve.restNum}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록날짜 : ${restRetrieve.restWriteDay}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수 : ${restRetrieve.restReadCnt}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>


							좋아요수 : ${restRetrieve.restGoods} <c:if
								test="${!empty sessionScope.comLogin}">
								<a href="RestGoodServlet?restNum=${restRetrieve.restNum}"> <img
									src="/project/images/goods.png">
								</a>
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
							test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">
							<tr>
								<!-- 이미지 수정부 -->
								<td rowspan="10"><input type="file" name="restImage"
									id="imgInp"> <img id="imgview"
									src="images/${restRetrieve.restImageClone}"
									alt="사진을 바꾸시려면 눌러주세요." border="0" align="center" width="300" />

									<br>현재파일:${restRetrieve.restImage}</td>
						</c:if>
						<c:if
							test="${!empty sessionScope.admLogin || !empty sessionScope.comLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum != restRetrieve.entNum))
						|| (empty sessionScope.entLogin && empty sessionScope.comLogin && empty sessionScope.admLogin)}">
							<tr>
								<!-- 이미지 화면부 -->
								<td rowspan="9"><img
									src="images/${restRetrieve.restImageClone}" border="0"
									align="center" width="300" /><br> <a
									class="btn btn-primary"
									href="/project/RestFileDownServlet?restImageClone=${restRetrieve.restImageClone}&restImage=${restRetrieve.restImage}">다운받기</a>

								</td>
						</c:if>

						<td class="td_title">음식점 이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="restName" value="${restRetrieve.restName}"
							class="form-control"></td>

						</tr>

					</div>
					<div class="form-inline">
						<td class="td_title">음식점 제목</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="restTitle" value="${restRetrieve.restTitle}"
							class="form-control"></td>

					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">음식점 지역</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="restLocation" class="form-control" id="restlo">
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
							<td class="td_title">음식점 종류</td>

							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="restType" class="form-control" id="restty">
									<option value="def">타입선택</option>
									<option value="한식">한식</option>
									<option value="일식">일식</option>
									<option value="중식">중식</option>
									<option value="양식">양식</option>
									<option value="패스트푸드">패스트푸드</option>
									<option value="제과">제과</option>

							</select>
							</td>
						</tr>

					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">음식점 평균 가격</td>
							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${restRetrieve.restPrice}"
									prestern="\###,###" var="ap" /> <input type="text"
								name="restPrice" value="${restRetrieve.restPrice}"
								class="form-control"></td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">음식점 전화번호</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<input type="text" name="restPhone"
								value="${restRetrieve.restPhone}" class="form-control">


							</td>
						</tr>
					</div>
					<tr>
						<td class="td_title">음식점 설명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
							<input type="text" name="restContent"
							value="${restRetrieve.restContent}" class="form-control">

						</td>
					</tr>
					<c:if test="${empty sessionScope.admLogin}">

						<tr>
							<td class="td_title">음식점사이트 바로가기</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'><a
								href="${restRetrieve.restSite}">${restRetrieve.restSite}</a></td>
						</tr>
					</c:if>

					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">
						<tr>
							<td class="td_title">음식점사이트 수정</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>

								<input type="text" name="restSite"
								value="${restRetrieve.restSite}">

							</td>
						</tr>

					</c:if>

				</table>

			</td>

		</tr>
	</table>

	<br>



	<div id="conta">

		<c:if test="${!empty sessionScope.comLogin}">

			<button onclick="" class="btn btn-default">패키지 등록하러 가기</button>
	&nbsp;&nbsp;
</c:if>

		<c:if
			test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">


			<input type="submit" class="btn btn-default" value="수정 하기">
		</c:if>
		<c:if
			test="${!empty sessionScope.admLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum))}">
			<a href="RestDeleteServlet?restNum=${restRetrieve.restNum}"
				class="btn btn-default">삭제 하기</a>
		</c:if>


		<a href="RestListServlet" class="btn btn-default">목록으로</a>

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