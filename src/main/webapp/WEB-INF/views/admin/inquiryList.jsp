<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">1:1 문의 목록 </h1>
    <p class="mb-4"> 현재 답변 대기중인 1:1 문의사항들입니다. 답변을 등록해주세요!</p>


    <div class="card shadow mb-4">
        <!-- 문의 list form 시작 -->
        <form name="frm" method="post">

            <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
<!--카테고리별 목록 조회
                <span class="col-md-6">
                <input type="button" onclick="listInquiry('all')" value="전체보기" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('book')"   value="도서"  class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('payment')"   value="결제" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('member')"   value="회원" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('subscribe')"   value="구독" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('community')"   value="커뮤니티" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('report')"   value="신문고" class="btn-light border-0 text-primary" style="font-weight: bold">
                <input type="button" onclick="listInquiry('etc')"   value="기타" class="btn-light border-0 text-primary" style="font-weight: bold">
                </span>
-->
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead align="center" class="table-header">
                        <tr class="thForList">
                            <th>문의유형</th>
                            <th>제목</th>
                            <th>문의내용</th>
                            <th>ID</th>
                            <th>등록일</th>
                            <th>답변등록</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="list" items="${inquiryList}" varStatus="vs">
                        <tr>
                            <td align="center">${list.ask_type}</td>
                            <td>${list.ask_title}</td>
                            <td>${list.ask_content}</td>
                            <td align="center">${list.ask_id}</td>
                            <td align="center">${list.ask_rdate}</td>
                            <td align="center">
                                <a href="" data-toggle="modal" data-target="#modal${vs.index}" class="text-info btn btn-light" style="font-weight: bold">
                                    <i class="fa fa-angle-double-right"></i>GO
                                </a>
                            </td>
                        </tr>

                        <!-- 답변 insert 모달창 시작 -->
                        <div class="modal" id="modal${vs.index}">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="font-weight: bold">1:1 문의에 답변해주세요.</h5>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- insert form 시작 -->
                                        <form name="frm" method="post" action="/admin/insertResponse/${list.ask_no}">
                                            <input type="hidden" name="ans_no" value="${list.ask_no}">
                                            <p class="text-info" style="font-weight: bold">Q. ${list.ask_title}</p>
                                            <textarea name="ans_content" rows="7" placeholder="답변을 입력해주세요" style="width: 100%" required></textarea>
                                            <input type="submit" value="답변등록" class="btn btn-info" align="right">
                                        </form><!-- insert form 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div><!-- 답변 insert 모달창 끝 -->

                        </tbody>
                        </c:forEach>
                    </table>
                    <div align="right">
                    </div>
                </div>
            </div>
        </form><!-- 문의 list form 끝 -->
    </div>
</div>


<script>

    /*
            //답변 유효성 검사
            function checkInsert(ask_no){
                if(confirm("답변을 저장할까요?")){
                    document.frm.action = "/admin/insertResponse/"+ask_no;
                    document.frm.submit();
                }
            }//checkResponse() end



            리스트 필터링 조회
            function listInquiry(){
                document.frm.action = "/admin/response";
                document.frm.submit();
            }//listInquiry() end
        */
</script>

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>