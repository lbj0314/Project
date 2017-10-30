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
						url : "/test/loginX/restGoods",
						dataType : "text",
						data : {
							restNum : $("#restNum").val()
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
				$("#restlo > option[value=${restRetrieve.restLocation}]").attr(
						"selected", "true");
				$("#restty > option[value=${restRetrieve.restType}]").attr(
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
			if ( !RegName.test($.trim($("#restName").val())) )
			{
				alert("음식점 이름에 2~20자로 입력해주세요.");
				$("#restName").focus();
				return false;
			}
			else if ( !RegTitle.test($.trim($("#restTitle").val())) )
			{
				alert("제목에  4~30자로 입력해주세요.");
				$("#restTitle").focus();
				return false;
			}
			else if ($("#restLocation").val() == "def") {
                alert("지역을 선택해주세요.");
                $("#restLocation").focus();
			return false;	 
       		}
			else if ($("#restType").val() == "def2") {
                alert("음식점 종류를 선택해주세요.");
                $("#restType").focus();
			return false;	 
       		}
			else if ($("#addr1").val() == "") {
                alert("주소를 입력해주세요.");
                $("#addr1").focus();
			return false;	 
        	}
			else if ( !RegAvgPrice.test($.trim($("#restPrice").val())) )
			{
				alert("1인당 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#restAdultPrice").focus();
				return false;
			}
			/* else if ( !RegAvgPrice.test($.trim($("#restKidPrice").val())) )
			{
				alert("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#restKidPrice").focus();
				return false;
			} */
			else if ( !RegPhone.test($.trim($("#restPhone").val())))
			{
				alert("전화번호 입력란에 9~11자리와 숫자만 입력해주세요.");
				$("#restPhone").focus();
				return false;
			}
			
			else if ($("#restContent").val() == "") {
                alert("내용을 입력해주세요.");
                $("#restContent").focus();
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
		$('#restName').keyup(function() {
		 if ($('#restName').val().length < 2 ) {
				$('font[name=check]').css("color", "red");
				$('font[name=check]').text("음식점 이름에 2~20자로 입력해주세요.");
				}
			  else {
				$('font[name=check]').css("color", "blue");
				$('font[name=check]').text("음식점 이름에 2~20자로 입력해주세요.");
			}
		});
	});//restName
		
	$(document).ready(function() {
		$('#restTitle').keyup(function() {
			if ($('#restTitle').val().length < 4) {
				$('font[name=check2]').css("color", "red");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
			else {
				$('font[name=check2]').css("color", "blue");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
		});
	});//restTitle
	
	$(document).ready(function() {
		$('#restPrice').keyup(function() {
			if ($('#restPrice').val().length < 3) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("1인당 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("1인당 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
		/* $('#restKidPrice').keyup(function() {
			if ($('#restKidPrice').val().length < 3) {
				$('font[name=check4]').css("color", "red");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check4]').css("color", "blue");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		}); */
	});//restPrice
	
	$(document).ready(function() {
		$('#restPhone').keyup(function() {
			if ($('#restPhone').val().length < 9) {
				$('font[name=check4]').css("color", "red");
				$('font[name=check4]').text("숫자 9-11자리로 입력해주세요");
			}
			else {
				$('font[name=check4]').css("color", "blue");
				$('font[name=check4]').text("숫자 9-11자리로 입력해주세요");
			}
		});
	});//restPhone

</script>

<FORM action="/test/loginX/restUpdate" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="restNum" value="${restRetrieve.restNum}"
		id="restNum"> <input type="hidden" name="restImage"
		value="${restRetrieve.restImage}"> <input type="hidden"
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
						<td class="td_default" align="center"><font size="5"><b>음식점
									정보 </b></font> &nbsp;</td>

					</tr>

					<tr>
						<td>음식점 번호:${restRetrieve.restNum}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록날짜:${restRetrieve.restWriteDay}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수:${restRetrieve.restReadCnt}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> 좋아요수: <span
							id="re1">${restRetrieve.restGoods}</span> <c:if
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
							test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">
							<tr>
								<!-- 이미지 수정부 -->
								<td rowspan="12"><input type="file" name="restImage"
									id="imgInp"> <img id="imgview"
									src="image/${restRetrieve.restImageClone}"
									alt="사진을 바꾸시려면 눌러주세요." border="0" align="center" width="300" />

									<br>현재파일:${restRetrieve.restImage}</td>
						</c:if>
						<c:if
							test="${!empty sessionScope.admLogin || !empty sessionScope.comLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum != restRetrieve.entNum))
						|| (empty sessionScope.entLogin && empty sessionScope.comLogin && empty sessionScope.admLogin)}">
							<tr>
								<!-- 이미지 화면부 -->
								<td rowspan="11"><img
									src="image/${restRetrieve.restImageClone}" border="0"
									align="center" width="300" /><br> <a
									class="btn btn-primary"
									href="/test/do2?restImageClone=${restRetrieve.restImageClone}&restImage=${restRetrieve.restImage}">다운받기</a>

								</td>
						</c:if>

						<td class="td_title">음식점 이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="restName" id="restName" value="${restRetrieve.restName}"
							class="form-control"><font name="check" size="2"></td>

						</tr>

					</div>
					<div class="form-inline">
						<td class="td_title">음식점 제목</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><input
							type="text" name="restTitle" id="restTitle" value="${restRetrieve.restTitle}"
							class="form-control"><font name="check2" size="2"></td>

					</div>
					<div class="form-inline">
						<tr>

							<td class="td_title">음식점 지역</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="restLocation" id="restLocation" class="form-control" id="restlo">
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
							<td class="td_title">음식점 종류</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<select name="restType" id="restType" class="form-control" id="restty">
									<option value="def2">음식점 선택</option>
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
					
					<!-- 다음주소 시작-->
					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">
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
								type="text" name="restAddr1" value="${restRetrieve.restAddr1}"
								placeholder="도로명주소" id="addr1" size="40" readonly=""
								class="form-control"></td>
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td class="td_title">지번 주소</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'><input
								type="text" name="restAddr2" value="${restRetrieve.restAddr2}"
								placeholder="지번주소" id="addr2" size="40" readonly=""
								class="form-control"></td>
						</div>
					</tr>
					<!-- 다음주소 끝 -->
					</div>
					
					<div class="form-inline">
						<tr>
							<td class="td_title">1인당 평균 가격</td>
							<td class="td_red" colspan="2" style='padding-left: 30px'><fmt:formatNumber
									type="currency" value="${restRetrieve.restPrice}"
									pattern="\###,###" var="aap" /> <input type="text"
								name="restPrice" id="restPrice" value="${restRetrieve.restPrice}"
								class="form-control"><font name="check3" size="2"></td>
						</tr>
					</div>

					<div class="form-inline">
						<tr>

							<td class="td_title">음식점 전화번호</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								<input type="text" name="restPhone" id="restPhone"
								value="${restRetrieve.restPhone}" class="form-control">
								<font name="check4" size="2">
							</td>
						</tr>
					</div>
					<tr>
						<td class="td_title">음식점 설명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
							<input type="text" name="restContent" id="restContent"
							value="${restRetrieve.restContent}" class="form-control">

						</td>
					</tr>
					<c:if test="${empty sessionScope.admLogin}">

						<tr>
							<td class="td_title">음식점 사이트 바로가기</td>
							<c:if test="${restRetrieve.restSite == '홈페이지 주소 없음'}">
							<td class="td_default" colspan="2" style='padding-left: 30px'>
								${restRetrieve.restSite}</td>
							</c:if>
							 <c:if test="${restRetrieve.restSite != '홈페이지 주소 없음'}">
								<td class="td_default" colspan="2" style='padding-left: 30px'>
									<a href="${restRetrieve.restSite}">${restRetrieve.restSite}</a></td>
								
						     </c:if>
						</tr>
					</c:if>
					<c:if
						test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">
						<tr>
							<td class="td_title">음식점 사이트 수정</td>
							<td class="td_default" colspan="2" style='padding-left: 30px'>

								<input type="text" name="restSite" id="restSite"
								value="${restRetrieve.restSite}">

							</td>
						</tr>

					</c:if>

				</table>

			</td>

		</tr>
	</table>

	<!-- 구글맵 위치정보  -->
	<br>
	<jsp:include page="/WEB-INF/views/include/restgooglemap.jsp" flush="true" />


	<h3 align=center>위치</h3>

	<div id="myMap" style="width: 50%; height: 450px; margin: auto">

		<!-- 구글맵 끝 -->

	</div>

	<div id="conta">

		<c:if test="${!empty sessionScope.comLogin}">

			<a href="packageOrderForm?restNum=${restRetrieve.restNum}" class="btn btn-default">패키지에 추가하기</a>
	&nbsp;&nbsp;	
</c:if>

		<c:if
			test="${!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum)}">


			<input type="submit" class="btn btn-default" value="수정 하기">
		</c:if>
		<c:if
			test="${!empty sessionScope.admLogin || (!empty sessionScope.entLogin && (sessionScope.entLogin.entnum == restRetrieve.entNum))}">
			<a href="/test/loginX/restDelete?restNum=${restRetrieve.restNum}"
				class="btn btn-default">삭제 하기</a>
		</c:if>


		<a href="/test/restList" class="btn btn-default">목록으로</a>

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
