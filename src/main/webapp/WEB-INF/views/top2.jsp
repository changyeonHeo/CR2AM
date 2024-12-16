<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/style_ctop.css">

<!DOCTYPE html>

<html>
<head>

<style>
.no_dot {
  list-style-type: none;
}
#header-second {
   justify-content: center !important;
}
.logo {
    display: flex;
    width: 125px;
    height: 25px;
    background-size: 250px 50px;
    content: "";
}
.header_top .top_link {
    align-items: center;
    color: rgba(34,34,34,.8);
    margin-top: 10px;
    display: flex;
    font-size: 12px;
    letter-spacing: -.06px
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/style-header.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/style-footer.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/style-common.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/style-index.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/style-pageForAll.css">
   
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<!-- jquery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<!-- End of Script -->

 <title> CR2AM | 한정판 거래의 FLEX </title>  
 
</head>
<body>
   <header>
   <div class="layout_base md wrap md win_os" tabindex="0">
      <div>
      <div data-v-77726920="" data-v-0078c730="" class="order header fixed">
         <div class="header_top">
      <c:choose>
            <c:when test="${sessionScope.principal != null}">
               <div id="header-main-menu">
                  <c:if test="${sessionScope.principal.auth eq 'admin'}">
                     <a href="<%=request.getContextPath()%>/product?cmd=insertPage"
                        class="header-sub-menu">상품등록</a>
                     <a href="#" class="header-sub-menu">상품수정</a>
                  </c:if>
                   <a
                     href="<%=request.getContextPath()%>/user?cmd=checkAgain"
                     class="header-sub-menu">정보수정</a> <a
                     href="<%=request.getContextPath()%>/user?cmd=logout"
                     class="header-sub-menu">로그아웃</a>
               </div>
            </c:when>
            <c:otherwise>
            <div class="top_inner">
               <ul class="top_list">                  
                  <li class="top_item">
                  <a href="mypage.do" class="top_link"> 마이페이지 </a></li>
                  <li class="top_item">
                  <a href="list_wish.do?id=${loginMember.id}" class="top_link"> 관심 </a></li>
                     <c:if test="${empty loginMember}">
                        <li class="top_item">          
                        <a href="login.do" class="top_link">로그인</a>
                     </c:if>            
               <c:if test="${not empty loginMember}">      
                  <li class="top_item">
                  <a href="logout.do" class="top_link">로그아웃</a></li></ul>
               </c:if>
            </div>
         </c:otherwise>
         </c:choose>
         </div>
         <div class="header_main">
            <div class="main_inner">
               <a href="main.do">   
                  <h1 class="logo">
                   <img src="resources/img/logo.png" width="100%">
                  </h1>
               </a>
            <div class="center"></div>
            
<div data-v-21940b30="" class="gnb_area" data-v-77726920="">
<nav data-v-21940b30="" id="pcGnbContainer" class="gnb">

<ul data-v-21940b30="" id="pcGnbList" class="gnb_list">
<li data-v-2734e01b="" data-v-21940b30="" class="gnb_item">
<a data-v-2734e01b="" href="main.do" aria-current="page" 
class="active nuxt-link-active gnb_link active"> HOME </a></li>

<li data-v-2734e01b="" data-v-21940b30="" class="gnb_item">
<a data-v-2734e01b="" href="/search" class="gnb_link"> SHOP </a></li>

</ul></nav>

<div data-v-060bad62="" data-v-21940b30="" class="search_btn_box">
<a data-v-060bad62="" aria-label="검색" href="#" class="btn_search">
<svg data-v-060bad62="" xmlns="http://www.w3.org/2000/svg" class="nav-search icon sprite-icons">
<use data-v-060bad62="" href="/_nuxt/f45cf20461dd6e4e6d8591d181767f33.svg#i-nav-search"
 xlink:href="/_nuxt/f45cf20461dd6e4e6d8591d181767f33.svg#i-nav-search"></use></svg>
 </a></div>
 
 </div></div></div>
   <div data-v-77726920="" class="portal_target vue-portal-target">
   
      <!-- Start of Dropdown -->
      <div id="header-second">
         <!-- <div class="btn-group header-second-btn-box"> -->
                  <button type="button" id="header-sec-home" onclick="location.href='main.do'"
                     class="btn btn-basic header-second-btn-group">홈</button>
                  <button type="button" id="header-sec-rank"
                     class="btn btn-basic header-second-btn-group"
                     onclick="location.href='/shop/product?cmd=rank';">랭킹</button>
            <div class="btn-group">
               <button type="button" id="header-sec-items"
                  class="btn btn-basic dropdown-toggle header-second-btn-group"
                  data-toggle="dropdown">브랜드별</button>
               <div class="dropdown-menu">
                  <ul class="no_dot">
                     <c:forEach var="listBrand" items="${listBrand}">
                     <a class="dropdown-item"
                        href="productlist.do?mode=pbrand&pbnum=${listBrand.pbnum}">${listBrand.pbrand}</a>
                </c:forEach>            
                  </ul>
               </div>
            </div>
            <div class="btn-group">
               <button type="button" id="header-sec-items"
                  class="btn btn-basic dropdown-toggle header-second-btn-group"
                  data-toggle="dropdown">카테고리별</button>
               <div class="dropdown-menu">
               <ul class="no_dot">
                     <c:forEach var="listCate2" items="${listCate2}">
                     <a class="dropdown-item"
                         href="productlist.do?mode=cname&cname=${listCate2}">${listCate2}</a>
                </c:forEach>          
               </ul>
               </div>
            </div>
             <button type="button" id="header-sec-rank"
                     class="btn btn-basic header-second-btn-group"
                     onclick="location.href='/shop/product?cmd=category';">전체상품</button>
         </div>
      </div>
      </div>
      </div>
      </div>

      <!-- End of Dropdown -->
   </header>