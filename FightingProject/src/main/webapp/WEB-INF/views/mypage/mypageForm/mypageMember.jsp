<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<br><br>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/test/js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<c:if test="${!empty sessionScope.comLogin }">
<script type="text/javascript">
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
		if ( !RegName.test($.trim($("#comname").val())) )
		{
			alert("이름에 영문 또는 한글 2~6자로 입력해주세요.");
			$("#comname").focus();
			return false;
		}
		else if ( !RegId.test($.trim($("#comid").val())) )
		{
			alert("아이디에 영문자와 숫자만으로 4~12자로 입력해주세요.");
			$("#comid").focus();
			return false;
		}
		else if ( !RegPasswd.test($.trim($("#compasswd").val())) )
		{
			alert("비밀번호에 영문과 숫자 포함해서 입력해주세요.");
			$("#name").focus();
			return false;
		}
		else if ( !RegSsn.test($.trim($("#comssn").val())) )
		{
			alert("주민 번호 입력란에 13자리와 숫자만 입력해주세요.");
			$("#comssn").focus();
			return false;
		}
		else if ( !RegPhone.test($.trim($("#comphone1").val())) )
		{
			alert("핸드폰 입력란에 10~11자리와 숫자만 입력해주세요.");
			$("#comphone1").focus();
			return false;
		}
		else if ( !RegEmail.test($.trim($("#comemail").val())) )
		{
			alert("이메일 입력란에 영문과 숫자만 입력해주세요.");
			$("#comemail").focus();
			return false;
		} 
		else if ($("#addr1").val() == "") {
            alert("주소를 입력해주세요.");
            $("#addr1").focus();
		return false;	 
    	}
	/* 	else if ($("#location").val() == "def") {
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
        } */
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
</script>
</c:if>
<c:if test="${!empty sessionScope.entLogin }">
<script type="text/javascript">
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
		if ( !RegName.test($.trim($("#entname").val())) )
		{
			alert("이름에 영문 또는 한글 2~6자로 입력해주세요.");
			$("#entname").focus();
			return false;
		}
		/* else if ( !RegId.test($.trim($("#entid").val())) )
		{
			alert("아이디에 영문자와 숫자만으로 4~12자로 입력해주세요.");
			$("#entid").focus();
			return false;
		} */
		else if ( !RegPasswd.test($.trim($("#entpasswd").val())) )
		{
			alert("비밀번호에 영문과 숫자 포함해서 입력해주세요.");
			$("#entpasswd").focus();
			return false;
		}
	/* 	else if ( !RegSsn.test($.trim($("#ssn").val())) )
		{
			alert("주민 번호 입력란에 13자리와 숫자만 입력해주세요.");
			$("#ssn").focus();
			return false;
		} */
		else if ( !RegPhone.test($.trim($("#entcellphone").val())) )
		{
			alert("핸드폰 입력란에 10~11자리와 숫자만 입력해주세요.");
			$("#entcellphone").focus();
			return false;
		}
		/* else if ( !RegEmail.test($.trim($("#email").val())) )
		{
			alert("이메일 입력란에 영문과 숫자만 입력해주세요.");
			$("#email").focus();
			return false;
		} 
		else if ($("#addr1").val() == "") {
            alert("주소를 입력해주세요.");
            $("#addr1").focus();
		return false;	 
    	} */
		else if ($("#entLocation").val() == "def") {
            alert("업소 지역을 선택해주세요.");
            $("#entLocation").focus();
		return false;	 
    	}
		/* else if ( !RegPhone2.test($.trim($("#phone2").val())))
		{
			alert("전화번호 입력란에 9~11자리와 숫자만 입력해주세요.");
			$("#phone2").focus();
			return false;
		} */
		
		else if ( !RegIn.test($.trim($("#entin").val())) )
		{
			alert("사업자 등록번호 입력란에 10자리와 숫자만 입력해주세요.");
			$("#entin").focus();
			return false;
		}
	});
});

$(document).ready(function() {
	
	$('#entpasswd').keyup(function() {
	
		
	 if ($('#entpasswd').val().length < 8 ) {
			$('font[name=echeck]').css("color", "red");
			$('font[name=echeck]').text("8자리 이상으로 입력하세요");
			}
		  else {
			$('font[name=echeck]').css("color", "blue");
			$('font[name=echeck]').text("8자리 이상으로 입력하세요");
		}
	});
	
	
	
	$('#entpasswd2').keyup(function() {
		if ($('#entpasswd').val() != $('#entpasswd2').val()) {
			$('font[name=echeck2]').css("color", "red");
			$('font[name=echeck2]').text("암호가 맞지 않습니다");
		}
		else {
			$('font[name=echeck2]').css("color", "blue");
			$('font[name=echeck2]').text("암호가 일치합니다");
		}
	});
});//passwd
	
$(document).ready(function() {
	$('#entssn').keyup(function() {
		if ($('#entssn').val().length < 13) {
			$('font[name=echeck3]').css("color", "red");
			$('font[name=echeck3]').text("숫자 13자리로 입력해주세요");
		}
		else {
			$('font[name=echeck3]').css("color", "blue");
			$('font[name=echeck3]').text("숫자 13자리로 입력해주세요");
		}
	});
});//ssn

$(document).ready(function() {
	$('#entcellphone').keyup(function() {
		if ($('#entcellphone').val().length < 10) {
			$('font[name=echeck4]').css("color", "red");
			$('font[name=echeck4]').text("숫자 10-11자리로 입력해주세요");
		}
		else {
			$('font[name=echeck4]').css("color", "blue");
			$('font[name=echeck4]').text("숫자 10-11자리로 입력해주세요");
		}
	});
});//phone1

$(document).ready(function() {
	$('#entphone').keyup(function() {
		if ($('#entphone').val().length < 9) {
			$('font[name=echeck5]').css("color", "red");
			$('font[name=echeck5]').text("숫자 9-11자리로 입력해주세요");
		}
		else {
			$('font[name=echeck5]').css("color", "blue");
			$('font[name=echeck5]').text("숫자 9-11자리로 입력해주세요");
		}
	});
});//phone2

$(document).ready(function() {
	$('#entfax').keyup(function() {
		if ($('#entfax').val().length < 9) {
			$('font[name=echeck6]').css("color", "red");
			$('font[name=echeck6]').text("숫자 9-11자리로 입력해주세요");
		}
		else {
			$('font[name=echeck6]').css("color", "blue");
			$('font[name=echeck6]').text("숫자 9-11자리로 입력해주세요");
		}
	});
});//fax

$(document).ready(function() {
	$('#entin').keyup(function() {
		if ($('#entin').val().length < 10) {
			$('font[name=echeck7]').css("color", "red");
			$('font[name=echeck7]').text("숫자 10자리로 입력해주세요");
		}
		else {
			$('font[name=echeck7]').css("color", "blue");
			$('font[name=echeck7]').text("숫자 10자리로 입력해주세요");
		}
	});
});//EIN

$(document).ready(function() {
	$('#entname').keyup(function() {
	
	 if ($('#entname').val().length < 2 ) {
			$('font[name=echeck8]').css("color", "red");
			$('font[name=echeck8]').text("영문 또는 한글 2-6자리로 입력해주세요");
			}
		  else {
			$('font[name=echeck8]').css("color", "blue");
			$('font[name=echeck8]').text("영문 또는 한글 2-6자리로 입력해주세요");
		}
	});
});

</script>
</c:if>
<c:if test="${!empty sessionScope.comLogin }">
	<form action="changeMember" method="get">
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly="" name="comid" id="comid"
					value="${sessionScope.comLogin.comid }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="compasswd" id="compasswd"
					value="${sessionScope.comLogin.compasswd }"><font name="check" size="2" ></font></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="comname" id="comname"
					value="${sessionScope.comLogin.comname }"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" readonly="" name="comssn" id="comssn"
					value="${sessionScope.comLogin.comssn }"><font name="check3" size="2" >></font></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" name="comphone" id="comphone"
					value="${sessionScope.comLogin.comphone }"><font name="check4" size="2" ></font>></td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td><input type="text" readonly=""
					value="${sessionScope.comLogin.comgrade }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="comemail" id="commail"
					value="${sessionScope.comLogin.comemail }"></td>
			</tr>
			<tr>
				<td>도로주소</td>
				<td><input type="text" name="comaddr1" id="comaddr1"
					value="${sessionScope.comLogin.comaddr1 }"></td>
			</tr>
			<tr>
				<td>지번주소</td>
				<td><input type="text" name="comaddr2" id="comaddr2"
					value="${sessionScope.comLogin.comaddr2 }"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="post1"
					value="${sessionScope.comLogin.compost1 }">-<input
					type="text" name="post2" value="${sessionScope.comLogin.compost2 }"></td>
			</tr>
			
		</table>
		<input type="submit" value="변경하기" class="btn btn-default">
			<input type="reset" value="다시하기" class="btn btn-default">
	</form>
</c:if>
<c:if test="${!empty sessionScope.entLogin }">
	<form action="changeMember" method="get">
		<table border='1'>
			<tr>
				<td>
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly="" name="entid" id="entid" maxlength="12"
					value="${sessionScope.entLogin.entid }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="entpasswd" id="entpasswd" maxlength="16"
					value="${sessionScope.entLogin.entpasswd }"><font name="echeck" size="2" ></font></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="entname" id="entname" maxlength="6"
					value="${sessionScope.entLogin.entname }"><font name="echeck8" size="2" ></font></td>
			</tr>
			<tr>
				<td>업소 지역</td>
				<td><input type="text" name="entlocation" id="entLocation"
					value="${sessionScope.entLogin.entlocation }"></td>
			</tr>
			<tr>
				<td>업소 전화번호</td>
				<td><input type="text" name="entphone" id="entphone" maxlength="11"
					value="${sessionScope.entLogin.entphone }"><font name="echeck5" size="2" ></font></td>
			</tr>
			<tr>
				<td>업주 핸드폰번호</td>
				<td><input type="text" name="entcellphone" id="entcellphone" maxlength="11"
					value="${sessionScope.entLogin.entcellphone }"><font name="echeck4" size="2" ></font></td>
			<tr>
				<td>업소 팩스번호</td>
				<td><input type="text" name="entfax" id="entfax" maxlength="11"
					value="${sessionScope.entLogin.entfax }"><font name="echeck6" size="2" ></font></td>
			</tr>
			<tr>
				<td>업소 사업장등록번호</td>
				<td><input type="text" name="entin" id="entin" maxlength="10"
					value="${sessionScope.entLogin.entin }"><font name="echeck7" size="2" ></font></td>
			</tr>
			<tr>
				<td>업소 종류</td>
				<td><input type="text" name="enttype" id="enttype"
					value="${sessionScope.entLogin.enttype }"></td>
			</tr>
		</table>
		<input type="submit" value="변경하기" class="btn btn-default"> <input
			type="reset" value="다시하기" class="btn btn-default">
	</form>
</c:if>
