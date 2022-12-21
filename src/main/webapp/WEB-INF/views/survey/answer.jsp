<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../community/admin_header.jsp"%>

<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px"> ${s_id} 신청서 보기</h2>

    <div class="container-fluid col-lg-8 card shadow">

        <div class="table-responsive">
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<br>
		<div>
		
		<form name="answer" id="answer" method="get">
		<!-- 파일 첨부는 하지 않기 때문에 enctype="multipart/form-data"는 필요 없어유 -->
		<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${dsv_code}"> <!-- dsv_code -->
		<input type="hidden" id="ans_id" name="ans_id" value="${s_id}"> <!-- dsv_code -->
		<table class="table">
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
			<td style="font-weight: bold;">${title.dsv_subject}</td>
		</tr>
		<tr>
			<c:choose>
						<c:when test="${title.dsv_type eq 'ju'}">
						<td>
						<c:forEach items="${choice}" var="choice">
						<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<input type="text" id="${choice.ch_anscode}" name="${choice.ch_anscode}" readonly>
								<!--문항 만들기 -->
									<c:forEach items="${answer}" var="ans">
									<c:choose>
									<c:when test="${ans.ans_anscode eq choice.ch_anscode}">
										<script>
										 $("input[name=${choice.anscode}]").val(${ans.ans_content});
										</script>
									</c:when>
									</c:choose>
									</c:forEach>
								<!-- 문항 end -->	
							</c:when>
						</c:choose>
						</c:forEach>
						</td>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'gaek' or 'etc'}">
						<td>
						
						<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">

								<input type="radio" id="${choice.ch_no}" name="${choice.ch_anscode}"  onclick="return(false);"><label for="${choice.ch_order}">${choice.ch_content}</label>
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
										
									</c:when>								</c:choose>
								</c:forEach>
								<!-- 문항 end -->	
							</c:when>
							</c:choose>
						</c:forEach>
						</td>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'check' or 'etc' }">
						<td>
						
						<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">

									<input type="checkbox" id="${choice.ch_no}" name="${choice.ch_anscode}"onclick="return(false);"><label for="${choice.ch_order}">${choice.ch_content}</label>
									
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

							</td>						
							</c:when>
				
						<c:when test="${title.dsv_type eq 'schedule' }">
						<td>
							<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<input type="date" id="${choice.ch_no}" name="${choice.ch_anscode}" value="" readonly>
									<c:forEach items="${answer}" var="ans">
									<c:choose>
									<c:when test="${ans.ans_anscode eq choice.ch_anscode}">										
										<script>
										 $("input[name=${choice.anscode}]").val(${ans.ans_content});
										</script>
									</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							</c:choose>
							</c:forEach>
						</td>
						</c:when>
						
						<c:when test="${title.dsv_type eq 'time' }">
						<td>
							<c:forEach var="choice" items="${choice}" varStatus="vs">
							<c:choose>
							<c:when test="${title.dsv_order eq choice.ch_order}">
								<input type="time" id="${choice.ch_no}" name="${choice.ch_anscode}" value="" readonly>
									<c:forEach items="${answer}" var="ans">
									<c:choose>
									<c:when test="${ans.ans_anscode eq choice.ch_anscode}">										
										<script>
										 $("input[name=${choice.anscode}]").val(${ans.ans_content});
										</script>
									</c:when>
									</c:choose>
									</c:forEach>
							</c:when>
							</c:choose>
							</c:forEach>
						</td>
						</c:when>
					</c:choose>	
			</tr>

		</c:forEach> 
	  
		
<!-- 설문 End -->
		<tr>
		    <td colspan="2" align="center">
		    	<%-- <input type="button" value="삭제" onclick="location.href='../chdelete.do?ans_code=${dsv_code}'"> --%>
		    	<a href="/comm/adminmember/${c_code}"> 돌아가기</a>
		    </td>
		</tr>    
		</table>
	</form>	
		
		</div>
	</div>

   
<!-- 본문작성 끝 -->

	</div>
	</div>
</div>
<%@ include file="../community/admin_footer.jsp"%>