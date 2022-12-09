<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
<div class="jumbotron">
<h1>한양서재에 오신것을 환영합니다</h1>
<p>회원가입 성공!</p>
<input type="button" name="button" class="btn btn-outline-success" onclick="location.href='/login/loginForm'" value="로그인 창으로 돌아기기">
<!--  <input type="button" name="button" class="btn btn-success btn-lg btn-block" onclick="location.href='/login/loginForm'" value="로그인"> -->
</div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>