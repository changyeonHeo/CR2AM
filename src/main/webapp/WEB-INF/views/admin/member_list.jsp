<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
<%@ include file="admin_top.jsp"%>

      <tr height="75%">   

         <td width="80%">         
   <div align="center">
   <br><Br><br>
   <hr color="navy" width="300">
      <h2>회 원 목 록</h2>
   <hr color="navy" width="300">
   
   <br>
   <form name="f" action="find_Member.do" method="post">
      <select name="search">
         <option value="id">아이디</option>
      </select>
      <input type="text" name="searchString" class="box">
      <input type="submit" value="검색">
   </form>
   
   <table border="0" width="60%" class="outline2">
   <br>
      <tr>
         <th bgcolor="#ebebeb">번호</th>
         <th bgcolor="#ebebeb">이름</th>
         <th bgcolor="#ebebeb">아이디</th>
         <th bgcolor="#ebebeb">전화번호</th>
         <th bgcolor="#ebebeb">삭제</th>
      </tr>
   <c:if test="${empty listMember}">
      <tr>
         <td colspan="5">등록된(찾으시는) 회원이 없습니다.</td>
      </tr>
   </c:if>   
   <c:set var="co" value="1"/>
   <c:forEach var="dto" items="${listMember}">
   <c:if test="${ dto.id !='admin'}">
      <tr>
         <td align="center">
            ${co}
            <c:set var="co" value="${co+1}"/>   
         </td>
         <td align="center">${dto.name}</td>
         <td align="center">${dto.id}</td>
         <td align="center">${dto.allHp}</td>
         <td align="center"><a href="ad_member_delete.do?mem=${dto.mem}">삭제</a>
         </td>
      </tr>
   </c:if>
   </c:forEach>         
   </table>
   <br><br>
   <c:if test="${count > 0}">
      <c:if test="${startPage > pageBlock}">
         <a href="member_list.do?pageNum=${startPage-3}">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${startPage}" end="${endPage}">
         <a href="member_list.do?pageNum=${i}">[${i}]</a>
      </c:forEach>
      <c:if test="${endPage < pageCount}">
         <a href="member_list.do?pageNum=${startPage+3}">[다음]</a>
      </c:if>
   </c:if>
</div>
</td>
         </tr>
</body>
</html>