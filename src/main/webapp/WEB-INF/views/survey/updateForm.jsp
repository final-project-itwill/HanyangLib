<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>
   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<div class="title">설문지 정보 수정</div>
	<form name='frm' method='POST' action='update.do'>
		<input type="hidden" name="sv_code" value="${sread.sv_code}">
		<div>
			<p class="survey">
				<input type="hidden" class="sv_comcode" name="sv_comcode" value="${sread.sv_comcode}"> <!-- 커뮤니티 코드 받아오기 -->
			제목 : <input type="text" class="sv_title" name="sv_title" value="${sread.sv_title}">
			</p>
		</div>
		<div>
			<p class="survey">
			설명 : <input type="text" class="sv_des" name="sv_des" value="${sread.sv_des}">
			</p>
		</div>
		<div>
			<p class="survey">
			인원제한 : <input type="number" class="sv_max" name="sv_max" value="${sread.sv_max}">
		</p>
		</div>
		<div>
			<p class="survey">
			마감일 : <input type="date" class="sv_edate" name="sv_edate" value="${sread.sv_edate}">
			</p>
		</div>
		<div class='bottom'>
			<input type="submit" value='수정'> 
			<input type="button" value='돌아가기' onclick="location.href='comm/admin/${sread.sv_comcode}">
		</div>
	</form>
	</div>
<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>