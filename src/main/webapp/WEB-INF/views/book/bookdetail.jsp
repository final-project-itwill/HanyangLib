<%@page import="kr.co.itwill.book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">
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
    <script src="/js/jquery-3.5.1.min.js"></script>
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <title>&#128218 한양서재</title>
</head>
<!-- 본문작성 시작 -->
<body>

<!-- 메뉴 시작 -->
<div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
        <span class="icofont-close js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div>

  
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
        <div class="row justify-content-between align-items-center">

          <div class="col-9 col-md-6 col-lg-3 text-right top-menu">

            <div class="d-inline-flex align-items-center">

              <span class="mx-2 d-inline-block d-lg-none"></span>
              
              <a href="#" class="d-inline-flex align-items-center d-inline-block d-lg-none"><span class="icon-twitter mr-2"></span></a>
              <a href="#" class="d-inline-flex align-items-center d-inline-block d-lg-none"><span class="icon-instagram mr-2"></span></a>


              <a href="#" class="burger ml-3 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                <span></span>
              </a>
            </div>
          </div>
        </div>
        <c:choose>
        <%-- 로그인 했을 때 --%>
		<c:when test="${grade!=null}">
         <div class="d-none d-lg-block row align-items-center py-3"> 
          <div class="col-12 col-sm-12 col-lg-12 site-navigation text-center" style="margin-top:30px">
            <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu">
	          <li class="active"><a href="/" style="font-weight: bold; color:black;">Home</a></li>
	          <li class="has-children">
	          <a href="/book/booklist" style="font-weight: bold;color:black;">도서목록</a>
	          <ul class="dropdown">
                  <li><a href="/book/bookcate_a?pageNum=1">전체보기</a></li>
                  <li><a href="/book/bookcate_n?pageNum=1">소설/시</a></li>
                  <li><a href="/book/bookcate_e?pageNum=1">에세이</a></li>
                  <li><a href="/book/bookcate_h?pageNum=1">인문</a></li>
                  <li><a href="/book/bookcate_s?pageNum=1">자연과학</a></li>
                </ul>
	          </li>
	          <li><a href="/gudok/index" style="font-weight: bold; color:black;">구독</a></li>
	          <li><a href="/mylib/libindex/${s_id}" style="font-weight: bold; color:black;">나만의 서재</a></li>
	          <li><a href="/comm/index" style="font-weight: bold; color:black;">커뮤니티</a></li>
              <li class="has-children">
              	<a href="#" style="font-weight: bold; color:black;">고객센터</a>
                <ul class="dropdown">
                  <li><a href="/notice/list?pageNum=1">공지사항</a></li>
                  <li><a href="#">문의</a></li>
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
				<a class="font2" href="/login/index" style="font-weight: bold; color: black;">
					<i class="fas fa-user"></i> ${s_id}님
				</a>
        	</li>
        	<!-- 장바구니 목록 추가 -->
            <li>
            	<a href="/cart/cartList?cart_id=${s_id}&cart_code=${book.b_code}" style="font-weight: bold;">
            		<i class="fas fa-shopping-cart"></i>
            		<!-- 장바구니에 들어있는 물품 개수 출력 -->
            		<c:if test="${s_cart<6}">
            			<c:set value="${s_cart}" var="cartCnt"/>
            		</c:if>
            		<c:if test="${s_cart>5}">
            			<c:set value="5+" var="cartCnt"/>
            		</c:if>
                       <span class="badge badge-danger badge-counter">${cartCnt}</span>
				</a>
			</li>
       	</ul>	        
	        <a href="#" class="burger light ml-auto site-menu-toggle js-menu-toggle d-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
	          <span></span>
	        </a>
	      </div>
	    </div>  
	   </c:when>
	   
	   
	    <%-- 로그인 안했을 때 --%>
		<c:otherwise> 
         <div class="d-none d-lg-block row align-items-center py-3"> 
          <div class="col-12 col-sm-12 col-lg-12 site-navigation text-center" style="margin-top:30px">
            <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu">
	          <li class="active"><a href="/" style="font-weight: bold; color:black;">Home</a></li>
	          <li class="has-children">
	          <a href="/book/booklist" style="font-weight: bold;color:black;">도서목록</a>
	          <ul class="dropdown">
                  <li><a href="/book/bookcate_a?pageNum=1">전체보기</a></li>
                  <li><a href="/book/bookcate_n?pageNum=1">소설/시</a></li>
                  <li><a href="/book/bookcate_e?pageNum=1">에세이</a></li>
                  <li><a href="/book/bookcate_h?pageNum=1">인문</a></li>
                  <li><a href="/book/bookcate_s?pageNum=1">자연과학</a></li>
                </ul>
	          </li>
	          <li><a href="/gudok/detail" style="font-weight: bold; color:black;">구독</a></li>
	          <li><a href="/login/index" style="font-weight: bold; color:black;">나만의 서재</a></li>
	          <li><a href="/login/index"  style="font-weight: bold; color:black;">커뮤니티</a></li>
              <li class="has-children">
              	<a href="#" style="color:black;">고객센터</a>
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
        	<!-- 장바구니 목록 추가 -->
            <li>
            	<a href="/login/index" style="font-weight: bold;">
            		<i class="fas fa-shopping-cart"></i>
            	</a>
            </li>
		</ul>        
	        <a href="#" class="burger light ml-auto site-menu-toggle js-menu-toggle d-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
	          <span></span>
	        </a>
	      </div>
	    </div>  
	   </c:otherwise>
	  </c:choose>  
      </nav> <!-- END nav -->

    </div> <!-- END container -->
<!--  메뉴 끝 -->

<!-- 본문 시작 -->
     <div class="site-hero py-5 bg-light mb-5" style="background:url(/images/detailback.jpg); background-size: 100% 100%;">

      <div class="container">
        <div class="row align-items-center justify-content-between">
          <div class="col-lg-12 text-center">
            <a href="/"><img src=/images/hylogo_b.png width=140px;></a>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
				<img src="${book.b_bookcover}" width="400px" style=" margin-bottom:20px">
		  </div>
          <div class="col-lg-6 pl-lg-5">
			<a href = # >      
          	<span class="section-subtitle" style="margin-bottom:10px">${book.b_type}</span>
          	</a>  
            <h4 class="mb-4 section-title">
            	${book.b_name}
            	<c:if test="${book.b_gudok eq 'Y'}">
					<img alt="gudokBadge" src="/images/gudokBadge.png" width="80px;">
              	</c:if>
            </h4>
            <p>작가 : ${book.b_author}</p>
            <p>출판사 : ${book.b_publish}</p>
            <p>가격 : ${book.b_price} 원</p>
            <p>출판일 : ${book.b_rdate}</p>
            <ul class="list-check list-unstyled primary">
              <li>${book.b_des}</li>
            </ul>
            <table style="margin-top:30px">
	            <tr>
		            <td colspan="2" align="center">
			            <input type="hidden" name="product_code" value="${book.b_code}">
			            
			<!-- 구매 관련 버튼 로직 시작 -->
			<!-- 로그인 한 아이디가 없다면 -->
			<c:if test="${s_id eq null}">
			            <input type="button" value="장바구니" onclick="location.href='/login/index'"> 
			            <input type="button" value="바로결제" onclick="location.href='/login/index'">
			</c:if>
			<!-- 로그인 상태라면 -->
			<c:if test="${s_id ne null}">
				<%-- 이 책이 구독 가능이라면 --%>
				<c:if test="${book.b_gudok eq 'Y'}">
					<%-- 구독을 한 상태라면 --%>
					<c:if test="${subs eq 'Y'}">
						<%-- 이 책을 보유하지 않았다면 --%>
						<c:if test="${haveBook eq 0}">
							<input type="button" class="btn btn-outline-light btn-block col-md-6 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" value="나만의 서재에 담기" onClick="location.href='/mylib/libInsert/${book.b_code}/${s_id}'">
						</c:if>
						<%-- 이 책을 보유했다면 --%>
						<c:if test="${haveBook eq 1}">
							<input type="button" class="btn btn-outline-light btn-block col-md-12 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" disabled value="이미 책을 보유하고 계십니다">
						</c:if>
					</c:if>
					<%-- 구독을 하지 않은 상태라면 --%>
					<c:if test="${subs eq 'N'}">
				    		<input type="button" class="btn btn-outline-light btn-block col-md-4 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" value="장바구니" onclick="location.href='/cart/cartList?cart_id=${s_id}&cart_code=${book.b_code}'"> 
				            <input type="button" class="btn btn-outline-light btn-block col-md-4 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" value="바로결제" onclick="#">
				    </c:if>
				</c:if>
				<%-- 이 책이 구독 불가능이라면 --%>
				<c:if test="${book.b_gudok eq 'N'}">
					<%-- 이 책을 보유하지 않았다면 --%>
					<c:if test="${haveBook eq 0}">
						<input type="button" class="btn btn-outline-light btn-block col-md-4 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" value="장바구니" onclick="location.href='/cart/cartList?cart_id=${s_id}&cart_code=${book.b_code}'">
				        <input type="button" class="btn btn-outline-light btn-block col-md-4 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" value="바로결제" onclick="#">
					</c:if>
					<%-- 이 책을 보유했다면 --%>
					<c:if test="${haveBook eq 1}">
						<input type="button" class="btn btn-outline-light btn-block col-md-12 text-dark" style="font-weight: bold; margin-bottom: 20px; border-color: #2a96a5; text-align: center;" disabled value="이미 책을 보유하고 계십니다">
					</c:if>
				</c:if>
			</c:if> 
			<!-- 구매 관련 버튼 로직 끝 -->
			</td>            
	        </tr>
	        <tr>
		        <!-- 구독 유도 버튼 시작-->
				<td>
					<a href="/gudok/index"><img src="/images/gudok.png" style="width:400px; margin-top:10px"></a>
				</td>
				<!-- 구독 유도 버튼 끝-->		
	        </tr>   
            </table>
          </div>
      </div>
    </div>
</div>

<!-- 커뮤니티 목록 출력 -->
    <div class="site-section slider-team-wrap">
      <div class="container">

        <div class="row mb-5 align-items-center">
          <div class="col-md-6">
            <span class="section-subtitle">책을 즐기는 또다른 방법</span>
            <h2 class="section-title">커뮤니티</h2>
			<input type="button" class="btn btn-outline-light btn-block col-sm-3 text-dark" style="font-weight: bold; border-color: #2a96a5; float:left; display: flex; justify-content: center; align-items:center;" value="커뮤니티 만들기" onclick="location.href='/comm/index'">
          </div>
          <div class="col-md-6 text-left text-md-right">
            <div class="slider-nav">
              <a href="#" class="js-prev js-custom-prev-v2" style="background-color:#147814"><span class="icon-arrow_back"></span></a>
              <a href="#" class="js-next js-custom-next-v2" style="background-color:#147814"><span class="icon-arrow_forward"></span></a>
              

            </div> <!-- /.slider-nav -->
          </div>
        </div>

        <div class="slider-team owl-carousel owl-3-slider">
          <div class="team">
          
          
          <!-- 커뮤니티가 없는 경우 -->
      		<c:if test="${fn:length(commu)==0}">
      		<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
				<td colspan="4">이 책에 첫 커뮤니티를 만들어주세요</td>	
			</tr>
      		</c:if>
      		
      		
      		
      		 <!-- 커뮤니티가 있는 경우 -->
      		 
      		<c:if test="${fn:length(commu) != 0}">
            <c:forEach var="com" items="${commu}">
                        
            <div class="pic">
              <img src="${com.c_banner}" alt="Image" class="img-fluid">
            </div>
            <h3><a href="#"><span class="">${com.c_name}</span></a></h3>
            <span class="d-block position">커뮤니티장 : ${com.c_id}</span>
            <p>${com.c_des}</p>
            <p class="mb-0"><a href="#" class="more dark">Learn More <span class="icon-arrow_forward"></span></a></p>
            
            </c:forEach>
            </c:if>
          </div>

        </div>
      </div> <!-- /.container -->
    </div> <!-- /.untree_co-section -->

    <div class="site-section testimonial-section">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
            <span class="section-subtitle">${book.b_name}</span>
            <h4 class="section-title">서평</h4>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-lg-7">
          
          
          <!-- 서평이 없는 경우 -->
	<c:if test="${fn:length(review) == 0}">

			<div class="main-slider owl-single owl-carousel">
            
              <div class="testimonial mx-auto">
                <figure class="img-wrap">
                  <img src="/images/img_v_1-min.jpg" alt="Image" class="img-fluid">
                </figure>
                <h3 class="name"></h3>
                <blockquote>
                  <p>&ldquo;당신의 생각을 나누어 주세요&rdquo;</p>
                </blockquote>
                <input type="button" class="btn btn-outline-light btn-block col-sm-3 text-dark" style="font-weight: bold; border-color: #2a96a5; margin-left:190px; float:center; display: flex; justify-content: center; align-items:center;" value="서평 쓰기" onclick="location.href='/mylib/libindex/${s_id}'">
              </div>
              
            </div>
   
    </c:if>

		<!--  서평이 있는 경우 -->
		
		<c:if test="${fn:length(review) != 0}">
			<c:forEach var="dto" items="${review}">
				<div class="main-slider owl-single owl-carousel">
	                <h3 class="name">${dto.br_title}</h3>
	                <blockquote style="text-overflow: ellipsis;">
	                  <p>${dto.br_content}</p>
	                  <p class="mb-0">
	                  	<a href="/mylib/reviewRead?br_no=${dto.br_no}" class="more dark">더 보기<span class="icon-arrow_forward"></span></a>
	                  </p>
	                </blockquote>
            	</div>
            </c:forEach>
		</c:if>
		
		
		
		
          </div>
        </div>
      </div>
    </div>
      
  </body>
  
  <!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>
</html>