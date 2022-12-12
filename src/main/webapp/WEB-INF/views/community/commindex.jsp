<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문작성 시작 commindex.jsp -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 타이틀 사진과 상단 검색창 --%>
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/galaxy.jpeg'); height: 90vh;">
    <div class="container">
        <div class="row align-items-center justify-content-between" style="display:flex; flex-direction: row-reverse;">
            <div class="col-lg-12 intro">
                <h1 class="text-white text-right font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0" style="text-shadow: 3px 3px 3px black;">책 한 권 속에 펼쳐져있는<br>수 만가지 이야기를<br>검색해보세요</h1>
                <form action="search" method="post" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="200">
                    <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="커뮤니티 이름 또는 책 이름을 검색해보세요">
                    <button type="submit" style="width:40px; padding: 0px;"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container pb-md-5"></div>



<!---------------------------------------------------------------------------->


<%-- 인기 커뮤니티 --%>
<div class="container pb-md-5 border-bottom">
    <div class="row">
        <div class="col-lg-12">


    <%-- 커뮤니티 생성하기 버튼 : 모달창으로 나만의서재 책 불러오기 ------------------------------------------------------------------------------%>
            <div class="modal" id="modal">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" style="font-weight: bold">나만의 서재</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <p>이야기를 나누고 싶은 도서를 선택해주세요</p>
                            <table class="table">
                                <tr>
                                    <th></th>
                                    <th>도서명</th>
                                    <th>진행률</th>
                                </tr>
                                <c:forEach items="${listMylib}" var="dto">
                                    <tr>
                                        <td><img src="/storage/${dto.b_bookcover}"></td>
                                        <td><a href="createForm/${dto.b_code}">${dto.b_name}</a></td>
                                        <td>${dto.lib_proc}%</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" class="btn-light" data-toggle="modal" data-target="#modal" style="font-weight: bold; color: #3b5998;margin-bottom: 20px;">커뮤니티 만들러 가기</button>
    <%-- 커뮤니티 생성하기 버튼 끝 ---------------------------------------------------------------------------------------------------------%>


            <a href="list?pageNum=1"><!-- 인기순 list로 가기-->
                <h1 class="listtext-black text-left font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0">종이에 쓰인<br>글자만으로<br>이런 모임이</h1>
            </a>
        </div>
        <div class="col-lg-12">
            <div class="row" data-aos="fade-up" data-aos-delay="0">
                <div class="col-lg-4">
                    <!-- 사진 클릭하면 해당 커뮤니티 상세보기 이동 -->
                    <a href="read" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
                <div class="col-lg-4">
                    <a href="" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
                <div class="col-lg-4">
                    <a href="" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
            </div>
        </div>
    </div>
</div>


<%--신규 커뮤니티--%>
<div class="container pb-md-5"></div>
<div class="container pb-md-5 border-bottom">
    <div class="row">
        <div class="col-lg-12">
            <a href="list?pageNum=1"><%--최신순 list로 가기--%>
                <h1 class="text-black text-right font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0">새로운 모임은<br>언제든 환영이야</h1>
            </a>
        </div>
        <div class="col-lg-12">
            <div class="row" data-aos="fade-up" data-aos-delay="0">

                <c:forEach items="${newComm}" var="dto">
                <div class="col-lg-4">
                    <a href="read?c_code=${dto.c_code}&loginID=${s_id}" class="gal-item">
                                <img src="/storage/${dto.c_banner}" class="img-fluid">
                    </a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">${dto.c_name}</h4>
                    <p style="text-align: center; font-weight: bold">${dto.b_name}</p>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<%-- 마감일 임박 커뮤니티 --%>
<div class="container pb-md-5"></div>
<div class="container pb-md-5 border-bottom">
    <div class="row" data-aos="fade-up" data-aos-delay="0">
        <div class="col-lg-12">
            <a href="list?pageNum=1"><!-- 마감순 list로 가기-->
                <h1 class="text-black text-left font-weight-bold mb-4" data-aos="fade-up" data-aos-delay="0">열두시가 되면은<br>문을 닫는다</h1>
            </a>
        </div>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-4">
                    <a href="" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
                <div class="col-lg-4">
                    <a href="" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
                <div class="col-lg-4">
                    <a href="" class="gal-item"><img src="../images/img_h_2-min.jpg" class="img-fluid"></a>
                    <br>
                    <h4 style="text-align: center; font-weight: bold">커뮤니티명</h4>
                    <p style="text-align: center; font-weight: bold">책 이름</p>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- 본문작성 끝 --%>
<%@ include file="../footer.jsp"%>