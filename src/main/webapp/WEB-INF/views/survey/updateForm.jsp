<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../community/admin_header.jsp"%>
   
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>      

    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">설문지 관리하기</h1>
        <p class="mb-4">설문지 관련 정보를 수정할수 있습니다.</p>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 설문지 정보</h6>
            </div>
            <div class="card-body">   
<!-- 본문작성 시작 -->	
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  

	<div class="container" style="margin-top : 30px; margin-bottom : 20px;">
	<form name='frm' method='POST' action='update.do'>
		<input type="hidden" name="sv_code" value="${sread.sv_code}">
		<div>
			<p class="survey">
				<input type="hidden" class="sv_comcode" name="sv_comcode" value="${sread.sv_comcode}"> <!-- 커뮤니티 코드 받아오기 -->
			  &nbsp;제 &nbsp; &nbsp;목 &nbsp;: &nbsp;<input type="text" class="sv_title" name="sv_title" value="${sread.sv_title}">
			</p>
		</div>
		<div>
			<p class="survey">
			  &nbsp;설 &nbsp; &nbsp;명 &nbsp;: &nbsp;<input type="text" class="sv_des" name="sv_des" value="${sread.sv_des}">
			</p>
		</div>
		<div>
			<p class="survey">
			인원제한 : <input type="number" class="sv_max" name="sv_max" value="${sread.sv_max}" min="0" max="30" >
		</p>
		</div>
		<div>
			<p class="survey">
			 &nbsp;마 감 일 &nbsp;: <input type="date" class="sv_edate" name="sv_edate" value="${sread.sv_edate}"  min="${min}">
			</p>
			<br>
		</div>
		<div class='bottom' >
			<button type="button" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 300px; margin:auto;" >
                            <i class="fas fa-fw fa-cog"></i> 수정</button>
		</div>
	</form>
	</div>
<!-- 본문작성 끝 -->
		</div>
		</div>
		</div>
<script>
function() {
			if(sv_title==''){
				alert("제목을 입력해주세요.");
				sv_title.focus;
				return false;
			}
			if(sv_des==''){
				alert("내용을 입력해주세요.");
				sv_des.focus;
				return false;
			}
			if(sv_edate==''){
				alert("마감일을 입력해주세요.");
				sv_edate.focus;
				return false;
			}
		}
</script>

</script>

<%@ include file="../community/admin_footer.jsp"%>