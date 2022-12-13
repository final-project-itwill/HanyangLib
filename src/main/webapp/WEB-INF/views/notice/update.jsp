<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 update.jsp -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>


<div class="container" style="padding-top: 100px">
    <div class="title">공지사항 수정</div>

    <form method="post" action="update">
        <input type="hidden" id="n_no" name="n_no" value="${read.n_no}">
        <table class="table">
            <tr>
                <th>카테고리 선택</th>
                <td>
                    <select name="n_type" class="col-lg-10">
                        <option value="info" <c:if test="${read.n_type == 'info'}">selected</c:if>>기본</option>
                        <option value="book" <c:if test="${read.n_type == 'book'}">selected</c:if>>도서</option>
                        <option value="comm" <c:if test="${read.n_type == 'comm'}">selected</c:if>>커뮤니티</option>
                        <option value="payment" <c:if test="${read.n_type == 'payment'}">selected</c:if>>결제/환불</option>
                        <option value="event" <c:if test="${read.n_type == 'event'}">selected</c:if>>이벤트</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="n_title" id="n_title" value="${read.n_title}" class="col-lg-10" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="5" name="n_content" id="n_content" class="col-lg-10">${read.n_content}</textarea></td>
            </tr>

        </table>
        <div style="text-align: center">
            <input type="submit" value="수정">
            <input type="button" value="목록" onclick="location.href='list?pageNum=1'">
        </div>
    </form>
</div>



<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>