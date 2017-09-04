<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="conright" class="form-group">

	<form action="LoginServlet" method="get" class="form-inline">
		<select name="wholog" class="form-control">
			<option value="com">일반회원</option>
			<option value="ent">기업회원</option>
			<option value="adm">관리자</option>
		</select> 아이디<input type="text" name="userid" class="form-control" placeholder="아이디를 입력하세요.">
		비밀번호<input type="password" name="passwd" class="form-control" placeholder="비밀번호를 입력하세요."> <input
			type="submit" value="로그인" class="btn btn-default">
	</form>
</div>




