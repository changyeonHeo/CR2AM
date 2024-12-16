<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!-- product_cscate_list.jsp -->

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_product.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/admin_cscate_list.js"></script>

			<br><br>
			<input type="hidden" class="cnum" value="${cnum}">
			<table border="0" width="50%" align="center" class="outline2">
				<caption>
					<h3>카테고리목록</h3>
				</caption>
				<tr bgcolor="#ebebeb">
					<th width="40%"> 소분류 코드 / 소분류 이름 </th>
					<th width="20%"> 수정 | 삭제 </th>
				</tr>
			</table>
			</body>
			</html>