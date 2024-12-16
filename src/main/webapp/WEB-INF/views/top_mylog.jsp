<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top_mylog.jsp -->
<!-- hearder 부분만 있음 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/style_ctop.css">

<!DOCTYPE html>

<style>
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
.login_title[data-v-4a9bf2df]:before {
    background: url(img/logo.png) no-repeat;
    background-size: 250px 50px;
    content: "";
    display: inline-block;
    height: 50px;
    width: 250px
}
.tiny.material-icons {
  cursor: pointer;
  outline: none; /* 테두리 감추기 */
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- material icon -->
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
   <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
   <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- summernote css/js -->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->

   <header>
   <div id="__nuxt">
   <div id="__layout">
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
                  <a href="<%=request.getContextPath()%>/favor?cmd=favorList"
                     class="header-sub-menu">찜</a> <a
                     href="<%=request.getContextPath()%>/cart?cmd=cartList"
                     class="header-sub-menu">장바구니</a> <a
                     href="<%=request.getContextPath()%>/user?cmd=checkAgain"
                     class="header-sub-menu">정보수정</a> <a
                     href="<%=request.getContextPath()%>/user?cmd=logout"
                     class="header-sub-menu">로그아웃</a>
               </div>
            </c:when>
            <c:otherwise>
            <div class="top_inner">
               <ul class="top_list">               
                     <c:if test="${empty loginMember}">
                        <li class="top_item">          
                        <a href="login.do" class="top_link">로그인</a></li>
                        <li class="top_item">          
                        <a href="join.do" class="top_link">회원가입</a></li>
                     </c:if>            
               <c:if test="${not empty loginMember}">      
               <c:if test="${loginMember.id != 'admin'}">
                  <li class="top_item">               
                        <a href="mypage.do" class="top_link">마이페이지</a></li>&nbsp;&nbsp;                
                        <li class="top_item">
                  <a href="list_wish.do?mem=${loginMember.mem}" class="top_link"> 관심 </a></li>&nbsp;&nbsp; 
                  </c:if>                      
                     <c:if test="${loginMember.id == 'admin'}">
                        <a href="admin.do" class="top_link">관리자페이지</a>&nbsp;&nbsp;
                     </c:if>                 
                  <li class="top_item">
                  <a href="logout.do" class="top_link">로그아웃</a></li>                  
               </c:if>
               </ul>
            </div>
         </c:otherwise>
         </c:choose>
         </div>
         <div class="header_main">
            <div class="main_inner">
               <a href="main.do" style="text-align: center;">   
                  <h1 class="logo">
                   <img src="img/logo.png" width="100%" style="width: 200px; height: auto; padding-left: 40px; padding-right: 40px;">
                  </h1>
               </a>
            <div class="center"></div>
            
         <div class="gnb_area" data-v-77726920="">
            <nav id="pcGnbContainer" class="gnb">
               <ul id="pcGnbList" class="gnb_list">
               <li data-v-2734e01b="" data-v-21940b30="" class="gnb_item">
                  <a href="main.do" aria-current="page" class="active nuxt-link-active gnb_link active"> HOME </a></li>
               </ul>
            </nav>
                  <form  action="<%=request.getContextPath()%>/search.do">
                     <button class="tiny material-icons">search</button>
                  </form>
            </div>
            </div>
            </div>
         </div>
         </div>
   </header>