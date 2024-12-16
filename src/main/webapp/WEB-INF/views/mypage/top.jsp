<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- mypage/top.jsp -->   
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title> CR2AM | 한정판 거래의 FLEX </title>

<style>
.no_dot {
  list-style-type: none;
}
.mypage-prod-list {
   font-size: 13px; 
   color: #c6c6c6; 
   font-weight: bold; 
   margin: 80px 0 100px 480px;
}
.mypage-wish-list {
   font-size: 13px; 
   color: #c6c6c6; 
   font-weight: bold; 
   margin: 50px 0 50px 375px;
}
#header-second-mypage {
   max-width: 1300px;
   padding: 49px 0 50px 30px;
   margin: 0 200px 0 160px;
   display: flex;
}
.header_sub{
    margin: 5px 17px 0px 3px;
    font-size: 13px;
    font-weight: bold;
    text-decoration: none;
    color: black;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style-header.css">
<link rel="stylesheet" type="text/css" href="css/style-footer.css">
<link rel="stylesheet" type="text/css" href="css/style-common.css">
<link rel="stylesheet" type="text/css" href="css/style-index.css">
<link rel="stylesheet" type="text/css" href="css/style-pageForAll.css">
<link rel="stylesheet" type="text/css" href="css/style-qna.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage.css">
<link rel="stylesheet" type="text/css" href="css/style_buy.css"> 
<link rel="stylesheet" type="text/css" href="css/style_sell.css"> 
<link rel="stylesheet" type="text/css" href="css/style-wish.css">

<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- summernote css/js -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<header>
<div id="header-first-mypage">
   <div id="header-logo" style="margin: 2px -14px 150px -15px">
      <a href="main.do">
         <img src="img/logo.png" id="header-logo-img"/>
      </a>
   </div>
   <div>
      <!-- <a href="index.do" class="header-sub-mypage">고객센터</a> -->
      <a href="mypage.do" class="header-sub-mypage">마이페이지</a>
      <!-- <a href="notice.do" class="header-sub-mypage">알림</a> -->
      <a href="logout.do" class="header-sub-mypage" style="margin-right: 30px">로그아웃</a><br><br>
      <a href="main.do" class="header-sub2-mypage">HOME</a>
<!--       <a href="main.do" class="header-sub2-mypage">STYLE</a>
      <a href="main.do" class="header-sub2-mypage">SHOP</a> -->
      <a href="search.do" class="header-sub2-mypage">
         <img src="img/search.png" width="17" height="17">
      </a>
   </div>
</div>
</header>
<div id="header-second-mypage" style="height : auto;">
   <div style="width: 170px;">
       <h4><strong><a href="mypage.do" style="color: black; ">마이<br>페이지</a></strong></h4><br>
       <h5><strong>쇼핑 정보</strong></h5>
      <a href="buy.do" class="header_sub">구매 내역</a><br>
      <a href="sell.do" class="header_sub">판매 내역</a><br>
      <a href="mypage_prodcheck.do" class="header_sub"> 검수 </a><br>     
      <%-- <a href="list_wish.do?id=${loginMember.id}" class="header_sub">관심</a> --%><br><br>
      <h5><strong>내 정보</strong></h5>
      <a href="loginfo.do?id=${loginMember.id}" class="header_sub">로그인 정보</a><br>
      <a href="address_list.do?mem=${loginMember.mem}" class="header_sub">주소록</a><br>
      <a href="list_wish.do?id=${loginMember.id}" class="header_sub">관심</a><br>
      <a href="list.do?id=${loginMember.id}" class="header_sub">문의하기</a><br>
<!--       <a href="write_review.do" class="header_sub">리뷰 작성</a><br>
        <a href="list_review.do?rproduct=product1" class="header_sub">(테스트용) </a><br> -->
      <a href="review_list.do?id=${loginMember.id}" class="header_sub"> MY STYLE</a>
   </div>
   