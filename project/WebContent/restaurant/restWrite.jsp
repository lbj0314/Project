<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/project/js_daumaddress/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->


<form action="/project/RestWriteServlet" enctype="multipart/form-data"
	method="post">
	<input type="hidden" name="entNum"
		value="${sessionScope.entLogin.entnum}">
	${sessionScope.entLogin.entnum }
	<table align=center>
		<tr>

			<div class="form-inline">
				<td align=center>관광소 이름:</td>
				<td><input type="text" name="restName" class="form-control"></td>



				<!-- 이미지삽입 하여야함 -->
				<td align=center>제목:</td>
				<td><input type="text" name="restTitle" class="form-control"></td>
			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td align=center>지역:</td>
				<td><select name="restLocation" class="form-control">
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
				<td align=center>맛집:</td>
				<td><select name="restType" class="form-control">
						<option value="def">맛집선택</option>
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
				<td align=center>가격:</td>
				<td><input type="text" name="restPrice" class="form-control"></td>

			</div>
		</tr>
		<tr>
			<div class="form-inline">
				<td colspan=2 align=center>홈페이지 주소(없을시 적지 말것):</td>
				<td colspan=2><input type="text" name="restSite"
					class="form-control"></td>


			</div>
		</tr>
		<tr>
			<div class="form-inline">

				<td colspan=2 align=center>전화번호:</td>
				<td colspan=2><input type="text" name="restPhone"
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
			<td colspan=4><textarea rows="10" cols="10" name="restContent"
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
