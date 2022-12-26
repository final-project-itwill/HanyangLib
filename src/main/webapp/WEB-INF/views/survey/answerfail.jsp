<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../community/admin_header.jsp"%>
<style>

	table{
		width: 300px;
		
		cellpadding:10px;
		
		cellspacing:0;
		
		margin-bottom : 50px;
	}
	th{
		height: 40px;
	}
	td{
		height: 50px;
		vertical-align : bottom;
	}
</style>

    <div class="container-fluid" style="  width : 70%; margin-bottom : 100px;">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">설문지 확인하기</h1>
        <p class="mb-4">'${read.c_name}'의 설문지 입니다.</p>

        <div class="card shadow mb-6">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">'${s_id}'가 작성한 설문지 입니다.</h6>
            </div>
            <div class="card-body">   

        <div class="table-responsive">
<!-- 본문작성 시작 -->	
	<div class="container" >
	<br>
		<div>
		
		
		<!-- 파일 첨부는 하지 않기 때문에 enctype="multipart/form-data"는 필요 없어유 -->
		<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${dsv_code}"> <!-- dsv_code -->
		<input type="hidden" id="ans_id" name="ans_id" value="${s_id}"> <!-- dsv_code -->
		<table>

		<tr>
			<th> 기존 설문지가 삭제되었습니다. </td>
		</tr>
		<tr>	
			<td> 감사합니다. </th>
		</tr>


	  
		
<!-- 설문 End -->
	
		    	

		</table>
	
		<button type="button" onclick="location.href='/comm/adminmember/${c_code}'" id="btn_survey" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 100px;    margin:auto;" >돌아가기</button>
		<br>
		</div>
	</div>

   
<!-- 본문작성 끝 -->

	</div>
	</div>
</div>
</div>
<%@ include file="../community/admin_footer.jsp"%>