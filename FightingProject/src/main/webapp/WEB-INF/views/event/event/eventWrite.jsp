<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>글쓰기 화면</h1>
	<div class="container-fluid">
		
<form action="/test/loginX/eventWrite" method="post" >
<input type="hidden" name="eventAdmnum" value="${sessionScope.admLogin.admnum }">
제목<input type="text" name="eventNotitle" class="form-control"><br>
내용<textarea rows="10" cols="10" name="eventNocontent" class="form-control"></textarea>
 <input type="submit" value="글쓰기" class="form-control">
</form>

<div class="huge-top">
			<button class="btn btn-normal pull-right"
				onclick="location.href='/test/eventList';">목록</button>
		</div>


</div>
