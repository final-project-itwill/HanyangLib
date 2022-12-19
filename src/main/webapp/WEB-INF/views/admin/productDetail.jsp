<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

<script>
function productUpdate(){
	document.form1.action="/admin/productupdate";
	document.form1.submit();
}//prodcutUpdate() end

function productdelete(){
	if(confirm("선택된 도서가 삭제됩니다\n진행할까요?")){
		document.form1.action="/admin/productdelete";
		document.form1.submit();
	}//if end
}//productdelete() end
</script>

 <div class="card shadow mb-4">
	<div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">도서 상세보기</h6>
	</div>

	<a href="/admin/productlist" class="btn btn-light btn-icon-split btn-sm" style="width:120px; align:left; margin-left:10px;  margin-top:10px">
        <span class="icon text-white-50">
                 <i class="fas fa-flag"></i>
        </span>
        <span class="text">상품목록</span>
    </a>
<div class="card-body">
	<div class="table-responsive">
		<form id="test" name="form1" method="post" action="insert" enctype="multipart/form-data">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<tr>
				<td>${book.b_name}</td>
			</tr>
			<tr>
				<td>도서명</td>
				<td>${book.b_name}</td>
			</tr>			
			
			
			
			
			    
    		</table>
    	</form>
    </div>
 </div> 
    
    
    
    
    
    
 </div>   



<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>