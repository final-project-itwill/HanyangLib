<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 list.jsp -->
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>

<div class="container" style="padding-top: 100px;">
    <div class="title">공지사항</div>
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

    <div style="text-align: center">
        글 수 : ${fn:length(list)}
        <form name="keyword" method="post" action="search">
            <input type="text" id="keyword" name="keyword" value="${keyword}" placeholder="공지사항에서 검색하기">
            <input type="submit" value="검색">
        </form>
    </div>
</div>


<!-- 푸터용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 5vh; padding-top: 20px"></div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>