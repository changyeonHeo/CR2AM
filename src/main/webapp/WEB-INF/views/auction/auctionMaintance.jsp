<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- auctionMaintance.jsp -->
   
<head>
<style type="text/css">
div.wapper {
   margin-top: 40px;
   align-content: center;
   align-items: center;
}
div{
   align-content: center;
}
form {
    display: block;
    margin-top: -5em;
    margin-block-end: 1em;
}
</style>
</head>
<%@ include file="../admin/admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br>
<h2 style="text-align: center; font-weight: bold;"> [ 거 래 관 리 ] </h2>
<div class="wapper" width="80%">
   <div class="searchAuction" align="right">
      <form name="f" action="auctionMaintance.do" method="post">
         <select name="type">
            <option value="0">입찰 중</option>
            <option value="1">입찰 완료</option>
            <option value="2">검수중</option>
            <option value="3">판매 취소</option>
            <option value="4">배송 중</option>
            <option value="5">전부표시</option>
         </select> <input type="submit" value="확인">
      </form>
   </div><br><br><br>
   <div class="mainContent" align="center">
      <table border="0" class="outline2">
         <caption></caption>
         <tr>
            <th bgcolor="#ebebeb">상품 판매번호</th>
            <th bgcolor="#ebebeb">구매 / 판매 여부</th>
            <th bgcolor="#ebebeb">등록한 사람 아이디</th>
            <th bgcolor="#ebebeb">거래한 상대의 아이디</th>
            <th bgcolor="#ebebeb">상품 등록번호</th>
            <th bgcolor="#ebebeb">가격</th>
            <th bgcolor="#ebebeb">상품 사이즈</th>
            <th bgcolor="#ebebeb">상품 상황</th>
            <th bgcolor="#ebebeb">등록된 날짜</th>
            <th bgcolor="#ebebeb">검수여부/거래 날짜</th>
            <th bgcolor="#ebebeb">수정 삭제</th>
         </tr>
         <c:forEach var="dto" items="${listAuction }">
            <tr>
               <td align="center">${dto.anum}</td>
               <c:choose>
                  <c:when test="${dto.atype eq 'b'}">
                     <td>구매</td>
                  </c:when>
                  <c:when test="${dto.atype eq 'ba'}">
                     <td>구매 입찰</td>
                  </c:when>
                  <c:when test="${dto.atype eq 's'}">
                     <td>판매</td>
                  </c:when>
                  <c:otherwise>
                     <td>판매 입찰</td>
                  </c:otherwise>
               </c:choose>
               <td align="center">${dto.id}</td>
               <td align="center">${dto.aid}</td>
               <td align="center">${dto.pnum}</td>
               <td align="center">${dto.price}</td>
               <td align="center">${dto.product_size}</td>
               <c:choose>
                  <c:when test="${dto.atype eq 'b'}">
                     <td>구매완료</td>
                  </c:when>
                  <c:when test="${dto.atype eq 'ba'}">
                     <c:choose>
                        <c:when test="${dto.status eq 1 }">
                           <td>구매완료</td>
                        </c:when>
                        <c:otherwise>
                           <td>입찰중</td>
                        </c:otherwise>
                     </c:choose>
                  </c:when>
                  <c:when test="${dto.atype eq 's'}">
                     <c:choose>
                        <c:when test="${dto.status eq 1 }">
                           <td>판매완료</td>
                        </c:when>
                        <c:when test="${dto.status eq 2 }">
                           <td>검수중</td>
                        </c:when>
                     </c:choose>
                  </c:when>
                  <c:when test="${dto.atype eq 'sa'}">
                     <c:choose>
                        <c:when test="${dto.status eq 1 }">
                           <td>판매완료</td>
                        </c:when>
                        <c:when test="${dto.status eq 2 }">
                           <td>검수중</td>
                        </c:when>
                        <c:when test="${dto.status eq 3 }">
                           <td>판매취소</td>
                        </c:when>
                        <c:otherwise>
                           <td>판매중</td>
                        </c:otherwise>
                     </c:choose>
                  </c:when>
               </c:choose>
               <td align="center">${dto.insertdate}</td>
               <c:choose>
                  <c:when test="${dto.atype eq 'ba' }">
                     <c:choose>
                        <c:when test="${dto.status eq 1}">
                           <td align="center">${dto.saledate}</td>
                        </c:when>
                        <c:otherwise>
                           <td align="center">-</td>
                        </c:otherwise>
                     </c:choose>
                  </c:when>
                  <c:when test="${dto.atype eq 'sa' || dto.atype eq 's'}">
                     <c:choose>
                        <c:when test="${dto.status eq 2 }">
                           <td align="center">
                              <input type="button" 
                              onclick="location.href='inspection.do?anum=${dto.anum}'"
                              value="검수하기">
                           </td>
                        </c:when>
                        <c:when test="${dto.status eq 1 }">
                           <td align="center">${dto.saledate }</td>
                        </c:when>
                        <c:otherwise>
                           <td>${dto.saledate}</td>
                        </c:otherwise>
                     </c:choose>
                  </c:when>
               </c:choose>
               <td align="center">
                  <input type="button" onclick="location.href='updateAuctionFromAdmin.do?anum=${dto.anum}'" value="수정">
                  <input type="button" onclick="location.href='deleteAuctionFromAdmin.do?anum=${dto.anum}'"value="삭제">
               </td>
            </tr>
         </c:forEach>
      </table>
   </div>
</div>
</body>
</html>