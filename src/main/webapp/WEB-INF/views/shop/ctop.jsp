<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ctop.jsp -->

<link rel="stylesheet" type="text/css" href="css/style_ctop.css">

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

<html>
<title> CR2AM | 한정판 거래의 FLEX </title>

<style>
.logo {
    display: flex;
    width: 125px;
    height: 25px;
    background-size: 250px 50px;
    content: "";
}
</style>

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
<!-- 						<li class="top_item">
						<a href="main.do" class="top_link"> 고객센터 </a></li>	 -->					
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
                  <a href="list_wish.do?id=${loginMember.id}" class="top_link"> 관심 </a></li>&nbsp;&nbsp; 
                  </c:if>                      
                     <c:if test="${loginMember.id == 'admin'}">
                        <a href="admin.do" class="top_link">관리자페이지</a>&nbsp;&nbsp;
                     </c:if>                 
                  <li class="top_item">
                  <a href="logout.do" class="top_link">로그아웃</a></li>         
					</c:if>
				</div>
			</c:otherwise>
			</c:choose>
			</div>
			<div class="header_main">
				<div class="main_inner">
					<a href="main.do">   
						<h1 class="logo">
 						<img src="img/logo.png" width="100%">
						</h1>
					</a>
				<div class="center">
					<h2 class="title">
					<span class="title_txt">판매하기</span></h2></div>
				<div class="right">
					<a href="check_standard.do">
					<button type="button" 
					class="btn btn_standard outlinegrey small"> 검수기준 </button></a>
				</div>
				</div>
			</div>
			<div class="portal_target vue-portal-target">
			</div>
		</div>
	</div>
	</div>
	
</header>

<%-- <%@include file="../bottom2.jsp" %> --%>
	