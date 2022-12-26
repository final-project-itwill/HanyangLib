<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->

<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>

<form name="memberform" method="post" action="insert" enctype="multipart/form-data">
<div class="container">
<table border="1" class="table table-hover">
<tr>
	<td style="color:red; font-weight: bold;">*필수입력</td>
</tr>
<tr>
	<th>프로필 사진</th>
	<td>
		<input type="file" name="file" id="file"  src="../storage/profile_none.png">
		<input type="hidden" name="m_img" id="m_img">
 	</td>
</tr>
<tr>
    <th>*아이디</th>
    <td style="text-align: left">
      <input type="text" name="m_id" id="m_id" size="15">
      <input type="button" value="ID중복확인" id="btn_userid"> 
      <span id="idpanel" style="display:none"></span> 
    </td>
</tr>
<tr>
    <th>*비밀번호</th>
    <td style="text-align: left"><input type="password" name="m_pw" id="m_pw" size="15" required></td>
</tr>
<tr>
    <th>*비밀번호 확인</th>
    <td style="text-align: left" colspan="2">
    <input type="password" name="m_pw2" id="m_pw2" class="pwcheck" size="15" required>
    <font id="chm_pw" size="2"></font>
    </td>
</tr>
<tr>
    <th>*이름</th>
    <td style="text-align: left"><input type="text" name="m_name" id="m_name" size="15" maxlength="20" required></td>
</tr>
<tr>
    <th>*닉네임</th>
    <td style="text-align: left">
    	<input type="text" name="m_nick" id="m_nick" size="15" maxlength="20" required>
    	<input type="button" value="닉네임중복확인" id="btn_usernick"> 
    	<span id="nickpanel" style="display:none"></span>
    </td>
</tr>
<tr>  
  <th>*생년월일</th>
	<td  style="text-align: left"><input type="date" name="m_birth" id="m_birth" required>
	</td>
</tr>
<tr>
    <th>*이메일</th>
    <td style="text-align: left">
      <input type="email" name="m_email" id="m_email" size="30">
      <input type="button" value="Email 중복확인" id="btn_email">
      <span id="emailpanel" style="display:none"></span>
    </td>
</tr>
 <tr>
    <th>*이메일 수신여부</th>
    <td>
        <input type="checkbox" name="mailcheck" id="mailcheck">
        <input type="hidden" name="m_mailcheck" id="m_mailcheck">
    </td>
</tr>
<tr>
    <th>*sms 수신여부</th>
    <td>
        <input type="checkbox" name="smscheck" id="smscheck">
        <input type="hidden" name="m_smscheck" id="m_smscheck">
    </td>
</tr>
<tr>
    <th>*전화번호</th>
    <td style="text-align: left"><input type="text" name="m_tel" id="m_tel" size="15"></td>
</tr>
<tr>
    <th>*우편번호</th>
    <td style="text-align: left">
      <input type="text" name="m_zip" id="m_zip" size="7"  readonly>
      <input type="button" value="주소찾기" onclick="DaumPostcode()">
      <span></span>    
    </td>
</tr>
<tr>  
  <th>*주소</th>
  <td style="text-align: left"><input type="text" name="m_add1" id="m_add1" size="45" readonly></td>
</tr>
<tr>  
  <th>*나머지주소</th>
  <td style="text-align: left"><input type="text" name="m_add2" id="m_add2" size="45"></td>
</tr>
<tr>  
  <th>*성별</th>
  <td style="text-align: left">
        <select name="m_gender"  id="m_gender">
          <option value="0" selected>선택하세요.</option>
          <option value="M">남자</option>
          <option value="F">여자</option>
        </select>
  </td>
</tr>
<tr>
    <td colspan="2" style="text-align: center">
        <input type="submit" value="회원가입" class="btn btn-success" onsubmit="location.href='/member/insert'" onclick="meminesrt()"/>
        <input type="reset"  value="취소"     class="btn btn-primary" onclick="javascript:history.back()"/>
    </td>
</tr>
</table>
</div>
`
<script>
	$(".pwcheck").keyup(function(){
    	let pass1 = $("#m_pw").val();
    	let pass2 = $("#m_pw2").val();
    if(pass1 != "" || pass != ""){
    	if(pass1 == pass2){
    		$("#chm_pw").html("비밀번호가 일치합니다!");
    		$("#chm_pw").css("color", "green");
    	}else{
    		$("#chm_pw").html("비밀번호가 불일치합니다!");
    		$("#chm_pw").css("color", "red");
    	}//if end
    }//if end
});

</script>
   <script>
    function meminesrt(){
    	if($("input:checkbox[name='mailcheck']").is(":checked") == true){
			$("#m_mailcheck").val('Y');
			
		} else if($("input:checkbox[name='mailcheck']").is(":checked") == false){
			$("#m_mailcheck").val('N');
			
		}//if end
		
		if($("input:checkbox[name='smscheck']").is(":checked") == true){
			$("#m_smscheck").val('Y');
		} else if($("input:checkbox[name='smscheck']").is(":checked") == false){
			$("#m_smscheck").val('N');
		}//if end
			
    	if(confirm("회원가입을 하시겠어요?")){
    	document.memberform.action="/member/insert";
    	document.memberform.submit();    	
    	}//if end
    	
    }//memupdate
    

	$("#btn_userid").click(function() {
		$.post(
				"idcheckproc.do"
				,"m_id=" + $("#m_id").val()
				,idresponseProc		
		);
	}); //click() end
	
	
	$("#btn_email").click(function() {
		$.post(
				"emailcheckproc.do"
				,"m_email=" + $("#m_email").val()
				,emailresponseProc		
		);
	}); //click() end
	
	$("#btn_usernick").click(function(){
		$.post(
				"nicknamecheckproc.do"
				,"m_nick=" + $("#m_nick").val()
				,nickresponseProc
		);
	});	//click() end
	
	</script>
	
	<script>
	function idresponseProc(result) {
		$("#idpanel").empty();
		$("#idpanel").html(result);
		$("#idpanel").show();
	}//responseProc() end
	
	
	function emailresponseProc(result) {
		$("#emailpanel").empty();
		$("#emailpanel").html(result);
		$("#emailpanel").show();
	}//responseProc() end
	
	
	function nickresponseProc(result) {
		$("#nickpanel").empty();
		$("#nickpanel").html(result);
		$("#nickpanel").show();
	}//responseProc() end
	
</script>

<!-- ----- DAUM 우편번호 API 시작----- -->
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


</form>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>