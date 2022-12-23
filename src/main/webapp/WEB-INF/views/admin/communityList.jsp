<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="admin_header.jsp"%>
<!-- 본문작성 시작 -->
<br>

    <!-- MD Pick card 시작 -->
    <div class="container-fluid">
        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">MD Pick 커뮤니티</h1>
        <p class="mb-4">한양서재 MD가 추천하는 커뮤니티 리스트예요.</p>

        <div class="row">
        <c:forEach var="list" items="${mdPick}">
            <div class="col-sm-4 col-lg-4">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-danger">${list.c_name}</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body" style="text-align: center">
                        <div class="bookcover-area col-sm-4 col-lg-4" style="height: 150px;">
                            <img src="/storage/${list.c_banner}" style="margin: auto; height: 100%">
                        </div>
                        <p style="margin: 13px 0 0 0">${list.c_des}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
    <!-- MD Pick card 끝 -->

    <br><br><br>

    <!-- 커뮤니티 list 시작 -->
    <div class="container-fluid">

        <h1 class="h3 mb-2 text-gray-800" style="font-weight: bold">한양서재 커뮤니티 목록</h1>
        <p class="mb-4"> 현재 '모집중'인 커뮤니티에 대해 MD Pick을 설정할 수 있어요! MD가 선정한 커뮤니티는 메인에 걸리게 된답니다.</p>


        <div class="card shadow mb-4">

            <form name="frm" method="post">

                <div class="card-header py-3 row" style="margin: 0 10px 0 10px">

                    <span class="col-md-6"">
                        <input type="button" name="filter1" onclick="listCommunity('all')" value="전체보기" class="btn-light border-0 text-primary" style="font-weight: bold">
                        <input type="button" name="filter2" onclick="listCommunity('i')"   value="모집중"  class="btn-light border-0 text-primary" style="font-weight: bold">
                        <input type="button" name="filter3" onclick="listCommunity('d')"   value="모집완료" class="btn-light border-0 text-primary" style="font-weight: bold">
                        <input type="button" name="filter4" onclick="listCommunity('e')"   value="활동완료" class="btn-light border-0 text-primary" style="font-weight: bold">
                    </span>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr class="thForList">
                                <th>No.</th>
                                <th>커뮤니티 이름</th>
                                <th>선정도서</th>
                                <th>주모임지역</th>
                                <th>모임장ID</th>
                                <th>인원수</th>
                                <th>MD</th>
                            </tr>
                            </thead>

                            <tbody class="communityList"></tbody><!-- 리스트 출력 부분 -->

                        </table>
                        <div align="right">
                            <button onclick="updatePick()" class="btn btn-light btn-outline-info" style="color: darkgreen; font-weight: bold;">
                            <i class="fas fa-check"></i> MD Pick 설정하기</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>

    </div><!-- 커뮤니티 list 끝 -->

<!-- 목록 필터링 조회/MD pick 업데이트를 위한 js -->
<script>

/*
    $("input:button[name='filter']").on('click', function (){
        let c_state = $(this).val();     //클릭한 버튼의 value값 변수
        let idx=$(this).index();
        //alert(idx);
        if (idx==0){
            c_state="all";
        }else if(idx==1){
            c_state = 'i';
        }else if(idx==2){
            c_state = 'd';
        }else if(idx==3){
            c_state = 'e';
        }//if end

        return listCommunity(c_state);
    });//click() end
*/

    function listCommunity(c_state){
        //alert("함수에 변수 가져옴 : "+c_state);
        $.ajax({
            url    :"/admin/ajaxlist"
            ,type   :"post"
            ,data   : {'c_state':c_state}
            ,success:function (data){
                //alert(data);

                //each반복문으로 출력 시작
                let a = "";
                let i =1;
                $.each(data, function (key, value){
                    //alert(key);
                    //alert(value);
                    a += "<tr>";
                    a += "  <td style='text-align: center;'>"+ i++ + "</td>";
                    a += "  <td class='text-primary'>"+value.c_name+"</td>";
                    a += "  <td>"+value.b_name+"</td>";
                    a += "  <td>"+value.c_local+"</td>";
                    a += "  <td style='text-align: center;'>"+value.c_id+"</td>";
                    a += "  <td style='text-align: center;'>"+value.cnt+"명</td>";
                    if(value.c_state=='i'){
                        if(value.c_pick == 'Y'){
                            a += "<td style='text-align: center;'><input type='checkbox' name='mdList' value='"+ value.c_code +"' checked></td>";
                        }else{
                            a += "<td style='text-align: center;'><input type='checkbox' name='mdList' value='"+ value.c_code +"'></td>";
                        }//if end

                    }else{
                        a += "<td style='text-align: center;'><input type='checkbox' name='mdList' value='"+ value.c_code +"' onclick='return false' disabled></td>";
                    }//if end
                    a += "</tr>";

                });//each() end

                $(".communityList").html(a);

            }//success end
            ,error  :function (){
                alert("실패")
            }//error end
        });//ajax() end
    }//listCommunity() end

    //페이지 로딩시 커뮤니티 목록 출력
    $(document).ready(function (){
        listCommunity();
    });//ready() end


    //MD Pick 업데이트 하기
    function updatePick(){
        let size = $("input:checkbox[name='mdList']:checked").length;
        //alert(size);

        if(size>3) {
            alert("MD Pick은 최대 3개까지 설정 가능합니다.");
        }else{
            document.frm.action = "/admin/pickUpdate";
            document.frm.submit();
        }//if end
    }//updatePick() end

</script>


<!-- 본문작성 끝 -->
<%@ include file="admin_footer.jsp"%>