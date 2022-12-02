<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 list.jsp -->

<div class="hero-slant overlay" style="background-image: url('../images/galaxy.jpeg'); height: 50vh;">
    <div class="container">
        <div class="align-items-center justify-content-between" style="padding-top: 200px;">
            <div class="col-lg-12 intro">
                <h1 class="text-white font-weight-bold mb-4 aos-animate" data-aos="fade-up" data-aos-delay="0">커뮤니티<br>둘러보지 않을래?</h1>
            </div>
        </div>
    </div>

</div>

<div class="container pb-md-5"></div>
<div class="container pb-md-5"></div>


<!-- 커뮤니티 목록 테이블 (DB연결 후 jstl for문으로 출력할 것이다)-->
<div class="container border-bottom">

    <div class="row">
        <div class="col-lg-3">
        <select class="" style="width: 20vh; height: 5vh">
            <option>인기순</option>
            <option>최신순</option>
            <option>마감순</option>
            <option>모두보기</option>
        </select>
        </div>

        <div class="col-lg-3"></div>

        <div class="col-lg-6" style="margin-right: 0">
        <form class=" text-right">
            <input type="text" style="height: 5vh; width: 40vh" placeholder="커뮤니티 찾아보기">
            <input type="submit" class="btn-dark" value="검색">
        </form>
        </div>
    </div>
    <br>

    <table class="table table-hover">
        <thead>
        <tr class="active">
            <th>No.</th>
            <th>커뮤니티 이름</th>
            <th>뭘 넣을까?</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
        </tr>
        <tr>
            <td>Mary</td>
            <td>Moe</td>
            <td>mary@example.com</td>
        </tr>
        <tr>
            <td>July</td>
            <td>Dooley</td>
            <td>july@example.com</td>
        </tr>
        </tbody>
    </table>

</div>


<!-- 페이징 추가하기 / border-bottom 클래스 여기에 추가?-->


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>