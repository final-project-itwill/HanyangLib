<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="auth.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 본문작성 시작 -->
 <%--if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){ 
	// 아이디 저장 쿠키 확인 ---------------------------------------------------
	Cookie[] cookies = request.getCookies(); // 사용자 pc에 저장된 모든 쿠키값 가져오기
	String c_id = "";
	if(cookies!=null){ // 쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id = cookie.getValue();	
			} // if end
		} // for end
	} // if end
	
	// ------------------------------------------------------------------

 --%>



<div class="container text-center">
	<div class="login-content" id="login-content">
    
	      <h2 class="title">환영합니다</h2>   
	      <form action="/login/loginproc" method="post">
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