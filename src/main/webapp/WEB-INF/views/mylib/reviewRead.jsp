<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
	<!-- 배너 시작 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
	<!-- 배너 끝 -->
	<!-- 서평목록 시작 -->
	<table class="table">
	<c:forEach items="${rvRead}" var="rvRead">
	<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
		<td>${rvRead.br_title}</td>
		<td>${rvRead.br_id}</td>
		<td>${rvRead.br_count}</td>
		<td>${rvRead.b_name}</td>
	</tr>
	<tr style="text-align: center;">
		<td colspan="4">${rvRead.br_content}</td>
	</tr>
	</c:forEach>
	</table>
	<!-- 서평 목록 끝 -->
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>