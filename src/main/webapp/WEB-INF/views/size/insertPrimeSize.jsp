<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div>
		<div>
			<div align="center">
				<form action="insertSizeForm.do" method="post">
					<table border="1">
						<tr>
							<th>테이블 이름</th>
							<td><input name="pname" id="pname" type="text"></td>
							<th>타입</th>
							<td><select name="type">
									<option value="s">신발(기본 220 ~ 330)</option>
									<option value="c">의류(기본 XXS ~ XXL)</option>
									<option value="o">원사이즈(기본 One Size)</option>
							</select></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>