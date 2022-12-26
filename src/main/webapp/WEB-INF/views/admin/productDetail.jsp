<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

 <div class="card shadow mb-4">
	<div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">도서 상세보기</h6>
	</div>

	<a href="/admin/productlist?pageNum=1" class="btn btn-light btn-icon-split btn-sm" style="width:120px; align:left; margin-left:10px;  margin-top:10px">
        <span class="icon text-white-50">
                 <i class="fas fa-flag"></i>
        </span>
        <span class="text">상품목록</span>
    </a>
	<div class="card-body">
		<div class="table-responsive">
			<form id="test" name="form1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="b_code" value="${b_code}">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<td>도서코드(ISBN)</td>
					<td>${book.b_code}</td>
				</tr>
				<tr>
					<td>도서명</td>
					<td>${book.b_name}</td>
				</tr>
				<tr>
						<td>도서카테고리</td>
						<td>${book.b_type}</td>
				</tr>
				<tr>
						<td>출판사</td>
						<td>${book.b_publish}</td>
				</tr>
				<tr>
						<td>작가</td>
						<td>${book.b_author}</td>
				</tr>
				<tr>
						<td>구독서비스 제공</td>
						<td>${book.b_gudok}</td>
				</tr>
				 <tr>
						<td>페이지수</td>
						<td>${book.b_page}</td>
						
					</tr>
					<tr>
						<td>상품가격</td>
						<td>${book.b_price}</td>
					</tr>
					<tr>
						<td>출판일</td>
						<td>${book.b_rdate}</td>
					</tr>
					<tr>
						<td>상품설명</td>
						<td>${book.b_des}</td>
					</tr>
					  <tr>
					        <td>상품사진</td>
					        <td><img src="${book.b_bookcover}"></td>
					    </tr>
					  </table> 
					   <div class="align-content-sm-center" style="text-align: center">
					            <input type="hidden" name="b_code" value="${book.b_code}">
					            <input type="hidden" name="b_bookcover" value="${book.b_bookcover}">
					            <input type="button" class="btn btn-success btn-icon-split"  value="상품수정" onclick="update()"> 
					            <input type="button" class="btn btn-danger btn-icon-split" value="상품삭제" onclick="del()"> 
					   </div>   
	    	</form>
	    </div>
	 </div> 
   
 </div>   
 
 
 <script>
 let b_code = "${b_code}";
 let b_bookcover = "${b_bookcover}"
 
function update(){
	document.form1.action="/admin/update/"+b_code;
	document.form1.submit();
}//prodcutUpdate() end

function del(){
	if(confirm("선택된 도서가 삭제됩니다\n진행할까요?")){
		document.form1.action="/admin/delete/"+b_code;
		document.form1.submit();
	}//if end
}//productdelete() end
</script>



<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>