<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<form action="/project/TourWriteServlet" enctype="multipart/form-data" method="post">
	<input type="hidden" name="entNum" value="${sessionScope.entLogin.entnum}">
	${sessionScope.entLogin.entnum }
	<table align=center>
		<tr>

			<div class="form-inline">
				<td align=center>관광소 이름:</td>
				<td><input type="text" name="attName" class="form-control"></td>



				<!-- 이미지삽입 하여야함 -->
				<td align=center>제목:</td>
				<td><input type="text" name="attTitle" class="form-control"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td align=center>지역:</td>
				<td><select name="attLocation" class="form-control">
						<option>지역선택</option>
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
				<td align=center>타입:</td>
				<td><select name="attType" class="form-control">
						<option>타입선택</option>
						<option value="자연">자연</option>
						<option value="체험">체험</option>
						<option value="역사">역사</option>
						<option value="테마">테마</option>
						<option value="쇼핑">쇼핑</option>

				</select></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td align=center>성인가격:</td>
				<td><input type="text" name="attAdultPrice"
					class="form-control"></td>
				<td align=center>어린이가격:</td>
				<td><input type="text" name="attKidPrice" class="form-control"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=2 align=center>홈페이지 주소(없을시 적지 말것):</td>
				<td colspan=2><input type="text" name="attSite"
					class="form-control"></td>


			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td colspan=2 align=center>전화번호:</td>
				<td colspan=2><input type="text" name="attPhone"
					class="form-control"></td> <br>
				</td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=4 align=center>내용</td>

			</div>
		</tr>
		<tr>
			<td colspan=4><textarea rows="10" cols="10" name="attContent"
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
