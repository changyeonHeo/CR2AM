<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="admin_product.jsp" %>
<script type="text/javascript">

function prodCheck() {
    var pcodeValue = document.getElementsByName("pcode")[0].value;
    var pbrandValue = document.getElementsByName("pbrand")[0].value;
    var cnameValue = document.getElementsByName("cname")[0].value;
    var csnameValue = document.getElementsByName("csname")[0].value;
    var pnameValue = document.getElementsByName("pname")[0].value;
    var pgenderValue = document.getElementsByName("pgender")[0].value;
    var size_typeValue = document.getElementsByName("size_type")[0].value;
    var pimageValue = document.getElementsByName("pimage")[0].value;
    var ppriceValue = document.getElementsByName("pprice")[0].value;
    var pcontentsValue = document.getElementsByName("pcontents")[0].value;
    var ppointValue = document.getElementsByName("ppoint")[0].value;

    if (pcodeValue.trim() === "") {
        alert("상품코드를 입력해 주세요");
        document.getElementsByName("pcode")[0].focus();
        return false;
    }
    if (pbrandValue.trim() === "") {
        alert("브랜드를 입력해 주세요");
        document.getElementsByName("pbrand")[0].focus();
        return false;
    }
    if (cnameValue.trim() === "" || cnameValue === "select") {
        alert("대분류를 선택해 주세요");
        document.getElementsByName("cname")[0].focus();
        return false;
    }
    if (csnameValue.trim() === "" || csnameValue === "select") {
        alert("소분류를 선택해 주세요");
        document.getElementsByName("csname")[0].focus();
        return false;
    }
    if (pnameValue.trim() === "") {
        alert("상품명을 입력해 주세요");
        document.getElementsByName("pname")[0].focus();
        return false;
    }
    if (pgenderValue.trim() === "") {
        alert("성별을 선택해 주세요");
        document.getElementsByName("pgender")[0].focus();
        return false;
    }
    if (size_typeValue.trim() === "") {
        alert("사이즈를 선택해 주세요");
        document.getElementsByName("size_type")[0].focus();
        return false;
    }
    if (pimageValue.trim() === "") {
        alert("상품이미지를 선택해 주세요");
        document.getElementsByName("pimage")[0].focus();
        return false;
    }
    if (ppriceValue.trim() === "") {
        alert("상품가격을 입력해 주세요");
        document.getElementsByName("pprice")[0].focus();
        return false;
    }
    if (pcontentsValue.trim() === "") {
        alert("상품소개를 입력해 주세요");
        document.getElementsByName("pcontents")[0].focus();
        return false;
    }
    if (ppointValue.trim() === "") {
        alert("상품포인트를 입력해 주세요");
        document.getElementsByName("ppoint")[0].focus();
        return false;
    }

    return true;
}

</script>

<script>

/*    function selectSize() {
       window.open("selectSize.do", "gola", "width=410, height=290");
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
         var cs = csnum[0].split("-");
         if (cs[0] == cnum[0]) {
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
         <form name="f" action="admin_prod_input.do" method="post" 
            enctype="multipart/form-data" onsubmit="return prodCheck();">
            <table border="0" class="outline" width="40%">
            <caption><h3> 제 품 등 록 </h3></caption>
               <tr>
                  <th bgcolor="#ebebeb"> 상품코드 </th>
                  <td><input type="text" name="pcode" class="box"></td>
               </tr>
               <tr>
                  <th bgcolor="#ebebeb">브랜드</th>
                  <td><select name="pbrand">
                        <c:forEach var="listBrand" items="${listBrand}">
                           <option value="${listBrand.pbrand}">
                              ${listBrand.pbrand}</option>
                        </c:forEach>
                  </select></td>
               </tr>
               <tr>
                  <th bgcolor="#ebebeb">카테고리</th>
                  <td><select name="cname" id="cname">
                        <option value="select">'대분류'선택하세요</option>
                        <c:forEach var="listCate" items="${listCate}">
                           <option value="${listCate.cname}" id="cname">
                              ${listCate.cname}[${listCate.ccode}]</option>
                        </c:forEach>
                         </select>
                           <select name="csname" id="csname">
                        <option value="select">'소분류'선택하세요</option>
                        <c:forEach var="listCate1" items="${listCsname}">
                           <option value="${listCate1.csname}" id="csname">
                              ${listCate1.csname}[${listCate1.ccode}-${listCate1.cscode}]</option>
                        </c:forEach>
                  </select></td>
               </tr>
               <tr>
                  <th bgcolor="#ebebeb">상품명</th>
                  <td><input type="text" name="pname" class="box"></td>
               </tr>
               <tr>
                  <th bgcolor="#ebebeb">성별</th>
                  <td><select name="pgender">
                        <option value="M"> M </option>
                        <option value="W"> W </option>
                        <option value="-"> - </option>
                  </select></td>
               </tr>
            <tr>
               <th bgcolor="#ebebeb"> 사이즈 </th>
               <td>
                  <select name="size_type">
                     <option value="c">의류</option>
                     <option value="s">신발</option>
                     <option value="o">원사이즈</option>
                  </select>
               </td>
              </tr>
               <tr>
                  <th bgcolor="#ebebeb">상품이미지</th>
                  <td><input type="file" name="pimage" class="box"></td>
               </tr>
<!--                <tr>
                  <th bgcolor="#ebebeb">상품수량</th>
                  <td><input type="text" name="pqty" class="box"></td>
               </tr> -->
               <tr>
                  <th bgcolor="#ebebeb">상품가격</th>
                  <td><input type="text" name="pprice" class="box"></td>
               </tr>

               <tr>
                  <th bgcolor="#ebebeb">상품소개</th>
                  <td><textarea name="pcontents" row="5" cols="50"></textarea>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#ebebeb">상품포인트</th>
                  <td><input type="text" name="ppoint" class="box"></td>
               </tr>
               <tr>
                  <td align="center" colspan="3">
                     <div align="right">
                        <input type="submit" value="상품등록" onsubmit="return prodCheck();">&nbsp;&nbsp; <input
                           type="reset" value="취소">
                     </div>
                  </td>
               </tr>
            </table>
         </form>
</body>
</html>