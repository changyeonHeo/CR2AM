<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_brand_update.jsp -->

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
	<form name="f" method="post" action="admin_brand_update.do">
	<input type="hidden" name="pbnum" value="${getBrand.pbnum}"/>
	<table border="0" width="30%" class="outline2">
		<div align="center">
			<caption> 브랜드 수정 </caption>
			<tr>
				<th bgcolor="#ebebeb"> 브랜드 명 </th>
				<td><input type="text" name="pbrand" class="box" value="${getBrand.pbrand}"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="submit" value="수정" onclick="brandCheck()">
				&nbsp;&nbsp;<input type="reset" value="취소">
				</td>
			</tr>
		</div>
	</table>
    </form>

</body>
</html>
	
	
	
	
