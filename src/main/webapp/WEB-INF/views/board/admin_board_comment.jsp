<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- board/board_admin_comment.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/style_admin.css">

<%@ include file="../admin/admin_product.jsp" %>

  <br><br>
  
	<h2 style="text-align: center; font-weight: bold;"> [ 댓글 달기 ] </h2>
	  <br><br>
	<div align="center">
		<form name="f" action="admin_board_comment.do?bnum=${breplyList.bnum}&id=${breplyList.id}" method="post"> 										
			<table border="0" class="outline" width="40%">
				<tr>
					<td align="center" width="20%">내 용</td>
					<td><textarea name="bcontent" rows="15" cols="60" class="box"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="목록보기" onclick="window.location='re_list.board'">
					</td>
				</tr>
			</table>
		</form> 
	</div> 