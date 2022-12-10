<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 read.jsp -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<div class="hero-slant overlay" style="background-image: url('/images/galaxy.jpeg'); height: 50vh;">
</div>

<div class="text-center">
    <img class="userphoto rounded-circle" src="/images/hanyanglogo.png" style="width: 30vh; position: absolute;">
    <h1 style="text-align: center; font-weight: bold">${read.c_name}</h1>
</div>

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
        <div class="lib-info col-12 col-sm-5 col-md-5 col-lg-5">
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

                <%-- 커뮤니티 신청 버튼 --%>

                    <button type="button" onclick="clickSignup()">이 커뮤니티 신청하기</button>


            </div>
        </div><!-- 우측 bar end-->
    </div><!-- row end-->

    <br><br>

    <!-- 커뮤니티 구성원 -->
    <div class="container-fluid">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 5vh">커뮤니티 구성원</h3>
        <div id="parent" style="text-align: center" class="photo mr-3">
            <div class="container-fluid" style="text-align: center; justify-content: center; display: flex; height: 18vh">
                <figure style="position: absolute">
                    <img src="/images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-left: 20vw">
                    <img src="/images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-left: 40vw">
                    <img src="/images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-right: 20vw">
                    <img src="/images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-right: 40vw">
                    <img src="/images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <br>
            </div>
        </div>
    </div><!-- 커뮤니티 구성원 end-->

    <br><br><br><br><br><br>

    <!-- 커뮤니티 후기 (ajax 더보기) ------------------------------------------------------------------>

    <div class="container-fluid text-center">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 1vh">커뮤니티 후기</h3>
        <p style="font-size: 18px; padding-bottom: 40px">방문해 주신 당신, 발자취를 남겨주세요!</p>

        <div class="container-fluid col-lg-3 d-sm-none"></div>
        <div class="container-fluid text-center col-lg-6 col-sm-12">

            <!-- 후기 등록 form 시작 -->
            <!-- 로그인 id가 해당 커뮤니티에 가입된 상태일 때만 후기 작성 가능-->
            <%--<c:if test="${loginID=='hanyihanyi'}">--%>

            <c:if test="${(commCheck.c_state=='d' || commCheck.c_state=='e') && idCheck.s_state=='s'}">
                <form name="commacForm" id="commacForm" style="margin-bottom: 30px">
                    <input type="hidden" id="ac_ccode" name="ac_ccode" value="${read.c_code}"><!-- 부모 PK키-->
                    <input type="hidden" id="ac_cname" name="ac_cname" value="${read.c_name}"><!-- 부모 커뮤니티 이름 -->
                    <input type="text" name="ac_review" id="ac_review" placeholder="후기를 남겨주세요">
                    <input type="range" name="ac_manjok" id="ac_manjok" min=1 max=5>
                    <button type="button" name="commacBtn" id="commacBtn">후기 남기기</button>
                </form><!-- 후기 등록 form 끝 -->
            </c:if>

            <!-- 후기 목록 div -->
            <div class="activityList"></div>

<%--            후기 list for:each 반복문으로 테이블로 출력했을 때--%>
<%--            <table  style="width: 100%">--%>
<%--                <c:forEach var="dto" items="${acList}">--%>
<%--                    <tr>--%>
<%--                        <td class="col-sm-2 col-md-2 col-lg-2"><img src="/images/user.png" style="width: 4vw"> </td>--%>
<%--                        <td class="col-sm-8 col-md-8 col-lg-8">${dto.ac_review}</td>--%>
<%--                        <td class="col-sm-2 col-md-2 col-lg-2">--%>

<%--                            <c:forEach var="star" begin="1" end="${dto.ac_manjok}">--%>
<%--                                ★--%>
<%--                            </c:forEach>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>

<%--                <tr>--%>
<%--                    <td colspan="3"><a href="#">후기 더보기</a></td>--%>
<%--                </tr>--%>
<%--            </table>--%>

        </div>
        <div class="container-fluid col-lg-3 d-sm-none"></div>
    </div><!-- 커뮤니티 후기 end -->
    <br><br><br>
</div>

<!-- 후기 관련 자바스크립트 -->
<script>
    let ac_ccode = '${read.c_code}';  //부모 PK키


    //로그인 id가 작성자와 동일한 경우에만 후기 수정/삭제 가능
    let loginID = 'hanyihanyi';   //세션변수로 받아올 것.
    //현재 ac_id 값은 컨트롤러에 임의로 hanyihanyi로 세팅했다.


    //커뮤니티 신청버튼 누르면, 가입 여부 체크 및 신청폼페이지로 이동
    function clickSignup(){
        let id = '${idCheck.s_id}';
        if(id == ''){
            location.href = "signupForm";   //나중에 설문지페이지와 바로 연결하기
        }else{
            alert("이미 가입을 신청한 커뮤니티입니다.");
        }//if end
    }//checkSignup() end



    //후기 남기기 버튼 클릭했을 때
    $("#commacBtn").click(function (){
        //id="commac"의 내용을 전부 가져온다
        let insertData=$("#commacForm").serialize();
        //alert(insertData);
        InsertIntoCommunityActivity(insertData);   //후기등록 함수호출
    });//click() end

    function InsertIntoCommunityActivity(insertData){
        //alert("댓글등록함수호출" + insertData);
        $.ajax({
             url    :'/commac/insert'
            ,type   :'post'
            ,data   :insertData
            ,success:function (data){
                 //alert(data);
                if(data==1){        //후기등록 성공
                    listActivity();   //후기등록 후 후기목록 함수호출
                    $('#ac_review').val('');    //기존 후기내용 빈값으로
                    $('#ac_manjok').val(3);     //기본별점 3
                }//if end
            }//success end
        });//ajax() end
    }//InsertIntoCommunityActivity() end


    //후기 목록
    function listActivity(){
        $.ajax({
             url    :'/commac/list'
            ,type   :'get'
            ,data   :{'ac_ccode':ac_ccode} //부모 PK키
            ,success:function (data){
                //alert(data);
                let a = ''; //출력할 결과값
                $.each(data, function (key, value){
                    // alert(key);
                    // alert(value);
                    a += '<div class="commacArea" style="border-bottom: 1px solid darkgray; margin-bottom: 15px">';
                    a += '  <div class="commacInfo' + value.ac_no +'">';
                    a += '      번호 : ' + value.ac_no + ' / 작성자 : ' + value.ac_id + "  " + value.ac_rdate;

                    //작성자||관리자만 수정/삭제 버튼 접근 가능
                    if(value.ac_id == loginID || value.ac_id =='webmaster'){
                        a += '      <a href="javascript:openActivityUpdatePanel(' + value.ac_no + ',\'' + value.ac_review + '\',' + value.ac_manjok + ');">수정</a>';
                        a += '      <a href="javascript:deleteActivity(' + value.ac_no + ');">삭제</a>';
                    };//if end
                    a += '  </div>';
                    a += '  <div class="commacReview' + value.ac_no +'">'
                    a += '      <p>후기 내용 : ' + value.ac_review + ' / 만족도 :' + value.ac_manjok + '</p>';
                    a += '  </div>';
                    a += '</div>';
                });//each() end

                $(".activityList").html(a);   //<div class="activityList"></div>

            }//success end
        });//ajax() end
    }//listActivity() end


    //후기 수정 - 수정할 내용 폼으로 출력
    function openActivityUpdatePanel(ac_no, ac_review, ac_manjok){
        let a = '';
        a += '<div class="input-group" style="text-align: center">';
        a += '  <input type="text" value="' + ac_review + '" id="ac_review_' + ac_no + '">';
        a += '  <input type="range" min="1" max="5" value="' + ac_manjok +'" id="ac_manjok_' + ac_no + '">';
        a += '  <button type="button" onclick="updateActivity(' + ac_no + ')">수정</button>';
        a += '</div>';

        $(".commacReview" + ac_no).html(a);
    }//openActivityUpdatePanel() end


    //후기 수정
    function updateActivity(ac_no){

        let updateReview = $('#ac_review_' + ac_no).val();
        let updateManjok = $('#ac_manjok_' + ac_no).val();
        // alert(ac_no);
        // alert(updateReview);
        // alert(updateManjok);

        $.ajax({
             url:'/commac/update'
            ,type:'post'
            ,data:{'ac_review':updateReview, 'ac_manjok':updateManjok, 'ac_no':ac_no}
            ,success:function (data){
                 if(data == 1) listActivity();    //후기수정 후 목록 출력
            }//success end
        });//ajax() end
    }//updateActivity() end


    //후기 삭제
    function deleteActivity(ac_no){
        $.ajax({
             url    :'/commac/delete/' + ac_no
            ,type   :'post'
            ,success:function (data){
                 if(data == 1){             //후기 삭제되면
                     listActivity(ac_ccode);  //목록 출력
                 }//if end
            }//success end
        });//ajax() end
    }//deleteActivity() end


    //페이지 로딩시 댓글 목록 출력
    $(document).ready(function (){
        listActivity();
    });//ready() end






</script>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>