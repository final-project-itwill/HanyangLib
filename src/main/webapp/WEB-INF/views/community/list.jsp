<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 list.jsp -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <form class=" text-right" name="keyword" action="search" method="post">
            <input type="text" name="keyword" style="height: 5vh; width: 40vh" value="${keyword}" placeholder="커뮤니티 찾아보기">
            <input type="submit" class="btn-dark" value="검색">
        </form>
        </div>
    </div>
    <br>

    <table class="table table-hover">
        <thead>
        <tr class="active">
            <th>커뮤니티 이름</th>
            <th>책</th>
            <th>모집상태</th>
            <th>등록일</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="dto" items="${list}">
        <tr>
            <td><a href="read/${dto.c_code}">${dto.c_name}</a></td>
            <td>${dto.b_name}</td>
            <td>
                <c:choose>
                    <c:when test="${dto.c_state == 'i'}">모집중</c:when>
                    <c:when test="${dto.c_state == 'd'}">모집완료</c:when>
                    <c:when test="${dto.c_state == 'e'}">활동완료</c:when>
                </c:choose>
            </td>
            <td>${dto.c_rdate}</td>

            <!-- 관리자 페이지로 이동 필요-->
            <td>
                <a href="/comm/update/${dto.c_code}">수정</a> &nbsp;&nbsp;
                <a href="/comm/delete/${dto.c_code}">삭제</a>
            </td>

        </tr>
        </c:forEach>

        </tbody>
    </table>

    <!-- 페이징 list -->
    <c:set var="pageCount" value="${totalPage}"></c:set>
    <c:set var="startPage" value="${startPage}"></c:set>
    <c:set var="endPage"   value="${endPage}"></c:set>

    <div class="container-fluid" style="text-align: center">
        <!-- endPage는 10, 20, 30.. ex)총 페이지가 22일 때 endPage 30이 아닌 22까지 출력해야 함 -->
        <c:if test="${endPage > pageCount}">
            <c:set var="endPage" value="${pageCount}"></c:set>
        </c:if>

        <!-- 이전 : startPage는 10, 20, 30.. 따라서 1보다 크면 이전 페이지 이동 가능 -->
        <c:if test="${startPage > 1}">
            <a href="/comm/list?pageNum=${startPage-1}">[이전]</a>      <!-- pageNum값을 Controller에 보냄 -->
        </c:if>

        <!-- 현재페이지 볼드체 / 현재페이지 외 링크 걸기 -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
                <c:when test="${pageNum != i}"><a href="/comm/list?pageNum=${i}">[${i}]</a></c:when>
            </c:choose>
        </c:forEach>

        <!-- 다음 이동 -->
        <c:if test="${endPage < pageCount}">
            <a href="/comm/list?pageNum=${endPage+1}">[다음]</a>
        </c:if>
    </div>

    <br>

</div>

<!--
<script>

    function checkDelete(){
        let msg = "삭제하면 복구되지 않습니다. \n 진행하시겠습니까?"
        if(confirm(msg)) {
            return true;
        }else {
            history.back();
        }//if end
    }//checkDelete() end
</script>
-->
<!-- 페이징 추가하기 / border-bottom 클래스 여기에 추가?-->


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>