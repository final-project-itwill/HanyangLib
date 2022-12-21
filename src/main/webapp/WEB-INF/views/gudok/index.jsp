<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 정기결제 iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 상단 배너 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/login1.jpg'); height: 100vh;"></div>
<!-- 본문작성 시작 -->
<div class="container text-center" style="background-color: white; background-color: rgba( 255, 255, 255, 0.8 ); width: 400px; position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></div>
    <div class="pricing-section">
      <div class="container">
        <div class="section-title text-center mb-5" data-aos="fade-up" data-aos-delay="0">
          <h2 class="heading font-weight-bold mb-5">한양서재 구독하기</h2>

          <div class="switch-plan">
            
            <div class="d-inline-flex align-items-center">
              <div class="period">1개월 정기결제</div>
              <a class="period-toggle js-period-toggle"></a>
              <div class="period"><span class="mr-2">1년 정기결제</span><span class="save-percent">Save 25%</span></div>
            </div>

          </div>
        </div>
        

        <div class="row" style="justify-content: center;">
          <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing-item active">
              <h3>한양서재 구독</h3>
              <div class="description">
                <p>당신의 슬기로운 독서생활을 응원합니다</p>
              </div>
              <div class="period-change mb-4 d-block">
                <div class="price-wrap">
                  <div class="price">
                    <div>
                    	<c:set var="monthly" value="9900"/>
                    	<c:set var="yearly" value="89100"/>
                      <div>9,900</div>
                      <div>89,100</div>
                    </div>
                  </div>
                </div>
                <div class="d-inline-flex align-items-center text-center period-wrap">
                  <div class="d-inline-block mr-1">정기결재</div>
                  <div class="d-block text-left period">
                    <div>
                      <div>1개월</div>
                      <div>1년</div>
                    </div>
                  </div>
                </div>
              </div>
              <ul class="list-unstyled mb-4">
                <li class="d-flex"><span class="feather-check-square mr-2 mt-1"></span><span>언제 어디서나 한양서재에서<br>책을 꺼내보세요</span></li>
              </ul>
              <div>
              	<span>지금 바로 정기구독을 시작해보세요</span><br>
                <a href="javascript:monthly()" class="btn btn-primary">1개월 시작하기</a>
                <br>
                <a href="javascript:yearly()" class="btn btn-primary">1년 시작하기</a>
              </div>
            </div>
          </div>
        </div>
</div></div>

<!-- 정기결제 관련 자바스크립트 시작 -->
<script>
let total = 0;
let name = "";
let id = "${s_id}";

function monthly(){
	alert(total);
	total = ${monthly}
	alert(total);
	name = '한양서재 1개월 정기 구독 서비스';
	return imp_pay();
};

function yearly(){
	alert(total);
	total = ${yearly}
	alert(total);	
	name = '한양서재 1년 정기 구독 서비스';
	return imp_pay();
};

function imp_pay(){
	$(function(){	    
    	//@@@@@@ 1번 @@@@@@@
        var IMP = window.IMP; // 생략가능
        IMP.init('imp77166106'); //가맹점 식별코드 삽입
        var msg;
        
        //@@@@@@@@ 2번 @@@@@@@@
        // 총 가격 불러오기(위에서 작업, 생략)
        
		//@@@@@@ 3번 @@@@@@@
            IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : name,
            amount : total,
            customer_uid : "HanyangLib" + new Date().getTime(), 
            buyer_email : 'admin@hanyanglib.co.kr',
            buyer_name : '한양서재',
            buyer_tel : '010-0000-0000',
            buyer_addr : '책이 있는 한양 어딘가',
            buyer_postcode : '123-456',
            imp_uid : id
           // m_redirect_url : '결제 완료후 이동할 페이지'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        uid : rsp.imp_uid,
                        price: rsp.amount
                        //기타 필요한 데이터가 있으면 추가 전달
                    })
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/gudok/success';
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/gudok/fail";
                alert(msg);
            }
        });

    });    
};
</script>
<!-- 정기결제 관련 자바스크립트 끝 -->

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>