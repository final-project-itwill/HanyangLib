<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 본문작성 시작 -->

 <!-- 아이디,이메일 입력 폼 -->
	<div class="p-5">
     <div class="text-center">
         <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
         <p class="mb-4">아이디와 이메일을 입력해주세요!</p>
     </div>
     <form class="user" action="/member/findPw" method="post" name="findfrm">
        <div class="form-group">
             <input type="text" class="form-control form-control-user"
                 id="memberId" aria-describedby="IdHelp" name="memberId"
                 placeholder="ID를 입력하세요...">
             <input type="hidden" name="m_id" id="m_id">
         </div>
         <div class="form-group">
             <input type="email" class="form-control form-control-user"
                 id="memberEmail" aria-describedby="emailHelp" name="memberEmail"
                 placeholder="EMAIL을 입력하세요...">
             <input type="hidden" name="m_email" id="m_email">
         </div>
        <button><a href="/member/pwupdateform">비밀번호 찾기</a></button>
      	
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
<script>
function check() {

}





</script>



<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>