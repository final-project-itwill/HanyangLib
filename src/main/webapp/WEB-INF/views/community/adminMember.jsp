<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

    <!-- 커뮤니티 구성원 목록 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">구성원 관리하기</h1>
        <p class="mb-4">현재 가입이 승인되어 활동하고 있는 사람들의 목록이에요.</p>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 승인 명단</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>아이디</th>
                                <th>닉네임</th>
                                <th>독서 진행률</th>
                                <th>신청날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(approvedMember) == 0}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">아직 활동하는 회원이 없습니다.</td>
                                </tr>
                            </c:if>
                            <c:forEach var="dto" items="${approvedMember}" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td><a href="/survey/answer/${sv_code}/${dto.s_id}">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                    <td>${dto.s_nick}</td>
                                    <td>${dto.lib_proc}%</td>
                                    <td>${dto.s_rdate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div><!-- 커뮤니티 구성원 목록 끝 -->

    <br><br>


    <script>

        //가입 승인 버튼
        function approveMember(){
            if(confirm("진행할까요?")){
                document.frm.action = "/comm/adminupdate/${read.c_code}";
                document.frm.submit();
            }
        }//approveMember() end

        //가입 거절 버튼
        function rejectMember(){
            document.frm.action = "/comm/adminreject/${read.c_code}";
            document.frm.submit();
        }//rejectMember() end

    </script>


    <!-- 승인/거절 대기 명단 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">가입 신청</h1>
        <p class="mb-4">가입의 승인을 기다리고 있는 사람들이에요. <br>아이디를 클릭하면 커뮤니티 신청서를 확인할 수 있답니다.</p>


        <div class="card shadow mb-4">

        <form name="frm" method="post">

            <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
                <span class="col-md-6">
                    <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 가입 대기 명단</h6>
                </span>

                <!-- 승인/거절 버튼 -->
                <span class="col-md-6" style="text-align: right!important">
                    <button id="approvalBtn" name="approvalBtn" onclick="approveMember()" class="btn-light border-0" style="color: darkgreen; font-weight: bold">
                        <i class="fas fa-check"></i> 승인</button>
                    <button id="rejectBtn" name="rejectBtn" onclick="rejectMember()" class="btn-light border-0" style="color: #be2617; font-weight: bold">
                        <i class="fas fa-trash"></i> 거절</button>
                </span>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>아이디</th>
                                <th>닉네임</th>
                                <th>신청상태</th>
                                <th>독서 진행률</th>
                                <th>신청날짜</th>
                                <th>체크</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(waitingMember) == 0}">
                                <tr>
                                    <td colspan="7" style="text-align: center;">커뮤니티 가입 승인을 기다리고 있는 회원들이 없습니다</td>
                                </tr>
                            </c:if>
                            <c:forEach var="dto" items="${waitingMember}" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td><a href="/survey/answer/${sv_code}/${dto.s_id}">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                    <td>${dto.s_nick}</td>
                                    <td>
                                    <c:choose>
                                        <c:when test="${dto.s_state == 'i'}">승인 대기</c:when>
                                        <c:when test="${dto.s_state == 'r'}">가입 거절</c:when>
                                    </c:choose>
                                    </td>
                                    <td>${dto.lib_proc}%</td>
                                    <td>${dto.s_rdate}</td>
                                    <td><input type="checkbox" name="chkList" id="chkList" value="${dto.s_id}"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <p align="right" style="padding-right: 10px" class="text-primary"><input type="checkbox" id="checkAll"> 모두선택</p>
            </div>

        </form>
        </div>

    </div><!-- 승인/거절 대기 명단 끝 -->


    <%-- 체크박스 관련 스크립트 --%>
    <script>

        //체크박스 모두 체크
        $(document).ready(function (){
            $("#checkAll").click(function (){

                if($("#checkAll").prop("checked")){
                    $("input[name=chkList]").prop("checked", true);
                }else {
                    $("input[name=chkList]").prop("checked", false);
                }//if end


            });//click() end
        });//ready() end





/*
 AJAX 버리고 간다

        //가입 승인버튼 클릭했을 때
        $("#approvalBtn").click(function (){
            let chkList = "";
            $('input[type="checkbox"]:checked').each(function (index) {
                chkList += $(this).val();
            });
            alert(chkList);
            approveMember(chkList); //가입승인 함수 호출
        });//click() end


        //가입 승인
        function approveMember(chkList){
            //alert("가입승인 함수 호출" + chkList);
            $.ajax({
                 url    :'/comm/adminupdate'
                ,type   :'post'
                ,data   :chkList
                ,success:function (data){
                    alert(data);
                }//success end
            });//ajax() end
        }//approveMember() end

*/

    </script>




<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>

