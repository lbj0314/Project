<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#userid").on("blur", function() {
			$.ajax({
				type : "get",
				url : "MemberCheckServlet",
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
				url : "MemberCheckServlet",
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
		
		$('#passwd').keyup(function() {
			if ($('#passwd').val().length < 8) {
				$('font[name=check]').css("color", "red");
				$('font[name=check]').text("암호 길이가 맞지 않습니다.");
			}
			else {
				$('font[name=check]').css("color", "blue");
				$('font[name=check]').text("길이가 적합합니다.");
			}	
		});
		$('#passwd2').keyup(function() {
			if ($('#passwd').val() != $('#passwd2').val()) {
				$('font[name=check2]').css("color", "red");
				$('font[name=check2]').text("암호가 맞지 않습니다.");
			}
			else {
				$('font[name=check2]').css("color", "blue");
				$('font[name=check2]').text("암호가 일치합니다.");
			}
		});
	});
	/* $(document).ready(function() {
		/* $('#passwd').keyup(function(){
		}); */

	/* $('#ssn').keyup(function() {
	
		
		if ($('#ssn').val() = !$('#ssn').val()) {
			$('font[name=check2]').css("color", "red");
			$('font[name=check2]').text("주민등록번호 길이가 맞지 않습니다.");
		} else {
			$('font[name=check2]').css("color", "blue");
			$('font[name=check2]').text("주민등록번호 길이가 일치합니다.");
		}
	});
	}); */

	/* function fnssnCheck(ssn) // 주민등록번호유효성검사.
	 {
	 var sum = 0;
	 if (ssn.length != 13) {
	 return false;
	 } else if (ssn.substr(6, 1) != 1 && ssn.substr(6, 1) != 2 && ssn.substr(6, 1) != 3 && ssn.substr(6, 1) != 4) {
	 return false;
	 }

	 for (var i = 0; i < 12; i++) {
	 sum += Number(ssn.substr(i, 1)) * ((i % 8) + 2);
	 }
	 if (((11 - (sum % 11)) % 10) == Number(ssn.substr(12, 1))) {
	 return true;
	 }
	 return false;
	 }  */

	/* 
	 function chkPassWord (userid,passwd) { 
	 if(passwd.length < 8) {      //길이체크
	 alert("비밀번호는 문자, 숫자, 특수문자의 조합 8~12자리이상으로 입력해주세요.");
	 $("#passwd").val("");
	 $("#passwd2").val("");
	 $("#passwd").focus();
	 return false;         
	 }
	 if(!passwd.match(/^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/))  {   
	 //(?=^.{8,12}$) = 8자에서 12자 체크 
	 //(?=.*\d)      = 숫자포함
	 //(?=.*[a-zA-Z]) = 알파벳 대소문자 포함
	 //(?=.*[!@#$%^&+=]).*$/) = 특수문자 포함
	 alert("비밀번호는 문자, 숫자, 특수문자의 조합 8~12자리이상으로 입력해주세요.");
	 $("#passwd").val("");
	 $("#passwd2").val("");
	 $("#passwd").focus();
	 return false;         
	 } 
	 if(passwd.indexOf(userid) > -1) {      
	 alert("비밀번호에 아이디를 사용할 수 없습니다.");
	 $("#passwd").val("");
	 $("#passwd2").val("");
	 $("#passwd").focus();
	 return false;        
	
	 } 
	 var SamePass_0 = 0; //동일문자 카운트
	 var SamePass_1 = 0; //연속성(+) 카운드
	 var SamePass_2 = 0; //연속성(-) 카운드
	
	 var chr_pass_0;
	 var chr_pass_1;
	
	 for(var i=0; i < passwd.length; i++) {       
	 chr_pass_0 = passwd.charAt(i);
	 chr_pass_1 = passwd.charAt(i+1);
	 //동일문자 카운트
	 if(chr_pass_0 == chr_pass_1) {
	 SamePass_0 = SamePass_0 + 1;
	 } // if
	 //연속성(+) 카운드
	 if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1) {
	 SamePass_1 = SamePass_1 + 1;
	 } // if
	 //연속성(-) 카운드
	 if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1) {
	 SamePass_2 = SamePass_2 + 1;
	 }
	 } // for
	 if(SamePass_0 > 1) {
	 alert("동일문자를 3번 이상 사용할 수 없습니다.");
	 $("#passwd").val("");
	 $("#passwd2").val("");
	 $("#passwd").focus();
	 return false;
	 } // if
	
	 if(SamePass_1 > 1 || SamePass_2 > 1 )  {
	 alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
	 $("#passwd").val("");
	 $("#passwd2").val("");
	 $("#passwd").focus();
	 return false;
	 } // if
	 return true;          
	 });
	 */

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
<form action="JoinServlet" method="get">
	<select id="category" name="category">
		<option value="com">일반회원</option>
		<option value="ent">기업회원</option>
		<option value="adm">관리자</option>
	</select>
	<table border='1'>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid" id="userid"><em
				id="result"></em></td>
		</tr>
		<tr>
			<td>비밀 번호</td>
			<td><input type="password" name="passwd" id="passwd" />
			<font name="check" size="2"></font>
			</td>
		</tr>
		<tr>
			<td>비밀 번호 확인</td>
			<td><input type="password" name="passwd2" id="passwd2" /> <font
				name="check2" size="2"></font></td>
		</tr>
		<tr>
			<td>주민 번호</td>
			<td><input type="text" placeholder="주민 번호(-제외)" id="ssn"
				name="ssn"> <!-- <font name="check3" size="2"></font> --></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><input type="text" placeholder="휴대폰 번호(-제외)" id="phone1"
				name="phone1"></td>
		</tr>
		<tr>
			<td>이메일 주소</td>
			<td><input type="text" id="email" name="email"></td>
		</tr>

		<!-- 다음주소 시작-->
		<tr>
			<td>우편 번호</td>
			<td><input name="post1" id="post1" size="5" readonly="">
				- <input name="post2" id="post2" size="5" readonly=""> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"
				id="button"></td>
		</tr>
		<tr>
			<td>도로명 주소</td>
			<td><input name="addr1" id="addr1" size="40" readonly=""
				placeholder="도로명주소"></td>
		</tr>
		<tr>
			<td>지번 주소</td>
			<td><input name="addr2" id="addr2" size="40"
				placeholder="지번주소(기업회원의 경우 업소 지역)"></td>
		</tr>
		<!-- 다음주소 끝 -->
		<tr>
			<td>업소 지역</td>
			<td><select name="Location" disabled="true" class="form-control"
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
			<td><input type="text" id="phone2" disabled="true" name="phone2"></td>
		</tr>
		<tr>
			<td>업소 팩스번호</td>
			<td><input type="text" id="fax" disabled="true" name="fax"></td>
		</tr>
		<tr>
			<td>사업장 등록번호</td>
			<td><input type="text" id="in" disabled="true" name="in"></td>
		</tr>
		<tr>
			<td>업소 종류</td>
			<td><select id="kind" disabled="true" name="kind"><option
						value="tour">관광 명소</option>
					<option value="restaurant">음식점</option>
					<option value="stay">숙박 업소</option></select></td>
		</tr>
	</table>
	<input type="submit" value="가입하기" class="btn btn-default">

</form>

