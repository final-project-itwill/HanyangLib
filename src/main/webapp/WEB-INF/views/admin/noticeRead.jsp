<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<div class="container-fluid">
    <h3 class="h3 mb-2 text-gray-800" style="font-weight: bold">공지사항</h3>
    <p class="mb-4"> 기존의 공지사항을 수정하거나 삭제할 수 있어요. </p>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">

                <!--공지사항 read form 시작-->
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

                    <div class="align-content-sm-center" style="text-align: center">
                        <input type="hidden" id="n_no" name="n_no" value="${read.n_no}">
                        <input type="button" value="수정" class="btn btn-outline-primary" style="font-weight: bold" onclick="update()">
                        <input type="button" value="삭제" class="btn btn-outline-danger" style="font-weight: bold" onclick="del()">
                    </div>

                </form><!--공지사항 read form 끝 -->
    </div>
</div>

<!-- 수정/삭제 관련 js -->
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
<%@ include file="admin_footer.jsp"%>