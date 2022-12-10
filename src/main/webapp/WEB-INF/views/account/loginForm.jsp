<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<!-- 본문작성 시작 -->
<!-- 쿠키 확인 -->
<%
	Cookie[] cookies = request.getCookies();
	String c_id = "";
	if(cookies!=null){ // 쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id = cookie.getValue();	
			} // if end
		} // for end
	} // if end
%>

<c:choose>
	<%-- 로그인 한 상태라면 --%>
	<c:when test="${grade!=null}">
	<div class="text-center">
		<h2 class="title">환영합니다</h2>   
		<h3 class="user-name"><strong>${s_id}</strong> 님  </h3>
   
		<a href="/login/logout" class="btn-notice-master ml30">로그아웃</a>
		<div class="mt30 text-center">
			<a href="#" class="btn btn-primary">회원정보수정</a>
			<a href="#" class="btn btn-primary ml30">회원탈퇴</a>	
		</div>
<!-- 		<div onclick="kakaoLogout();">
		     <a href="javascript:void(0)">
		         <span>카카오 로그아웃</span>
		     </a>
		</div> -->
	</div>
	</c:when>
	<%-- 로그인을 안 한 상태라면 --%>
	<c:otherwise>
	<div class="container text-center">
		<div class="login-content" id="login-content">
	    
		      <h2 class="title">로그인을 하여<br>한양서재를 이용해보세요</h2>   
		      <form action="/login/loginproc" method="post">
				<div class="input-div one">
				   <div class="i" id="user">
				      <i class="fas fa-user"></i>
				      <input type="text" class="input" id="m_id" name="m_id" placeholder="username" value="<%=c_id%>">
				   </div>
				</div>
				<div class="input-div pass" id="input-div pass">
				   <div class="i" id="user"> 
				      <i class="fas fa-lock"></i>
				      <input type="password" class="input" id="m_pw" name="m_pw" placeholder="password">
				   </div>
				</div>
				<div class="checkbox mb-3">
					<label>
						<input type="checkbox" value="remember" id="c_id" name="c_id" <%if(!c_id.isEmpty()){out.print("checked");}%>>
						아이디 기억하기
					</label>
				</div>
		
				<a href="#" id="a">Forgot Password?</a>
				<input type="submit" class="btn" id="btn" value="Login">
				<input type="button" class="btn" id="btn" value="signup" onclick="location.href='/member/agreement'">
			</form>
			<!--
			<div class="text-center">	            
				<table style="margin: auto;">
				<tr>
					<td id="GgCustomLogin">
						<a href="javascript:void(0)">
						<i class="fab fa-google"></i><span> Google 로그인</span>
						</a>
					</td>
					<td>&emsp;</td>
				 	<td onclick="kakaoLogin();">
				      <a href="javascript:void(0)">
				          <span>카카오 로그인</span>
				      </a>
					</td>
				</tr>
				</table>
			</div>
			<script>
			
			// 구글 로그인
			// 처음 실행하는 함수
			function init() {
				gapi.load('auth2', function() {
					gapi.auth2.init();
					options = new gapi.auth2.SigninOptionsBuilder();
					options.setPrompt('select_account');
			        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
					options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
			        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
			        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
					gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
				})
			}
			
			function onSignIn(googleUser) {
				var access_token = googleUser.getAuthResponse().access_token
				$.ajax({
			    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
					url: 'https://people.googleapis.com/v1/people/me'
			        // key에 자신의 API 키를 넣습니다.
					, data: {personFields:'birthdays', key:'AIzaSyA21TJ6ZRo49Kc-rLY9w2JkOLa0hAR6ivY', 'access_token': access_token}
					, method:'GET'
				})
				.done(function(e){
			        //프로필을 가져온다.
					var profile = googleUser.getBasicProfile();
					console.log(profile)
				})
				.fail(function(e){
					console.log(e);
				})
			}
			function onSignInFailure(t){		
				console.log(t);
			}
			</script>
			// 구글 api 사용을 위한 스크립트
			<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
			
			// 카카오 스크립트
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
			Kakao.init('14166aacf486b99d5b1779442f4f5f78'); //발급받은 키 중 javascript키를 사용해준다.
			console.log(Kakao.isInitialized()); // sdk초기화여부판단
			//카카오로그인
			function kakaoLogin() {
			    Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  console.log(response)
			          },
			          fail: function (error) {
			            console.log(error)
			          },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      },
			    })
			  }
			//카카오로그아웃  
			function kakaoLogout() {
			    if (Kakao.Auth.getAccessToken()) {
			      Kakao.API.request({
			        url: '/v1/user/unlink',
			        success: function (response) {
			        	console.log(response)
			        },
			        fail: function (error) {
			          console.log(error)
			        },
			      })
			      Kakao.Auth.setAccessToken(undefined)
			    }
			  }  
			</script>
			 -->
		</div>
	</div>
	</c:otherwise>
</c:choose>




<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>