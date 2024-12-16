<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_board_list.jsp -->

<%@ include file="../admin/admin_top.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <link rel="stylesheet" type="text/css" href="css/style.css"> 
   <tr height="75%">   
         <td width="80%">
         
<br><br><br>
<div align="center">
	<hr color="green" width="300">
		<h2> 문 의 목 록 </h2>
	<hr color="green" width="300">
<br><br>
   <table border="0" width="60%" class="outline">
      <tr bgcolor="green">
         <th width="10%" class="m1">번호</th>
         <th width="50%" class="m1">제 목</th>
         <th width="20%" class="m1">작성자</th>
         <th width="20%" class="m1">작성일</th>
      </tr> 
   <c:if test="${empty listBoardAll}">
      <tr>
         <td colspan="4">등록된 게시물이 없습니다.</td>
      </tr>
   </c:if>
   <c:set var="num" value="${number}"/> 
   <c:forEach var="listBoard" items="${listBoardAll}">
      <tr>
         <td>
            ${listBoard.bnum}
         </td>
         <td>   
             <a href="admin_board_content.do?bnum=${listBoard.bnum}">
               ${listBoard.btitle}
             </a>    
         </td>
         <td>${listBoard.id}</td>
         <td>${listBoard.bregdate}</td>
      </tr>
   </c:forEach>
   </table>
   <br>
   
   <form name="f" action="admin_board_list.do" method="post">
      <select name="search">
         <option value="id">작성자</option>
         <option value="btitle">글제목</option>
         <option value="bcontent">글내용</option>
      </select>
      <input type="text" name="searchString" class="box">
      <input type="submit" value="검색">
   </form>   
   
   <c:if test="${startPage > pageBlock}">
        <a href="list_board.do?pageNum=${startPage - pageBlock}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i}]</b>
            </c:when>
            <c:otherwise>
                <a href="list_board.do?pageNum=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <a href="list_board.do?pageNum=${startPage + pageBlock}">[다음]</a>
    </c:if>
   
</div>






