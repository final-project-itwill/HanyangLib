<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 read.jsp -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- style 시작 -->
<link rel="stylesheet" href="/css/libtable.css">
<!-- Custom fonts for this template-->
<link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

<style>
    .lib-cont * {
        font-family: "KyoboHandwriting2020A";
    }
</style><!-- style 끝 -->


<!-- 헤더 배경 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/sky.jpg'); height: 60vh;"></div>

<!-- 본문 시작 -->
<div class="container-fluid lib-body" style="padding:0px;">
    <div class="row lib-row">


        <!-- 커뮤니티 정보 table 시작 -->
        <div class="container-fluid lib-info col-12 col-md-4 col-lg-3" style="background-color: #0E2A47;">
            <table class="table custom-table">
                <tr align="center">
                    <td valign="middle" style="line-height: 180%;">
                        <p style="font-size: 14px; line-height: 2em; margin-bottom: 5px; color: #0E2A47; font-weight: bold">커뮤니티 선정 도서</p>
						<span style="font-weight: bold; font-size: 35px;">
                            <img src="${read.b_bookcover}" alt="bookPhoto" width="200vh">
                        </span><br>
                        <p style="font-weight: bold; text-align: center; margin: 5px 0 0 0; color: #0E2A47; font-size: 20px;">
                            ${read.b_name}
                        </p>
                    </td>
                </tr>
                <tr align="center">
                    <td valign="middle" style="line-height: 180%;">
                        <p style="font-size: 14px; line-height: 2em; margin-bottom: 5px; color: #0E2A47; font-weight: bold">커뮤니티 만든 사람</p>
                        <img src="/storage/${read.m_img}" alt="userPhoto" width="100vh"><br><br>
						<span style="font-weight: bold; font-size: 30px;">
                            ${read.m_nick}
						</span><br>
                        <p style="font-weight: bold; text-align: center; margin: 0px;">
                            ${read.c_id}
                        </p>
                    </td>
                </tr>
                <tr align="center">
                    <td valign="middle" style="line-height: 180%;">
                        <p style="font-size: 14px; line-height: 2em; margin-bottom: 15px; color: #0E2A47; font-weight: bold">우리 커뮤니티는 현재?</p>
                        <span style="font-weight: bold; font-size: 30px;">
                            <c:choose>
                                <c:when test="${read.c_state == 'i'}">모집중</c:when>
                                <c:when test="${read.c_state == 'd'}">모집완료</c:when>
                                <c:when test="${read.c_state == 'e'}">활동완료</c:when>
                            </c:choose>
                        </span><br>
                    </td>
                </tr>
                <tr align="center">
                    <td valign="middle" style="line-height: 180%;">
                        <p style="font-size: 14px; line-height: 1em; color: #0E2A47; font-weight: bold">주 모임 지역</p>
                        <span style="font-weight: bold; font-size: 20px;">
                            ${read.c_local}
                        </span><br><br>
                        <p style="font-size: 14px; line-height: 1em; color: #0E2A47; font-weight: bold">오픈 채팅방 참여하기</p>
                        <c:if test="${read.c_chat ==''}">
                            <span style="font-weight: bold; font-size: 14px;">채팅방 없음</span>
                        </c:if>
                            <span style="font-weight: bold; font-size: 14px;">
                                <a href="https://open.kakao.com/o/gXtrVbVe">${read.c_chat}</a>
                            </span>
                        </p>
                        <hr>
                        <!-- 커뮤니티 신청 버튼 -->
                        <c:choose>
                            <c:when test="${read.c_state == 'i' && checkOwner != s_id}">
                                <button type="button" class="btn btn-outline-light btn-block text-dark" onclick="clickSignup()" style="font-weight: bold; color: #3b5998; border-color: #2a96a5;">
                                    <i class="fas fa-smile"></i>  이 커뮤니티 신청하기
                                </button>
                            </c:when>
                            <c:when test="${read.c_state != 'i'}">
                                <p style="font-weight: bold">"신청이 마감되었습니다"</p>
                            </c:when>
                        </c:choose>

                        <!-- 커뮤니티 관리자 페이지 버튼 -->
                        <c:if test="${checkOwner == s_id}">
                            <button type="button" class="btn btn-outline-light btn-block text-dark" onclick="location.href='/comm/admin/${read.c_code}'" style="font-weight: bold; color: #3b5998; border-color: #2a96a5;">
                                <i class="fas fa-fw fa-cog"></i> 커뮤니티 관리하기
                            </button>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div><!-- 커뮤니티 정보 table 끝 -->


        <!-- 상세페이지 시작 -->
        <div class="lib-cont col-12 col-md-8 col-lg-9"  style="padding-bottom: 80px;">
            <table class="lib_cont table custom-table" style="display: table; table-layout: fixed;">
                <tr>
                    <td colspan="5" class="text-center lib-text">
                        <h1>${read.c_name}</h1>
                        <h4 style="font-size: medium;">우리 커뮤니티에 오신 것을 환영합니다!</h4>
                        <div style="text-align: center; padding: 10px;">
                            <span style="font-weight: bold; font-size: 35px;">
                                <img src="/storage/${read.c_banner}" alt="communityPhoto" width="500vh">
                            </span><br>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="text-center lib-text">
                        <h4>커뮤니티 소개 >></h4>
                        <h4 style="font-size: medium;">${read.c_des}</h4>
                    </td>
                </tr>
                <!-- 커뮤니티 구성원이 없을 경우 -->
                <c:if test="${fn:length(checkMember)==0}">
                    <tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
                        <td colspan="5" class="text-center lib-text">
                            <h1>커뮤니티 구성원 >></h1>
                            <h4 style="font-size: medium;">아직 가입 승인된 멤버가 없습니다.</h4>
                        </td>
                    </tr>
                </c:if>
                <!-- 커뮤니티 구성원이 있을 경우-->
                <c:if test="${fn:length(checkMember)!=0}">
                <tr><td colspan="5" class="text-center"><h1>커뮤니티 구성원 >></h1></td></tr>
                <tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
                    <td></td>
                    <c:forEach items="${checkMember}" var="list" varStatus="vs">
                        <td>
                            <div style="text-align: center;">

                                <div style="height: 150px; padding: 10px;">
                                    <img src="/storage/${list.m_img}" class="img-fluid rounded-circle" width="100px" align="middle">
                                    <p style="text-align: center">${list.m_nick}</p>
                                </div>
                                <br>
                                <br>
                            </div>
                        </td>
                    </c:forEach>
                    <td></td>
                </tr>
                </c:if><!--구성원 끝 -->

            </table>
        </div>
    </div><!-- 상세페이지 끝 -->

    <!-- 후기 시작 -->
    <div class="container-fluid">
        <table class="table custom-table">
            <!-- 구분선 시작 -->
            <tr>
                <td colspan="5" class="text-center">
                    <img alt="divider" src="/images/divider3.png" width="50%">
                </td>
            </tr><!-- 구분선 끝 -->
            <tr>
                <td colspan="5" class="text-center lib-cont">
                    <h1>커뮤니티 후기</h1>
                    <h4 style="font-size: medium;">책과 함께 활동한 후기를 살펴보세요</h4>
                </td>
            </tr>
        </table>
        <!-- 후기 남기기 form 시작 -->
        <div class="container lib-cont text-center">
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
        </div><!-- 후기 남기기 form 끝 -->
        <br>
        <!-- 후기 목록 div -->
        <div class="container">
            <table class="table table-default reviewList" id="reviewList" style="background-color: #F6F6F6"></table>
        </div>



    </div><!-- 후기 끝 -->

</div><!-- 본문 끝 -->






<!-- 후기 관련 자바스크립트 -->
<script>
    let c_code = '${read.c_code}';  //부모 PK키
    let loginID = '${s_id}';

    //더보기
    let limit = 3;              //3개씩 출력
    let size = ${reviewCnt};    //총 후기 수


    //커뮤니티 신청
    function clickSignup(){
    	let sv_code = '${sv_code}'
        let signState = '${checkID.s_state}';   //로그인id의 가입 상태
        let owner = '${checkOwner}';


        if(sv_code ==''){
            if(signState == ''){                    //가입이력 없음

                let s_nick = '${s_nick}';
                //alert(s_nick);
                let comsign = {
                        s_code : c_code,
                        s_id : loginID,
                        s_nick : s_nick
                    } // survey end

                    $.ajax({
                        type: "post",
                        url:"/survey/write/comsign",
                        contentType: "application/json",
                        data: JSON.stringify(comsign)
                    }) // ajax end
                    alert(" 가입 신청 되었습니다. ");
                	location.reload();

            }else if(signState == 'i') {
                alert("이미 가입을 신청한 커뮤니티입니다. \n 가입 승인을 기다려주세요.");
            }else if(signState == 's'){
                alert("이미 가입이 승인된 커뮤니티입니다.");
            }else if(signState == 'r'){
                alert("가입 신청이 반려된 커뮤니티입니다.");
            }//if end

        }else{

            if(signState == ''){                    //가입이력 없음
                location.href = "/survey/write/${c_code}";       //설문지페이지와 바로 연결하기
            }else if(signState == 'i') {
                alert("이미 가입을 신청한 커뮤니티입니다. \n 가입 승인을 기다려주세요.");
            }else if(signState == 's'){
                alert("이미 가입이 승인된 커뮤니티입니다.");
            }else if(signState == 'r'){
                alert("가입 신청이 반려된 커뮤니티입니다.");
            }//if end

        }// sv_code if end

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
                    a += '<tr class="reviewArea" style="border-bottom: 1px solid darkgray; margin-bottom: 15px">';
                    a += '  <td class="reviewInfo' + value.ac_no +'">';
                    a += '      작성자 : ' + value.ac_id + ' | 작성일 : ' + value.ac_rdate;
                    a += '  </td><td class="text-right">';
                    if(value.ac_id == loginID || loginID =='webmaster'){    //작성자||관리자만 수정/삭제 버튼 접근 가능
                        a += '      <a href="javascript:openReviewUpdatePanel(' + value.ac_no + ',\'' + value.ac_review + '\',' + value.ac_manjok + ');">수정</a>';
                        a += '      <a href="javascript:deleteReview(' + value.ac_no + ');">삭제</a>';
                    };//if end
                    a += '  </td>';
                    a += '</tr><tr>';
                    a += '  <td colspan="2" class="content' + value.ac_no + '" id="content' + value.ac_no + '">';
                    a += '      <p class="lib-cont" style="color: black">' + value.ac_review +'</p>';
                    a += '      <span style="text-align: right">별점 :';
                                for(i=1; i<=value.ac_manjok; i++){
                    a += '          <img src="/images/star.png" width="15px"></span>';
                                }//for end
                    a += '';
                    a += '      <br></td>';
                    a += '  </tr>';
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