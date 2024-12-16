<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- memberSsn.jsp -->
<html>
<head>
	<title>회원가입유무</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>회 원 가 입 유 무</h2>
		<hr color="green" width="300">
		<form name="f" action="member_check.do" method="post">
			<table border="0" width="500" class="outline">
				<tr>
					<th class="m1">이름</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th class="m1">전화번호</th>
					<td><input type="text" name="hp1" class="box" size="3" maxlength="3">-
					<input type="text" name="hp2" class="box" size="4" maxlength="4">-
					<input type="text" name="hp3" class="box" size="4" maxlength="4"></td>
				</tr>	
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="조회">
						<input type="reset" value="다시작성">
					</td>
				</tr>		
			</table>
		</form>
	</div>
</body>
</html>