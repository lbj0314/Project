<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>음식점 글쓰기</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<h1>글쓰기 화면</h1>
	<div class="container-fluid">
<form action="RestWriteServlet" method="post" >
제목<input type="text" name="resttitle" class="form-control"><br>
내용<textarea rows="10" cols="10" name="restcontent" class="form-control"></textarea>
 <input type="submit" value="글쓰기" class="form-control">
</form>
<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='RestListServlet';">목록</button>
		</div>
</div>
</body>
</html>