<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 list.jsp -->
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>

<div class="container" style="padding-top: 100px;">
    <h4 style="font-weight: bold; text-align: center">공지사항</h4>
    <div class="contents">
        <input type="button" value="공지사항 쓰기" onclick="location.href='insert'">
    </div>

    <table class="table">
        <tr>
            <th>분류</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>

        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${dto.n_type}</td>
                <td><a href='read?n_no=${dto.n_no}'>${dto.n_title}</a></td>
                <td>${dto.n_rdate}</td>
            </tr>
        </c:forEach>

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
            <a href="/notice/list?pageNum=${startPage-1}">[이전]</a>      <!-- pageNum값을 Controller에 보냄 -->
        </c:if>

        <!-- 현재페이지 볼드체 / 현재페이지 외 링크 걸기 -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
                <c:when test="${pageNum != i}"><a href="/notice/list?pageNum=${i}">[${i}]</a></c:when>
            </c:choose>
        </c:forEach>

        <!-- 다음 이동 -->
        <c:if test="${endPage < pageCount}">
            <a href="/notice/list?pageNum=${endPage+1}">[다음]</a>
        </c:if>
    </div>

    <br>

    <!-- 검색 -->
    <div style="text-align: center">
        <form name="keyword" method="post" action="search">
            <input type="text" id="keyword" name="keyword" value="${keyword}" placeholder="공지사항에서 검색하기">
            <input type="submit" value="검색">
        </form>
    </div>
</div>
<br>


<!-- 푸터용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 5vh; padding-top: 20px"></div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>