<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 div.main{
 	margin-top: 100px;
 	align-content: center;	
 }
</style>
</head>
<body>
	<div class="main" align="center">
		<form name="f" method="post" action="updateAuctionFromAdmin.do">
			<table border="1">
				<tr>
					<th>상품 입찰번호</th>
					<td><input name="anum" type="text" value="${dto.anum}"
						readonly="readonly"></td>
					<th>구애 / 판매여부</th>
					<td><select name="atype">
							<c:choose>
								<c:when test="${dto.atype eq 'b' }">
									<option value="b" selected="selected">구매 입찰</option>
									<option value="s">판매 입찰</option>
								</c:when>
								<c:when test="${dto.atype eq 's' }">
									<option value="b">구매 입찰</option>
									<option value="s" selected="selected">판매 입찰</option>
								</c:when>
							</c:choose>
					</select></td>
				<tr />
				<tr>
					<th>등록자 ID</th>
					<td><input name="id" value="${dto.id }" readonly="readonly"></td>
					<th>입찰자 ID</th>
					<td><input name="aid" value="${dto.aid }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td><input name="pnum" value="${dto.pnum }"
						readonly="readonly"></td>
					<th>가격</th>
					<td><input name="price" value="${dto.price}"></td>
				</tr>
				<tr>
					<th>상품 사이즈</th>
					<td><input name="product_size" value="${dto.product_size}"></td>
					<th>상품 상황</th>
					<td><input name="status" value="${dto.status}"></td>
				</tr>
				<tr>
					<th>등록 일자</th>
					<td><input name="insertdate" value="${dto.insertdate}"
						readonly="readonly"></td>
					<th>판매 일자</th>
					<td><input name="saledate" value="${dto.saledate}"></td>

				</tr>
				<tr>
				
				<td colspan="4" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>