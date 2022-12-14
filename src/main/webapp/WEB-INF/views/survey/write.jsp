<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>

<!-- 상단 배너 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>


<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<p>
		<button type="button" onclick="location.href='../survey'">설문</button>
	</p>
	<br>
		<div>
		<h3> 신청서 작성 ${s_id} ${count}</h3>
		
		<form name="answer" id="answer" method="post">
		<!-- 파일 첨부는 하지 않기 때문에 enctype="multipart/form-data"는 필요 없어유 -->
		<input type="hidden" id="ans_code" name="ans_code" value="${dsv_code}"> <!-- dsv_code -->
		<input type="hidden" id="ans_id" name="ans_id" value="${s_id}"> <!-- dsv_code -->
		<a href="../create/${dsv_code}">설문생성</a>
		
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
		${orderno}
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
								<!-- 주관식 답변 코드 만들기 -->
								<c:set var="j" value="${j+1}"/>
								<c:if test="${j<10}">
									<c:set var="anscodeno" value="ju0${j}"></c:set>
								</c:if>
								<c:if test="${j>=10}">
									<c:set var="anscodeno" value="ju${j}"></c:set>
								</c:if>
								<input type="text" id="${orderno}" name="${orderno}" value="${anscodeno}" placeholder="입력해주세요">
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
								<!-- 객관식 답변 코드 만들기 -->
								<c:set var="g" value="${g+1}"/>
								<c:if test="${g<10}">
									<c:set var="anscodeno" value="g0${g}"></c:set>
								</c:if>
								<c:if test="${g>=10}">
									<c:set var="anscodeno" value="g${g}"></c:set>
								</c:if>
								<input type="radio" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}"><label for="${choice.ch_order}">${choice.ch_content}</label>
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
								<!-- 체크박스 답변 코드 만들기 -->
								<c:set var="c" value="${c+1}"/>
								<c:if test="${c<10}">
									<c:set var="anscodeno" value="c0${c}"></c:set>
								</c:if>
								<c:if test="${c>=10}">
									<c:set var="anscodeno" value="c${c}"></c:set>
								</c:if>
								<input type="checkbox" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}"><label for="${choice.ch_order}">${choice.ch_content}</label>
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
								<!-- 달력 답변 코드 만들기 -->
								<c:set var="s" value="${s+1}"/>
								<c:if test="${s<10}">
									<c:set var="anscodeno" value="s0${s}"></c:set>
								</c:if>
								<c:if test="${s>=10}">
									<c:set var="anscodeno" value="s${s}"></c:set>
								</c:if>
								<input type="date" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}">
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
								<!-- 시간 답변 코드 만들기 -->
								<c:set var="t" value="${t+1}"/>
								<c:if test="${t<10}">
									<c:set var="anscodeno" value="t0${t}"></c:set>
								</c:if>
								<c:if test="${t>=10}">
									<c:set var="anscodeno" value="t${t}"></c:set>
								</c:if>						
								<input type="time" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}">
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
		    	<input type="button" value="설문등록" onclick="insert()">
		    	<input type="reset" value="취소">
		    </td>
		</tr>    
		</table>
	</form>	
		
		</div>
	</div>

<script>

	
	function insert() {
		
		var count = ${count};
		for( var i=1; i<=count; i++){
/* 		가져오기 방법 1	
			$(document).ready(function() {
			    var inputValue = $("input[name='od0"+i+"']:checked").val();
			    alert(inputValue);
			}); */
			
			var scores = document.getElementsByName("od0"+i+"")
			scores.forEach((node) => {
			    if(node.checked) {
			        alert(node.value)
		        	alert(node.value.substring(0,1))
			    	return
			    }// if end
			    
			})
			
			//alert(document.querySelector('input[name="od01"]:checked'));
			document.answer.action="answer";
			document.answer.submit();
		} // end
	alert("성공");
	}// function() end
</script>
   
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>