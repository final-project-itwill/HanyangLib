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
	<!-- 커뮤니티 목록 시작 -->
	<div class="lib-cont col-12 col-sm-9 col-lg-9">
    <div class="section-latest">
      <div class="container">
        <div class="row gutter-v1 align-items-stretch mb-5">
          <div class="col-md-12">
          <c:forEach items="${commuRead}" var="commu">
              <div class="col-12">
                <div class="post-entry horizontal d-md-flex">
                  <div class="media">
                    <a href="#"><img src="images/img_h_3.jpg" alt="Image" class="img-fluid"></a>
                  </div>
                  <div class="text">
                    <div class="meta">
                      <span>May 10, 2020</span>
                    </div>
                    <h2><a href="#">${commu.c_name}</a></h2>
                    <p>${commu.ac_manjok}</p>
                  </div>
                </div>
              </div>
		  </c:forEach>
          </div>
        </div>
      </div>
  </div>
</div>
</div>
</div>

<!-- 커뮤니티 목록 끝 -->

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>