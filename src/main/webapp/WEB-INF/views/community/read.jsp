<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 read.jsp -->




<div class="hero-slant overlay" style="background-image: url('../images/galaxy.jpeg'); height: 50vh;">
</div>

<div class="text-center">
    <img class="userphoto rounded-circle" src="../images/hanyanglogo.png" style="width: 30vh; position: absolute;">
    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
</div>

<div class="container-fluid border-bottom">
    <div class="row">
        <!-- 커뮤니티 상세 : 좌측 bar 시작 -->
        <div class="lib-cont col-12 col-sm-9 col-md-9 col-lg-8" style="padding-left: 5vw">

            <div class="container-fluid" style="padding: 0 15vw 15vw 1vw">
                <img src="../images/none.jpg" class="img-fluid img-thumbnail">
                <div>
                    <h3g style="text-align: center; font-weight: bold; margin-top: 5vh">커뮤니티 소개</h3g>
                    <p style="margin-top: 5vh">얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다</p>
                </div>
            </div>
        </div><!-- 좌측 bar end-->

        <!-- 커뮤니티 정보 : 우측 bar 시작 -->
        <div class="lib-info col-12 col-sm-3 col-md-3 col-lg-4">
            <div class="container-fluid" style="padding-right: 10vw">
                <div>
                    첵 제목
                </div><!-- 책 제목 end-->
                <div>
                    <table class="table">
                        <tr>
                            <th>커뮤니티장</th>
                            <td>행복한돼지</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 상태</th>
                            <td>활동중</td>
                        </tr>
                        <tr>
                            <th>주 모임 지역</th>
                            <td>송파구</td>
                        </tr>
                        <tr>
                            <th>오픈채팅방 주소</th>
                            <td>http://~</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 등록일</th>
                            <td>2022-11-25</td>
                        </tr>
                    </table>
                </div><!-- 정보 테이블 end-->
                <button type="submit">커뮤니티 신청하기</button><!-- 신청 버튼 end-->
            </div>
        </div><!-- 우측 bar end-->
    </div>

    <br><br>

    <!-- 커뮤니티 구성원 -->
    <div class="container-fluid">
        <h3 style="text-align: center; font-weight: bold; padding-bottom: 5vh">커뮤니티 구성원</h3>
        <div id="parent" style="text-align: center" class="photo mr-3">
            <div class="container-fluid" style="text-align: center; justify-content: center; display: flex; height: 18vh">
                <figure style="position: absolute">
                    <img src="../images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-left: 20vw">
                    <img src="../images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-left: 40vw">
                    <img src="../images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-right: 20vw">
                    <img src="../images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <figure style="position: absolute; margin-right: 40vw">
                    <img src="../images/user.png" class="img-fluid rounded-circle" style="width: 8vw">
                    <figcaption style="font-weight: bold; color: black; font-size: 1.5vw">닉네임</figcaption>
                </figure>
                <br>
            </div>
        </div>
    </div><!-- 커뮤니티 구성원 end-->

    <br><br><br><br><br><br>
    <!-- 커뮤니티 후기 (ajax 더보기) -->
    <div class="container-fluid">
        <h3 style="text-align: center; font-weight: bold">커뮤니티 후기</h3>
    </div><!-- 커뮤니티 후기 end -->

    <br><br><br>
</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>