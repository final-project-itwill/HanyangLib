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
		
		<form name="answer" id="answer" method="get">
		<!-- 파일 첨부는 하지 않기 때문에 enctype="multipart/form-data"는 필요 없어유 -->
		<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${dsv_code}"> <!-- dsv_code -->
		<input type="hidden" id="ans_id" name="ans_id" value="${s_id}"> <!-- dsv_code -->
		<table>
		<!-- 주관식 반복 -->
		<c:forEach items="${title}" var="title" varStatus="tvs">
		
		<!-- 순서코드 만들기(od01, od02) -->
		<c:if test="${tvs.count<10}">
			<c:set var="orderno" value="od0${tvs.count}"></c:set>
		</c:if>
		<c:if test="${tvs.count>=10}">
			<c:set var="orderno" value="od${tvs.count}"></c:set>
		</c:if>
		
		<tr>
			<input type="hidden" id="ans_order" name="ans_order" value="${orderno}"> <!-- ans_order -->
			<td style="font-weight: bold;">${tvs.count}. ${title.dsv_subject}</td>
		</tr>
		<tr>
			<c:choose>
						<c:when test="${title.dsv_type eq 'ju'}">
						<th>
						<c:forEach items="${choice}" var="choice">
						<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
						
								<!--문항 만들기 -->
									<c:forEach items="${answer}" var="ans">
									<c:choose>
									<c:when test="${ans.ans_anscode eq choice.ch_anscode}">
											<input type="text" id="${choice.ch_anscode}" name="${choice.ch_anscode}" value='${ans.ans_content}' readonly>
									</c:when>
									</c:choose>
									</c:forEach>
								<!-- 문항 end -->	
							</c:when>
						</c:choose>
						</c:forEach>
						</th>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'gaek' or 'etc'}">
						<th>
						
						<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">

								<input type="radio" id="${choice.ch_anscode}" name="${choice.ch_anscode}"  onclick="return(false);"><label for="${choice.ch_order}">&nbsp;${choice.ch_content}</label>
								<!--문항 만들기 -->
								<c:forEach items="${answer}" var="ans">
								<c:choose>
									<c:when test="${ans.ans_order eq choice.ch_order}">

										   <c:choose>
											<c:when test="${ans.ans_anscode eq choice.ch_anscode }">
												<script>
												 $("input[name=${choice.ch_anscode}]").prop("checked", true);
												</script>
											</c:when>
											</c:choose>
										
									</c:when>					
								</c:choose>
								</c:forEach>
								<!-- 문항 end -->	
							</c:when>
							</c:choose>
						</c:forEach>
						</th>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'check' or 'etc' }">
						<th>
						
						<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">

									<input type="checkbox" id="${choice.ch_anscode}" name="${choice.ch_anscode}"onclick="return(false);"><label for="${choice.ch_order}">&nbsp;${choice.ch_content}</label>
									
								<!--문항 만들기 -->

								<c:forEach items="${answer}" var="ans">								
								<c:choose>
									<c:when test="${ans.ans_order eq choice.ch_order}">

										   <c:choose>
											<c:when test="${ans.ans_anscode eq choice.ch_anscode }">
												<script>
												 $("input[name=${choice.ch_anscode}]").prop("checked", true);
												</script>
											</c:when>
											</c:choose>
										
									</c:when>
								</c:choose>
								</c:forEach>
								<!-- 문항 end -->			
								</c:when>
								</c:choose>
							</c:forEach>

							</th>						
							</c:when>
				
						<c:when test="${title.dsv_type eq 'schedule' }">
						<th>
							<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<c:forEach items="${answer}" var="ans">
								<c:choose>
								<c:when test="${ans.ans_anscode eq choice.ch_anscode}">
										<input type="date" id="${choice.ch_anscode}" name="${choice.ch_anscode}"  value='${ans.ans_content}' readonly>										
								</c:when>
								</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							</c:forEach>
						</th>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'time' }">
						<th>
							<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<c:forEach items="${answer}" var="ans">
								<c:choose>
								<c:when test="${ans.ans_anscode eq choice.ch_anscode}">
									<input type="time" id="${choice.ch_anscode}" name="${choice.ch_anscode}"  value='${ans.ans_content}' readonly>										
								</c:when>
								</c:choose>
								</c:forEach>
							</c:when>
							</c:choose>
							</c:forEach>
						</th>
						</c:when>
					</c:choose>	
			</tr>

		</c:forEach> 
	  
		
<!-- 설문 End -->
	
		    	

		</table>
	</form>	
	
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