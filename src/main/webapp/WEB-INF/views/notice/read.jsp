<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>


<div class="container">
    <h4 style="font-weight: bold; text-align: center; margin-top: 30px">공지사항</h4>
    <p style="text-align: right">
        <c:if test="${grade == 'A'}">
            <a href="/notice/insert">새 공지사항 작성하기</a>
        </c:if>
        &nbsp;
        <a href="/notice/list?pageNum=1">목록으로 돌아가기</a>
    </p>

    <form name="frm">
        <table class="table">
            <tr>
                <th>분류</th>
                <td>${read.n_type}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${read.n_title}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${read.n_content}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${read.n_rdate}</td>
            </tr>
        </table>
    </form>

</div>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>