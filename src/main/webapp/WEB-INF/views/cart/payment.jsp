<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="section-latest">
<div class="container">
	<c:set var="price" value="0" />
	<c:forEach var="list" items="${paymentList}">
		<c:set var="total" value="${price+list.dpay_price}"/>
	</c:forEach>
	<form name="payfrm" method="post" action="/cart/kakaoPay">
        <div class="row gutter-v1 align-items-stretch mb-5">
			<div class="col-12">
				<h2 class="section-title">결제</h2>
			</div>                    
		<div class="col-md-9 pr-md-5">
			<div class="row">
	            <div class="col-12">				
				<!-- 결제 목록 시작 -->
				<div class="post-entry horizontal d-md-flex" style="justify-content: space-between; align-items: center;">
					<div class="text" style="padding: 10px;">
						<h2 style="text-align: left; font-size: 2vw;">주문서 번호 : ${dpay_pno}</h2>
						<p style="text-align: right;">총 가격 : ${total}</p>
					</div>
				</div>
				<!-- 결제 목록 끝 -->
              </div>
            </div>
          </div>		  

          <div class="col-md-3">
            <div class="floating-block sticky-top text-center" style="position: sticky; top: 0px;">
				<h2 class="mb-3 text-black">카카오페이 결제</h2>
				<p>금액을 확인해주세요</p>
				<p>상품 가격 : ${total}</p>
			<input type="hidden" value="${total}" name="pay_total" id="pay_total">
			<input type="hidden" value="${dpay_pno}" name="pay_no" id="pay_no">
			<input type="hidden" value="${s_id}" name="pay_id" id="pay_id">
			<input type="button" value="카카오로 결제하기" onclick="kakaopay()">
			<input type="button" value="결제 취소하기" onclick="payCancel()">
			</div>
          </div>
       </div>
	</form>
</div>
</div>

<script>

function kakaopay() {
	document.payfrm.action = "/cart/kakaoPay";
    document.payfrm.submit();
}

function payCancel() {
	document.payfrm.action = "/cart/payCancel";
    document.payfrm.submit();
}

</script>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>