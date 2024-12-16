<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <title>홈페이지</title>
   <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
   <div align="right">
      <a href="index.do">공지사항</a> | 
      <c:if test="${empty loginMember}">
         <a href="login.do">로그인</a>
      </c:if>   
      <c:if test="${not empty loginMember}">
         <a href="logout.do">로그아웃</a> |
         <a href="mypage.do">마이페이지</a>
      </c:if>
   </div>
   <div align="left">
      <a href="main.do">
      <img src="resources/img/logo.png" border="0" width="20%" height="10%"></a><br><br>
   </div>

<%-- <body>
	<div align="center">
	<table border="1" width="800" height="600">
		<tr height="10%">
			<th width="20%"><a href="javascript:checkMember()">회원가입</a></th>
			<th width="20%"><a href="member_list.do">회원보기</a></th>
			<th width="20%"><a href="member_list.do?mode=find">회원찾기</a></th>
			<th width="20%">
		<c:if test="${empty loginMember}">
			<a href="login.do">로그인</a>
		</c:if>	
		<c:if test="${not empty loginMember}">
			<a href="logout.do">로그아웃</a>
		</c:if>
			</th>
			<th width="20%"><a href="index.do">메인페이지</a></th>
		</tr>
		<tr height="80%">
			<td colspan="5"> --%>
			
			
			
			
			
			
			
			
			