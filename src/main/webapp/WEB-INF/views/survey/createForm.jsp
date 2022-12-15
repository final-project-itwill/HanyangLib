<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>   
<!-- 입력창 크기 조절 css -->
<style>
.input_size input{width:100%}
</style>

<!-- 상단 배너 시작 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 상단 배너 끝 -->
<!-- 본문작성 시작 -->
<div class="container">
	<form name="create" method="post">
		<input type="hidden" name="sv_code" value="${sv_code}">
		<input type="button" onclick="seeSource()">
		<div class="test1"></div>
		<script>
		function seeSource() {
			$(".test1").text(document.documentElement.innerHTML);
		}
		</script>
		<table class="table site-section bg-light">
		<tr>
			<th>설문조사 ${dsv_code}</th>
		</tr>
		<tr>
			<td>제목 : </td>
			<td>
				<span class="input_size">
					<input type="text" name="sv_title" id="sv_title" placeholder="해당 설문지의 제목을 입력하세요.">
				</span>
			</td>
		</tr>
		<tr>
			<td>설명 : </td>
			<td>
				<span class="input_size">
					<input type="text" name="sv_des" id="sv_des" placeholder="설문지에 대한 설명을 입력하세요.">
				</span>
			</td>
		</tr>
		<tr>
			<td>인원제한 : </td>
			<td>
				<span class="input_size">
					<input type="number" name="sv_max" name="sv_max">
				</span>
			</td>
		</tr>
		<tr>
			<td>마감일 : </td>
			<td>
				<span class="input_size">
					<input type="date" name="sv_edate" name="sv_edate">
				</span>
			</td>
		</tr>
		</table>
	<c:set var="cnt" value="1"></c:set>
	<div>
		<input type="hidden" name="dsv_code" value="${sv_code}">
		<input type="hidden" name="ch_code" value="${sv_code}">
		<div class="surveyContent" name="surveyContent" id="surveyContent">
			<div class="input_subject">
				<input type="hidden" name="dsv_order" id="dsv_order" value="od0${cnt}">
				${cnt}
				<input type="text" name="dsv_subject" placeholder="질문의 제목을 입력하세요."></input>
				<input type="radio" name="dsv_check" id="dsv_check" value="">
			</div>		
			<div>
				<select class="selectbox" name="dsv_type" id="dsv_type" onchange="changeType()">
					<option value="1" selected disabled>유형을 선택하여주세요</option>
					<option value="gaek">객관식</option>
					<option value="ju">주관식</option>
					<option value="check">체크박스</option>
					<option value="time">시간</option>
					<option value="schedule">날짜</option>
				</select>
			</div>
			<div name="input_content1" id="input_content1"></div>
		</div>
		<input type="button" value="질문 추가하기" onclick="addSurvey()">
	</div>
	</form>
</div>
<!-- 본문작성 끝 -->
<!-- 설문지 생성 관련 자바스크립트 -->
<script>
	// 		 content += '<input type="button" name="removeC" id="removeC" value="답변삭제">';
 let cnt = ${cnt};
	
	
 // 1) 질문의 유형이 선택되었을 때 기본적인 항목창 출력시키기
 function changeType(){
	 alert($(".selectbox option:selected").val());
	 let type = $(".selectbox option:selected").val();
	 alert(type);
	 let content = "";
	 
	 alert(cnt);
	 
	 if(type == 'gaek'){
		 content += '<input type="hidden" name="dsv_type" id="dsv_type" value=';
		 content += type;
		 content += '>';
		 content += '<input type="text" name="ch_content" id="ch_content" placeholder="항목을 추가하려면 추가버튼을 누르세요">';
		 content += '<input type="button" name="addcontent" id="addcontent" value="항목 추가하기">';
	 } else if(type == 'ju'){
		 content += '<input type="hidden" name="dsv_type" id="dsv_type" value=';
		 content += type;
		 content += '>';
		 content += '<input type="text" name="ch_content" id="ch_content">';
	 } else if(type == 'check'){
		 content += '<input type="hidden" name="dsv_type" id="dsv_type" value=';
		 content += type;
		 content += '>';
		 content += '<input type="checkbox">';
		 content += '<input type="text" name="ch_content" id="ch_content">';
		 content += '<input type="button" name="addcontent" id="addcontent" value="항목 추가하기">';
	 } else if(type == 'time'){
		 content += '<input type="hidden" name="dsv_type" id="dsv_type" value=';
		 content += type;
		 content += '>';
		 content += '<input type="time">';
		 content += '<input type="button" name="addcontent" id="addcontent" value="항목 추가하기">';
	 } else if(type == 'schedule'){
		 content += '<input type="hidden" name="dsv_type" id="dsv_type" value=';
		 content += type;
		 content += '>';
		 content += '<input type="date">';
		 content += '<input type="button" name="addcontent" id="addcontent" value="항목 추가하기">';		 
	 } // if end
	 $("#input_content").html(content);
 } // changeType() end
 
 // 2) 질문 추가를 눌렀을 때 질문이 추가되기
	function addSurvey(){
		alert(cnt);
		cnt++;
		alert(cnt);
		let a = '';
		a += ' <div class="input_subject"> ';
		a += cnt;
		a += ' <input type="hidden" name="dsv_order" id="dsv_order" value="od0';
	 	a += cnt;
	 	a += ' "> ';
	 	a += ' <input type="text" name="dsv_subject" placeholder="질문의 제목을 입력하세요."></input> ';
 		a += ' <input type="radio" name="dsv_check" id="dsv_check" value=""> ';
		a += ' </div> ';
		a += ' <div> ';
		a += ' 		<select class="selectbox" name="dsv_type" id="dsv_type" onchange="changeType()"> ';
		a += ' 		<option value="0" selected disabled>유형을 선택하여주세요</option> ';
		a += ' 		<option value="gaek">객관식</option> ';
		a += ' 		<option value="ju">주관식</option> ';
		a += ' 		<option value="check">체크박스</option> ';
		a += ' 		<option value="time">시간</option> ';
		a += ' 		<option value="schedule">날짜</option> ';
		a += ' 		</select> ';
		a += ' </div> ';
		a += ' <div name="input_content ';
		a += cnt;
		a += ' " id="input_content ';
		a += cnt;
		a += ' "></div> ';
		a += ' </div> ';
	alert(a);
	$("#surveyContent").append(a);
	
 }


</script>
<%@ include file="../footer.jsp"%>