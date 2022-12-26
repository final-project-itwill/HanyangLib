<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
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
	<div class="hero-slant" data-stellar-background-ratio="0.5" style="background-image: url('../../images/topbg.jpg'); height: 60vh;"></div>
<!-- 본문작성 시작 -->
<div class="section-latest">
<div class="container">
	<form name="frm" method="post">
	<div class="row gutter-v1 align-items-stretch mb-5">
		<div class="col-12 lib-cont" style="margin: 10px;">
			<h2 class="section-title">장바구니</h2>
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
						<!-- ** 경환 : 주문서 코드 자동생성 : s + 날짜(yyyyMMdd) + 설문지 코드 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>
						<c:choose>
							<c:when test="${cnt<9}">
								<c:set var="dpay_pno" value="${date}-00${cnt+1}"/>
							</c:when>
							<c:when test="${cnt>=9 and cnt<98}">
								<c:set var="dpay_pno" value="${date}-0${cnt+1}"/>
							</c:when>
							<c:otherwise>
								<c:set var="dpay_pno" value="${date}-${cnt+1}"/>
							</c:otherwise>
						</c:choose>					
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
              <p>주문서 번호 : ${dpay_pno}</p>
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
	document.frm.action = "/cart/payment/${dpay_pno}/${s_id}";
	document.frm.submit()
}

</script>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>