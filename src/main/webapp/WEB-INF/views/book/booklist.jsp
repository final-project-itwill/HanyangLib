<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp"%>

<!-- 본문작성 시작 -->
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">

	<!-- 상단 시작과 검색창 -->
	<div class="hero-slant overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('../images/booklist.jpg'); height: 90vh;">
		<div class="container">
			<div class="row align-items-center justify-content-between"
				style="display: flex; flex-direction: row-reverse;">
				<div class="col-lg-12 intro">
					<h1 class="text-white text-left font-weight-bold mb-4"
						data-aos="fade-up" data-aos-delay="0"
						style="text-shadow: 3px 3px 3px black;">
						당신만을 위한 서점<br>마음의 조각을<br>찾아보세요
					</h1>
					<form name="keyword" action="search" method="post" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="100">
						<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="책제목 또는 작가를 검색해보세요">
						<input type="submit" class="btn-dark" value="검색" style="width: 40px; padding: 0px;">
					</form>
				</div>
			</div>
		</div>
	</div>
	
   <!--사이드 메뉴 시작 -->	
	
	
   <!--사이드 메뉴 끝 -->		

	
    <!-- MD 추천 리스트 시작 -->
    

    <div class="site-section slider-team-wrap">
      <div class="container">

        <div class="row mb-5 align-items-center">
          <div class="col-md-6">
            <span class="section-subtitle">선택, 망설여지세요?</span>
            <h2 class="section-title">MD 추천 도서</h2>
          </div>
          <div class="col-md-6 text-left text-md-right">
            <div class="slider-nav">
              <a href="#" class="js-prev js-custom-prev-v2" style="background-color:#147814"><span class="icon-arrow_back"></span></a>
              <a href="#" class="js-next js-custom-next-v2" style="background-color:#147814"><span class="icon-arrow_forward"></span></a>

            </div> <!-- /.slider-nav -->
          </div>
        </div>

        <div class="slider-team owl-carousel owl-3-slider">
		<c:forEach var="dto" items="${mdBpick}">
          <div class="team">
            <div class="pic">
              <img src="${dto.b_bookcover}" alt="Image" class="img-fluid" style="width:250px">
            </div>
            <span class="d-block position">${dto.b_type}</span>
            <h3><a href="/book/bookdetail/${dto.b_code}"><span style="width:230px">${dto.b_name}</span></a></h3>
            <span class="d-block position">작가 : ${dto.b_author}</span>
            <span class="d-block position">출간일 : ${dto.b_rdate}</span>
            <p class="mb-0"><a href="/book/bookdetail/${dto.b_code}" class="more dark">더 보기 <span class="icon-arrow_forward"></span></a></p>
            <div class="d-flex author align-items-center">
                    <div class="pic">
                      <img src="/images/MDbori.jpg" alt="Image" class="img-fluid rounded-circle" style="width:50px; margin-top:20px; margin-right:10px">
                    </div>
                    <div class="author-name">
                      <strong class="d-block">MD 보리</strong>
                      <span class="">I LOVE "BOOK"!</span>
                    </div>
          </div>
  
        </div>
        </c:forEach>
      </div> <!-- /.container -->
    </div> <!-- /.untree_co-section -->
  </div>


 <!-- MD 추천 리스트 끝 -->

<!-- 신작소개 리스트 시작 -->

    <div class="site-section slider-team-wrap">
      <div class="container">

        <div class="row mb-5 align-items-center">
          <div class="col-md-6">
            <span class="section-subtitle">누구보다 빠르게 만나보는</span>
            <h2 class="section-title">새로 등록된 도서</h2>
          </div>
          <div class="col-md-6 text-left text-md-right">
            <div class="slider-nav">
              <a href="#" class="js-prev js-custom-prev-v2" style="background-color:#147814"><span class="icon-arrow_back"></span></a>
              <a href="#" class="js-next js-custom-next-v2" style="background-color:#147814"><span class="icon-arrow_forward"></span></a>

            </div> <!-- /.slider-nav -->
          </div>
        </div>

        <div class="slider-team owl-carousel owl-3-slider">
		<c:forEach var="dto" items="${newbook}">
          <div class="team">
            <div class="pic">
              <img src="${dto.b_bookcover}" alt="Image" class="img-fluid" style="width:250px">
            </div>
            <span class="d-block position">${dto.b_type}</span>
            <h3><a href="/book/bookdetail/${dto.b_code}"><span style="width:230px">${dto.b_name}</span></a></h3>
            <span class="d-block position">작가 : ${dto.b_author}</span>
            <span class="d-block position">출간일 : ${dto.b_rdate}</span>
            <p>${dto.b_des}</p>
            <p class="mb-0"><a href="/book/bookdetail/${dto.b_code}" class="more dark">더 보기 <span class="icon-arrow_forward"></span></a></p>

  
        </div>
        </c:forEach>
      </div> <!-- /.container -->
    </div> <!-- /.untree_co-section -->
  </div>



   <!-- 신작소개 리스트 끝 -->


	<!-- 도서 전체보기 리스트 시작 -->
<div class="site-section slider-team-wrap">
   <div class="container">


	<div class="row mb-5 align-items-center">
          <div class="col-md-6">
            <span class="section-subtitle">모든도서를 볼수있는</span>
            <h2 class="section-title"><a href="/book/booklist_d">도서 전체보기</a></h2>
          </div>
          
	<table border="0" align = "center" width=70%>
		
		<tr>
			<td>
			<c:forEach var="dto" items="${list}">
				<div class="col-12">
					<div class="post-entry horizontal d-md-flex">
						<div class="media">
							<a href="#">
							<img src="${dto.b_bookcover}" style="width: 140px; margin-right: 20px;"></a>
						</div>
						<div class="text">
							<div class="meta">
								<p>${dto.b_type}</p>
								<span>출판사 ${dto.b_publish}</span> <span>&bullet;</span> <span>작가 ${dto.b_author}</span>
							</div>
							<h3>
								<a href="/book/bookdetail/${dto.b_code}" style="color: #906D3B">${dto.b_name}</a>
							</h3>
							<p>출판일 ${dto.b_rdate}</p>
							<p>${dto.b_des}</p>
						</div>
					</div>
				</div>
			</c:forEach>
			</td>
		</tr>

	</table>
	
	
	
	 </div>
   </div> <!-- /.container -->
 </div> <!-- /.untree_co-section -->



</body>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>