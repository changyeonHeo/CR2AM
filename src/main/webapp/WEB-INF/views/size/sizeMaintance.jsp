<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<div>
		<div>
			<div>
				<div align="center">
					<a href="insertSizeForm.do">신규 사이즈 폼 입력</a>
				
				<table>
					<tr>
						<th>제품이름</th>
						<th>사이즈 타입</th>
						<th>삭제/수정</th>
					</tr>
					<c:forEach var="dto" items="${listSize}">
						<tr>
							<td>${dto.pname}</td>
							<td>${dto.type}</td>
							<td><input type="button" value="수정"
								onclick="location.href='updatePrimeSize.do?pname=${dto.pname}'">
								<input type="button" value="삭제"
								onclick="location.href='deletePrimeSize.do?pname=${dto.pname}'"></td>
						</tr>
					</c:forEach>
				</table>
				</div>	
			</div>
		</div>


	</div>


</body>

</html>