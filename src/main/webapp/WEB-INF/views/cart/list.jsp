<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="section-latest">
<div class="container">
	<form name="frm" method="post">
	<div class="row gutter-v1 align-items-stretch mb-5">
		<div class="col-12" style="margin: 10px;">
			<h2 class="section-title">장바구니${date}</h2>
		</div>
		<div class="col-md-9 pr-md-5">
		<div class="row">
		
			<div class="col-12">
			<!-- 전체 선택, 선택한 항목 삭제 버튼 -->
			<div style="text-align: right;">
			<input type="button" value="전체 선택" onclick="javascript:allClick()">
			<input type="button" value="전체 선택 해제" onclick="javascript:allUnClick()">
			<input type="button" value="선택한 항목 삭제" onclick="javascript:deleteBook()">
			</div>
			<!-- 버튼 스크립트 구문 시작 -->
			<script>
			// 전체 선택
			function allClick() {
				$("input[name=addPay]").prop("checked", true);
			}
			
			// 전체 선택 해제
			function allUnClick() {
				$("input[name=addPay]").prop("checked", false);
			}
			
			</script>
			<!-- 버튼 스크립트 구문 끝 -->

			<!-- 장바구니 목록 시작 -->
			<c:forEach var="list" items="${listCart}">
				<div class="post-entry horizontal d-md-flex" style="justify-content: space-between; align-items: center;">
					<div class="media" style="width:130px;">
                    	<img src="${list.b_bookcover}" alt="Image" class="img-fluid" style="width:100px;">
					</div>
					<div class="text" style="padding: 10px;">
						<h2 style="text-align: left; font-size: 2vw;">${list.b_name}</h2>
						<p style="text-align: right;">${list.b_price}</p>
					</div>
					<div class="checkbox" style="float: right;">
						<input type="checkbox" name="addPay" value="${list.cart_code}" checked>
						<input type="hidden" name="addPrice" value="${list.b_price}">
						<!-- ** 경환 : 주문서 코드 자동생성 : s + 날짜(yyyymmdd) + 설문지 코드 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyymmdd" /></c:set> 
						<c:set var="sv_code" value="s${date}-com001"></c:set>
					</div>
				</div>
			</c:forEach>
			<!-- 장바구니 목록 끝 -->
			</div>
		</div>
		</div>		  
			<!-- 우측 결제 관련 창 시작 -->
          <div class="col-md-3">
            <div class="floating-block sticky-top text-center" style="position: sticky; top: 0px;">
              <h2 class="mb-3 text-black">결제</h2>
              <p>구매하고 싶은 상품을 잘 선택했는지 확인하세요</p>
					<input type="button" value="결제 하러 가기" onclick="javascript:goPay()">
			</div>
          </div>
			<!-- 우측 결제 관련 창 끝 -->
        </div>
        </form>
  </div>
</div>

<script>

function deleteBook() {
	document.frm.action = "/cart/delete/${s_id}";
	document.frm.submit()
}

function goPay() {
	document.frm.action = "/cart/payment";
	document.frm.submit()
}

</script>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>