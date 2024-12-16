<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_brand_list.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="admin_product.jsp" %>

  <br><br>			
	<table border="0" width="40%" align="center" class="outline2">
		<caption><h3> 브랜드 목록 </h3></caption>
		<tr bgcolor="#ebebeb">
			<th width="45%"> 브랜드 </th>
			<th width="35%"> 수정 | 삭제 </th>
		</tr>
		<c:if test="${empty listBrand}">
			<tr>
				<td colspan="4">등록된 브랜드가 없습니다.</td>
			</tr>		
		</c:if>
		<c:forEach var="dto" items="${listBrand}">
		<tr>
			<td align="center">${dto.pbrand}</td>
			<td align="center">
				<a href="admin_brand_update.do?pbnum=${dto.pbnum}"> 수정 </a> |
				<a href="admin_brand_delete.do?pbnum=${dto.pbnum}">삭제</a>

			</td>
		</tr>	
		</c:forEach>		
	</table>

</body>
</html>
	
