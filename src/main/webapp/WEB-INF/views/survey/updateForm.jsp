<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!--이미 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>

   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<div class="title">설문지 정보 수정</div>
	<form name='frm' method='POST' action='update.do'>
		<input type="hidden" name="sv_code" value="${read.sv_code}">
		<div>
			<p class="survey">
				<input type="hidden" class="sv_comcode" name="sv_comcode" value=""> <!-- 커뮤니티 코드 받아오기 -->
			제목 : <input type="text" class="sv_title" name="sv_title" value="${read.sv_title}">
			</p>
		</div>
		<div>
			<p class="survey">
			설명 : <input type="text" class="sv_des" name="sv_des" value="${read.sv_des}">
			</p>
		</div>
		<div class='bottom'>
			<input type="submit" value='수정'> 
			<input type="button" value='목록' onclick="location.href='survey/'">
		</div>
	</form>
	</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>