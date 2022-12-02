<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="/js/jquery-3.5.1.min.js"></script>

<!--이미 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>




<!-- 본문작성 시작 -->	
	<div class="container" style="margin-top :70px;">
	<p>
		<button type="button" onclick="location.href='../survey'">설문</button>
	</p>
	<br>
		<div>
		<h3> 신청서 작성 </h3>
		<form name="survey" method="post" action="" enctype="multipart/form-data">
		<table class="table">
		
		<!-- 주관식 반복 -->
		<c:forEach var="row" items="${detail}" varStatus="vs">
		<tr>
			<c:choose>
					<c:when test="${row.dsv_subject != '-'}">
					<td>${row.dsv_subject}
					
					<c:choose>
						<c:when test="${row.dsv_type eq 'ju'}"><br>
						<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">
								<input type="text" id="${var.ch_no}" name="${var.ch_order}">
							</c:when>
							</c:choose>						
						</c:forEach>
						</c:when>
						
						<c:when test="${row.dsv_type eq 'gaek' or 'etc'}"><br>
						<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">
								<input type="radio" id="${var.ch_no}" name="${var.ch_order}" value="${var.ch_order}"><label for="${var.ch_order}">${var.ch_content}</label>
							</c:when>
							</c:choose>
						</c:forEach>
						</c:when>
						
						<c:when test="${row.dsv_type eq 'check' or 'etc' }"><br>
						<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">
								<input type="checkbox" id="${var.ch_no}" name="${var.ch_order}" value="${var.ch_order}"><label for="${var.ch_order}">${var.ch_content}</label>
							</c:when>
							</c:choose>
						</c:forEach>						
						</c:when>
						
						<c:when test="${row.dsv_type eq 'drop' or 'etc'}"><br>
						<select>
						<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">
								<option id="${var.ch_no}" name="${var.ch_order}" value="${var.ch_order}">${var.ch_content}</option>
							</c:when>
							</c:choose>
						</c:forEach>
						</select>
						</c:when>
						
						<c:when test="${row.dsv_type eq 'schedule' }"><br>
							<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">
								<input type="date">
							</c:when>
							</c:choose>
							</c:forEach>
						</c:when>
						
						<c:when test="${row.dsv_type eq 'time' }"><br>
							<c:forEach var="var" items="${details}" varStatus="vs">
							<c:choose>
							<c:when test="${ row.dsv_order eq var.ch_order}">											
								<input type="time">
							</c:when>
							</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>	

					</td>
					</c:when>
			</c:choose>

		</tr>
		
		<!-- 보기 5개씩 보이게 만들] -->
		<c:if test="${vs.count mod 5==0}"></c:if>
				
		</c:forEach> 

		
<!-- 설문 End -->
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="쓰기" class="btn btn-success">
		       <input type="reset"  value="취소" class="btn btn-danger">
		    </td>
		</tr>    
		</table>
		
		</form>
		</div>
	</div>

   
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>