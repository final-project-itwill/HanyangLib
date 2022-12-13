<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문작성 시작 -->
<body>

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
						당신만을 위한 서점<br>마음의 조각을<br>검색해보세요
					</h1>
					<form action="read" class="sign-up-form d-flex" data-aos="fade-up"
						data-aos-delay="200">
						<input type="text" class="form-control"
							placeholder="책제목 또는 작가를 검색해보세요">
						<button type="submit" class="btn-dark"
							style="width: 40px; padding: 0px;">
							<i class="fa-solid fa-magnifying-glass text-center"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	
    <div class="section-latest">
      <div class="container">
        <div class="row gutter-v1 align-items-stretch mb-5">
          <div class="col-12">
          <br>

            <h2 class="section-title">Weekly Best</h2>
            <input type="button" value="책 등록" onclick="location.href='/book/productWrite'">
          </div>
          <div class="col-md-9 pr-md-5">
            <div class="row">
              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/115094437/M"
                    style=" margin-right: 20px; "/></a>
                  </div>
                  <div class="text">
                    <div class="meta">
                      <span>출판사 현대문학</span>
                      <span>&bullet;</span>
                      <span>작가 천선란</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">랑과 나의사막</a></h2>
                    <p>출판일 2022-10-25</p>
                    <p>당대 한국 문학의 가장 현대적이면서도 첨예한 작가들을 선정, 신작 시와 소설을 수록하는 월간 『현대문학』의 특집 지면 [현대문학 핀 시리즈]의 마흔세 번째 소설선</p>
                    
                  </div>
                </div>
              </div>

              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/111088149/M"
                    style=" margin-right: 20px;" /></a>
                  </div>
                  <div class="text">
                    <div class="meta-cat">
                      <span>출판사</span>
                      <span>&bullet;</span>
                      <span>작가</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">책 제목</a></h2>
                    <p>출판일 YYYY-MM-DD</p>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    
                  </div>
                </div>
              </div>

              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/99308021/M"
                    style=" margin-right: 20px;" /></a>
                  </div>
                  <div class="text">
                    <div class="meta-cat">
                      <span>출판사</span>
                      <span>&bullet;</span>
                      <span>작가</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">책 제목</a></h2>
                    <p>출판일 YYYY-MM-DD</p>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    
                  </div>
                </div>
              </div>


              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/110641272/M"
                    style=" margin-right: 20px;" /></a>
                  </div>
                  <div class="text">
                    <div class="meta-cat">
                      <span>출판사</span>
                      <span>&bullet;</span>
                      <span>작가</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">책 제목</a></h2>
                    <p>출판일 YYYY-MM-DD</p>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    
                  </div>
                </div>
              </div>

              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/99308021/M"
                    style=" margin-right: 20px;" /></a>
                  </div>
                  <div class="text">
                    <div class="meta-cat">
                      <span>출판사</span>
                      <span>&bullet;</span>
                      <span>작가</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">책 제목</a></h2>
                    <p>출판일 YYYY-MM-DD</p>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    
                  </div>
                </div>
              </div>

              <div class="col-12">
                <div class="post-entry horizontal d-flex mb-0">
                  <div class="media">
                    <a href="#"><img src="http://image.yes24.com/goods/110641272/M"
                    style=" margin-right: 20px;" /></a>
                  </div>
                 <div class="text">
                    <div class="meta-cat">
                      <span>출판사</span>
                      <span>&bullet;</span>
                      <span>작가</span>
                    </div>
                    <h2><a href="#" style="color:#906D3B">책 제목</a></h2>
                    <p>출판일 YYYY-MM-DD</p>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    
                  </div>
                </div>
              </div>

            </div>
          </div>
	<!-- 여기에 몇페이지인지 누르는거 넣기 -->

	<!-- 사이드 카테고리 메뉴 시작-->
          <div class="col-md-3">
            <div class="mb-4">
              <a href="https://youtu.be/8ziUcTYwARI" data-fancybox class="video-wrap"><!-- 여긴 작은 광고배너 넣어도 좋을듯 -->
                <span class="play-wrap"><span class="icon-play"></span></span>
                <img src="../images/quok.jpg" alt="Image" class="img-fluid rounded">
              </a>
            </div>
            <div class="floating-block sticky-top text-left">
              <h2 class="mb-3 text-black">카테고리</h2>
              <!-- 링크 넣어줘야 해 -->
              <ul>
              	<li><a href="bookcate_n?pageNum=1">소설/시</a></li>
              	<li><a href="bookcate_e">에세이</a></li>
              	<li><a href="bookcate_h">인문</a></li>
              	<li><a href="bookcate_s">자연과학</a></li>
              </ul>
              <form action="#">
              </form>
            </div>
          </div>
      <!-- 사이드 카테고리 메뉴 끝 -->    
          
          
        </div>
	</div>
</body>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>