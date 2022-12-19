<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>
<!-- 본문작성 시작 -->
<!--이미 -->

   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<div class="title">설문지 삭제</div>
	<form name='frm' method='POST' action='delete.do'>
		<input type="hidden" name="c_code" value="${c_code}">
		
		<div class="content">
			<p>설문지를 삭제하시겠습니까?</p>
			<p>※ 관련 자료 전부 삭제됩니다</p>
		</div>
		<div class='bottom'>
			<input type="submit" value='삭제'> 
			<input type="button" value='목록' onclick="location.href='survey/'">
		</div>
	</form>
	</div>
<!-- 본문작성 끝 -->
<%@ include file="../community/admin_footer.jsp"%>