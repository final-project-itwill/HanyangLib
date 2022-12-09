<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 createForm.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="hero-slant overlay" style="background-image: url('/images/galaxy.jpeg'); height: 50vh;">
</div>


<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">커뮤니티 생성하기</h2>

    <div class="container-fluid col-lg-8">
        <p style="text-align: right"><a href="commindex" style="color: #3b5998">돌아가기</a></p>

        <form name="frm" method="post" action="/comm/insert" enctype="multipart/form-data">
            <%-- 커뮤니티 코드 ex.com001 --%>
            <c:forEach var="list" items="${list}" varStatus="vs">
                <c:if test="${vs.count < 9}">
                    <c:set var="c_code" value="com00${vs.count+1}"></c:set>
                </c:if>
                <c:if test="${vs.count >= 9}">
                    <c:set var="c_code" value="com0${vs.count+1}"></c:set>
                </c:if>
                <c:if test="${vs.count >=100}">
                    <c:set var="c_code" value="com${vs.count+1}"></c:set>
                </c:if>

            </c:forEach>
            <input type="hidden" name="c_code" value="${c_code}">
            <input type="hidden" name="c_bcode" value="${b_code}">
            <input type="hidden" name="c_banner" value="none.jpg">

            <table class="table" style="text-align: center">
                <tr>
                    <th>선택한 책</th>
                    <td>${readBook.b_name}</td>
                </tr>
                <tr>
                    <th>커뮤니티 이름</th>
                    <td><input type="text" name="c_name" class="col-lg-10" required></td>
                </tr>
                <tr>
                    <th>커뮤니티 설명</th>
                    <td><textarea name="c_des" class="col-lg-10" placeholder="만들고자 하는 커뮤니티에 대해 소개해주세요!" maxlength="500" rows="6"></textarea></td>
                </tr>
                <tr>
                    <th>주모임 지역</th>
                    <td><input type="text" name="c_local" class="col-lg-10" placeholder="활동하고 싶은 지역을 적어주세요."></td>
                </tr>
                <tr>
                    <th>오픈채팅 주소</th>
                    <td><input type="text" name="c_chat" class="col-lg-10"></td>
                </tr>
                <tr>
                    <th>커뮤니티 대표사진</th>
                    <td><input type="file" name="poster" class="col-lg-10"></td>
                </tr>
                <tr>
                    <th>최대 인원수</th>
                    <td><input type="number" name="c_count" min="2" value="3" class="col-lg-10"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" value="커뮤니티 만들기">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>