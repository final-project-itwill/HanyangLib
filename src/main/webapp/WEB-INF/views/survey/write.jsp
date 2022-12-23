<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>


    <!-- Custom fonts for this template-->
    <link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- Custom styles for this template-->
    <link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	
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
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url(&quot;/images/galaxy.jpeg&quot;); height: 15vh; background-position: 0% 0px; margin-bottom:100;">
</div>

<!-- 상단 배너 -->
	    <div class="container-fluid" style="  width : 60%; margin-bottom : 150px; margin-top : 100px;">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">설문지 참여하기</h1>
        <p class="mb-4">'${c_name}'의 설문지 입니다.</p>

        <div class="card shadow mb-6">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">'${s_id}'님 참여해주셔서 감사합니다.</h6>
                <p style="text-align: right"><a href="/comm/read/${c_code}" style="color: #3b5998; margin-top: 20px">돌아가기</a></p>
            </div>
            <div class="card-body">   

        <div class="table-responsive">


<!-- 본문작성 시작 -->	
	<div class="container">
	<br>
		<div>
		
		<form name="answer" id="answer" method="post">
		<!-- 파일 첨부는 하지 않기 때문에 enctype="multipart/form-data"는 필요 없어유 -->
		<input type="hidden" id="ans_code" name="ans_code" class="ans_code" value="${dsv_code}"> <!-- dsv_code -->
		<input type="hidden" id="ans_id" name="ans_id" class="ans_id" value="${s_id}"> <!-- dsv_code --> 
		
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
								<!-- 주관식 답변 코드 만들기 -->
								<c:set var="j" value="${j+1}"/>
								<c:if test="${j<10}">
									<c:set var="anscodeno" value="ju0${j}"></c:set>
								</c:if>
								<c:if test="${j>=10}">
									<c:set var="anscodeno" value="ju${j}"></c:set>
								</c:if>
									<input type="text" class="${anscodeno}" id="${choice.ch_no}" name="${anscodeno}" >
									<input type="hidden" id="${orderno}" name="${orderno}" value="${anscodeno}">
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
								<!-- 객관식 답변 코드 만들기 -->
								<c:set var="g" value="${g+1}"/>
								<c:if test="${g<10}">
									<c:set var="anscodeno" value="g0${g}"></c:set>
								</c:if>
								<c:if test="${g>=10}">
									<c:set var="anscodeno" value="g${g}"></c:set>
								</c:if>
									<input type="radio" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}"><label for="${choice.ch_order}">&nbsp;${choice.ch_content}</label>
									<input type="hidden" name="${anscodeno}" class="${anscodeno}" value="${choice.ch_content}">
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
								<!-- 체크박스 답변 코드 만들기 -->
								<c:set var="c" value="${c+1}"/>
								<c:if test="${c<10}">
									<c:set var="anscodeno" value="c0${c}"></c:set>
								</c:if>
								<c:if test="${c>=10}">
									<c:set var="anscodeno" value="c${c}"></c:set>
								</c:if>
									<input type="checkbox" id="${choice.ch_no}" name="${orderno}" value="${anscodeno}"><label for="${choice.ch_order}">&nbsp;${choice.ch_content}</label>
									<input type="hidden" name="${anscodeno}" class="${anscodeno}" value="${choice.ch_content}">
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
								<!-- 달력 답변 코드 만들기 -->
								<c:set var="s" value="${s+1}"/>
								<c:if test="${s<10}">
									<c:set var="anscodeno" value="s0${s}"></c:set>
								</c:if>
								<c:if test="${s>=10}">
									<c:set var="anscodeno" value="s${s}"></c:set>
								</c:if>
									<input type="date" class="${anscodeno}" id="${choice.ch_no}" name="${anscodeno}" min="${min}">
									<input type="hidden" id="${orderno}" name="${orderno}" value="${anscodeno}">
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
								<!-- 시간 답변 코드 만들기 -->
								<c:set var="t" value="${t+1}"/>
								<c:if test="${t<10}">
									<c:set var="anscodeno" value="t0${t}"></c:set>
								</c:if>
								<c:if test="${t>=10}">
									<c:set var="anscodeno" value="t${t}"></c:set>
								</c:if>						
									<input type="time" class="${anscodeno}" id="${choice.ch_no}" name="${anscodeno}">
									<input type="hidden" id="${orderno}" name="${orderno}" value="${anscodeno}">
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
			<!-- <button type="button" onclick="insert() " id="btn_survey" class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 100px;  height:30;  margin:auto; display :inline-block;" >설문등록</button> -->
			<button type="button" onclick="insert() "  class="btn btn-outline-light btn-block text-dark" style="font-weight: bold; color: #3b5998; border-color: #2a96a5; width: 50%; margin:auto;" >
                            <span class="glyphicon glyphicon-ok"></span> 설문등록</button>
		<br>
	</form>	
		
		</div>
	</div>
</div>
</div>
</div>
</div>
<script>

	
	function insert() {
		let ans_code = $(document).find('input.ans_code').val();
		let ans_id = $(document).find('input.ans_id').val();
		var count = ${count};
		if(ans_code==""){
			ans_code.focus();
			alert("경로가 잘못되었습니다.");
			return false;
		}
		if(ans_id==""){
			//ans_id.focus();
			alert("로그인이 필요합니다.");
			return false;
		}
		
		for( var i=1; i<=count; i++){
/* 		가져오기 방법 1	
			$(document).ready(function() {
			    var inputValue = $("input[name='od0"+i+"']:checked").val();
			    alert(inputValue);
			}); */
			
			let ans_order = "od0"+i+""
			var set = document.getElementsByName(ans_order)
			
			set.forEach((node) => {
				
			    if(node.checked) {
			    //	alert(node.value)
		        
		        	let ans_anscode	= node.value
		        	let ans_content = $(document).find('input.'+ans_anscode+'').val();
		    		if(ans_content==""){
		    			ans_content.focus();
		    			alert("체크해 주세요.");
		    			return false;
		    		}
		        //	alert("	ans_content : " + ans_content);	
		        //	alert("ans_code : " + ans_code);
		        //	alert("ans_order : " + ans_order);
		        //	alert("ans_anscode : " + ans_anscode);
			    	
		        	

					let survey = {
						ans_code : ans_code,
						ans_order : ans_order,
						ans_anscode : ans_anscode,
						ans_id	: ans_id,
						ans_content : ans_content
					} // survey end
					
					$.ajax({
						type: "post",
						url:"/survey/write/answer",
						contentType: "application/json",
						data: JSON.stringify(survey),
						success:function(data){
							alert(data);
						}
					}) // ajax end
			    
			    	
			    } else if (	node.value.substring(0,1) == "j" ||
			    			node.value.substring(0,1) == "s" ||
			    			node.value.substring(0,1) == "t" ) {
			    //	alert(node.value);

		        	let ans_anscode	= node.value
		        	let ans_content = $(document).find('input.'+ans_anscode+'').val();
		        //	alert("	ans_content : " + ans_content);	
		        //	alert("ans_code : " + ans_code);
		        //	alert("ans_order : " + ans_order);
		        //	alert("ans_anscode : " + ans_anscode);
			    //	alert("ans_id : " + ans_id);
		        	

					let survey = {
						ans_code : ans_code,
						ans_order : ans_order,
						ans_anscode : ans_anscode,
						ans_id	: ans_id,
						ans_content : ans_content
					} // survey end
					
					$.ajax({
						type: "post",
						url:"/survey/write/answer",
						contentType: "application/json",
						data: JSON.stringify(survey)
		   
					}) // ajax end
					

			    } // if end
			}) // set end
			
			//alert(document.querySelector('input[name="od01"]:checked'));
		} // end
		let s_code = '${c_code}';
		let s_nick = '${s_nick}';
		
		let comsign = {
				s_code : s_code,
				s_id : ans_id,
				s_nick : s_nick,
				s_surveycode : ans_code
			} // survey end
			
			alert(comsign);
			$.ajax({
				type: "post",
				url:"/survey/write/comsign",
				contentType: "application/json",
				data: JSON.stringify(comsign)
			}) // ajax end	
		
	alert("신청 되었습니다.");
	window.location.href = "http://localhost:9090/comm/read/${c_code}";
	}// function() end
</script>
   
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>