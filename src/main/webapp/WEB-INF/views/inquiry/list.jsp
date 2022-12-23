<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<!-- 헤더용 div -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-color: #0E2A47; height: 13vh;"></div>

<div class="container" style="padding-top: 100px;">
    <h3 style="font-weight: bold; text-align: center">1:1 문의</h3>
    <h6 style="text-align: center; margin-bottom: 20px">제목을 클릭하면 내가 쓴 문의사항을 확인할 수 있어요</h6>



    <!-- 게시판 테이블 시작 -->
    <table class="table" style="text-align: center">
        <thead class="border-dark">
            <tr>
                <th>문의유형</th>
                <th>내용</th>
                <th>작성일</th>
                <th>처리상태</th>
            </tr>
        </thead>
        <tbody>
            <!-- 문의 영역 -->
            <c:forEach var="list" items="${list}" varStatus="vs">
            <tr>
                <td style="color: #1da1f2">
                        ${list.ask_type}
                </td>
                <td class="text-left">
                    <button name="detailBtn" class="btn datailBtn" value="${vs.count}" onclick="viewHidden(this)">${list.ask_title}</button>
                </td>
                <td>${list.ask_rdate}</td>
                <c:choose>
                    <c:when test="${list.ans_no == ''}">
                        <td>답변대기</td>
                    </c:when>
                    <c:otherwise>
                        <td style="color: #1da1f2">답변완료</td>
                    </c:otherwise>
                </c:choose>
            </tr>

            <!-- 문의 내용 -->
            <tr id="${vs.count}" class="contentDetail" style="background-color: #F6F6F6; display: none">
                <td><br></td>
                <td colspan="2" class="text-left">${list.ask_content}</td>
                <td></td>
            </tr>

            <!-- 답변 영역 -->
            <c:if test="${list.ans_no != ''}">
            <tr id="${vs.count}" class="contentDetail" style="background-color: #F6F6F6; display: none">
                <td>한양서재<br>CS 담당자</td>
                <td colspan="2" class="text-left">${list.ans_content}</td>
                <td style="color: #1da1f2">답변완료</td>
            </tr>
            </c:if>
            </c:forEach>
        </tbody>
    </table><!-- 게시판 테이블 끝 -->

    <div class="text-right">
        <input type="button" class="btn btn-dark" value="문의하기" onclick="location.href='/inquiry/insertForm'">
    </div>
</div>


<script>

    //문의내용 클릭시 display 처리
    function viewHidden(this1){
        let divID = "#"+this1.value;
        //alert(divID)

        if ($(divID).css("display") == "none") {
            $(divID).css("display", "table-row");
            $(".contentDetail").not(divID).css("display", "none");
        } else {
            $(divID).css("display", "none");
        }
    }//viewHidden() end

</script>

<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>