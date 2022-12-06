<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 배너 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
<!-- 배너 끝 -->
<div class="container-fluid">
	<div class="row lib-row">
	<!-- 개인 정보 시작 -->
	<div class="lib-info col-12 col-sm-3 col-lg-3">
	<c:forEach items="${libInfo}" var="info">
		<table class="table">
		<tr align="center">
			<td valign="middle" style="line-height: 180%;">
				<span style="font-weight: bold; font-size: 35px;">
					<a href="/mylib/libindex/${lib_id}">${info.m_nick}</a>
				</span><br>
				${lib_id}<br>
			</td>
		</tr>
		<tr>
			<td>
				<div style="background-image: url('/images/heart.png');
							background-position: center;
							background-repeat: no-repeat;
							background-size: 10vh;
							position: relative;
							height: 10vh;">
				<p style="color: white; font-weight: bold; text-align: center; padding-top: 2vh;">${info.m_heat}</p>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				서재에 있는 책은 모두 : ${bookCount}권<br>
				80% 이상 읽은 책은 : ${book80Count}권
			</td>
		</tr>
		<tr>
			<td>
			<button class="btn btn-warning">이번 달 목표 설정하기</button>
			</td>
		</tr>
		<tr>
			<td>
				이번 달은<br>
				<span style="font-weight: bold; font-size: 35px;">4</span> 권 읽기
			</td>
		</tr>
		<tr>
			<td>
				이번 해는<br>
				<span style="font-weight: bold; font-size: 35px;">12</span> 권 읽기
			</td>
		</tr>
		</table>
	</c:forEach>
	</div>
	<!-- 개인 정보 끝 -->
	<!-- 서평 목록 시작 -->
	<div class="lib-cont col-12 col-sm-9 col-lg-9">
	<div class="container pb-5 mb-5 border-bottom">
    <div class="row">
      <div class="col-lg-12">
        <div class="custom-accordion" id="accordion_1">
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">서평은 개인의 의견입니다</button>
            </h2>

            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion_1">
              <div class="accordion-body">
                누군가의 자유로운 생각을 존중하는 태도로 비난보단 애정 듬뿍 담은 조언을 부탁드려요
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">서평이 맘에 드신다고요?</button>
            </h2>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion_1">
              <div class="accordion-body">
                여러분도 멋진 서평을 남길 수 있어요, 지금 당신의 서재에 가셔서 서평을 작성해보세요
              </div>
            </div>
          </div> <!-- .accordion-item -->
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">기록하는 힘에 대하여</button>
            </h2>

            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion_1">
              <div class="accordion-body">
                끈기가 없는 사람은 꾸준하게 기록할 수 없어요, 여러분의 기록은 분명 시간이 지날 수록 더 빛을 발하는 보물이 되어줄 거예요 
              </div>
            </div>

          </div> <!-- .accordion-item -->

	      </div>
	    </div>
	  </div>
	</div>

	<table class="table">
	<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
		<td>제목</td>
		<td>책 이름</td>
		<td>별점</td>
		<td>조회수</td>
	</tr>
	<c:forEach items="${review}" var="rv">
	<tr style="text-align: center;">
		<td>${rv.br_title}</td>
		<td>${rv.b_name}</td>
		<td>${rv.br_star}</td>
		<td>${rv.br_count}</td>
	</tr>
	</c:forEach>
	</table>
	</div>
</div>
</div>
<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>