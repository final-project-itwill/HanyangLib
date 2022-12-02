<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: gray; height: 40vh;"></div>


<div class="container">
    <div class="title">공지사항</div>
    <p style="text-align: right">
        <a href="/notice/insert">새 공지사항 작성하기</a><!-- 관리자만 접근 가능하도록 session 변수 활용 -->
        &nbsp;
        <a href="/notice/list">목록으로 돌아가기</a>
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
        <!-- 관리자만 접근 가능 -->
        <div class="align-content-sm-center" style="text-align: center">
            <input type="hidden" id="n_no" name="n_no" value="${read.n_no}">
            <input type="button" value="수정" onclick="update()">
            <input type="button" value="삭제" onclick="del()">
        </div>

    </form>

</div>


<script>

    function del(){
        if(confirm("영구히 삭제됩니다. \n 진행할까요?")){
            document.frm.action="/notice/delete";
            document.frm.submit();
        }//if end
    }//del() end

    function update(){
        document.frm.action="/notice/update";
        document.frm.submit();
    }//update() end

</script>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>