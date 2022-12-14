<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('/images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
    
    <h3>회원상세보기</h3>
    
    <form name="membupdate" method="post">
    	<input type="hidden" id="m_id" name="m_id" value="${s_id}">
	    <table border="1" class="table table-hover">
	        <tr>
	            <td>아이디</td>
	            <td>${s_id}</td>
	        </tr>
	        <tr>
    			<th>전화번호</th>
			    <td style="text-align: left"><input type="text" name="m_tel" id="m_tel" value="${detail.m_tel}" size="15"></td>
			</tr>
	         <tr>
	            <td>비밀번호</td>
	            <td><input type="password" name="m_pw" id="m_pw" value="${detail.m_pw}"></td>
	        </tr>
	        <tr>
			    <th>*비밀번호 확인</th>
			    <td style="text-align: left"><input type="password" name="pw_check" id="pw_check" size="15" required></td>
			</tr>
	        <tr>
	        	<th>이메일</th>
	            <td>
	            	<input type="email" name="m_email" id="m_email" value="${detail.m_email}">
	            </td>
	        </tr>
	        <tr>
	   			<th>우편번호</th>
			    <td style="text-align: left">
			      <input type="text" name="m_zip" id="m_zip" size="7" value="${detail.m_zip}" readonly>
			      <input type="button" value="주소찾기" onclick="DaumPostcode()">
			      <span></span>    
			    </td>
			</tr>
			<tr>  
			  <th>주소</th>
			  <td style="text-align: left"><input type="text" name="m_add1" id="m_add1" size="45" value="${detail.m_add1}" readonly></td>
			</tr>
			<tr>  
			  <th>나머지주소</th>
			  <td style="text-align: left"><input type="text" name="m_add2" id="m_add2" size="45" value="${detail.m_add2}"></td>
			</tr>
	        <tr>
	   		  <th>이메일 수신여부</th>
	    		<td>
	       			 <input type="checkbox" name="mailcheck" id="mailcheck">
	       			 <input type="hidden" name="m_mailcheck" id="m_mailcheck">
	       		
	    		</td>
			</tr>
			<tr>
			    <th>sms 수신여부</th>
			    <td>
			        <input type="checkbox" name="smscheck" id="smscheck">
			        <input type="hidden" name="m_smscheck" id="m_smscheck">
			    </td>
			</tr>
	        <tr>
	            <td colspan="2" align="center">
	               <!--  <input type="hidden" name="" value=""> -->
	                <input type="button" class="btn btn-success" value="회원수정" onclick="memupdate()">
	            </td>
	        </tr>
	      </table>
    </form>
   </div>
   
   
    <script>
    function memupdate(){
    	alert($("input:checkbox[name='mailcheck']").is(":checked"));
    	if($("input:checkbox[name='mailcheck']").is(":checked") == true){
			$("#m_mailcheck").val('Y');
			//alert($("#m_mailcheck").val());
		} else if($("input:checkbox[name='mailcheck']").is(":checked") == false){
			$("#m_mailcheck").val('N');
			//alert($("#m_mailcheck").val());
		}
		
		if($("input:checkbox[name='smscheck']").is(":checked") == true){
			$("#m_smscheck").val('Y');
		} else if($("input:checkbox[name='smscheck']").is(":checked") == false){
			$("#m_smscheck").val('N');
		}
    	
    	if(confirm("정보가 입력됩니다\n가입할까요?")){
    	document.membupdate.action="/member/update";		//수정 후 수정페이지로 이동
    	document.membupdate.submit();    	
    	}//if end
    }//memupdate
    
    </script>
    
    
  
    <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_add1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#m_add2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    <!-- ----- DAUM 우편번호 API 종료----- -->
	</script>


<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>