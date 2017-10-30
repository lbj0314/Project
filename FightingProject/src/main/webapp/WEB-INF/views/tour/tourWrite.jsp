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
		var RegAvgPrice = /^[0-9]{3,11}$/; //어른,어린이 가격 유효성 검사
		var RegPhone = /^[0-9]{9,11}$/; //전화번호 유효성 검사
		
		 
		$("form").submit(function(){
			if ( !RegName.test($.trim($("#attName").val())) )
			{
				alert("관광소 이름에 2~20자로 입력해주세요.");
				$("#attName").focus();
				return false;
			}
			else if ( !RegTitle.test($.trim($("#attTitle").val())) )
			{
				alert("제목에  4~30자로 입력해주세요.");
				$("#attTitle").focus();
				return false;
			}
			else if ($("#attLocation").val() == "def") {
                alert("지역을 선택해주세요.");
                $("#attLocation").focus();
			return false;	 
       		}
			else if ($("#attType").val() == "def2") {
                alert("관광소 종류를 선택해주세요.");
                $("#attType").focus();
			return false;	 
       		}
			else if ($("#addr1").val() == "") {
                alert("주소를 입력해주세요.");
                $("#addr1").focus();
			return false;	 
        	}
			else if ( !RegAvgPrice.test($.trim($("#attAdultPrice").val())) )
			{
				alert("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#attAdultPrice").focus();
				return false;
			}
			else if ( !RegAvgPrice.test($.trim($("#attKidPrice").val())) )
			{
				alert("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
				$("#attKidPrice").focus();
				return false;
			}
			else if ( !RegPhone.test($.trim($("#attPhone").val())))
			{
				alert("전화번호 입력란에 9~11자리와 숫자만 입력해주세요.");
				$("#attPhone").focus();
				return false;
			}
			
			else if ($("#attContent").val() == "") {
                alert("내용을 입력해주세요.");
                $("#attContent").focus();
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
		$('#attName').keyup(function() {
		 if ($('#attName').val().length < 2 ) {
				$('font[name=check]').css("color", "red");
				$('font[name=check]').text("관광소 이름에 2~20자로 입력해주세요.");
				}
			  else {
				$('font[name=check]').css("color", "blue");
				$('font[name=check]').text("관광소 이름에 2~20자로 입력해주세요.");
			}
		});
	});//attName
		
	$(document).ready(function() {
		$('#attTitle').keyup(function() {
			if ($('#attTitle').val().length < 4) {
				$('font[name=check2]').css("color", "red");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
			else {
				$('font[name=check2]').css("color", "blue");
				$('font[name=check2]').text("제목에 4~30자로 입력해주세요.");
			}
		});
	});//attTitle
	
	$(document).ready(function() {
		$('#attAdultPrice').keyup(function() {
			if ($('#attAdultPrice').val().length < 3) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("성인 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
		$('#attKidPrice').keyup(function() {
			if ($('#attKidPrice').val().length < 3) {
				$('font[name=check4]').css("color", "red");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
			else {
				$('font[name=check4]').css("color", "blue");
				$('font[name=check4]').text("어린이 가격 입력란에 3~11자리의 숫자만 입력해주세요.");
			}
		});
	});//attPrice
	
	$(document).ready(function() {
		$('#attPhone').keyup(function() {
			if ($('#attPhone').val().length < 9) {
				$('font[name=check5]').css("color", "red");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
			else {
				$('font[name=check5]').css("color", "blue");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
		});
	});//attPhone

</script>

<form action="/test/loginX/tourWrite" enctype="multipart/form-data" method="post">
	<input type="hidden" name="entNum" value="${sessionScope.entLogin.entnum}">
	<!-- <input type="hidden" name="attCloneImage" value="2"> -->
	<!-- <input type="hidden" name="ImageClone" value="2"> -->
	${sessionScope.entLogin.entnum }
	<table align=center>
		<tr>

			<div class="form-inline">
				<td align=center>관광소 이름:</td>
				<td><input type="text" name="attName" id="attName" class="form-control"><font name="check" size="2"></td>



				<!-- 이미지삽입 하여야함 -->
				<td align=center>제목:</td>
				<td><input type="text" name="attTitle" id="attTitle" class="form-control"><font name="check2" size="2"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td align=center>지역:</td>
				<td><select name="attLocation" id="attLocation" class="form-control">
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
				<td align=center>종류:</td>
				<td><select name="attType" id="attType" class="form-control">
						<option value="def2">종류 선택</option>
						<option value="자연">자연</option>
						<option value="체험">체험</option>
						<option value="역사">역사</option>
						<option value="테마">테마</option>
						<option value="쇼핑">쇼핑</option>

				</select></td>
			</div>
		</tr>
		<!-- 다음주소 시작-->
		<tr>
		<div class="form-inline">
			<td  align=center>우편 번호:</td>
			<td colspan=3><input id="post1" size="5" readonly="" class="form-inline">
				- <input id="post2" size="5" readonly="" class="form-inline"> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"
				id="button" class="btn btn-default btn-xs"></td>
				</div>
		</tr>
		<tr>
		<div class="form-inline">
			<td align=center>도로명 주소:</td>
			<td><input name="attAddr1" id="addr1"  readonly=""
				placeholder="도로명주소" class="form-control"></td>
				
		
		
			<td align=center>지번 주소:</td>
			<td><input name="attAddr2" id="addr2"  readonly=""
				placeholder="지번주소(기업회원의 경우 업소 지역)" class="form-control"></td>
			</div>
		</tr>
		<!-- 다음주소 끝 -->
		<tr>
			<div class="form-inline">
				<td align=center>성인가격:</td>
				<td><input type="text" name="attAdultPrice" id="attAdultPrice"
					class="form-control"><font name="check3" size="2"></td>
				<td align=center>어린이가격:</td>
				<td><input type="text" name="attKidPrice" id="attKidPrice" class="form-control" ><font name="check4" size="2"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=2 align=center>홈페이지 주소(없을시 적지 말것):</td>
				<td colspan=2><input type="text" name="attSite" id="attSite"
					class="form-control"></td>


			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td colspan=2 align=center>전화번호:</td>
				<td colspan=2><input type="text" name="attPhone" id="attPhone"
					class="form-control"><font name="check5" size="2"></td> <br>
				</td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=4 align=center>내용</td>

			</div>
		</tr>
		<tr>
			<td colspan=4><textarea rows="10" cols="10" name="attContent" id="attContent"
					class="form-control"></textarea></td>
		</tr>

		<tr>
			<td colspan=4 align=center><h3>사진등록</h3></td>
		</tr>
		<tr>
			<td colspan=4 align=center><input type="file" name="attImage"
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
