<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<style>
    .response{ background-color: #F6F6F6}
</style>




<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">1:1 답변 목록 </h1>
    <p class="mb-4"> 답변이 완료된 문의사항입니다. 확인하여 수정/삭제할 수 있어요.</p>

    <div class="card shadow mb-4">

            <div class="card-body">
                <div class="table-responsive">

                    <!-- 1:1 문의/답변 table 시작 -->
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead align="center" class="table-header">
                        <tr class="thForList">
                            <th>문의유형</th>
                            <th>제목</th>
                            <th>문의내용</th>
                            <th>ID</th>
                            <th>등록일</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="list" items="${responseList}" varStatus="vs">
                        <tr>
                            <td align="center" style="color: #1da1f2">${list.ask_type}</td>
                            <td>${list.ask_title}</td>
                            <td>${list.ask_content}</td>
                            <td align="center">${list.ask_id}</td>
                            <td align="center">${list.ask_rdate}</td>
                        </tr>
                        <tr align="center" class="response">
                            <td style="font-weight: bold">CS담당자</td>
                            <td colspan="3"><div class="class${list.ans_no}">${list.ans_content}</div></td>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#modal${vs.index}"><i class="fa fa-file"></i>수정</a>
                                &nbsp;
                                <a href="javascript:deleteResponse(${list.ans_no});" class="text-danger"><i class="fa fa-trash"></i>삭제</a>
                            </td>
                        </tr>

                        <!-- 답변 update 모달창 시작 -->
                        <div class="modal" id="modal${vs.index}">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="font-weight: bold">1:1 문의에 답변해주세요.</h5>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- insert form 시작 -->
                                        <form name="frm" method="post" action="/inquiry/update">
                                            <input type="hidden" name="ans_no" value="${list.ans_no}">
                                            <p class="text-info" style="font-weight: bold">Q. ${list.ask_title}</p>
                                            <textarea name="ans_content" rows="7" style="width: 100%" required>
                                                 ${fn:trim(list.ans_content)}
                                            </textarea>
                                            <input type="submit" value="답변수정" class="btn btn-info" align="right">
                                        </form><!-- insert form 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div><!-- 답변 update 모달창 끝 -->

                        </tbody>
                        </c:forEach>

                    </table><!-- 1:1 문의/답변 table 끝 -->
                </div>
            </div>
    </div>
</div>



<script>

    //답변 삭제
    function deleteResponse(ans_no){
        if(confirm("정말 삭제하시겠습니까?")){
            $.ajax({
                url    :'/inquiry/delete/' + ans_no
                ,type   :'post'
                ,success:function (data){
                    if(data == 1){
                        location.reload();
                    }//if end
                }//success end
            });//ajax() end
        }//if end
    }//deleteReview() end

</script>


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>