<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
		$("#userid").on("blur", function() {
			$.ajax({
				type : "get",
				url : "/test/joinForm",
				data : {
					category : $("#category").val(),
					userid : $("#userid").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					if ($.trim(responseData) == "Y") {
						$("#result").css("color", "blue");
						$("#result").text("사용 가능한 아이디 입니다.");
					}
					if ($.trim(responseData) == "N") {
						$("#result").css("color", "red");
						$("#result").text("이미 사용중인 아이디 입니다.");
					}
					if ($.trim(responseData) == "Z") {
						$("#result").css("color", "black");
						$("#result").text("아이디를 입력 하세요.")
					}
				},
				error : function(xhr, status, e) {
					console.log(status, e)
				}
			});
		});
	});
	$(document).ready(function() {
		$("#userid").on("keyup", function() {
			$.ajax({
				type : "get",
				url : "/test/joinForm",
				data : {
					category : $("#category").val(),
					userid : $("#userid").val()
				},
				dataType : "text",
				success : function(responseData, status, xhr) {
					if ($.trim(responseData) == "Y") {
						$("#result").css("color", "blue");
						$("#result").text("사용 가능한 아이디 입니다.");
					}
					if ($.trim(responseData) == "N") {
						$("#result").css("color", "red");
						$("#result").text("이미 사용중인 아이디 입니다.");
					}
				},
				error : function(xhr, status, e) {
					console.log(status, e)
				}
			});
		});
	});
	
	$(document).ready(function() {
		
		var RegName = /^[가-힣a-zA-Z]{2,6}$/; //이름 유효성 검사 2~6자 사이
		var RegId =  /^[a-z0-9_-]{4,12}$/;  //아이디 유효성 검사 4~12자 사이
		var RegPasswd = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호 유효성 검사 영문 숫자 혼합하여 특수문자 가능 8~16자리
		var RegSsn = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))|[1-4][0-9]{6}$/; //주민등록 번호 유효성 검사
		var RegPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/; //핸드폰 유효성 검사
		var RegEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //이메일 유효성검사
		var RegPhone2 = /^[0-9]{9,11}$/; //전화번호 유효성 검사
		var RegIn = /^[0-9]{10}$/; //사업자등록번호 유효성 검사
		 
		$("form").submit(function(){
			if ( !RegName.test($.trim($("#name").val())) )
			{
				alert("이름에 영문 또는 한글 2~6자로 입력해주세요.");
				$("#name").focus();
				return false;
			}
			else if ( !RegId.test($.trim($("#userid").val())) )
			{
				alert("아이디에 영문자와 숫자만으로 4~12자로 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			else if ( !RegPasswd.test($.trim($("#passwd").val())) )
			{
				alert("비밀번호에 영문과 숫자 포함해서 입력해주세요.");
				$("#passwd").focus();
				return false;
			}
			else if ( !RegSsn.test($.trim($("#ssn").val())) )
			{
				alert("주민 번호 입력란에 13자리와 숫자만 입력해주세요.");
				$("#ssn").focus();
				return false;
			}
			else if ( !RegPhone.test($.trim($("#phone1").val())) )
			{
				alert("핸드폰 입력란에 10~11자리와 숫자만 입력해주세요.");
				$("#phone1").focus();
				return false;
			}
			else if ( !RegEmail.test($.trim($("#email").val())) )
			{
				alert("이메일 입력란에 영문과 숫자만 입력해주세요.");
				$("#email").focus();
				return false;
			} 
			else if ($("#addr1").val() == "") {
                alert("주소를 입력해주세요.");
                $("#addr1").focus();
			return false;	 
        	}
			else if ($("#location").val() == "def") {
                alert("업소 지역을 선택해주세요.");
                $("#location").focus();
			return false;	 
        	}
			else if ( !RegPhone2.test($.trim($("#phone2").val())))
			{
				alert("전화번호 입력란에 9~11자리와 숫자만 입력해주세요.");
				$("#phone2").focus();
				return false;
			}
			
			else if ( !RegIn.test($.trim($("#in").val())) )
			{
				alert("사업자 등록번호 입력란에 10자리와 숫자만 입력해주세요.");
				$("#in").focus();
				return false;
			}
		
			else if ($("#kind").val() == "def2") {
	                alert("업소 종류를 선택해주세요.");
	                $("#kind").focus();
				return false;	 
            }
		});
	});
	
	$(document).ready(function() {
		$('#name').keyup(function() {
		
			
		 if ($('#name').val().length < 2 ) {
				$('font[name=check8]').css("color", "red");
				$('font[name=check8]').text("영문 또는 한글 2-6자리로 입력해주세요");
				}
			  else {
				$('font[name=check8]').css("color", "blue");
				$('font[name=check8]').text("영문 또는 한글 2-6자리로 입력해주세요");
			}
		});
	});
		
		$(document).ready(function() {
		$('#passwd').keyup(function() {
		
			
		 if ($('#passwd').val().length < 8 ) {
				$('font[name=check]').css("color", "red");
				$('font[name=check]').text("8자리 이상으로 입력하세요");
				}
			  else {
				$('font[name=check]').css("color", "blue");
				$('font[name=check]').text("8자리 이상으로 입력하세요");
			}
		});

		$('#passwd2').keyup(function() {
			if ($('#passwd').val() != $('#passwd2').val()) {
				$('font[name=check2]').css("color", "red");
				$('font[name=check2]').text("암호가 맞지 않습니다");
			}
			else {
				$('font[name=check2]').css("color", "blue");
				$('font[name=check2]').text("암호가 일치합니다");
			}
		});
	});//passwd
		
	$(document).ready(function() {
		$('#ssn').keyup(function() {
			if ($('#ssn').val().length < 13) {
				$('font[name=check3]').css("color", "red");
				$('font[name=check3]').text("숫자 13자리로 입력해주세요");
			}
			else {
				$('font[name=check3]').css("color", "blue");
				$('font[name=check3]').text("숫자 13자리로 입력해주세요");
			}
		});
	});//ssn
	
	$(document).ready(function() {
		$('#phone1').keyup(function() {
			if ($('#phone1').val().length < 10) {
				$('font[name=check4]').css("color", "red");
				$('font[name=check4]').text("숫자 10-11자리로 입력해주세요");
			}
			else {
				$('font[name=check4]').css("color", "blue");
				$('font[name=check4]').text("숫자 10-11자리로 입력해주세요");
			}
		});
	});//phone1
	
	$(document).ready(function() {
		$('#phone2').keyup(function() {
			if ($('#phone2').val().length < 9) {
				$('font[name=check5]').css("color", "red");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
			else {
				$('font[name=check5]').css("color", "blue");
				$('font[name=check5]').text("숫자 9-11자리로 입력해주세요");
			}
		});
	});//phone2
	
	$(document).ready(function() {
		$('#fax').keyup(function() {
			if ($('#fax').val().length < 9) {
				$('font[name=check6]').css("color", "red");
				$('font[name=check6]').text("숫자 9-11자리로 입력해주세요");
			}
			else {
				$('font[name=check6]').css("color", "blue");
				$('font[name=check6]').text("숫자 9-11자리로 입력해주세요");
			}
		});
	});//fax
	
	$(document).ready(function() {
		$('#in').keyup(function() {
			if ($('#in').val().length < 10) {
				$('font[name=check7]').css("color", "red");
				$('font[name=check7]').text("숫자 10자리로 입력해주세요");
			}
			else {
				$('font[name=check7]').css("color", "blue");
				$('font[name=check7]').text("숫자 10자리로 입력해주세요");
			}
		});
	});//EIN
	
	$(document).ready(function() {
		$("#category").on("change", function() {
			if ($("#category option:selected").val() == "ent") {
				$("#name").attr("disabled", false);
				$("#ssn").attr("disabled", false);
				$("#phone1").attr("disabled", false);
				$("#email").attr("disabled", false);
				$("#addr1").attr("disabled", true);
				$("#addr2").attr("disabled", false);
				$("#post1").attr("disabled", true);
				$("#post2").attr("disabled", true);
				$("#location").attr("disabled", false);
				$("#phone2").attr("disabled", false);
				$("#fax").attr("disabled", false);
				$("#in").attr("disabled", false);
				$("#kind").attr("disabled", false);
				$("#button").attr("disabled", true);
			} else if ($("#category option:selected").val() == "com") {
				$("#name").attr("disabled", false);
				$("#ssn").attr("disabled", false);
				$("#phone1").attr("disabled", false);
				$("#email").attr("disabled", false);
				$("#addr1").attr("disabled", false);
				$("#addr2").attr("disabled", false);
				$("#post1").attr("disabled", false);
				$("#post2").attr("disabled", false);
				$("#location").attr("disabled", true);
				$("#phone2").attr("disabled", true);
				$("#fax").attr("disabled", true);
				$("#in").attr("disabled", true);
				$("#kind").attr("disabled", true);
				$("#button").attr("disabled", false);
			} else {
				$("#name").attr("disabled", true);
				$("#ssn").attr("disabled", true);
				$("#phone1").attr("disabled", true);
				$("#email").attr("disabled", true);
				$("#addr1").attr("disabled", true);
				$("#addr2").attr("disabled", true);
				$("#post1").attr("disabled", true);
				$("#post2").attr("disabled", true);
				$("#location").attr("disabled", true);
				$("#phone2").attr("disabled", true);
				$("#fax").attr("disabled", true);
				$("#in").attr("disabled", true);
				$("#kind").attr("disabled", true);
				$("#button").attr("disabled", true);
			}
		});
	});
</script>
<form action="" method="get">
	<select id="category" name="category">
		<option value="com">일반회원</option>
		<option value="ent">기업회원</option>
		<option value="adm">관리자</option>
	</select>
	<table border='1'>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" placeholder="영문 또는 한글 2 - 6자" maxlength="6"><font name="check8" size="2"></font></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid" id="userid" placeholder="영문 또는 숫자 4 - 12자" maxlength="12"><em
				id="result"></em></td>
		</tr>
		<tr>
			<td>비밀 번호</td>
			<td><input type="password" name="passwd" id="passwd" placeholder="영문+숫자  8 - 16자" maxlength="16" />
			<font name="check" size="2"></font>
			</td>
		</tr>
		<tr>
			<td>비밀 번호 확인</td>
			<td><input type="password" name="passwd2" id="passwd2" placeholder="특수 문자 가능" maxlength="16" /> <font
				name="check2" size="2"></font></td>
		</tr>
		<tr>
			<td>주민 번호</td>
			<td><input type="text" placeholder="주민 번호(-제외)" id="ssn"
				name="ssn" maxlength="13"> <font name="check3" size="2"></font></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><input type="text" placeholder="휴대폰 번호(-제외)" id="phone1"
				name="phone1" maxlength="11"><font name="check4" size="2"></font></td>
		</tr>
		<tr>
			<td>이메일 주소</td>
			<td><input type="text" id="email" name="email" placeholder="ex) nonamed@korea.com " maxlength="30"></td>
		</tr>

		<!-- 다음주소 시작-->
		<tr>
			<td>우편 번호</td>
			<td><input name="post1" id="post1" size="5" readonly="" value="">
				- <input name="post2" id="post2" size="5" readonly="" value=""> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"
				id="button"></td>
		</tr>
		<tr>
			<td>도로명 주소</td>
			<td><input name="addr1" id="addr1" size="40" readonly=""
				placeholder="도로명주소" value=""></td>
		</tr>
		<tr>
			<td>지번 주소</td>
			<td><input name="addr2" id="addr2" size="40"
				placeholder="지번주소(기업회원의 경우 업소 지역)" value=""></td>
		</tr>
		<!-- 다음주소 끝 -->
		<tr>
			<td>업소 지역</td>
			<td><select name="location" disabled="true" class="form-control"
				id="location">
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
		</tr>
		<tr>
			<td>업소 전화번호</td>
			<td><input type="text" placeholder="전화번호(-제외)" id="phone2" disabled="true" name="phone2" maxlength="11"><font name="check5" size="2"></font></td>
		</tr>
		<tr>
			<td>업소 팩스번호</td>
			<td><input type="text" placeholder="팩스 번호(-제외)" id="fax"disabled="true" name="fax" maxlength="11"><font name="check6" size="2"></font></td>
		</tr>
		<tr>
			<td>사업자 등록번호</td>
			<td><input type="text" id="in" placeholder="사업자 등록번호(-제외)" disabled="true" name="in" maxlength="10"><font name="check7" size="2"></font></td>
		</tr>
		<tr>
			<td>업소 종류</td>
			<td><select id="kind" disabled="true" name="kind">
			<option value="def2">업소 종류 선택</option>
			<option value="tour">관광 명소</option>
					<option value="restaurant">음식점</option>
					<option value="stay">숙박 업소</option></select></td>
		</tr>
	</table>
	<input type="submit" value="가입하기" class="btn btn-default">

</form> --%>