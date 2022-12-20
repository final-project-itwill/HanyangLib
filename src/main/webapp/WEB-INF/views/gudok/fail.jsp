<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/login1.jpg'); height: 100vh;">
	<div style="height: 100vh;"></div>
	<div class="container text-center" style="background-color: white; background-color: rgba( 255, 255, 255, 0.8 ); width: 400px; position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);">
		<div><br>
			<h1><i class="fas fa-exclamation-triangle"></i></h1>
		      <h4 class="title">결제에 실패했습니다<br>다시 한 번 확인해주세요</h4>
		      <br>  
		      <input type="button" value="돌아가기" onclick="location.href='/gudok/index'">
		      <br>
		</div>
	</div>
	</div>
<!-- 본문작성 끝 -->
<%-- <%@ include file="../footer.jsp"%> --%>