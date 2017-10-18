<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeView</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/test/css/style.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	
	<!-- 구글맵 api key 등록부 -->
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBNH4T1aYDzFHPc-Lqvb-b16nSvlGzT_a8&sensor=true"></script>
<script type="text/javascript">


// 이미지 다운 구현해야 함

 	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#imgview').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	} 
</script>


</head>
<body>
	<div id="conright">
		<jsp:include page="/WEB-INF/views/login/loginForm.jsp" flush="true" /><br>

	</div>

	<jsp:include page="/WEB-INF/views/include/top.jsp" flush="true" /><br>



	<jsp:include page="/WEB-INF/views/tour/tourRetrieve.jsp" flush="true" /><br>


	<jsp:include page="/WEB-INF/views/include/copyright.jsp" flush="true" /><br>


	
</body>
</html>