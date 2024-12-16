<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <link rel="stylesheet" type="text/css" href="css/style_mypage_All.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css"> -->
<link rel="stylesheet" type="text/css" href="css/style_ctop.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</style>

<div class="container my lg" data-v-764de31e="" data-v-0adb81cc="">
	<div data-v-0adb81cc="" class="snb_area">
	
		<a data-v-0adb81cc="" href="mypage.do" aria-current="page" class="nuxt-link-exact-active nuxt-link-active">
			<h2 data-v-0adb81cc="" class="snb_main_title">마이 페이지</h2></a>
		<nav data-v-7bcac446="" data-v-0adb81cc="" class="snb">
			
			<div data-v-7bcac446="" class="snb_list">
				<strong data-v-7bcac446="" class="snb_title">쇼핑 정보</strong>
					
				<ul data-v-7a824f04="" data-v-7bcac446="" class="snb_menu">
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="buy.do" class="menu_link"> 구매 내역 </a></li>
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="sell.do" class="menu_link"> 판매 내역 </a></li>
				<!-- <li data-v-7a824f04="" class="menu_item">
				<a data-v-7a824f04="" href="/my/inventory" class="menu_link"> 보관 판매 </a></li> -->
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="mypage_prodcheck.do" class="menu_link"> 검수 </a></li>
				</ul>
			</div>
		
			<div data-v-7bcac446="" class="snb_list">
				<strong data-v-7bcac446="" class="snb_title">내 정보</strong>
		
				<ul data-v-7a824f04="" data-v-7bcac446="" class="snb_menu">
		
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="loginfo.do?id=${loginMember.id}" class="menu_link"> 로그인 정보 </a></li>
					<!-- <li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/profile-edit" class="menu_link"> 프로필 관리 </a></li> -->
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="address_list.do?mem=${loginMember.mem}" class="menu_link"> 주소록 </a></li>
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="list_wish.do?mem=${loginMember.mem}" class="menu_link"> 관심 </a></li>
					<li data-v-7a824f04="" class="menu_item">
						<a data-v-7a824f04="" href="list.do?id=${loginMember.id}" class="menu_link"> 문의하기 </a></li>
					<li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="review_list.do?id=${loginMember.id}" class="menu_link"> MY STYLE </a></li>
					<!-- <li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/payment" class="menu_link"> 결제 정보 </a></li> -->
					<!-- <li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/account" class="menu_link"> 판매 정산 계좌 </a></li>
					<li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/receipt" class="menu_link"> 현금영수증 정보 </a></li> -->
					<!-- <li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/point" class="menu_link"> 포인트 </a></li> -->
					<!-- <li data-v-7a824f04="" class="menu_item">
					<a data-v-7a824f04="" href="/my/coupon" class="menu_link"> 쿠폰 </a></li> -->
				</ul>
			</div>
		</nav>
	</div>

 






