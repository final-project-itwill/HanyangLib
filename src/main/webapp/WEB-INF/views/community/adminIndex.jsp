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


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>