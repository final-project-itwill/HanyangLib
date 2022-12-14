<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">

    <title>&#128218 한양서재</title>

    <!-- Custom fonts for this template-->
    <link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- Custom styles for this template-->
    <link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top"><%--본문 시작 -----------------------------------------------------------------------------------%>

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar 좌측 메뉴 시작 -->

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/comm/index">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="/static/images/hanyanglogo_w.png"></i>
            </div>
            <div class="sidebar-brand-text mx-3" style="font-size: 20px"><img src="/images/hylogo_w.png" style="width:120px; margin-top: 10px;"></div>
        </a>


        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/comm/admin/${read.c_code}">
                <i class="fas fa-fw fa-cog"></i>
                <span style="font-size: 16px">커뮤니티 관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav 커뮤니티 구성원 관리 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-folder"></i>
                <span>1. 구성원</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">인원을 관리해보세요</h6>
                    <a class="collapse-item" href="/comm/adminmember/${read.c_code}">가입 신청 승인</a>
                </div>
            </div>
        </li>

        <!-- Nav 커뮤니티 신청서(설문지) 관리 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-folder"></i>
                <span>2. 커뮤니티 신청서</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">가입 신청서를 확인하세요</h6>
                    <a class="collapse-item" href="utilities-color.html">신청서 생성</a>
                    <a class="collapse-item" href="utilities-border.html">신청서 수정</a>
                    <a class="collapse-item" href="utilities-animation.html">신청서 결과 확인</a>
                </div>
            </div>
        </li>


        <!-- Nav 커뮤니티 관리 (페이지/정보 수정) -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>3. 커뮤니티 관리</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">정보 수정이나 삭제는 여기서!</h6>
                    <a class="collapse-item" href="/comm/update/${read.c_code}">커뮤니티 정보 수정</a>
                    <a class="collapse-item" href="javascript:checkDelete();">커뮤니티 삭제</a>
                </div>
            </div>
        </li>

        <script>
            function checkDelete(){
                let msg = "삭제된 데이터는 복구되지 않습니다. \n 진행하시겠어요?"
                if(confirm(msg)){
                    alert("삭제");
                }
            }//checkDelete() end
        </script>

        <br>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- End of Sidebar 좌측메뉴 끝 -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- 상단 커뮤니티 이름 출력 -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group text-dark" style="font-weight: bold">
                        &#128218 ${read.c_name}
                    </div>
                </form><!-- 상단 커뮤니티 이름 출력 끝 -->

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                누군가 후기를 등록했어요!
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>

                            <a class="dropdown-item text-center small text-gray-500" href="#">후기보러 커뮤니티 페이지 가기</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>


                    <!-- Nav 커뮤니티장 ID info 시작 -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-weight: bold; font-size: 15px"><i class="fas fa-user"></i> ${s_id} 님</span>

                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                내정보 관리
                            </a>
                            <a class="dropdown-item" href="/mylib/libindex/${s_id}">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                나만의 서재
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                로그아웃
                            </a>
                        </div>
                    </li><!-- Nav 커뮤니티장 ID info 끝 -->

                </ul>

            </nav><!-- End of Topbar ----------------------------------------------------------------------------->



            <!-- Content 시작 -->
            <div class="container-fluid">

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
                                            <th>신청날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${approvedMember}" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td><a href="#">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                                <td>${dto.s_nick}</td>
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

                <!-- 승인/거절 대기 명단 시작 -->
                <div class="container-fluid">

                    <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">가입 신청</h1>
                    <p class="mb-4">가입의 승인을 기다리고 있는 사람들이에요.</p>


                    <div class="card shadow mb-4">

                        <div class="card-header py-3 row" style="margin: 0 10px 0 10px">
                            <span class="col-md-6">
                                <h6 class="m-0 font-weight-bold text-primary">'${read.c_name}' 가입 대기 명단</h6>
                            </span>
                            <!-- 승인/거절 버튼 -->
                            <span class="col-md-6" style="text-align: right!important">
                                <button class="btn-light border-0"><i class="fas fa-check"></i> 승인</button>
                                <button class="btn-light border-0"><i class="fas fa-trash"></i> 거절</button>
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
                                            <th>독서진행률</th>
                                            <th>신청날짜</th>
                                            <th>체크</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${waitingMember}" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td><a href="#">${dto.s_id}</a></td><%--신청서 답변이랑 연결--%>
                                                <td>${dto.s_nick}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${dto.s_state == 'i'}">승인 대기</c:when>
                                                        <c:when test="${dto.s_state == 'r'}">가입 거절</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>0</td>
                                                <td>${dto.s_rdate}</td>
                                                <td><input type="checkbox" id="" name=""></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div><!-- 승인/거절 대기 명단 끝 -->





                <!-- Footer ----------------------------------------------------------------------------------------->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright ©2022 HanyangLibrary <br> All Rights Reserved</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div><!-- End of Page Wrapper -->


        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하실거예요?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body"> 로그아웃을 원하신다면 하단에 "Logout" 버튼을 클릭해주세요.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="/login/logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript-->
        <script src="/adminBootstrap/vendor/jquery/jquery.min.js"></script>
        <script src="/adminBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="/adminBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="/adminBootstrap/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="/adminBootstrap/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="/adminBootstrap/js/demo/chart-area-demo.js"></script>
        <script src="/adminBootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>