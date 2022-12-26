<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<script src="/js/chart-area-demo.js"></script>
<script src="/js/chart-bar-demo.js "></script>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">${read.c_name}신청서 차트</h1>
<p class="mb-4">커뮤니티를 신청한 사람들의 설문지를 분석하여 결과로 보여줘요.</p>
<input type="hidden" id="code" value="${read.c_code}">

<!-- Content Row -->
<div class="row">

    <div class="col-xl-8 col-lg-7">

        <!-- Area Chart -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">누적 신청 인원</h6>
            </div>
            <div class="card-body">
                <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                </div>
                <hr>
              	 날자에 따른 누적 신청 인원입니다.
            </div>
        </div>

<!--         Bar Chart
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
            </div>
            <div class="card-body">
                <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                </div>
                <hr>
                Styling for the bar chart can be found in the
                <code>/js/demo/chart-bar-demo.js</code> file.
            </div>
        </div>
 -->
    </div>

    <!-- Donut Chart -->
    <div class="col-xl-4 col-lg-5">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">신청 현황</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <div class="chart-pie pt-4">
                    <canvas id="myPieChart"></canvas>
                </div>
                <hr>
                 신청대기, 현재회원, 가입거절 비율을 알수 있습니다.
            </div>
        </div>
    </div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>
