<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- address_list.jsp -->

<%-- <%@ include file = "../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">
<link rel="stylesheet" type="text/css" href="css/style_address.css">

<script>
   function reloading() {
      location.reload();
   }
</script>

<script type="text/javascript">

   function addAddress() {
      var mem = $("#mem").val();
      window.open("address_insert.do?mem="+mem, "search",
            "width=650, height=850")
   }

   function updateAddress(mem) {
      window.open("address_update.do?mem=" + mem, "search",
            "width=650, height=850")
   }
   
   $(document).ready(function(){
       if (${listAddress.size() >= 3}) {
           $('.btn_box').hide(); // 등록된 주소가3 이상이면 추가버튼 사라지게
       }
   });
   
</script>

<style>
hr {
   background-color: black;
   width: 100%;
   height: 3px;
}
a {
   text-decoration: none !important;
}
.btn {
   box-shadow: none !important;
}
</style>

<div id="openTag" class="mmmiddle_area">
   <div id="cnt" class="member">
      <div class="maincontent">
         <h4 class="log_info">내 배송지</h4>
         <hr>
         <div class="content_title" data-v-61e7a8a3="" data-v-2e8df47b="">        
			<div class="btn_box" data-v-61e7a8a3="" style="padding-left:882px;">
                <a data-v-14ec1f2e data-v-61e7a8a3 href="javascript:addAddress()" class="btn btn_add"> 
                 	<span data-v-61e7a8a3 class="btn_txt"> + 새 배송지 추가 </span>
                </a>
            </div>
		 </div>                
         <input type="hidden" value="${loginMember.mem}" id="mem">
         <div id="addr_return" style="min-height: 750px; padding-top:8px;">
            <div
               class="tabcnt_addr_return tabcnt_addr_return0 tabcnt_mp tabcnt_mp0">
               <ul class="list">
                  <c:if test="${empty listAddress}">
                     <li>
                        <h4 style="font-size: 15px">등록된 주소가 없습니다.</h4>
                     </li>
                  </c:if>
                  <c:forEach var="dto" items="${listAddress}">
                     <li><c:if test="${dto.seq == 1}">
                           <strong> [기본 배송지] </strong>
                        </c:if>
                        <div class="peo">${dto.name}</div>
                        <div class="tal">
                           <div class="box">
                              <p class="tel" style="margin: 5px 0;">
                                 <span class="mobile">${dto.allHp}</span>
                              </p>
                           </div>
                           <div class="address">
                              <p class="road">
                                 <span>[${dto.zipcode}]&nbsp;${dto.address1}&nbsp;${dto.address2}</span>
                              </p>
                           </div>
                        </div> <c:if test="${dto.seq != 1}">
                           <td data-v-7d49a47c class="btn_bind"><a data-v-14ec1f2e
                              data-v-7d49a47c class="btn outlinegrey small"
                              onclick="window.location='address_update_seq.do?mem=${dto.mem}&seq=${dto.seq}&anum=${dto.anum}'">
                                 기본 배송지로 설정 </a></td>
                           <%--    <td data-v-7d49a47c class="btn_bind"><a data-v-14ec1f2e
                           data-v-7d49a47c class="btn outlinegrey small"
                           href="javascript:updateAddress(${dto.mem})"> 수정 </a></td> --%>
                           <td data-v-7d49a47c class="btn_bind"><a data-v-14ec1f2e
                              data-v-7d49a47c class="btn outlinegrey small"
                              onclick="window.location='address_delete.do?mem=${dto.mem}&seq=${dto.seq}'">
                                 삭제 </a></td>
                        </c:if>
                  </c:forEach>
               </ul>
               
                <%-- <c:if test="${listAddress.size() < 3}">            
               <div class="btn_box" data-v-61e7a8a3="">
                  <a data-v-14ec1f2e data-v-61e7a8a3 href="javascript:addAddress()" class="btn btn_add"> 
                  <span data-v-61e7a8a3 class="btn_txt"> + 새 배송지 추가 </span>
                  </a>
                 </div>
               </c:if> --%>
            </div>
         </div> 
      </div>
   </div>
</div>
</div>
</div>
<%@ include file="../bottom2.jsp"%>