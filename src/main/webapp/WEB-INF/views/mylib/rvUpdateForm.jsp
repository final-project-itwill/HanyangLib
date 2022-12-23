<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
<style>
.slider {
  -webkit-appearance: none;
  width: 50%;
  height: 15px;
  border-radius: 5px;  
  background: #04AA6D;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%; 
  background: #04AA6D;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #04AA6D;
  cursor: pointer;
}
</style>
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
<!-- 배너 끝 -->
<div style="text-align: center; margin-top: 30px">
    <h2 style="font-weight: bold; margin-bottom: 30px">서평 쓰기</h2>

    <div class="container-fluid col-lg-8">
    <form method="post" action="rvUpdate">
    	<input type="hidden" id="br_id" name="br_id" value="${s_id}">
    	<input type="hidden" id="br_no" name="br_no" value="${br_no}">
    	<input type="hidden" name="br_bcode" id="br_bcode" value="${read.br_bcode}">
        <table class="table">
        <tr>
            <th>제목</th>
            <td><input type="text" name="br_title" id="br_title" class="col-lg-10" value="${read.br_title}" required></td>
        </tr>
        <tr>
            <th>서평할 책을 골라주세요</th>
            <td><input type="text" name="b_name" id="b_name" class="col-lg-10" value="${read.b_name}" readonly></td>
            <!-- 모달 버튼 -->
            <td><input type="button" class="btn btn-success" data-toggle="modal" data-target="#searchBook" value="책 찾아보기">
			<div class="modal fade" id="searchBook">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">나의 서재에서 책을 한 권 꺼내보아요</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <table>
			        <c:forEach items="${libRead}" var="read" varStatus="vs">
			        <tr>
						<td>
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
						</td>
						<!-- 책 제목 -->
						<td>
							${read.b_name}
						</td>
						<td>
							<input type="radio" name="check" id="check" value="${vs.count}">
							<input type="hidden" name="code${vs.count}" id="code${vs.count}" value="${read.b_code}">
							<input type="hidden" name="name${vs.count}" id="name${vs.count}" value="${read.b_name}">
						</td>
					</tr>
					</c:forEach>
			        </table>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <input type="button" class="btn btn-default" data-dismiss="modal" value="close" onclick="choose()">
			      </div>
			      <script>
			      	function choose(){
						let cnt = $("input:radio[name='check']:checked").val();
						$('#b_name').val($("#name"+cnt).val());
						$('#br_bcode').val($("#code"+cnt).val());
			      	}
			      </script>
			
			    </div>
			  </div>
			</div>
            <!-- 모달 버튼 끝 -->
            </td>
        </tr>
        <tr>
        	<th>당신의 별점은!?</th>
        	<td><input type="range" name="br_star" id="br_star" min="1" max="5" value="${read.br_star}" required></td>
        </tr>

        </table>
        <!-- CKEditor 4 -->
		<div class="edior">
			    <textarea name="br_content" id="br_content">${read.br_content}</textarea>
				<script>
				 CKEDITOR.replace('br_content',
                         {});
				</script>
				<style>
				  .ck-editor__editable { height: 200px; }
				</style>
		</div>
        <div align="center">
            <input type="submit" value="수정">
            <input type="button" value="취소" onclick="javascript:history.back()">
        </div>
    </form>
    </div>
</div>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>