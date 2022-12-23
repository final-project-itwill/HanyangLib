<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>
<!-- 본문작성 시작 -->
<!--이미 -->
<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">설문지 삭제하기</h2>

    <div class="container-fluid col-lg-6 card shadow" style=" margin-bottom : 30px">
        

        <div class="table-responsive">	
   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :30px; margin-bottom: 30px;">
	<form name='frm' method='POST' action='delete.do'>
		<input type="hidden" name="c_code" value="${c_code}">
		
		<div class="content">
			<br>
			<p>설문지를 삭제하시겠습니까?</p>
			<p>※ 관련 자료 전부 삭제됩니다</p>
			<br>
		</div>
		<div class='bottom' style="text-align: center;">
			<button type="submit" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 300px;    margin:auto;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  							<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
 							</svg> 삭제</button>
			
			
		</div>
	</form>
	</div>
<!-- 본문작성 끝 -->
		</div>
	</div>
</div>
<%@ include file="../community/admin_footer.jsp"%>