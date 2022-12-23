<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/feather/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/style.css">
	<!-- fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<!-- Custom styles for this template-->
    <link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="js/jquery-3.5.1.min.js"></script>
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
	      <a href="/"><img src="images/hylogo_w.png" style="width:120px; margin-top: 20px;"></a>
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
	          	  <li><a href="/book/bookcate_a?pageNum=1">전체보기</a></li>
                  <li><a href="/book/bookcate_n?pageNum=1">소설/시</a></li>
                  <li><a href="/book/bookcate_e?pageNum=1">에세이</a></li>
                  <li><a href="/book/bookcate_h?pageNum=1">인문</a></li>
                  <li><a href="/book/bookcate_s?pageNum=1">자연과학</a></li>
                </ul>
          	</li>
          	<li><a href="/gudok/index" style="font-weight: bold;">구독</a></li>
	          	<li><a href="/mylib/libindex/${s_id}" style="font-weight: bold;">나만의 서재</a></li>
	          	<li><a href="/comm/index" style="font-weight: bold;">커뮤니티</a></li>
              	<li class="has-children">
              		<a href="#" style="font-weight: bold;">고객센터</a>
	                <ul class="dropdown">
	                  <li><a href="/notice/list?pageNum=1">공지사항</a></li>
	                  <li><a href="/inquiry/list">1:1문의</a></li>
					  <c:choose>
						<c:when test="${grade == 'A'}">
							<li><a href="/admin/dashboard">관리자 페이지</a></li>
						</c:when>
					  </c:choose>
	                </ul>
	              </li>
	        </ul>
			<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right menu-absolute">
            	<li>
        			<a class="font2" href="/login/index" style="font-weight: bold;">
        			<i class="fas fa-user"></i> ${s_id}님
        			</a>
        		</li>
        		<!-- 장바구니 목록 추가 -->
	            <li><a href="/cart/cartList?cart_id=${s_id}&cart_code=${book.b_code}" style="font-weight: bold;"><i class="fas fa-shopping-cart"></i></a></li>
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
	          <a href="/book/booklist?pageNum=1" style="font-weight: bold;">도서목록</a>
	          <ul class="dropdown">
                  <li><a href="/book/bookcate_a?pageNum=1">전체보기</a></li>
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
	                  <li><a href="/inquiry/list">1:1문의</a></li>
	                </ul>
	              </li>
	        </ul>          
	        <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right menu-absolute">
            	<li class="cta-button">
              		<a class="font2" href="/login/index" style="font-weight: bold;">
        				<i class="fas fa-sign-in-alt"></i> 로그인
        			</a>
        		</li>
        		<!-- 장바구니 목록 추가 -->
	            <li>
	            	<a href="/login/index" style="font-weight: bold;">
	            		<i class="fas fa-shopping-cart"></i>
	            		<!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter">3+</span>
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
<!-- 본문 시작 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('images/indexbg.jpg')">
	<div class="container">
	   <div class="row align-items-center justify-content-between">
	     <div class="col-lg-7 intro">
	       <h1 class="text-white font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0" style="text-shadow: 3px 3px 3px black;">책 속에 담긴<br>당신의 이야기가 펼쳐지는<br>이곳은 한양서재입니다</h1>
	       <p class="text-white mb-4" data-aos="fade-up" data-aos-delay="100" style="text-shadow: 3px 3px 3px black;">책 한 권만으로도 펼쳐지는 수많은 이야기가 존재하는데, 하물며 책은 몇 권이 쓰여져도 아깝지 않을 당신의 삶은 아니할까요</p>
	     </div>
	   </div>
	 </div>
	 <div class="slant" style="background-image: url('images/slant.svg');"></div>
	</div>
	
	<!-- 퀵메뉴 -->
	<div class="quickmenu">
	  <ul>
	    <li>오늘 본 책</li>
	    <li><a href="#">1:1문의</a></li>
	    <li><a href="#">후기</a></li>
	  </ul>
	</div>
	
	<!-- 미연: 광고배너 -->
	<div class="container pt-5 pb-5 mb-5 border-bottom">
		<div class="row">
			<div class="col-lg-12">
		    <h1 class="h6 mb-3 text-black"></h1>
		  </div>
		  <div class="col-lg-12" >
		    <div class="main-slider owl-single dots-absolute owl-carousel" style="height: 70vh;">
		      <img src="images/bimg_h_1-min.jpg" alt="Image" class="img-fluid">
		      <img src="images/bimg_h_2-min.jpg" alt="Image" class="img-fluid">
		      <img src="images/bimg_h_3-min.jpg" alt="Image" class="img-fluid">
		      <img src="images/bimg_h_4-min.jpg" alt="Image" class="img-fluid">
		    </div>
		  </div>
		</div>
	</div>
	<!-- 미연: 광고배너 끝-->
	
	<!-- MD 추천 도서 시작 -->
	<div style="padding: 100px 0; margin-top: 200px; background-color: #FCDEC0;">
		<div class="container">
			<div class="row text-center justify-content-center mb-5">
				<div class="col-lg-7"><h2 class="font-weight-bold text-black heading">MD's PICK, 오늘의 추천 도서</h2></div>
			</div>

			<div class="main-slider owl-3-slider dots-absolute owl-carousel">
			<c:forEach items="${mdBook}" var="book" varStatus="vs">
				<div class="item">
					<a class="media-thumb" href="/book/bookdetail/${book.b_code}">
						<img src="${book.b_bookcover}" alt="Image" class="img-fluid" style="height:80vh;">
						<p class="font-weight-bold text-black text-center heading" style="font-size: large; padding-top: 10px;">${book.b_name}</p>
					</a> 
				</div>
			</c:forEach>

			</div>

		</div>
	</div>


	<!-- MD 추천 도서 끝 -->
	
	<!-- 커뮤니티 추천 시작 -->
	<div class="site-section bg-light" id="blog-section">
	  <div class="container">
	    <div class="row">
	      <div class="col-7 mb-4 position-relative text-center mx-auto">
	        <h2 class="font-weight-bold text-center">가장 인기많은 커뮤니티!</h2>
	        <p>우리의 인기많은 커뮤니티는 무엇일까~골라보쇼</p>
	      </div>
	
	    </div>
	    <div class="row">
	      
		<c:forEach items="${mdComm}" var="comm" varStatus="vs">
	      <div class="col-md-6 mb-5 mb-lg-0 col-lg-4">
	        <div class="blog_entry">
	          <a href="#"><img src="${comm.c_banner}" alt="community banner" class="img-fluid"></a>
	          <div class="p-4 bg-white">
	            <h3><a href="#">${comm.c_name}</a></h3>
	            <span class="date">${comm.c_rdate.substring(0,11)}</span>
	            <p>${comm.c_des}</p>
	            <p class="more"><a href="#">여기어떄?</a></p>
	          </div>
	        </div>
	        </div>
		</c:forEach>
		</div>
		
	<!-- 커뮤니티 추천 끝 -->
	
	<!-- 서평 시작 (한이) -------------------------------------------------------------------------->
	<div class="testimonial-section">
	  <div class="container">
	    <div class="row align-items-center justify-content-between">
	      <div class="col-lg-4 mb-5 section-title" data-aos="fade-up" data-aos-delay="0">
	        
	        <h2 class="mb-4 font-weight-bold heading">이 달의 서평</h2>
	        <p class="mb-4">반응이 뜨거운 서평을 읽어 보세요!</p>
	      </div>
	      <div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
	        
	        <div class="testimonial--wrap">
	          <div class="owl-single owl-carousel no-dots no-nav">
	          <c:forEach items="${mdReview}" var="review" varStatus="vs">
	            <div class="testimonial-item">	            
	              <div class="d-flex align-items-center mb-4">
	                <div class="mr-3" style="max-width: 100px">
	                  <img src="${review.b_bookcover}" alt="Image" class="img-fluid"> <!-- 책 이미지 -->
	                </div>
	                <div class="author">
	                  <cite class="d-block mb-0" style="font-size: large">${review.b_name}</cite>
	                  <br>
	                  <span>${review.br_id}</span>
	                </div>
	              </div>
	              <div class="align-items-end mb-4"><p style="text-align: right;">등록일 : ${review.br_rdate.substring(0,11)} &nbsp;&nbsp; 조회수 : ${review.br_count}</p></div>
	
	              <blockquote>
	                <p>&ldquo;${review.br_title}&rdquo;</p>
	              </blockquote>
              	</div>
           	  </c:forEach>
	          </div>
	          <div class="custom-nav-wrap">
	            <a href="#" class="custom-owl-prev"><span class="icon-keyboard_backspace"></span></a>
	            <a href="#" class="custom-owl-next"><span class="icon-keyboard_backspace"></span></a>
	          </div>
	        </div>
	
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 서평 끝 (한이) -------------------------------------------------------------------------->
<!-- 본문 끝 -->
<!-- footer 시작 -->
 <div class="site-footer">
  <div class="container">
    <div class="row justify-content-between">
      <div class="col-lg-4">
        <div class="widget">
          <h3>한양서재란?</h3>
          <p>책을 사랑하는 독자분들에게 다양한 E-Book들을 언제, 어디서든 볼 수 있도록 제공해드립니다. 또한 같은 책을 읽은 다양한 사람들과 이야기를 나누고 소통할 수 있는 공간이 되어 드리려 합니다.</p>
        </div>
        <div class="widget">
          <h3>Connect with us</h3>
          <ul class="social list-unstyled">
            <li><a href="#"><span class="icon-facebook"></span></a></li>
            <li><a href="#"><span class="icon-twitter"></span></a></li>
            <li><a href="#"><span class="icon-instagram"></span></a></li>
            <li><a href="#"><span class="icon-dribbble"></span></a></li>
            <li><a href="#"><span class="icon-linkedin"></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-6">
          <div class="col-12">
            <div class="widget">
              <h3>Members</h3>
            </div>
          </div>
          <div class="col-12">
            <div class="widget">
              <ul class="links list-unstyled">
                <li>&#127744 김경환 / 조장 / <a href="/">메인페이지</a>, <a href="/gudok/index">구독페이지</a>, <a href="/mylib/libindex">나만의 서재</a>, <a href="/login/index">로그인</a>, 결제(일반,정기) 기능 구현, PPT</li>
                <li>&#127744 강한이 / 기술자문 / <a href="/comm/index">커뮤니티페이지</a>, <a href="/notice/list?pageNum=1">공지사항페이지</a>, 관리자페이지</li>
                <li>&#127744 김성훈 / 기술자문 / <a href="/survey/survey">설문지페이지</a>, <a href="/survey/survey">설문지탬플릿페이지</a></li>
                <li>&#127744 김한주 / 자료조사 / <a href="/member/memberform">회원가입</a></li>
                <li>&#127744 방미연 / 서기 / <a href="/book/booklist">도서페이지</a>, Data Crawlling 작업</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row justify-content-center text-center copyright">
      <div class="col-md-8">
		  <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> HanyangLibrary<br>All Rights Reserved</p>
		  <p style="font-size: 4px;">— Designed with love by <a href="https://untree.co/">Untree.co</a> • <a href="https://untree.co/license/">License</a></p>
        </div>
      </div>
    </div>
 <!-- footer 끝 -->

<!-- 로딩창 시작 -->
<div id="overlayer"></div>
<div class="loader">
  <div class="spinner-border" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>
<!-- 로딩창 끝 -->

  <!-- 퀵메뉴 스크롤 따라 다니기 -->
  <script>
  	$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
  </script>
  
  	<script src="js/jquery-migrate-3.0.0.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/imagesloaded.pkgd.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/custom.js"></script>

  
</body>
</html>
