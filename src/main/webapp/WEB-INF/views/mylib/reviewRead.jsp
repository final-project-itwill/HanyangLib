<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
	<!-- 배너 시작 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
	<!-- 배너 끝 -->
	<!-- 서평목록 시작 -->
	<form name="frm">
		<table class="table">
		<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
			<td>${rvRead.br_title}</td>
			<td>${rvRead.br_id}</td>
			<td>${rvRead.br_count}</td>
			<td>${rvRead.b_name}</td>
		</tr>
		<tr style="text-align: center;">
			<td colspan="4">${rvRead.br_content}</td>
		</tr>
		</table>
		<div class="align-content-sm-center" style="text-align: center">
	            <input type="hidden" id="br_no" name="br_no" value="${rvRead.br_no}">
	            <input type="hidden" id="br_id" name="br_id" value="${rvRead.br_id}">	            
	            <input type="button" value="수정" onclick="update()">
	            <input type="button" value="삭제" onclick="del()">
		</div>
	</form>
	<!-- 서평 목록 끝 -->
	
	<script>

    function del(){
        if(confirm("영구히 삭제됩니다. \n 진행할까요?")){
            document.frm.action="/mylib/rvDelete";
            document.frm.submit();
        }//if end
    }//del() end

    function update(){
        document.frm.action="/mylib/rvUpdate";
        document.frm.submit();
    }//update() end

	</script>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>