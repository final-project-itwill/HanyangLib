<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <img src="/images/none.jpg" class="img-fluid img-thumbnail"><!-- 추후 read로 c_banner 가져올 것 -->
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
                            <td>${read.c_id}</td>
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
                <button type="submit">커뮤니티 신청하기</button><!-- 신청 버튼 end-->
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

    <!-- 커뮤니티 후기 (ajax 더보기) -->
    <div class="container-fluid text-center">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 1vh">커뮤니티 후기</h3>
        <p style="font-size: 18px; padding-bottom: 40px">방문해 주신 당신, 발자취를 남겨주세요!</p>


        <!-- 후기 테이블 시작 -->
        <div class="container-fluid col-lg-3 d-sm-none"></div>
        <div class="container-fluid text-center col-lg-6 col-sm-12">
            <table  style="width: 100%">
                <tr>
                    <td colspan="3" style="text-align: right"><button type="submit">후기 남기기</button> </td>
                </tr>

                <c:forEach var="dto" items="${acList}">
                    <tr>
                        <td class="col-sm-2 col-md-2 col-lg-2"><img src="/images/user.png" style="width: 4vw"> </td>
                        <td class="col-sm-8 col-md-8 col-lg-8">${dto.ac_review}</td>
                        <td class="col-sm-2 col-md-2 col-lg-2">

                            <c:forEach var="star" begin="1" end="${dto.ac_manjok}">
                                ★
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>

                <tr></tr>
                <tr></tr>
                <tr>
                    <td colspan="3"><a href="#">후기 더보기</a></td>
                </tr>
            </table>
        </div>
        <div class="container-fluid col-lg-3 d-sm-none"></div>
        <!-- 후기 테이블 끝 -->
    </div><!-- 커뮤니티 후기 end -->

    <br><br><br>
</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>