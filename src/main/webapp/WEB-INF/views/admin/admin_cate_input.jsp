<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!-- admin_cate_input.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="admin_product.jsp" %>

   <script type="text/javascript">
    function cateCheck() {
        var ccodeValue = document.getElementById("ccode").value;
        var cnameValue = document.getElementById("cname").value;
        var cscodeValue = document.getElementById("cscode").value;        
        var csnameValue = document.getElementById("csname").value;

         if (ccodeValue.trim() === "" || ccodeValue === "select") {
            alert("대분류 코드를 입력/선택해 주세요");
            document.getElementById("ccode").focus();
            return false;
        }
        if (cnameValue.trim() === "" || cnameValue === "select") {
            alert("대분류를 입력/선택해 주세요");
            document.getElementById("cname").focus();
            return false;
        }
        if (cscodeValue.trim() === "" ) {
            alert("소분류 코드를 입력해 주세요");
            document.getElementById("cscode").focus();
            return false;
        }
        if (csnameValue.trim() === "") {
            alert("소분류를 입력해 주세요");
            document.getElementById("csname").focus();
            return false;
        }
        return true;
    }
    </script>
    
    <script>

    $(function() {
        $("#textccode").hide();
        $("#textcname").hide();
         $('#ccode').change(function() {
             if ($('#ccode').val() == 'directly') {
                $("#textccode").show();
                 $('#textccode').attr("disabled", false);
                 $('#textccode').val("");
                 $('#textccode').focus();
             } else {
                 $('#textccode').val($('#ccode').val());
                 $("#textccode").hide();
             }
         })
         $('#cname').change(function() {
             if ($('#cname').val() == 'directly') {
                $("#textcname").show();
                 $('#textcname').attr("disabled", false);
                 $('#textcname').val("");
                 $('#textcname').focus();
             } else {
                 $('#textcname').val($('#cname').val());
                 $("#textcname").hide();
             }
         })
     });

	</script>
	
	<br><br>		
	<form name="f" action="admin_cate_input.do" method="post" onsubmit="return cateCheck();"> 
			<table border="0" width="50%" align="center" class="outline2">
			<caption><h3>카테고리 등록</h3></caption>			
			<tr>
            <th width="40%" bgcolor="#ebebeb"> 대분류 코드</th>
           	 <td>
            	<input id="textccode" placeholder="선택또는입력" name="textccode" value=""/>
             	<select name="ccode" id="ccode">
                        <option value="select">선택하세요</option>      
	                      <c:forEach var="listCate_text" items="${listCate_text}">
                              <option value="${listCate_text.ccode}"> ${listCate_text.ccode} </option>
                          </c:forEach>
                        <option value="directly">직접입력</option>
                 </select> 
              </td> 
         </tr>
         <tr>   
            <th width="40%" bgcolor="#ebebeb"> 대분류 </th>
            <td>
            	<input id="textcname" placeholder="선택또는입력" name="textcname" value=""/>
             	<select name="cname" id="cname">
                        <option value="select">선택하세요</option>      
	                        <c:forEach var="listCsname" items="${listCsname}">
	                           <option value="${listCsname.cname}"> ${listCsname.cname} </option>
	                       </c:forEach>
                        <option value="directly">직접입력</option>
                 </select> 
              </td>                         
         </tr>
         <tr>
            <th width="40%" bgcolor="#ebebeb"> 소분류 코드 </th>
             <td><input type="text" id="cscode" name="cscode" class="box"></td>
         </tr>
         <tr>
            <th width="40%" bgcolor="#ebebeb"> 소분류 </th>
            <td><input type="text" id="csname" name="csname" class="box"></td>
         </tr>
         <tr>
            <td align="right" colspan="4">         
               <input type="submit" value="등록">
               <input type="reset" value="취소">
            </td>
            </tr>
			</table>	
         </form>
</body>
</html>
