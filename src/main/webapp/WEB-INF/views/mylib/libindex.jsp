<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 나만의 서재 관련 link, style 시작 -->
<link rel="stylesheet" href="/css/libtable.css">
<!-- Custom fonts for this template-->
<link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/adminBootstrap/css/sb-admin-2.min.css" rel="stylesheet">

<style>
.site-nav .site-navigation .site-menu > li > a {
	color : black;
}
.site-nav .site-navigation .site-menu > li.active > a {
	color : black;
}
.lib-cont * {
	font-family: "KyoboHandwriting2020A";
}
.lib-cont  a, .lib-cont a:hover {
	color : black !important;
}
</style>
<!-- 나만의 서재 관련 link, style 끝 -->
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant" data-stellar-background-ratio="0.5" style="background-image: url('../../images/topbg.jpg'); height: 60vh;">
	</div>


	<!-- ebookRead 새창으로 열기 자바스크립트 -->
	<script>
		function readEbook(b_code){
			let link = "http://localhost:9095/mylib/eBookRead/"+b_code;
			let encodedURI = encodeURI(link);
			window.open(encodedURI, '');
		}//readEbook() end
	
	</script>

	<!-- container -->
	<div class="container-fluid lib-body" style="padding:0px;">
		<div class="row lib-row">
			<!-- 개인정보창 -->
			<div class="container-fluid lib-info col-12 col-md-4 col-lg-3" style="background-color: #ddc5b2;">
			<c:forEach items="${libInfo}" var="info">
				<table class="table custom-table">
				<tr>
					<td>
						<img src="/storage/${info.m_img}" alt="userPhoto" width="200vh">
					</td>
				</tr>
				<tr align="center">
					<td valign="middle" style="line-height: 180%;">
						<span style="font-weight: bold; font-size: 35px;">
							<a class="text-black" href="/mylib/libindex/${lib_id}">${info.m_nick}</a>
						</span><br>						
						<p style="font-weight: bold; text-align: center; margin: 0px;">
							${lib_id}
						</p>
						<span style="line-height: 1em; margin: 0px; padding: 0px;">
							<img alt="heart" src="/images/hearts.png" width="20vh">
							${info.m_heat}
						</span>
						<p style="font-size: xx-small; line-height: 1.5em; margin-bottom: 0px;">한양서재에서 열심히 활동해서<br>하트를 늘려보세요</p>
					</td>
				</tr>
				<tr>
					<td>
						서재에 있는 책은 모두 : <span style="font-weight: bold;">${bookCount}</span>권<br>
						80% 이상 읽은 책은 : <span style="font-weight: bold;">${book80Count}</span>권<br>
					<c:if test="${lib_id eq s_id}">
					<!-- 모달창 버튼 -->
					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">
						목표 설정하기
					</button>
					<!-- 모달창 시작 -->	
					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-sm modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">한 권이어도 좋으니<br>꾸준히 읽어보아요</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<form name="goalfrm" action="/mylib/setGoal">
								<input type="hidden" name="m_id" id="m_id" value="${lib_id}">
								<table class="modal-body table">
								<tr>
									<th>이번 달 목표</th>
									<td>
										<input type="text" name="m_month" id="m_month" value="${info.m_month}">
									</td>
								</tr>
								<tr>
									<th>올 해 목표</th>
									<td>
										<input type="text" name="m_year" id="m_year" value="${info.m_year}">
									</td>
								</tr>									
								</table>								

								<!-- Modal footer -->
								<div class="modal-footer">
									<input type="submit" class="btn btn-secondary" onclick="javascript:setGoal()" value="결정하기">
								</div>
								</form>
							</div>
						</div>
					</div>
					
					<script>
						function setGoal(){
							$("#myModal")
						}					
					</script>
					
					</c:if>
					<!-- 모달창 끝 -->
						</td>
				</tr>
				<tr>
					<td>
						이번 달은<br>
						<span style="font-weight: bold; font-size: 35px;">${info.m_month}</span> 권 읽기
					</td>
				</tr>
				<tr>
					<td>
						이번 해는<br>
						<span style="font-weight: bold; font-size: 35px;">${info.m_year}</span> 권 읽기
					</td>
				</tr>
				</table>
			</c:forEach>
			</div>
			<!-- 상세페이지 -->
			<div class="lib-cont col-12 col-md-8 col-lg-9"  style="padding-bottom: 80px;"> <!-- style="background-image: url('../../images/libbg2.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;" -->
				<table class="lib_cont table custom-table" style="display: table; table-layout: fixed;">
<!-- 					   style="background-image: url('../../images/lib_cont_bg1.png');
					   			background-position:center;
					   			background-repeat: no-repeat;
					   			background-size: 100vw;
					   			background-position: center top;" -->
				<!-- 서재 목록 시작 -->
				<!-- 나의 서재에 책이 없을 경우 -->
				<c:if test="${bookCount==0}">
				<tr>
					<td colspan="5" class="text-center lib-text">
						<h1>나의 서재</h1>
						<h4 style="font-size: medium;">내가 세계를 알게 된 것은 책에 의해서였다 - Jean Paul C. A. Sartre</h4>
					</td>
				</tr>
				<tr></tr>
				<tr><td colspan="5">아직 서재에 책을 꽂아두지 않으셨네요</td></tr>
				</c:if>
				<!-- 나의 서재에 책이 있을 경우 -->
				<c:if test="${bookCount!=0}">
				<tr>
					<td colspan="5" class="text-center lib-text">
						<h1>나의 서재</h1>
						<h4 style="font-size: medium;">내가 세계를 알게 된 것은 책에 의해서였다 - Jean Paul C. A. Sartre</h4>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="text-right">
					<div class="btn" onclick="location.href='/mylib/myBooks/${lib_id}'" style="background-image: url('../../images/hy_btn_l.png'); background-repeat: no-repeat; background-size: contain; padding-right: 50px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서재로 들어가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					</td>
				</tr>
				<tr><td colspan="5" class="text-center"><h4>가장 최근에 들어온 책들이에요</h4></td></tr>
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td></td>
					<c:forEach items="${libThree}" var="read" varStatus="vs">
					<c:choose>
					<c:when test="${fn:length(libThree)==1}">
					<td colspan="3">
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${read.b_bookcover != null}">
								<div style="height: 150px; padding: 10px;">
								<img src="${read.b_bookcover}" width="100px" align="middle">
								</div>
							</c:when>
							<c:otherwise>
								등록된 사진 없음!!<br>
							</c:otherwise>
						</c:choose>
						<br>
						<a class="text-black" href="javascript:readEbook(${read.b_code});">${read.b_name}</a>
						<br>
							진행도 : <fmt:formatNumber value="${read.lib_proc}" pattern="###"/>%
						</div>
					</td>
					</c:when>
					<c:otherwise>
					<td>
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${read.b_bookcover != null}">
								<div style="height: 150px; padding: 10px;">
								<img src="${read.b_bookcover}" width="100px" align="middle">
								</div>
							</c:when>
							<c:otherwise>
								등록된 사진 없음!!<br>
							</c:otherwise>
						</c:choose>
						<br>
						<a class="text-black" href="javascript:readEbook(${read.b_code});">${read.b_name}</a>
						<br>
							진행도 : <fmt:formatNumber value="${read.lib_proc}" pattern="###"/>%
						</div>
					</td>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					<td></td>
				</tr>
				</c:if>
				<!-- 서재 목록 끝 -->
				<!-- 구분선 시작 -->
				<tr>
					<td colspan="5" class="text-center">
					<img class="divider" alt="divider" src="/images/divider2.png" width="50%">
					</td>
				</tr>
				<!-- 구분선 끝 -->
				<!-- 커뮤니티 목록 시작 -->
				<!-- 가입한 커뮤니티가 없을 때 -->
				<c:if test="${fn:length(commuRead)==0}">
				<tr><td colspan="5" class="text-center lib-text"><h1>나의 커뮤니티 활동</h1><h4 style="font-size: medium;">혼자서는 작은 한 방울이지만 함께 모이면 바다를 이룹니다 - Ryunosuke Satoro</h4></td></tr>
				<tr><td colspan="5" class="text-center">오 이런, 가입한 커뮤니티가 없군요!</td></tr>
				</c:if>
				<!-- 가입한 커뮤니티가 있을 때 -->
				<c:if test="${fn:length(commuRead)!=0}">
				<tr><td colspan="5" class="text-center lib-text"><h1>나의 커뮤니티 활동</h1><h4 style="font-size: medium;">혼자서는 작은 한 방울이지만 함께 모이면 바다를 이룹니다 - Ryunosuke Satoro</h4></td></tr>
				<tr>
					<td colspan="5" class="text-right">
					<div class="btn" onclick="location.href='/mylib/myComm/${lib_id}'" style="background-image: url('../../images/hy_btn_l.png'); background-repeat: no-repeat; background-size: contain; padding-right: 50px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;커뮤니티 살펴보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					</td>
				</tr>
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
					<td colspan="2">커뮤니티 이름</td>
					<td>상태</td>
					<td>별점</td>
				</tr>
				<c:forEach items="${commuRead}" var="commu">
				<tr style="text-align: center;">
					<td colspan="2"><a class="text-black" href="#">${commu.c_name}</a></td>
					<td>
						<c:if test="${commu.c_state=='i'}">
							진행중
						</c:if>
						<c:if test="${commu.c_state=='e'}">
							활동 종료
						</c:if>
					</td>
					<td>
						<c:forEach var="cnt" begin="1" end="${commu.ac_manjok}" step="1">
							<img src="/images/star.png" width="15px">
						</c:forEach>	
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<tr><td colspan="5"><br><br></td></tr>
				<!-- 커뮤니티 목록 끝 -->
				<!-- 구분선 시작 -->
				<tr>
					<td colspan="5" class="text-center divider">
					<img class="divider" alt="divider" src="/images/divider2.png" width="50%">
					</td>
				</tr>
				<!-- 구분선 끝 -->
				<!-- 서평 목록 시작 -->
				<!-- 작성한 서평이 없을 때 -->
				<c:if test="${fn:length(review)==0}">
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td colspan="5" class="text-center lib-text">
						<h1>나의 서평</h1>
						<h4 style="font-size: medium;">둔한 붓이 총명함을 이긴다 - 다산 정약용</h4>
					</td>
				</tr>
				<c:if test="${s_id eq lib_id}">
				<tr>
					<td colspan="5" class="text-right">
					<div class="btn" onclick="location.href='/mylib/rvInsert?br_id=${lib_id}'" style="background-image: url('../../images/hy_btn_l.png'); background-repeat: no-repeat; background-size: contain; padding-right: 50px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서평 등록하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					</td>
				</tr>
				</c:if>
				<tr><td colspan="5">오 이런, 서평을 작성하지 않았군요!</td></tr>
				</c:if>
				<!-- 작성한 서평이 있을 때 -->
				<c:if test="${fn:length(review)!=0}">
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4">
					<td colspan="5" class="text-center lib-text">
						<h1>나의 서평</h1>
						<h4 style="font-size: medium;">둔한 붓이 총명함을 이긴다 - 다산 정약용</h4>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="text-right">
					<div class="btn" onclick="location.href='/mylib/myReview?lib_id=${lib_id}&pageNum=1'" style="background-image: url('../../images/hy_btn_l.png'); background-repeat: no-repeat; background-size: contain; padding-right: 50px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서평 읽어보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					</td>
				</tr>
				<tr class="col-12 col-xs-12 col-sm-4 col-lg-4" style="text-align: center;">
					<td colspan="2">제목</td>
					<td>책 이름</td>
					<td>별점</td>
					<td>조회수</td>
				</tr>
				<c:forEach items="${review5}" var="rv">
				<tr style="text-align: center;">
					<td colspan="2"><a href="/mylib/reviewRead?br_no=${rv.br_no}&loginId=${s_id}">${rv.br_title}</a></td>
					<td>${rv.b_name}</td>
					<td>
						<c:forEach var="cnt" begin="1" end="${rv.br_star}" step="1">
							<img src="/images/star.png" width="15px">
						</c:forEach>	
					</td>
					<td>${rv.br_count}</td>
				</tr>
				</c:forEach>
				</c:if>
				</table>
				</div>
			</div>
		</div>
		<!-- container 2 시작 -->
		<div class="container-fluid">
			<table class="table custom-table">	
				<!-- 방명록 -->
				<!-- 구분선 시작 -->
				<tr>
					<td colspan="5" class="text-center">
					<img alt="divider" src="/images/divider3.png" width="50%">
					</td>
				</tr>
				<!-- 구분선 끝 -->
				<tr>
					<td colspan="5" class="text-center lib-cont">
						<h1>방명록</h1>
						<h4 style="font-size: medium;">사랑받고 싶다면 사랑하라, 그리고 사랑스럽게 행동하라 - Benjamin Franklin</h4>
					</td>
				</tr>			
				</table>
				<div class="container lib-cont text-center">
				    <form name="visitorInsertForm" id="visitorInsertForm">
				    <input type="text" name="content" id="content" placeholder="오간 흔적을 남겨주세요" style="width: 600px;">
<!-- 				    <textarea name="content" id="content"></textarea>
				        <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
						<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
						<script>
						  ClassicEditor.create( document.querySelector( '#content' ), {
						    language: "ko"
						  } );
						</script>
						<style>
						  .ck-editor__editable { height: 200px; }
						</style> -->
				        <input type="hidden" name="vis_pid" id="vis_pid" value="${lib_id}">
				        <input type="hidden" name="vis_myid" id="vis_myid" value="${s_id}">
				        <!-- CKEditor 5 -->				        
				        <button type="button" name="visitorInsertBtn" id="visitorInsertBtn">등록</button>
				    </form>
				</div>
				<br>
					<div class="container">
					    <table class="table table-dark visitorList" id="visitorList"></table>
					</div>
				
				<!-- 방명록 관련 자바스크립트 -->
				<script>
				    let vis_pid='${lib_id}';
				    let loginId='${s_id}';
				    
				    // 더보기를 위한 limit 변수 선언
	                let limit = 5;	// 5개씩 출력
	                let size = ${vsCount};	// 총 댓글의 수를 담음
				
				    $('#visitorInsertBtn').click(function(){
				        let insertData = $('#visitorInsertForm').serialize();
				        //alert(insertData);
				        visitorInsert(insertData);
				    }); // click() end
				
				    // 방명록 등록
				    function visitorInsert(insertData){
				        $.ajax({
				             url:'/mylib/vsinsert'
				            ,type:'post'
				            ,data:insertData
				            ,success:function(data){
				                if(data==1){
				                    visitorList(); // 댓글 작성 후 댓글 목록 함수 호출
				                    $('#content').val('');
				                } // if end
				            } // success end
				        }); // ajax() end
				    }; // commentInsert() end
				    
				    // 방명록 목록
				    function visitorList(){
				        $.ajax({
				             url:"/mylib/vslist"
				            ,type:"get"
				            ,data:{'vis_pid':vis_pid, 'limit':limit}
				            ,success:function(data){
				                // alert(size);
				                // alert(limit);
				               	// alert(data);
				                let a = "";
				                $.each(data, function(key, value){
				                    a += "<tr class='visitorArea' style='border-bottm:1px solid darkgray; margin-bottom:15px;'>";
				                    a += "	<td class='visitorInfo" + value.vis_no + "'>";
				                    a += "		작성자 : " + value.vis_myid + " | 작성일 : " + value.vis_rdate.slice(0, 10);
				                    a += "	</td><td class='text-right'>";
									if(loginId == 'webmaster' || value.vis_myid == loginId){
				                    a += "		<a class='text-white' href='javascript:visitorUpdate(" + value.vis_no + ", \"" + value.vis_content + "\");'>수정</a>";
				                    a += "		<a class='text-white' href='javascript:visitorDelete(" + value.vis_no + ");'>삭제</a>";
				                	};
				                    a += "	</td>";
				                    a += "	</tr><tr>";
				                    a += "	<td colspan='2' class='vsContent' id='visitorContent" + value.vis_no + "'>";
				                    a += "		<p class='lib-cont'>" + value.vis_content + "</p>";
				                    a += "	</td>";				                    
				                    a += "</tr>";
				                    //alert(a);
				                }); // each end
				                
				                let b = "";
			                    b += "	<tr class='moreBtnDiv'>";
			                    b += "	<td colspan='2'>";
			                    b += "		<button type='button' class='btn btn-outline-light text-white btn-block' id='more' name='more' onclick='more()'><i class='fas fa-plus-circle'></i></button>";
			                    b += "	</td></tr>";
			                    if(limit<size) a += b;
				                $(".visitorList").html(a);
				            } // success end
				        }); // ajax() end
				    } // visitorList() end
				    
				    // 더보기 버튼을 누르면 limit가 증가
				    function more(){
				    	/* alert(limit);
				    	alert(size); */
				    	if(limit<size){
				    		limit+=5;
				    		//alert('늘어남');
				    		visitorList();
				    	} else {
				    		//alert('그대로');
				    		visitorList();
				    	} // while end		                
				    };
				    
				    // 페이지 로딩 시 댓글 목록 출력시키기
				    $(document).ready(function(){
				    	visitorList();
				    }); // ready() end
				    
				    // 방명록 수정하기
				    function visitorUpdate(vis_no, vis_content) {
					    let a = "";
					    a += "<div class='input-group'>";
					    // a += "	<input type='text' name='content_" + cno + "' value='" + content + "'>";
					    a += "	<input type='text' id='content_" + vis_no + "' value='" + vis_content + "'>";
					    a += "	<button type='button' onclick='visitorUpdateProc(" + vis_no + ")'>수정</button>";
					    a += "</div>";
					
					    $(".visitorContent" + vis_no).html(a);
					} // visitorUpdate() end 
					
					// 방명록 수정
					function visitorUpdateProc(vis_no) {
					    // let updateContent = $('[name=content_' + cno + ']').val();
					    let updateContent = $('#content_' + vis_no).val();
					
					    $.ajax({
					        url:"/mylib/vsupdate"
					        ,type:"post"
					        ,data:{'content':updateContent, 'vis_no':vis_no}
					        ,success:function(data){
					            if(data==1) visitorList();
					        }
					    }); // ajax() end
					} // visitorUpdateProc() end
					
					// 방명록 삭제
					function visitorDelete(vis_no){
					    $.ajax({
					        url:"/mylib/delete/"+vis_no
					        ,type:"post"
					        ,success:function(data){
					            if(data==1) {visitorList()};
					        }
					    }); // ajax() end
					} // visitorDelete() end		

					
				</script>
	</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>