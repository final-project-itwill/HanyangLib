<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800" style="font-weight: bold">관리자 페이지에 오신 것을 환영합니다</h1>

</div>
<p>좌측의 메뉴를 선택해주세요</p><br>

<!-- Content Row -->
<div class="row">

    <!-- 방문자수 card 시작 -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            오늘 방문자 수</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">100명</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- 방문자수 card 끝 -->

    <!-- 회원수 card 시작 -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            한양서재 회원수</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            1000명
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- 회원수 card 끝 -->

    <!-- 매출 card 시작 -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            지금까지 매출액
                        </div>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">1억ㅋㅋ</div>
                            </div>
                            <div class="col">
                                <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar"
                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                         aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-child fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- 매출 card 끝 -->

    <!-- 평점 card 시작 -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            구성원이 준 평점은 몇점일까?</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <c:choose>
                                <c:when test="${reviewCnt > 0}">
                                    <c:forEach var="i" begin="1" end="${star}">
                                        ★
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <p style="font-size: 15px">등록된 후기가 아직 없어요!</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- 평점 card 끝 -->

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>