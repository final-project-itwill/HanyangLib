<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
	<div class="p-5">
     <div class="text-center">
         <h1 class="h4 text-gray-900 mb-2">비밀번호 바꾸기</h1>
         <p class="mb-4">새로운 비밀번호를 입력하세요!</p>
     </div>
     <form class="user" action="/member/findPw" method="post">
        <div class="form-group">
             <input type="text" class="form-control form-control-user"
                 id="memberId" aria-describedby="IdHelp" name="memberId"
                 placeholder="새비밀번호를 입력하세요">
         </div>
         <button type="submit" class="btn btn-primary btn-user btn-block">
             비밀번호 바꾸기
         </button>
     </form>
     <hr>
      <a href="/login/index" class="btn btn-google btn-user btn-block">
            Login
         </a>
         <hr>
        <div class="text-center">
         <a class="small" href="/">메인페이지</a>
     </div>
     </div>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>