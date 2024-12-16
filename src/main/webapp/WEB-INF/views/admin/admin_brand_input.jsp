<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_brand_input.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="admin_product.jsp" %>

<script type="text/javascript">
function brandCheck(){
	if(f.pbrand.value == "") {
		event.preventDefault();
		alert("브랜드를 입력해 주세요")
		f.pbrand.focus()
		return
	}
    document.f.submit()
}
</script>

  <br><br>		
	<form name="f" action="admin_brand_input.do" method="post">
			<table border="0" width="30%" align="center" class="outline2">
			<div align="center">
			<caption><h3>브랜드 등록</h3></caption>
			<tr>
				<th width="40%" bgcolor="#ebebeb"> 브랜드 </th>
				<td><input type="text" name="pbrand" class="box"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="등록"  onclick="brandCheck()">
					<input type="reset" value="취소">
				</td>
				</tr>
				</div>
			</table>
         </form>
</body>
</html>
