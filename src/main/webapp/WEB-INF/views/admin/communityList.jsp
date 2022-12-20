<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

    <!-- 회원list 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">한양서재 커뮤니티 목록</h1>
        <p class="mb-4">이름을 클릭하면 세부정보를 볼 수 있어요.</p>


        <div class="card shadow mb-4">

            <form name="frm" method="post">

                <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
                    <span class="col-md-6">
                        <h6 class="m-0 font-weight-bold text-primary">회원등급별</h6>
                    </span>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>커뮤니티 이름</th>
                                <th>선정도서</th>
                                <th>주모임지역</th>
                                <th>모임장ID</th>
                                <th>가입인원수</th>
                                <th>모집상태</th>
                            </tr>
                            </thead>
                            <tbody class="communityList">

                            </tbody>
                        </table>
                    </div>
                </div>

            </form>
        </div>

    </div><!-- 회원 list 끝 -->


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>