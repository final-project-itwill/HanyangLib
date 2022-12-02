<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="auth.jsp" %>
<!-- 본문작성 시작 -->
<%if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guset")){
	//아이디 저장 쿠키 확인-----------------------
	Cookie[] cookies=request.getCookies();
	String c_id="";
	if(cookies!=null){ //쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){ //모든 쿠키값을 검색
			Cookie cookie=cookies[i]; //쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id=cookie.getValue();
			}//if end
		}//for end
	}//if end

%>	
<div class="container">
<!--  	 <img class="wave" id="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">-->
  <div class="container" id="container">
    <div class="img" id="img">
      <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content" id="login-content">
      <form id="form">
      <!--   <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg"> -->
        <h2 class="title">환영합니다</h2>
              <div class="input-div one">
                 <div class="i" id="user">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div" id="div">
                    <input type="text" class="input" placeholder="username">
                 </div>
              </div>
              <div class="input-div pass" id="input-div pass">
                 <div class="i" id="user"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <input type="password" class="input" id="input" placeholder="password">
                 </div>
              </div>
              <a href="#" id="a">Forgot Password?</a>
              <input type="submit" class="btn" id="btn" value="Login">
              
            	<input type="button" class="btn" id="btn" value="signup"
            	onclick="location.href='/member/memberform'">
 
            </form>
            
        </div>
    </div>

</div>
<%
}else{
	out.println("<strong>" + s_id +"</strong> 님");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	out.println("<br><br>");
	out.println("<a href='memberModify.jsp'>회원정보수정</a>");
	out.println(" &nbsp;&nbsp;");
	out.println("<a href='memberWithdraw.jsp'>회원탈퇴</a>");
}//if end

%>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>