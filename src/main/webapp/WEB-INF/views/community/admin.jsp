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

        <!-- 상단 커뮤니티 이름 출력 -->
        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
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

      </nav><!-- End of Topbar ----------------------------------------------------------------->



    <!-- Content 시작 -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800" style="font-weight: bold">관리자 페이지에 오신 것을 환영합니다</h1>

        </div>
          <p>좌측의 메뉴를 선택해주세요</p><br>

        <!-- Content Row -->
        <div class="row">

          <!-- 커뮤니티 생성일 card 시작 -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                      커뮤니티 생일</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">${read.c_rdate}</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- 커뮤니티 생성일 card 끝 -->

          <!-- 커뮤니티 상태 card 시작 -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                      우리 커뮤니티는 현재</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <c:choose>
                        <c:when test="${read.c_state == 'i'}">모집중</c:when>
                        <c:when test="${read.c_state == 'd'}">모집 완료</c:when>
                        <c:when test="${read.c_state == 'e'}">활동 완료</c:when>
                      </c:choose>
                    </div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- 커뮤니티 상태 card 끝 -->

          <!-- 커뮤니티 인원수 card 시작 -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">승인된인원수/신청인원수
                    </div>
                    <div class="row no-gutters align-items-center">
                      <div class="col-auto">
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">5/10</div>
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
          </div><!-- 커뮤니티 인원수 card 끝 -->

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


        <!-- Content Row -->
        <div class="row">

          <!-- 커뮤니티 사진 -->
          <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
              <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">커뮤니티 이름 : ${read.c_name}</h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="banner-area col-xl-8 col-lg-7">
                  <img src="/storage/${read.c_banner}" style="height: 50vh;">
                </div>
              </div>
            </div>
          </div>

          <!-- 선정한 책 -->
          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">책 이름 : ${read.b_name}</h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="bookcover-area col-xl-4 col-lg-5">
                  <img src="${read.b_bookcover}" style="height: 50vh; margin: auto">
                </div>
              </div>
            </div>
          </div>

    </div><!-- End of Main Content -->


<!-- Footer ------------------------------------------------------------------------------------------>
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