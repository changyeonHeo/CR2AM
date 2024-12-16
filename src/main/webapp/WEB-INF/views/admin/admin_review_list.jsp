<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- review/admin_review_list.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin/admin_top.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style.css">
   <tr height="75%">   
         <td width="80%">
         
<br><br><br>
<div align="center">
   <hr color="green" width="300">
      <h2> 리 뷰 목 록 </h2>
   <hr color="green" width="300">
<br><br>
   <table border="0" width="60%" class="outline">   
      <tr bgcolor="green">
         <th width="10%" class="m1">번호</th>
         <th width="30%" class="m1">이미지</th>
         <th width="10%" class="m1">상품</th>
         <th width="30%" class="m1">제목</th>
         <th width="10%" class="m1">작성자</th>
         <th width="10%" class="m1">작성일</th>
         <th width="10%" class="m1">삭제</th>
      </tr>   
   <c:if test="${empty getReviewAll}">
      <tr>
         <td colspan="7">등록된 리뷰가 없습니다.</td>
      </tr>
   </c:if>

   <c:forEach var="review" items="${getReviewAll}">
      <tr style="text-align: center;">
         <td>
            ${review.rnum}         
         </td>
         <td width="10%"><img src="/files/${review.rimage}" width="40" height="40"></td>
         <td>${review.rproduct}</td>
         <td>
            <a href="admin_content_review.do?rnum=${review.rnum}&id=${review.id}">${review.rtitle}</a>   
         </td>
         <td>${review.id}</td>
         <td>${review.reg_date}</td>
         <td>
         <input type="button" value="삭제" onclick="window.location='admin_delete_Review.do?rnum=${review.rnum}'"></td>
      </tr>
   </c:forEach>
   </table>
   <br>
   <div align="center">
   <form name="f" action="reviewAll.do" method="post">
      <select name="search">
         <option value="id">작성자</option>
         <option value="rtitle">글제목</option>
      </select>
      <input type="text" name="searchString" class="box">
      <input type="submit" value="검색">   
   </form>
   <c:if test="${startPage > pageBlock}">
        <a href="reviewAll.do?pageNum=${startPage - pageBlock}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i}]</b>
            </c:when>
            <c:otherwise>
                <a href="reviewAll.do?pageNum=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <a href="reviewAll.do?pageNum=${startPage + pageBlock}">[다음]</a>
    </c:if>
    </div>
</div>