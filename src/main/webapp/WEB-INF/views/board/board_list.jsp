<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- board/board_list.jsp -->
   
<%-- <%@ include file = "../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<style>
hr {
   background-color: black;
   width: 100%;
   height: 3px;
}
</style>

<script>

  window.onload = function () {
    function getCurrentDate() {
      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth() + 1; 
      var day = today.getDate();

      month = (month < 10) ? "0" + month : month;
      day = (day < 10) ? "0" + day : day;

      return year + "-" + month + "-" + day;
    }

    document.getElementById("bregdate").value = getCurrentDate();
  };
</script>

    <div class="mmmiddle_area" style="width:79.5%">
       <div>
         <h4 class="log_info"> 내 문의 </h4>                   
         <hr>
      </div>
				<a href="write.do">
				<img src="img/write.jpg" id="header-logo-img" 
					style="width: 50px; height: 30px; margin-left:904px;"/>
				</a>
			
   <div id="header-second-contents" style="margin-top:8px">
      <div align="center">
         <table class="pageForAll-table2">
            <tr class="pageForAll-table2-title" align="center">
               <th class="pageForAll-table2-title-no">번호</th>
               <th class="pageForAll-table2-title-detail pdl20">문의 내용</th>
               <th class="pageForAll-table2-title-writer">작성자</th>
               <th class="pageForAll-table2-title-date">날짜</th>
            </tr>
            <c:if test="${empty listBoard}">
               <tr>
                  <td colspan="4" style="padding-top: 10px; font-size: 15px;">등록된
                     문의사항이 없습니다.</td>
               </tr>
            </c:if>
            <c:forEach var="dto" items="${listBoard}">
               <tr class="pageForAll-table2-title1 f18-333">
                  <td class="pageForAll-table2-title-no">${dto.bnum}</td>
                  <td class="pageForAll-table2-title-detail pdl20"><a
                     href="content.do?bnum=${dto.bnum}&id=${dto.id}">${dto.btitle}</a></td>
                  <td class="pageForAll-table2-title-writer">${dto.id}</td>
                  <td class="pageForAll-table2-title-date">${dto.bregdate}</td>  
                  <%-- <td class="pageForAll-table-title-date">${dto.breg_date}</td> --%>
                  <%-- <fmt:formatDate value="${dto.breg_date}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
               </tr>
            </c:forEach>
         </table>
         <br>
         <div>
            <c:if test="${count > 0}">
               <c:if test="${startPage > pageBlock}">
                  <a href="list.do?id=${loginMember.id}&pageNum=${startPage-3}">[이전]</a>
               </c:if>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <a href="list.do?id=${loginMember.id}&pageNum=${i}">[${i}]</a>
               </c:forEach>
               <c:if test="${endPage < pageCount}">
                  <a href="list.do?id=${loginMember.id}&pageNum=${startPage+3}">[다음]</a>
               </c:if>
            </c:if>
         </div>
         </div></div>
      </div>
   </div>

   <%@ include file="../bottom2.jsp"%>
   
   