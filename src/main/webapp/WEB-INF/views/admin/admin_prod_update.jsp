<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
<!-- admin_prod_update.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="admin_product.jsp" %>

<script>

/*    function selectSize() {
       window.open("selectSize.do", "gola", "width=490, height=250");
       window.close();
   }
   
   function setSelectedSize(selectedSize) {
       document.getElementById("size").value = selectedSize;
   } */

   $(document).on("change", "#cname", function() {
      var text = $("#cname :selected").text();
      var ccode = text.split("[");
      var cnum = ccode[1].split("]");

      var options = $('#csname').find('option').map(function() {
         return $(this).text();
      }).get()

      for (var i = 1; i < options.length; i++) {
         var cscode = options[i].split("[");
         var csnum = cscode[1].split("]");
         if (cnum[0] == csnum[0]) {
            $("select option[value*=" + cscode[0] + "]").show();
         } else {
            $("select option[value*=" + cscode[0] + "]").hide();
         }
      }
   });
   (document).on("click", "#csname", function(){
         var text = $("#cname :selected").text();
      
         if(text.includes("선택하세요")){
            alert("상위 분류를 먼저 선택해 주세요")
         }
      });
      
      ////////////////////////////////////////////////////////////////////////////////////////
        $(document).on("change", "#csname", function() {
         var address = document.f.action;
         var text = $("#csname :selected").text();
         var ccode = text.split("[");
         var cco = ccode[1].split("]");
         if(address.includes("?")){
            address = address.split("=")[0] + "=" + cco[0];
         } else {
            address = address + "?code=" + cco[0];
         }
         document.f.action = address;
      });
      /////////////////////////////////////////////////////////////////////////////////////
 
</script>
   
   <br><br>
   <form name="f" action="admin_prod_update.do" 
                     method="post" enctype="multipart/form-data">
      <table border="0" class="outline" width="60%" class="outline">
      <div align="center">
         <caption>상품수정</caption>         
         <tr>
            <th bgcolor="#ebebeb"> 상품코드 </th>
            <td>
               <input type="text" name="pcode" value="${getProduct.pcode}" readOnly>
            </td>
         </tr>      
          <tr>
               <th bgcolor="#ebebeb"> 브랜드 </th>
               <td>
                  <select name="pbrand">
                       <c:forEach var="listBrand" items="${listBrand}">
                           <c:if test="${getProduct.pbrand == listBrand.pbrand}"> 
                              <option value="${listBrand.pbrand}" selected>${listBrand.pbrand}</option>
                           </c:if>
                           <c:if test="${getProduct.pbrand != listBrand.pbrand}">
                              <option value="${listBrand.pbrand}">${listBrand.pbrand}</option>
                           </c:if>   
                        </c:forEach>
                  </select>
                  </td>
            </tr>               
         <tr>
            <th bgcolor="#ebebeb"> 카테고리 </th>
            <td>
                   <select name="cname" id="cname" onChange="getselect()">
                       <c:forEach var="listCate" items="${listCate}">
                           <c:if test="${getProduct.cname == listCate.cname}"> 
                              <option value="${listCate.cname}" id="cname" selected>
                                   ${listCate.cname}[${listCate.ccode}]
                                 </option>
                           </c:if>
                           <c:if test="${getProduct.cname != listCate.cname}">
                              <option value="${listCate.cname}" id="cname">
                                   ${listCate.cname}[${listCate.ccode}]
                                 </option>
                           </c:if> 
                       </c:forEach>
                     </select> 
                    <select name="csname" id="csname">
                           <c:forEach var="listCate" items="${listCate}">
                              <option value="${listCate.csname}" id="csname">
                                 ${listCate.csname}[${listCate.ccode}]
                              </option>
                           </c:forEach>
                    </select>
                 </td>
         </tr>
         <tr>
            <th bgcolor="#ebebeb"> 상품명 </th>
            <td><input type="text" name="pname" class="box" value="${getProduct.pname}"></td>
         </tr>
         <tr>
            <th bgcolor="#ebebeb"> 성별 </th>
            <td>
               <select name="pgender">
               <c:forTokens var="pgender" items="M,W,-" delims=",">
                  <c:if test="${pgender == getProduct.pgender}"> 
                        <option value="${pgender}" selected>${fn:toUpperCase(pgender)}</option>
                  </c:if>
                  <c:if test="${pgender != getProduct.pgender}">
                        <option value="${pgender}">${fn:toUpperCase(pgender)}</option>
                  </c:if>
               </c:forTokens>
               </select>
            </td>
         </tr>
<!--             <tr>
               <th bgcolor="#ebebeb"> 사이즈 </th>
               <td><input type="text" name="size" id="size" class="box">
               <a href="javascript:selectSize(size)"> [사이즈 입력] </a>
               </td>
            </tr> -->
         <tr>
            <th bgcolor="#ebebeb"> 상품이미지 </th>
            <td>
               <img src="/files/${getProduct.pimage}" width="80" height="80">
               <input type="file" name="pimage" class="box">
               <input type="hidden" name="pimage2" value="${getProduct.pimage}"/>
            </td>
         </tr>
<%--          <tr>
            <th bgcolor="#ebebeb"> 상품수량 </th>
            <td><input type="text" name="pqty" class="box" value="${getProduct.pqty}"></td>
         </tr> --%>
         <tr>
            <th bgcolor="#ebebeb"> 상품가격 </th>
            <td><input type="text" name="pprice" class="box" value="${getProduct.pprice}"></td>
         </tr>
         <tr>
            <th bgcolor="#ebebeb"> 상품소개 </th>
            <td>
               <textarea name="pcontents" rows="5" cols="70">${getProduct.pcontents}</textarea>
            </td>
         </tr>
         <tr>
            <th bgcolor="#ebebeb"> 상품포인트 </th>
            <td><input type="text" name="ppoint" class="box" value="${getProduct.ppoint}"></td>
         </tr>
         <tr>
            <td colspan="2">
            <div align="right">
            <input type="submit" value="상품수정">&nbsp;&nbsp;<input type="reset" value="취소">
            </div>
            </td>
         </tr>
      </div>
      </table>   
         </form>
</body>
</html>
