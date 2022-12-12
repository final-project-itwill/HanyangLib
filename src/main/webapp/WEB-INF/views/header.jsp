<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">
<!--     구글 로그인 : content에 자신의 OAuth2.0 클라이언트ID를 넣습니다.
	<meta name ="google-signin-client_id" content="79165199733-nhgebrkqrqdtqf389rm3963hrc81p223.apps.googleusercontent.com">
	카카오 로그인
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/fonts/feather/style.css">
    <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <title>&#128218 한양서재</title>
</head>
<body>
<!-- header 시작 -->
<div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close">
            <span class="icofont-close js-menu-toggle"></span>
        </div>
    </div>
    <div class="site-mobile-menu-body"></div>
</div>
	<div class="container">
	  <nav class="site-nav">
	    <div class="logo">
	      <a href="/"><img src="/images/hylogo_w.png" style="width:120px; margin-top: 20px;"></a>
	    </div>
	    <div class="row align-items-center">
		<c:choose>
		<%-- 로그인 했을 때 --%>
		<c:when test="${grade!=null}">
	      <div class="col-12 col-sm-12 col-lg-12 site-navigation text-center">
	        <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu">
	          <li class="active"><a href="/" style="font-weight: bold;">Home</a></li>
	          <li class="has-children">
	          <a href="/book/booklist" style="font-weight: bold;">도서목록</a>
	          <ul class="dropdown">
                  <li><a href="/book/bookcate_n">소설/시</a></li>
                  <li><a href="/book/bookcate_e">에세이</a></li>
                  <li><a href="/book/bookcate_h">인문</a></li>
                  <li><a href="/book/bookcate_s">자연과학</a></li>
                </ul>
          	</li>
          	<li><a href="/gudok/detail" style="font-weight: bold;">구독</a></li>
	          	<li><a href="/mylib/libindex/${s_id}" style="font-weight: bold;">나만의 서재</a></li>
	          	<li><a href="/comm/index" style="font-weight: bold;">커뮤니티</a></li>
              	<li class="has-children">
              		<a href="#" style="font-weight: bold;">고객센터</a>
	                <ul class="dropdown">
	                  <li><a href="/notice/list?pageNum=1">공지사항</a></li>
	                  <li><a href="#">문의</a></li>
	                </ul>
	              </li>
	        </ul>
			<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right menu-absolute">
            	<li>
        			<a class="font2" href="/login/index" style="font-weight: bold;">
        			<i class="fas fa-user"></i> ${s_id}님
        			</a>
        		</li>
        	</ul>
        	<a href="#" class="burger light ml-auto site-menu-toggle js-menu-toggle d-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
	          <span></span>
	        </a>
	      </div>
		</c:when>
		<%-- 로그인 안했을 때 --%>
		<c:otherwise> 
	      	<div class="col-12 col-sm-12 col-lg-12 site-navigation text-center">
	        <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu">
	          <li class="active"><a href="/" style="font-weight: bold;">Home</a></li>
	          <li class="has-children">
	          <a href="/book/booklist" style="font-weight: bold;">도서목록</a>
	          <ul class="dropdown">
                  <li><a href="/book/bookcate_n">소설/시</a></li>
                  <li><a href="/book/bookcate_e">에세이</a></li>
                  <li><a href="/book/bookcate_h">인문</a></li>
                  <li><a href="/book/bookcate_s">자연과학</a></li>
                </ul>
	          </li>
   	        <li><a href="/login/index" style="font-weight: bold;">구독</a></li>
	          	<li><a href="/login/index" style="font-weight: bold;">나만의 서재</a></li>
	          	<li><a href="/login/index" style="font-weight: bold;">커뮤니티</a></li>
              	<li class="has-children">
              		<a href="#" style="font-weight: bold;">고객센터</a>
	                <ul class="dropdown">
	                  <li><a href="/notice/list?pageNum=1">공지사항</a></li>
	                  <li><a href="#">문의</a></li>
	                </ul>
	              </li>
	        </ul>          
	        <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right menu-absolute">
            	<li class="cta-button">
              		<a class="font2" href="/login/index" style="font-weight: bold;">
        				<i class="fas fa-sign-in-alt"></i> 로그인
        			</a>
        		</li>
            </ul>
       		<a href="#" class="burger light ml-auto site-menu-toggle js-menu-toggle d-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
	          <span></span>
	        </a>
	      </div>
        </c:otherwise>
        </c:choose>	
	    </div>  
	  </nav> <!-- END nav -->
	</div> <!-- END container -->
<!-- header 끝 -->
