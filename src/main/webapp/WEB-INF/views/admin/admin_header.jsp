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

    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>

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
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="/static/images/hanyanglogo_w.png"></i>
            </div>
            <div class="sidebar-brand-text mx-3" style="font-size: 20px"><img src="/images/hylogo_w.png" style="width:120px; margin-top: 10px;"></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">


    <c:choose>
    <%-- 로그인 ID가 해당 커뮤니티 생성자일 때 --%>
    <c:when test="${grade == 'A'}">
        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/dashboard">
                <i class="fas fa-fw fa-cog"></i>
                <span style="font-size: 16px">Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav 회원 관리 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-folder"></i>
                <span>1. 회원 </span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">한양서재 이용자를 관리해보세요</h6>
                    <a class="collapse-item" href="#">관리자 계정 관리</a>
                    <a class="collapse-item" href="/admin/memberList">이용자 관리</a>
                </div>
            </div>
        </li><!-- Nav 회원 관리 끝 -->

        <!-- Nav 상품 관리 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-folder"></i>
                <span>2. 상품 관리</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">구독</h6>
                    <a class="collapse-item" href="#">구독자 현황</a>
                    <a class="collapse-item" href="#">구독서비스 수정</a>
                    <a class="collapse-item" href="#"></a>
                    <a class="collapse-item" href="#"></a>
                    <h6 class="collapse-header">도서</h6>
                    <a class="collapse-item" href="/admin/productmain">Dashboard</a>
                    <a class="collapse-item" href="/admin/productinsert">신규도서 등록</a>
                    <a class="collapse-item" href="/admin/productlist">도서 관리</a>
                    <a class="collapse-item" href="/admin/productinquiry">도서 문의</a>
                </div>
            </div>
        </li><!-- Nav 상품 관리 끝 -->


        <!-- Nav 문의 관리 시작 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>3. 고객센터 </span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">공지사항과 문의관리는 여기서!</h6>
                    <a class="collapse-item" href="#">공지사항 관리</a>
                    <a class="collapse-item" href="#">공지사항 등록</a>
                    <h6 class="collapse-header">1:1문의</h6>
                    <a class="collapse-item" href="#">문의 접수 및 답변</a>
                    <a class="collapse-item" href="#"></a>
                </div>
            </div>
        </li><!-- Nav 문의 관리 끝 -->

        <hr class="sidebar-divider">
        <div class="sidebar-heading">커뮤니티</div>
        <!-- Nav 커뮤니티 관리 시작 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCommu"
               aria-expanded="true" aria-controls="collapseCommu">
                <i class="fas fa-fw fa-folder"></i>
                <span>커뮤니티 관리 </span>
            </a>
            <div id="collapseCommu" class="collapse" aria-labelledby="headingCommu" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">이용자들의 모임을 관리해요</h6>
                    <a class="collapse-item" href="#">커뮤니티 이용 현황</a>
                    <a class="collapse-item" href="/admin/communityList">리스트</a>
                    <a class="collapse-item" href="#">MD pick 설정하기</a>
                </div>
            </div>
        </li><!-- Nav 커뮤니티 관리 끝 -->



    </c:when>
    <%--로그인 안했을 때--%>
    <c:otherwise>
        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/dashboard">
                <i class="fas fa-fw fa-cog"></i>
                <span style="font-size: 16px">Dashboard</span></a>
        </li>
        <li class="nav-item active">
            <i class="fas fa-smile-wink"></i>
            <a class="nav-link" href="/login/index">관리자 계정으로<br>로그인 바랍니다.</a>
        </li>
    </c:otherwise>
    </c:choose>
        <%--커뮤니티 삭제 자바스크립트--%>
        <script>
            function checkDelete(){
                let msg = "삭제된 데이터는 복구되지 않습니다. \n진행하시겠어요?"
                if(confirm(msg)){
                    location.href="/comm/delete/${read.c_code}";
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

                <!-- 상단 헤더 -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group text-dark" style="font-weight: bold">
                        &#128218 한양서재 관리자를 위한 공간
                    </div>
                </form>

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
                                새로운 문의가 등록되었어요!
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

                            <a class="dropdown-item text-center small text-gray-500" href="#">답변달러 가기</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>


                    <!-- Nav 관리자 ID info 시작 -->
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
