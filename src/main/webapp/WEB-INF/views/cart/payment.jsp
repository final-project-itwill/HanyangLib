<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="section-latest">
<div class="container">
        <div class="row gutter-v1 align-items-stretch mb-5">
          <div class="col-12">
            <h2 class="section-title">결제</h2>
          </div>
                    
          <div class="col-md-9 pr-md-5">
            <div class="row">
              <div class="col-12">
              </div>
            </div>
          </div>		  

          <div class="col-md-3">
            <div class="floating-block sticky-top text-center" style="position: sticky; top: 0px;">
              <h2 class="mb-3 text-black">카카오페이 결제</h2>
              <p>금액을 확인해주세요</p>
              <p>${total}</p>
				<form method="post" action="/cart/kakaoPay">
					<button>카카오로 결제하기</button>
				</form>
			</div>
          </div>
        </div>
  </div>
</div>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>