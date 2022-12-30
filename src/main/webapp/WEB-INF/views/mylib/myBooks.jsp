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
<!-- ebookRead 새창으로 열기 자바스크립트 -->
<script>
	function readEbook(b_code){
		let link = "http://cloudd81.cafe24.com/mylib/eBookRead/"+b_code;
		let encodedURI = encodeURI(link);
		window.open(encodedURI, '');
	}//readEbook() end

</script>

<div class="container-fluid">
	<div class="row lib-row">
		<!-- 상세페이지 -->
		<!-- 책 목록 시작 -->
		<div class="container-fluid lib-cont col-12 col-sm-9 col-lg-9">
			<div class="container pb-5 mb-5 border-bottom">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="mb-3 text-black text-center" style="padding-top: 50px; padding-bottom: 50px;">
							보물과도 같은 책들이<br>쌓여있어요
						</h1>
					</div>
					<div class="col-lg-12">
						<div class="row gutter-1 gallery">
							<c:forEach items="${libRead}" var="read" varStatus="vs">
								<div class="col-3">
									<a href="${read.b_bookcover}" class="gal-item"
										data-fancybox="gal"><img src="${read.b_bookcover}"
										alt="Image" class="img-fluid"></a> <a
										href="javascript:readEbook(${read.b_code});">${read.b_name}</a>
									<br> 진행도 :
									<fmt:formatNumber value="${read.lib_proc}" pattern="###" />%
								</div>
								<c:if test="${vs.count mod 4==0}">
								<div class="container-fluid"><br><br></div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 책 목록 끝 -->
	</div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>