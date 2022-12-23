<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!-- 나만의 서재 관련 link, style 시작 -->
<link rel="stylesheet" href="/css/libtable.css">
<!-- Custom fonts for this template-->
<link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

<style>
.site-nav .site-navigation .site-menu > li > a {
	color : black;
}
.site-nav .site-navigation .site-menu > li.active > a {
	color : black;
}
.lib-cont * {
	font-family: "KyoboHandwriting2020A";
}
.lib-cont  a, .lib-cont a:hover {
	color : black !important;
}
</style>
<!-- 나만의 서재 관련 link, style 끝 -->
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant" data-stellar-background-ratio="0.5" style="background-image: url('../../images/topbg.jpg'); height: 60vh;">
	</div>
<!-- 배너 끝 -->
<div class="container-fluid">
	<div class="row lib-row">
	<div class="container-fluid text-right lib-cont">
		<h1>그대의, 커뮤니티</h1>
		<h4 style="font-size: medium;">1+1이 2라고요?.. 누가 그랬어요?</h4>
	</div>
	<!-- 커뮤니티 목록 시작 -->
	<div class="lib-cont col-12">
    <div class="section-latest">
      <div class="container">
        <div class="row gutter-v1 align-items-stretch mb-5">
          <div class="col-md-12">
          <c:forEach items="${commuRead}" var="commu">
              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media" style="width: 20vw; padding-right: 20px;">
                    <img src="/storage/${commu.c_banner}" alt="Image" class="img-fluid">
                  </div>
                  <div class="text">
                    <div class="meta">
                      <span>가입일 : ${commu.ac_rdate.substring(0,11)}</span>
                    </div>
                    <h2><a href="/comm/read/${commu.c_code}">${commu.c_name}</a></h2>
                    <c:if test="${commu.ac_manjok ne null}">
	                    <p>
	                    <c:forEach var="cnt" begin="1" end="${commu.ac_manjok}" step="1">
								<img src="/images/star.png" width="15px">
						</c:forEach>
						</p>
					</c:if>
                  </div>
                </div>
              </div>
		  </c:forEach>
          </div>
        </div>
      </div>
  </div>
</div>
</div>
</div>

<!-- 커뮤니티 목록 끝 -->

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>