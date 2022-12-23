<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 read.jsp -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!-- 상단 헤더 배경 및 커뮤니티 이름 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/galaxy.jpeg'); height: 15vh;">
</div>

<h1 class="text-dark text-left font-weight-bold" data-aos="fade-up" data-aos-delay="0" style="padding: 30px 0 0 10vw">
    ${read.c_name}
</h1>
<p class="text-dark text-left font-weight-bold" data-aos="fade-up" data-aos-delay="0" style="font-size: 20px;padding: 10px 0 0 10vw">&nbsp; 커뮤니티에 방문하신 것을 환영합니다</p>

<div class="container-fluid border-bottom">
    <div class="row">
        <!-- 커뮤니티 상세 : 좌측 bar 시작 -->
        <div class="lib-cont col-12 col-sm-7 col-md-7 col-lg-7" style="padding-left: 5vw">

            <div class="container-fluid" style="padding: 0 10vw 15vw 5vw">
                <img src="/storage/${read.c_banner}" class="img-fluid img-thumbnail"><!-- 추후 read로 c_banner 가져올 것 -->
                <div>
                    <h3 style="text-align: center; font-weight: bold; margin-top: 5vh">커뮤니티 소개</h3>
                    <p style="margin-top: 5vh; font-size: 20px">"${read.c_des}"</p>
                </div>
            </div>
        </div><!-- 좌측 bar end-->

        <!-- 커뮤니티 정보 : 우측 bar 시작 -->
        <div class="lib-info col-12 col-sm-5 col-md-5 col-lg-5" style="">
            <div class="container-fluid" style="padding-right: 10vw">
                <div>
                    <p style="background-color: lightgray; font-size: 20px; color: black; margin-bottom: 20px">책 제목 : ${read.b_name}</p>
                </div><!-- 책 제목 end-->
                <div>
                    <table class="table" style="width: 100%">
                        <tr>
                            <th>커뮤니티장</th>
                            <td>${read.m_nick}</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 상태</th>
                            <td>
                                <c:choose>
                                    <c:when test="${read.c_state == 'i'}">모집중</c:when>
                                    <c:when test="${read.c_state == 'd'}">모집완료</c:when>
                                    <c:when test="${read.c_state == 'e'}">활동완료</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>주 모임 지역</th>
                            <td>${read.c_local}</td>
                        </tr>
                        <tr>
                            <th>오픈채팅방 주소</th>
                            <td>${read.c_chat}</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 등록일</th>
                            <td>${read.c_rdate}</td>
                        </tr>
                    </table>
                </div><!-- 정보 테이블 end-->

                <!-- 커뮤니티 신청 버튼 -->
                <!-- 조건문으로 커뮤니티 모집중/완료 분기 -->
                <c:if test="${read.c_state == 'i'}">
                    <button type="button" class="btn btn-outline-dark" onclick="clickSignup()">이 커뮤니티 신청하기</button><br><br>
                </c:if>
                <c:if test="${read.c_state == 'd' || read.c_state == 'e'}">
                    <p style="font-weight: bold">"신청이 마감되었습니다"</p>
                </c:if>
                <br>

                <%-- 커뮤니티 관리자 페이지 버튼 --%>
                <c:if test="${checkOwner == s_id}">
                    <button type="button" class="btn btn-outline-light btn-block text-dark" onclick="location.href='/comm/admin/${read.c_code}'" style="font-weight: bold; color: #3b5998; border-color: #2a96a5;">
                        <i class="fas fa-fw fa-cog"></i> 커뮤니티 관리하기
                    </button>
                </c:if>

            </div>
        </div><!-- 우측 bar end-->
    </div><!-- row end-->

    <br>

    <!-- 커뮤니티 구성원 시작-->
    <div class="container">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 1vh">같이 하는 사람들</h3>
        <table>
            <tr>
                <c:forEach var="list" items="${checkMember}" varStatus="vs">
                    <td>
                        <img src="/storage/${list.m_img}" class="img-fluid rounded-circle">
                        <p style="text-align: center">${list.m_nick}</p>
                    </td>
                    <!-- 테이블 한 줄에 5행씩 -->
                    <c:if test="${vs.count mod 5 == 0}">
                        <tr></tr>
                    </c:if>
                </c:forEach>
            </tr>
        </table>
    </div><!-- 커뮤니티 구성원 end-->

    <br><br>

    <!-- 커뮤니티 후기 (ajax 더보기) ------------------------------------------------------------------>

    <div class="container-fluid text-center">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 1vh">커뮤니티 후기</h3>
        <p style="font-size: 18px; padding-bottom: 40px">방문해 주신 당신, 발자취를 남겨주세요!</p>

        <div class="container-fluid col-lg-3 d-sm-none"></div>
        <div class="container-fluid text-center col-lg-6 col-sm-12">

            <!-- 후기 등록 form 시작 -->
            <!-- 조건 : 1)id 가입 승인 완료(s)
                       2)해당 커뮤니티장
                       3)커뮤니티 모집완료/활동완료(d, e) -->

            <c:if test="${(checkID.s_state == 's' || s_id == checkOwner) && (read.c_state == 'd' || read.c_state == 'e')}">
                <form name="reviewForm" id="reviewForm" style="margin-bottom: 30px">
                    <input type="hidden" id="c_code" name="c_code" value="${read.c_code}">  <!-- 부모 PK키-->
                    <input type="hidden" id="cname" name="cname" value="${read.c_name}">    <!-- 부모 커뮤니티 이름 -->
                    <input type="hidden" id="loginID" name="loginID" value="${s_id}">       <!-- 작성자 -->
                    <input type="text" name="review" id="review" placeholder="후기를 남겨주세요">
                    <input type="range" name="manjok" id="manjok" min=1 max=5>
                    <button type="button" name="reviewInsertBtn" id="reviewInsertBtn">후기 남기기</button>
                </form><!-- 후기 등록 form 끝 -->
            </c:if>

            <!-- 후기 목록 div -->
            <div class="container-fluid">
                <table class="table table-default reviewList" id="reviewList"></table>
            </div>

        </div>
        <div class="container-fluid col-lg-3 d-sm-none"></div>
    </div><!-- 커뮤니티 후기 end -->
    <br><br><br>
</div>


<!-- 후기 관련 자바스크립트 -->
<script>
    let c_code = '${read.c_code}';  //부모 PK키
    let loginID = '${s_id}';

    //더보기
    let limit = 3;              //3개씩 출력
    let size = ${reviewCnt};    //총 후기 수


    //커뮤니티 신청
    function clickSignup(){
        let signState = '${checkID.s_state}';   //로그인id의 가입 상태
        let owner = '${checkOwner}';
        if(owner == loginID){
            alert("당신이 만든 커뮤니티입니다.");
        }else{
            if(signState == ''){                    //가입이력 없음
                location.href = "/survey/write/${c_code}";       //나중에 설문지페이지와 바로 연결하기
            }else if(signState == 'i') {
                alert("이미 가입을 신청한 커뮤니티입니다. \n 가입 승인을 기다려주세요.");
            }else if(signState == 's'){
                alert("이미 가입이 승인된 커뮤니티입니다.");
            }else if(signState == 'r'){
                alert("가입 신청이 반려된 커뮤니티입니다.");
            }//if end
        }//if end
    }//checkSignup() end


    //후기 남기기 버튼 클릭했을 때
    $("#reviewInsertBtn").click(function (){

        let insertData=$("#reviewForm").serialize();
        let reviewCnt = ${reviewByID};
        if(reviewCnt >= 1){
            alert("이미 후기를 작성한 커뮤니티입니다. \n기존 후기를 수정하거나 삭제해주세요.");
            $('#review').val('');   //기존 후기내용 빈값으로
            $('#manjok').val(3);    //기본별점 3
        }else{
            //alert(insertData);
            insertReview(insertData);   //후기등록 함수호출
        }//if end



    });//click() end

    //후기 등록
    function insertReview(insertData){
        //alert("댓글등록함수호출" + insertData);
        $.ajax({
            url    :'/comm/reviewinsert'
            ,type   :'post'
            ,data   :insertData
            ,success:function (data){
                //alert(data);
                if(data==1){                //후기등록 성공
                    listReview();           //후기등록 후 후기목록 함수호출
                    $('#review').val('');   //기존 후기내용 빈값으로
                    $('#manjok').val(3);    //기본별점 3
                }//if end
            }//success end
        });//ajax() end
    }//insertReview() end


    //후기 목록
    function listReview(){
        $.ajax({
            url    :'/comm/reviewlist'
            ,type   :'get'
            ,data   :{'c_code':c_code, 'limit':limit} //부모 PK키
            ,success:function (data){
                // alert(size);
                // alert(limit);

                let a = ''; //출력할 결과값
                $.each(data, function (key, value){
                    //alert(key);
                    //alert(value);
                    a += '<tr class="reviewArea" style="border: 1px solid darkgray; margin-bottom: 15px">';
                    a += '  <td class="reviewInfo' + value.ac_no +'"><br>';
                    a += '      <div colspan="2" class="content' + value.ac_no +'">'
                    a += '          <strong> "' + value.ac_review + '"</strong>  <span style="text-align: right">별점 :';
                                for(i=1; i<=value.ac_manjok; i++){
                    a += '          <img src="/images/star.png" width="15px"></span>';
                                }//for end
                    a += '';
                    a += '      </div>';
                    a += '      <div class="row"><p>작성자 : ' + value.ac_id + "</p>";
                    a += "          <p>작성일 : " + value.ac_rdate;
                    a += '      </div></p></td><td class="text-right">';

                    if(value.ac_id == loginID || loginID =='webmaster'){    //작성자||관리자만 수정/삭제 버튼 접근 가능
                        a += '      <a href="javascript:openReviewUpdatePanel(' + value.ac_no + ',\'' + value.ac_review + '\',' + value.ac_manjok + ');">수정</a>';
                        a += '      <a href="javascript:deleteReview(' + value.ac_no + ');">삭제</a>';
                    };//if end
                    a += '  </td>';
                    a += '  </tr><tr>';

                    a += '</tr>';
                });//each() end

                let b = '';
                b += '  <tr class="moreBtnDiv">';
                b += '  <td colspan="2">';
                b += '      <button type="button" class="btn btn-outline-light text-dark btn-block" id="moreBtn" name="moreBtn" onclick="more()">';
                b += '          <i class="fa fa-plus"></i> <strong>더보기</strong></button>';
                b += '  </td></tr>';
                if(limit < size) a += b;
                $(".reviewList").html(a);   //<div class="reviewList"></div>
            }//success end
        });//ajax() end
    }//listReview() end


    //더보기버튼 moreBtn 누르면 limit 증가
    function more(){
        // alert(limit);
        // alert(size);
        if(limit < size){
            limit += 3;
            //alert('늘어남');
            listReview();
        }else {
            //alert('그대로');
            listReview()
        }//if end
    }//more() end


    //후기 수정 - 수정할 내용 폼으로 출력
    function openReviewUpdatePanel(ac_no, review, manjok){
        let a = '';
        a += '<div class="input-group" style="text-align: center">';
        a += '  <input type="text" class="col-lg-8" value="' + review + '" id="review_' + ac_no + '">';
        a += '  <input type="range" min="1" max="5" value="' + manjok +'" id="manjok_' + ac_no + '">';
        a += '  <button type="button" onclick="updateReview(' + ac_no + ')">수정</button>';
        a += '</div>';

        $(".content" + ac_no).html(a);
    }//openReviewUpdatePanel() end


    //후기 수정
    function updateReview(ac_no){
        let updateReview = $('#review_' + ac_no).val();
        let updateManjok = $('#manjok_' + ac_no).val();
        // alert(ac_no);
        // alert(updateReview);
        // alert(updateManjok);
        $.ajax({
            url:'/comm/reviewupdate'
            ,type:'post'
            ,data:{'review':updateReview, 'manjok':updateManjok, 'ac_no':ac_no}
            ,success:function (data){
                if(data == 1) listReview();    //후기수정 후 목록 출력
            }//success end
        });//ajax() end
    }//updateReview() end


    //후기 삭제
    function deleteReview(ac_no){
        $.ajax({
            url    :'/comm/reviewdelete/' + ac_no
            ,type   :'post'
            ,success:function (data){
                if(data == 1){             //후기 삭제되면
                    listReview(c_code);  //목록 출력
                }//if end
            }//success end
        });//ajax() end
    }//deleteReview() end


    //페이지 로딩시 댓글 목록 출력
    $(document).ready(function (){
        listReview();
    });//ready() end


</script>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>