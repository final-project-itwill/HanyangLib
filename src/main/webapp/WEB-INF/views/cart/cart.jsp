<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문작성 시작 -->
<div class="hero-slant overlay" data-stellar-background-ratio="0.5" style="background-image: url('../images/libbg.jpg'); height: 40vh;"></div>
<div class="container">
   
   <h3>장바구니 목록</h3>
      <p>
        <button type="button" class="btn btn-info" onclick="javascript:history.back()">eBook구경하러가기</button>
      </p>
     <div class="container">
      <form method="post" action="search" class="form-group">
          상품명 : <input type="text" name="product_name" value="">
                  <input type="submit" class="" value="검색">
      </form>
   </div>
   
      <hr>
      <h4>상품갯수 : <span class="label label-default"></span></h4> 
      <br>
      <table border="1" class="table table-hover">
        <tr>
          <c:forEach var="row" items="" varStatus="vs"> 
             <td>
                <c:choose>
                   <c:when test="">
                      <img src="/storage/" width="100px">
                   </c:when>
                   <c:otherwise>
                      등록된 사진 없읍!!<br>
                   </c:otherwise>
                </c:choose>
                <br>
                상품 정보 : <a href=""></a>
                <br>
                상품가격 : <fmt:formatNumber value=""/>
             </td>
             <c:if test="">
                <tr></tr>
             </c:if>
          </c:forEach>
        </tr>
           <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="">
                <input type="button" class="btn btn-success" value="결제하러가기" onclick="location.href='/payment/paymentview'">
                <input type="button" class="btn btn-danger" value="eBook구경하러가기">
              <!--  <button type="button" class="btn btn-danger" onclick="javascript:history.back()">뒤로가기</button>  -->
            </td>
        </tr>
      </table>
   </div>





<!-- 본문작성 끝 -->
<%@ include file="../footer.jsp"%>