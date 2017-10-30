<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/test/js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

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
						url : "loginX/stayGoods",
						dataType : "text",
						data : {
							stayNum : $("#stayNum").val()
						},

						success : function(responseData, status, xhr) {
							//console.log(responseData);

							$("#result").text(responseData);
							//console.log(responseData);
							$("#re1").css("display", "none");

						},
						error : function(xhr, status, e) {
							console.log(status, e);

						}

					});

				});
				
				$("#staylo > option[value=${stayRetrieve.stayLocation}]").attr(
						"selected", "true");
				$("#stayty > option[value=${stayRetrieve.stayType}]").attr(
						"selected", "true");
				$("#staygd > option[value=${stayRetrieve.stayGrade}]").attr(
						"selected", "true");
				
			});
</script>

<script type="text/javascript">
$(document).ready(function() {
		
		var RegName = /^[가-힣a-zA-Z0-9_-]{2,20}$/; //이름 유효성 검사 2~20자 사이
		var RegTitle =  /^[가-힣a-zA-Z0-9_-]{4,30}$/;  //제목 유효성 검사 4~30자 사이
		var RegAvgPrice = /^[0-9]{3,11}$/; //어른,어린이 가격 유효성 검사
		var RegPhone = /^[0-9]{9,11}$/; //전화번호 유효성 검사
		
		 
		$("form").submit(function(){
			if ( !RegName.test($.trim($("#stayName").val())) )
			{
				alert("숙박업소 이름에 2~20자로 입력해주세요.");
				$("#stayName").focus();
				return false;
			}
			else if ( !RegTitle.test($.trim($("#stayTitle").val())) )
			{
				alert("제목에  4~30자로 입력해주세요.");
				$("#stayTitle").focus();
				return false;
			}
			else if ($("#stayLocation").val() == "def") {
                alert("지역을 선택해주세요.");
                $("#stayLocation").focus();
			return false;	 
       		}
			else if ($("#stayType").val() == "def2") {
                alert("숙박업소 종류를 선택해주세요.");
                $("#stayType").focus();
			return false;	 
       		}
			else if ($("#stayGrade").val() == "def3") {
                alert("숙박업소 등급을 선택해주세요.");
                $("#stayGrade").focus();
			return false;	 
       		}
			else if ($("#addr1").val() == "") {
                alert("주소를 입력해주세요.");
                $("#addr1").focus();
			return false;	 
        	}
			else if ( !RegAvgPrice.test($.trim($("#stayAdultPrice").val())) )
			{
				alert("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#stayAdultPrice").focus();
				return false;
			}
			else if ( !RegAvgPrice.test($.trim($("#stayKidPrice").val())) )
			{
				alert("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#stayKidPrice").focus();
				return false;
			}
			else if ( !RegPhone.test($.trim($("#stayPhone").val())))
			{
				alert("전화번호 입력란에 9~11자리와 숫자만 입력해주세요.");
				$("#stayPhone").focus();
				return false;
			}
			
			else if ($("#stayContent").val() == "") {
                alert("내용을 입력해주세요.");
                $("#stayContent").focus();
			return false;
        	}
			/* else if ($("#imgInp").val() == "") {
                alert("이미지를 삽입해주세요.");
                $("#imgInp").focus();
			return false;	 
        	} */
		});
	});
	
	$(document).ready(function() {
		$('#stayName').keyup(function() {
		 if ($('#stayName').val().length < 2 ) {
				$('font[name=check]').css("color", "red");
				$('font[name=check]').text("숙박업소 이름에 2~20자로 입력해주세요.");
				}
			  else {
				$('font[name=check]').css("color", "blue");
				$('font[name=check]').text("숙박업소 이름에 2~20자로 입력해주세요.");
			}
		});
	});//stayName
		
	$(document).ready(function() {
		$('#stayTitle').keyup(function() {
			if ($('#stayTitle').val().length < 4) {
				$('font[name=check2]').css("color", "red");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
			else {
				$('font[name=check2]').css("color", "blue");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
		});
	});//stayTitle
	
	$(document).ready(function() {
		$('#stayAdultPrice').keyup(function() {
			if ($('#stayAdultPrice').val().length < 3) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
		$('#stayKidPrice').keyup(function() {
			if ($('#stayKidPrice').val().length < 3) {
				$('font[name=check4]').css("color", "red");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check4]').css("color", "blue");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
	});//stayPrice
	
	$(document).ready(function() {
		$('#stayPhone').keyup(function() {
			if ($('#stayPhone').val().length < 9) {
				$('font[name=check5]').css("color", "red");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
			else {
				$('font[name=check5]').css("color", "blue");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
		});
	});//stayPhone

</script>

<FORM action="/test/loginX/stayUpdate" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="stayNum" value="${stayRetrieve.stayNum}"
		id="stayNum"> <input type="hidden" name="stayImage"
		value="${stayRetrieve.stayImage}"> <input type="hidden"
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
						<td class="td_default" align="center"><font size="5"><b>숙박업소
									정보 </b></font> &nbsp;</td>

					</tr>

					<tr>
						<td>숙박업소 번호:${stayRetrieve.stayNum}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록날짜:${stayRetrieve.stayWriteDay}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수:${stayRetrieve.stayReadCnt}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> 좋아요수: <span
							id="re1">${stayRetrieve.stayGoods}</span> <c:if
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
							test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == stayRetrieve.entNum)}">
							<tr>
								<!-- 이미지 수정부 -->
								<td rowspan="14"><input type="file" name="stayImage"
									id="imgInp"> <img id="imgview"
									src="image/${stayRetrieve.stayImageClone}"
									alt="사진을 바꾸시려면 눌러주세요." border="0" align="center" width="300" />

									<br>현재파일:${stayRetrieve.stayImage}</td>
						</c:if>
						<c:if
							test="${!empty sessionScope.admLogin || !empty sessionScope.comLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum != stayRetrieve.entNum))
						|| (empty sessionScope.entLogin && empty sessionScope.comLogin && empty sessionScope.admLogin)}">
							<tr>
								<!-- 이미지 화면부 -->
								<td rowspan="13"><img
									src="image/${stayRetrieve.stayImageClone}" border="0"
									align="center" width="300" /><br> <a
									class="btn btn-primary"
									href="/test/do1?stayImageClone=${stayRetrieve.stayImageClone}&stayImage=${stayRetrieve.stayImage}">다운받기</a>

								</td>
						</c:if>

						<td class="td_title">숙박업소 이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="stayName" id="stayName" value="${stayRetrieve.stayName}"
							class="form-control"><font name="check" size="2"></td>

						</tr>

					</div>
					<div class="form-inline">
						<td class="td_title">숙박업소 제목</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="stayTitle" id="stayTitle" value="${stayRetrieve.stayTitle}"
							class="form-control"><font name="check2" size="2"></td>

					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">숙박업소 지역</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="stayLocation" id="stayLocation" class="form-control" id="staylo">
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
							</select>
							</td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">숙박업소 종류</td>

							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="stayType" id="stayType" class="form-control" id="stayty">
									<option value="def2">숙박업소 종류 선택</option>
									<option value="게스트하우스">게스트하우스</option>
									<option value="아파트">아파트</option>
									<option value="모텔">모텔</option>
									<option value="호텔">호텔</option>
									<option value="호스텔">호스텔</option>
									<option value="펜션">펜션</option>
									<option value="홈스테이">홈스테이</option>
									<option value="템플스테이">템플스테이</option>
							</select>
							</td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">숙박업소 등급</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="stayGrade" id="stayGrade" class="form-control" id="staygd">
									<option value="def3">숙박업소 등급 선택</option>
									<option value="1성">1성</option>
									<option value="1.5성">1.5성</option>
									<option value="2성">2성</option>
									<option value="2.5성">2.5성</option>
									<option value="3성">3성</option>
									<option value="3.5성">3.5성</option>
									<option value="4성">4성</option>
									<option value="4.5성">4.5성</option>
									<option value="5성">5성</option>
							</select>
							</td>
						</tr>
					</div>





					<!-- 다음주소 시작-->
					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == stayRetrieve.entNum)}">
						<tr>
							<div class="form-inline">
								<div class="form-group">
									<td class="td_title">우편 번호:</td>

									<td class="td_default" colspan="2" style='padding-left: 30px'>

										<input name="post1" id="post1" size="5" readonly=""
										class="form-inline"> - <input name="post2" id="post2"
										size="5" readonly="" class="form-inline"> <input
										onclick="openDaumPostcode()" type="button" value="우편번호찾기"
										id="button" class="btn btn-default btn-xs">
									</td>
								</div>

							</div>
						</tr>
					</c:if>
					<tr>
						<div class="form-group">
							<td class="td_title">도로명 주소</td>

							<td class="td_default" colspan="2" style='padding-left: 30px'><input
								type="text" name="stayAddr1" value="${stayRetrieve.stayAddr1}"
								placeholder="도로명주소" id="addr1" size="40" readonly=""
								class="form-control"></td>


						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td class="td_title">지번 주소</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'><input
								type="text" name="stayAddr2" value="${stayRetrieve.stayAddr2}"
								placeholder="지번주소" id="addr2" size="40" readonly=""
								class="form-control"></td>
						</div>
					</tr>
					<!-- 다음주소 끝 -->
					</div>

					<div class="form-inline">
						<tr>
							<td class="td_title">숙박업소 성인가격</td>
							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${stayRetrieve.stayAdultPrice}"
									pattern="\###,###" var="aap" /> <input type="text"
								name="stayAdultPrice" id="stayAdultPrice" value="${stayRetrieve.stayAdultPrice}"
								class="form-control"><font name="check3" size="2"></td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>
							<td class="td_title">숙박업소 어린이가격</td>
							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${stayRetrieve.stayKidPrice}"
									pattern="\###,###" var="akp" /> <input type="text"
								name="stayKidPrice" id="stayKidPrice" value="${stayRetrieve.stayKidPrice}"
								class="form-control"><font name="check4" size="2"></td>
						</tr>
					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">숙박업소 전화번호</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<input type="text" name="stayPhone" id="stayPhone"
								value="${stayRetrieve.stayPhone}" class="form-control">
								<font name="check5" size="2">

							</td>
						</tr>
					</div>
					<tr>
						<td class="td_title">숙박업소 설명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
							<input type="text" name="stayContent" id="stayContent"
							value="${stayRetrieve.stayContent}" class="form-control">

						</td>
					</tr>
					<c:if test="${empty sessionScope.admLogin}">

						<tr>
							<td class="td_title">숙박업소사이트 바로가기</td>


							<c:if test="${stayRetrieve.staySite == '홈페이지 주소 없음'}">
								<td class="td_default" colspan="2" style='padding-left: 30px'>
									${stayRetrieve.staySite}</td>
							</c:if>
							<c:if test="${stayRetrieve.staySite != '홈페이지 주소 없음'}">
								<td class="td_default" colspan="2" style='padding-left: 30px'>
									<a href="${stayRetrieve.staySite}">${stayRetrieve.staySite}</a>
								</td>

							</c:if>


						</tr>
					</c:if>

					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == stayRetrieve.entNum)}">
						<tr>
							<td class="td_title">숙박업소사이트 수정</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>

								<input type="text" name="staySite" id="staySite"
								value="${stayRetrieve.staySite}">

							</td>
						</tr>

					</c:if>

				</table>

			</td>

		</tr>
	</table>

	<!-- 구글맵 위치정보  -->
	<br>
	<jsp:include page="/WEB-INF/views/include/staygooglemap.jsp" flush="true" />


	<h3 align=center>위치</h3>

	<div name="myMap" id="myMap" style="width: 50%; height: 450px; margin: auto">

	</div>
	<!-- 구글맵 끝 -->


	<div id="conta">

		<c:if test="${!empty sessionScope.comLogin}">

			<a href="packageOrderForm?stayNum=${stayRetrieve.stayNum}"
				class="btn btn-default">패키지에 추가하기</a>
	&nbsp;&nbsp;
</c:if>

		<c:if
			test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == stayRetrieve.entNum)}">


			<input type="submit" class="btn btn-default" value="수정 하기">
		</c:if>
		<c:if
			test="${!empty sessionScope.admLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == stayRetrieve.entNum))}">
			<a href="loginX/stayDelete?stayNum=${stayRetrieve.stayNum}"
				class="btn btn-default">삭제 하기</a>
		</c:if>


		<a href="stayList" class="btn btn-default">목록으로</a>

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