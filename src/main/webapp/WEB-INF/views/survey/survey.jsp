<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>

<!--이미 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>

   
<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<p>
		<button type="button" onclick="location.href='survey'">설문</button>
		<button type="button" onclick="location.href='create'">설문생</button>
	</p>
	<br>
		<div>
		<h3> <!--카테고리 이 -->커뮤니티 참여 신청서</h3>
		<form name="survey" method="post" action="insert" enctype="multipart/form-data">
		<table class="table">
		
		<!-- 주관식 반복 -->
		<tr>
			<td> 제 목 </td>
			<td> 내 용 </td>
			<td> 등록일 </td>
		<c:forEach var="row" items="${list}" varStatus="vs">
		<tr>
			<c:choose>
				<c:when test="${row.sv_title != '-'}">
					<td>${row.sv_title}</td>
					<td><a href="write/${row.sv_code}">${row.sv_des}</a></td>
					<td>${sv_rdate}</td>
				</c:when>
			</c:choose>

		</tr>
		
		<!-- 보기 5개씩 보이게 만들] -->
		<c:if test="${vs.count mod 5==0}"></c:if>
				
		</c:forEach> 
		</table>
		
		</form>
		</div>
	</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>