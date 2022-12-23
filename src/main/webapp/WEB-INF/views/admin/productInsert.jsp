<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->

<<script>

function addProduct(){
    if(confirm("진행할까요?")){
        document.frm.action = "/admin/productRead/${book.b_code}";
        document.frm.submit();
    }
}//approveMember() end
</script>


 <div class="card shadow mb-4">
	<div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">도서 등록</h6>
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
					<td>도서코드(ISBN)</td>
					<td><input type="text" name="b_code"></td>
				</tr>

				<tr>
					<td>도서명</td>
					<td><input type="text" name="b_name"></td>
				</tr>
				<tr>
					<td>도서카테고리</td>
					<td>
						<div class="container">
								<div class="form-check-inline">
									<label class="form-check-label" for="check1"> <input
										type="checkbox" class="form-check-input" id="check1"
										value="novel" onclick=>소설/시
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label" for="check2"> <input
										type="checkbox" class="form-check-input" id="check2"
										value="essay" onclick=>에세이
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label" for="check3"> <input
										type="checkbox" class="form-check-input" id="check3"
										value="humanity" onclick=>인문
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label" for="check4"> <input
										type="checkbox" class="form-check-input" id="check4"
										value="science" onclick=>자연과학
									</label>
								</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="b_publish"></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input type="text" name="b_author"></td>
				</tr>
				<tr>
					<td>구독서비스 제공</td>
					<td>
						<div class="container">
								<div class="form-check-inline">
									<label class="form-check-label" for="radio1"> <input
										type="radio" class="form-check-input" id="radio1"
										name="optradio" value="option1"> Y
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label" for="radio2"> <input
										type="radio" class="form-check-input" id="radio2"
										name="optradio" value="option2" checked> N
									</label>
								</div>
						</div>

					</td>
				</tr>
				<tr>
					<td>페이지수</td>
					<td><input type="number" name="pages"></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="number" name="price"></td>
				</tr>
				<tr>
					<td>출판일</td>
					<td><input type="date" name="rdate"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><textarea rows="5" cols="60" name="b_des"></textarea></td>
				</tr>
				<tr>
					<td>상품사진</td>
					<td><input type="file" name="img"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<div class="my-2"></div>
                       <button id="insertBtn" name ="insertBtn" class="btn btn-success btn-icon-split" onclick="addProduct()">
	                       	<span class="icon text-white-50">
	                       		<i class="fas fa-check"></i>
	                        </span>
	                        <span class="text">상품 등록</span>
                        </button>
                        
                        <a href="/admin/productlist" class="btn btn-danger btn-icon-split">
	                       	<span class="icon text-white-50">
	                       		<i class="fas fa-check"></i>
	                        </span>
	                        <span class="text">등록 취소</span>
	                    </a>
				</tr>


			</table>
		</form>
	 </div>
	</div>
</div>






<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>