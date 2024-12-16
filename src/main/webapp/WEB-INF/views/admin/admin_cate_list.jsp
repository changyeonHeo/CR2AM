<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!-- product_cate_list.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="admin_product.jsp" %>
	
	<br><br>	
	<table border="0" width="50%" align="center" class="outline2">
		<caption><h3>카테고리목록</h3></caption>
		<tr bgcolor="#ebebeb">
			<th width="40%"> 대분류 코드  /  대분류 </th>
			<th width="40%"> 소분류 코드  /  소분류 </th>
			<th width="20%"> 수정 | 삭제 </th>
		</tr>
		<c:if test="${empty listCate}">
			<tr>
				<td colspan="3">등록된 카테고리가 없습니다.</td>
			</tr>		
		</c:if>
		<c:forEach var="dto" items="${listCate}">
		<tr>
			<td align="center">${dto.ccode}&nbsp;&nbsp;/&nbsp;&nbsp;${dto.cname}</td>
			<td align="center">${dto.cscode}&nbsp;&nbsp;/&nbsp;&nbsp;${dto.csname}</td>
			<td align="center">
				<a href="admin_cate_update.do?cnum=${dto.cnum}"> 수정 </a> |
				<a href="admin_cate_delete.do?cnum=${dto.cnum}">삭제</a>
			</td>
		</tr>	
		</c:forEach>		
	</table>
</body>
</html>
