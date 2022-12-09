<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 본문작성 시작 -->
<div class="container text-center">
	<div class="login-content" id="login-content">
        <c:if test="${not empty error}">
        <div>
            로그인 실패시와 아웃시 출력하는 것은 더 알아보기
            아이디와 비밀번호를 확인해주세요
        </div>
        </c:if>
        <c:if test="${not empty logout}">
        <div>
            로그아웃 되셨습니다
        </div>
        </c:if>
    
	      <h2 class="title">환영합니다</h2>   
	      <form id="form" action="/account/register" method="post">
			<div class="input-div one">
			   <div class="i" id="user">
			      <i class="fas fa-user"></i>
			   </div>
			   <div class="div" id="div">
			      <input type="text" class="input" id="m_id" name="m_id" placeholder="username">
			   </div>
			</div>
			<div class="input-div pass" id="input-div pass">
			   <div class="i" id="user"> 
			      <i class="fas fa-lock"></i>
			   </div>
			   <div class="div">
			      <input type="password" class="input" id="m_pw" name="m_pw" placeholder="password">
			   </div>
			</div>
			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
	
			<a href="#" id="a">Forgot Password?</a>
			<input type="submit" class="btn" id="btn" value="Login">
			<input type="button" class="btn" id="btn" value="signup" onclick="location.href='/member/agreement'">
	
		</form>
            
	</div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>