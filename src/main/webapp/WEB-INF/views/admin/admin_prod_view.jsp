<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
<!-- admin_prod_view.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="admin_product.jsp" %>

<script type="text/javascript">
   
    function checkDelAndSubmit(pcode, pimage){
        var isDel = window.confirm("정말로 삭제하시겠습니까?")
        if (isDel){
            var form = document.createElement('form');
            form.name = 'del';
            form.method = 'post';
            form.action = 'admin_prod_delete.do';

            var inputPcode = document.createElement('input');
            inputPcode.type = 'hidden';
            inputPcode.name = 'pcode';
            inputPcode.value = pcode;

            var inputPimage = document.createElement('input');
            inputPimage.type = 'hidden';
            inputPimage.name = 'pimage';
            inputPimage.value = pimage;

            form.appendChild(inputPcode);
            form.appendChild(inputPimage);

            document.body.appendChild(form);
            form.submit();
        }
    }
   
   
</script>

  <br><br>
   <div align="right">
<%--       <a href="productSizeShow.do?pname=${getProduct.pname}">사이즈 보기 </a>| --%>
      <a href="sizeUpdate.do?pname=${getProduct.pname}&pcode=${getProduct.pcode}">사이즈 수정 ㆍ 보기</a>
   </div>
         
  <br><br>
   <!-- <form name="f" action="admin_prod_list.do" method="post"> -->  
<!--    <form action="admin_prod_delete.do" method="post"> 
 -->      <table border="0" class="outline2" width="60%">
      <caption><h2> 상품정보 </h2></caption>
         <tr>
            <th width="20%" bgcolor="#ebebeb">상품코드</th>
            <td width="35%" align="center">${getProduct.pcode}</td>            
            <th width="15%" bgcolor="#ebebeb">상품명</th>
            <td width="30%" align="center">${getProduct.pname}</td>

         <tr>            
            <th rowspan="6" width="20%" bgcolor="#ebebeb">상품이미지</th>
            <td rowspan="6" width="35%" align="center">
            <br><img src="/files/${getProduct.pimage}" width="200" height="200">
            <br><br>
            </td>
            <th width="15%" bgcolor="#ebebeb">브랜드</th>
            <td width="30%%" align="center">${getProduct.pbrand}
         </tr>         
         <tr> 
            <th width="15%" bgcolor="#ebebeb">카테고리</th>
             <td width="30%%" align="center">
               ${getProduct.cname} / ${getProduct.csname}
            </td>
         </tr>
         <tr>
            <th width="15%" bgcolor="#ebebeb">성별</th>
            <td width="30%" align="center">${getProduct.pgender}</td>
         </tr>
<!--          <tr>
            <th width="15%" class="m2">사이즈</th>
            <td width="30%" align="center"> /// </td>
         </tr> -->
         <tr>
            <th width="15%" bgcolor="#ebebeb">상품가격</th>
            <td width="30%" align="center">
               <fmt:formatNumber value="${getProduct.pprice}" pattern="###,###"/>원
            </td>
         </tr>
         <tr>
            <th width="15%" bgcolor="#ebebeb">상품포인트</th>
            <td width="35%" align="center">
               <fmt:formatNumber value="${getProduct.ppoint}" pattern="###,###"/>point
            </td>
         </tr>
         <tr>
            <th width="15%" bgcolor="#ebebeb">등록일</th>
            <td width="35%" align="center">${getProduct.pinputdate}</td>
         </tr>
         <tr>
            <th width="20%" bgcolor="#ebebeb">상품소개</th>
            <td colspan="3">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="pcontents" rows="5" cols="87" readOnly>${getProduct.pcontents}</textarea>
            </td>
         </tr>
         <tr>
            <td colspan="4" align="center">
<%--           <input type="submit" value="돌아가기">
               <a href="javascript:void(0);" onclick="checkDelAndSubmit('${dto.pcode}', '${dto.pimage}')">삭제</a> --%>
               
            <input type="button" value="돌아가기" onclick="location.href='admin_prod_list.do';">
                <%-- <input type="hidden" name="pcode" value="${dto.pcode}">
             <input type="hidden" name="pimage" value="${dto.pimage}"> --%>
             <input type="submit" value="삭제" onclick="checkDelAndSubmit('${getProduct.pcode}', '${getProduct.pimage}')">
            
            </td>
         </tr>
      </table>
       <!--   </form> -->
</body>
</html>