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
<script type="text/javascript">
$(document).ready(function() {
		 
		var RegName = /^[가-힣a-zA-Z0-9_-]{2,20}$/; //이름 유효성 검사 2~20자 사이
		var RegTitle =  /^[가-힣a-zA-Z0-9_-]{4,30}$/;  //제목 유효성 검사 4~30자 사이
		var RegAvgPrice = /^[0-9]{3,11}$/; //1인당 평균 가격 유효성 검사
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
			else if ( !RegAvgPrice.test($.trim($("#restAdultPrice").val())) )
			{
				alert("성인 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#restAdultPrice").focus();
				return false;
			}
			else if ( !RegAvgPrice.test($.trim($("#restKidPrice").val())) )
			{
				alert("어린이 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#restKidPrice").focus();
				return false;
			}
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
			else if ($("#imgInp").val() == "") {
                alert("이미지를 삽입해주세요.");
                $("#imgInp").focus();
			return false;	 
        	}
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
		$('#restAdultPrice').keyup(function() {
			if ($('#restAdultPrice').val().length < 3) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("성인 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("성인 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
	});//restPrice
	
	$(document).ready(function() {
		$('#restKidPrice').keyup(function() {
			if ($('#restKidPrice').val().length < 3) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("어린이 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("어린이 평균 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
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


<form action="/test/loginX/restWrite" enctype="multipart/form-data"
	method="post">
	<input type="hidden" name="entNum"
		value="${sessionScope.entLogin.entnum}">
	${sessionScope.entLogin.entnum }
	<table align=center>
		<tr>

			<div class="form-inline">
				<td align=center>음식점 이름:</td>
				<td><input type="text" name="restName" id="restName" maxlength="20" class="form-control"><font name="check" size="2"></td>



				<!-- 이미지삽입 하여야함 -->
				<td align=center>제목:</td>
				<td><input type="text" name="restTitle" id="restTitle" maxlength="30" class="form-control"><font name="check2" size="2"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td align=center>지역:</td>
				<td><select name="restLocation" id="restLocation" class="form-control">
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
				</select></td>
				<td align=center>음식점 종류:</td>
				<td><select name="restType" id="restType" class="form-control">
						<option value="def2">음식점 종류 선택</option>
						<option value="한식">한식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="양식">양식</option>
						<option value="패스트푸드">패스트푸드</option>
						<option value="제과">제과</option>

				</select></td>
			</div>
		</tr>
		
		<!-- 다음주소 시작-->
		<tr>
		<div class="form-inline">
			<td  align=center>우편 번호:</td>
			<td colspan=3><input name="post1" id="post1" size="5" readonly="" class="form-inline">
				- <input name="post2" id="post2" size="5" readonly="" class="form-inline"> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"
				id="button" class="btn btn-default btn-xs"></td>
				</div>
		</tr>
		<tr>
		<div class="form-inline">
			<td align=center>도로명 주소:</td>
			<td><input name="restAddr1" id="addr1"  readonly=""
				placeholder="도로명주소" class="form-control"></td>
				
		
		
			<td align=center>지번 주소:</td>
			<td><input name="restAddr2" id="addr2"  readonly=""
				placeholder="지번주소(기업회원의 경우 업소 지역)" class="form-control"></td>
			</div>
		</tr>
		<!-- 다음주소 끝 -->
		
		
		
		
		
		
		<tr>
			<div class="form-inline">
			
			<div class="form-inline">
				<td align=center>음식점 성인가격:</td>
				<td><input type="text" name="restAdultPrice" id="restAdultPrice"
					class="form-control"><font name="check3" size="2"></td>
				<td align=center>음식점 어린이가격:</td>
				<td><input type="text" name="restKidPrice" id="restKidPrice" class="form-control" ><font name="check4" size="2"></td>
			</div>
			

			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=2 align=center>홈페이지 주소(없을시 적지 말것):</td>
				<td colspan=2><input type="text" name="restSite" id="restSite"
					class="form-control"></td>


			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td colspan=2 align=center>전화번호:</td>
				<td colspan=2><input type="text" name="restPhone" id="restPhone" maxlength="11"
					class="form-control"><font name="check4" size="2"></td> <br>
				</td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=4 align=center>내용</td>

			</div>
		</tr>
		<tr>
			<td colspan=4><textarea rows="10" cols="10" name="restContent" id="restContent"
					class="form-control"></textarea></td>
		</tr>

		<tr>
			<td colspan=4 align=center><h3>사진등록</h3></td>
		</tr>
		<tr>
			<td colspan=4 align=center><input type="file" name="restImage"
				id="imgInp"> <img id="imgview" src="#" alt="사진을 넣어주세요." />


			</td>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=2 align=center><input type="submit" value="등록"
					class="btn btn-default btn-lg"></td>
				<td colspan=2 align=center><input type="reset" value="다시쓰기"
					class="btn btn-default btn-lg"></td>
			</div>
		</tr>
	</table>
</form>
