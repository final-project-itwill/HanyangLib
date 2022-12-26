<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 나만의 서재 관련 link, style 시작 -->
<link rel="stylesheet" href="/css/libtable.css">
<!-- Custom fonts for this template-->
<link href="/adminBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
<script>
/* 수정, 삭제 버튼 관련 자바스크립트 */
   function del(){
       if(confirm("영구히 삭제됩니다. \n 진행할까요?")){
           document.frm.action="/mylib/rvDelete";
           document.frm.submit();
       }//if end
   }//del() end

   function update(){
       document.frm.action="/mylib/rvUpdate";
       document.frm.submit();
   }//update() end

</script>
<!-- 본문작성 시작 -->
<!-- 배너와 커뮤니티장 사진이 들어가는 곳 -->
	<div class="hero-slant" data-stellar-background-ratio="0.5" style="background-image: url('../../images/topbg.jpg'); height: 60vh;">
	</div>
	<div class="container-fluid text-right lib-cont">
		<h1>그대의, 서평</h1>
		<h4 style="font-size: medium;">기록되지 않는 것은 기억되지 않는다</h4>
	</div>
<!-- 배너 끝 -->
	<!-- 서평목록 시작 -->
	<form name="frm">
		<table class="table custom-table">
		<tr>
			<td colspan="5" class="text-center lib-text">
				<h1>${rvRead.br_title}</h1>
				<h4 style="font-size: small;">${rvRead.b_name}</h4>
			</td>
		</tr>
		<tr style="text-align: center;">
			<td>
			${rvRead.br_content}
			</td>
		</tr>
		</table>
		<div class="align-content-sm-center" style="text-align: center">
	            <input type="hidden" id="br_no" name="br_no" value="${rvRead.br_no}">
	            <input type="hidden" id="br_id" name="br_id" value="${rvRead.br_id}">
			<c:if test="${rvRead.br_id eq s_id}">
	            <input type="button" class="btn btn-warning" value="수정" onclick="update()">
	            <input type="button" class="btn btn-warning" value="삭제" onclick="del()">
            </c:if>
		</div>
	</form>
	<!-- 서평 목록 끝 -->
	<!-- 서평 댓글 -->
	<div class="container lib-cont text-center">
	    <form name="commentFrm" id="commentFrm">
	    	<input type="text" name="brc_content" id="brc_content" placeholder="마음과 생각을 함께 나눠요" style="width: 600px;">
	        <input type="hidden" id="brc_pno" name="brc_pno" value="${rvRead.br_no}">
            <input type="hidden" id="brc_id" name="brc_id" value="${s_id}">
	        <button type="button" name="commentBtn" id="commentBtn">등록</button>
	    </form>
	</div>
	<c:set value="${s_id}" var="loginId"/>
	<br>
	<div class="container">
	    <table class="table commentList" id="commentList"></table>
	</div>
	
	<!-- 방명록 관련 자바스크립트 -->
	<script>
	    // 페이지 로딩 시 댓글 목록 출력시키기
	    $(window).on('load', function(){
	    	cmList();
	    }); // ready() end
		
	
	    let brc_id='${rvRead.br_id}';
	    let loginId='${loginId}';
	    
	    // 더보기를 위한 limit 변수 선언
        let limit = 5;	// 5개씩 출력
        let size = ${cmCount};	// 총 댓글의 수를 담음
	
	    $('#commentBtn').click(function(){
	        let insertData = $('#commentFrm').serialize();
	        //alert(insertData);
	        cmInsert(insertData);
	    }); // click() end
	
	    // 방명록 등록
	    function cmInsert(insertData){
	        $.ajax({
	             url:'/mylib/cminsert'
	            ,type:'post'
	            ,data:insertData
	            ,success:function(data){
	                if(data==1){
	                    cmList(); // 댓글 작성 후 댓글 목록 함수 호출
	                    $('#brc_content').val('');
	                } // if end
	            } // success end
	        }); // ajax() end
	    }; // commentInsert() end
	    
	    
	    
	    // 방명록 목록
	    function cmList(){
	    	//alert("무한 루프 시작?")
	    	//alert($("#brc_pno").val());
	    	//alert(limit);
	    	
	        $.ajax({
	             url:"/mylib/cmlist"
	            ,data:{'brc_pno':$("#brc_pno").val(), 'limit':limit}
	            ,success:function(data){
	            	//alert("무한 루프 도는 중?")
	                let a = "";
	                $.each(data, function(key, value){
 	                    a += "<tr class='cmArea' style='border-bottm:1px solid darkgray; margin-bottom:15px;'>";
	                    a += "	<td class='cmInfo" + value.brc_no + "'>";
	                    a += "		작성자 : " + value.brc_id + " | 작성일 : " + value.brc_rdate.slice(0, 10);
	                    a += "	</td><td class='text-right'>";
						if(loginId == 'webmaster' || value.brc_id == loginId){
		                    a += "		<a href='javascript:cmUpdate(" + value.brc_no + ", " + value.brc_content + ");'>수정</a>";
		                    a += "		<a href='javascript:cmDelete(" + value.brc_no + ");'>삭제</a>";
	                	};
	                    a += "	</td>";
	                    a += "	</tr><tr>";
	                    a += "	<td colspan='2' class='cmContent' id='cmContent" + value.brc_no + "'>";
	                    a += "		<p class='lib-cont'>" + value.brc_content + "</p>";
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
	                $(".commentList").html(a);
	            } // success end
	            ,error:function(data){
	            	alert("리스트 AJAX 실패");
	            }
	        }); // ajax() end
	        //alert("무한 루프 끝?")
	    } // cmList() end
	    
	    
	    
	    
	    
	    // 더보기 버튼을 누르면 limit가 증가
	    function more(){
	    	/* alert(limit);
	    	alert(size); */
	    	if(limit<size){
	    		limit+=5;
	    		//alert('늘어남');
	    		cmList();
	    	} else {
	    		//alert('그대로');
	    		cmList();
	    	} // while end		                
	    };
	    
	    
	    // 방명록 수정하기
	    function cmUpdate(brc_no, brc_content) {
		    let a = "";
		    a += "<div class='input-group'>";
		    a += "	<input type='text' id='content_" + brc_no + "' value='" + brc_content + "'>";
		    a += "	<button type='button' onclick='cmUpdateProc(" + brc_no + ")'>수정</button>";
		    a += "</div>";
		
		    $("#cmContent" + brc_no).html(a);
		} // visitorUpdate() end 
		
		// 방명록 수정
		function cmUpdateProc(brc_no) {
		    // let updateContent = $('[name=content_' + cno + ']').val();
		    let updateContent = $('#content_' + brc_no).val();
		
		    $.ajax({
		        url:"/mylib/cmupdate"
		        ,type:"post"
		        ,data:{'brc_content':updateContent, 'brc_no':brc_no}
		        ,success:function(data){
		            if(data==1) cmList();
		        }
		    }); // ajax() end
		} // visitorUpdateProc() end
		
		// 방명록 삭제
		function cmDelete(brc_no){
			if(confirm("삭제되면 복구할 수 없습니다. \n 삭제할까요?")){
				$.ajax({
			        url:"/mylib/cmDelete/"+brc_no
			        ,type:"post"
			        ,success:function(data){
			            if(data==1) {cmList()};
			        }
			    }); // ajax() end
	       }//if end
		} // cmDelete() end
		
	</script>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>