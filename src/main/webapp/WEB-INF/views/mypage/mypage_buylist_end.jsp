<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- mypage/mypage_buylist_end.jsp -->	
	
<%-- <%@ include file="../mypage/top.jsp"%> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_buy.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage_All.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.tab_link .title[data-v-2cbb289b] {
    font-size: 13px;
    letter-spacing: -.07px;
}
.ui-datepicker-trigger {
	display: none !important;
}
.period_calendar .calendar_wrap[data-v-14e5ae1c] {
	padding: 0 !important;
}
</style>

<!-- <style>
.btn {
   box-shadow: none !important;
}
.container{
	width: 900px;
}
a {
    color: black;
    text-decoration: none;
    background-color: transparent;
}
A:hover {
color: black; text-decoration: none
}
</style> -->

<input type="hidden" name="id" id="id" value="${loginMember.id}">
<div class="mmmiddle_area"> 
<div data-v-0adb81cc="" data-v-764de31e="" class="container my md" style="padding-top:0;">
<div data-v-3b1b5d32="" data-v-0adb81cc=""
	class="content_area my-page-content">
	<div data-v-3b1b5d32="" class="my_purchase">
		<div data-v-3b1b5d32="" class="v-portal" style="display: none;"></div>
		<div data-v-61e7a8a3="" data-v-3b1b5d32="" class="content_title">
			<div data-v-61e7a8a3="" class="title">
				<h3 data-v-61e7a8a3="">구매 내역</h3>
            <!---->
         </div>
         <!---->
      </div>
      <div data-v-2cbb289b="" data-v-3b1b5d32=""
         class="purchase_list_tab detail_tab">
         <div data-v-2cbb289b="" class="tab_item">
            <a data-v-2cbb289b="" href="buy.do" class="tab_link"><dl
                  data-v-2cbb289b="" class="tab_box">   
                  <dd data-v-2cbb289b="" class="count">0</dd>
                  <dt data-v-2cbb289b="" class="title">구매 입찰</dt>
               </dl></a>
         </div>
         <div data-v-2cbb289b="" class="tab_item">
            <a data-v-2cbb289b="" href="buy_ing.do" class="tab_link"><dl
                  data-v-2cbb289b="" class="tab_box">
                  <dd data-v-2cbb289b="" class="count">0</dd>
                  <dt data-v-2cbb289b="" class="title">진행 중</dt>
                  <!---->
               </dl></a>
         </div>
         <div data-v-2cbb289b="" class="tab_item tab_on">
            <a data-v-2cbb289b="" href="#" class="tab_link"><dl
                  data-v-2cbb289b="" class="tab_box">
                  <dd data-v-2cbb289b="" class="count">0</dd>
                  <dt data-v-2cbb289b="" class="title">종료</dt>
               </dl></a>
         </div>
      </div>
       <div data-v-77765e40="" data-v-3b1b5d32="" class="period_search" style="width:858px;">
            <div data-v-14e5ae1c="" data-v-77765e40=""
               class="period_calendar_wrapper"
               today="Thu Jan 04 2024 19:50:40 GMT+0900 (한국 표준시)">
               <div data-v-14e5ae1c="" class="period_calendar">
                  <div data-v-14e5ae1c="" class="calendar_wrap">
                     <!-- <span data-v-14e5ae1c=""> -->
                        <!-- <div data-v-14e5ae1c="" class="calendar"> -->
                        <input id="datepicker1" data-v-14e5ae1c="text" class="cal_input">
                        <!-- </div> -->
                       <!--  <div data-v-4cb7b681="" class="vc-popover-content-wrapper">

                        </div> -->
                     <!-- </span> -->
                  </div>
                  <span data-v-14e5ae1c="" class="swung_dash">~</span>
                  <div data-v-14e5ae1c="" class="calendar_wrap">
                     <!-- <span data-v-14e5ae1c=""> -->
                       <!--  <div data-v-14e5ae1c="" class="calendar"> -->
                           <input id="datepicker2" data-v-14e5ae1c="text" class="cal_input">
                        <!-- </div> -->
                        <!-- <div data-v-4cb7b681="" class="vc-popover-content-wrapper">
                          
                        </div> -->
                     <!-- </span> -->
                  </div>
            </div>
            <div data-v-14e5ae1c="" class="period_btn_box">
               <button data-v-14e5ae1c="" class="btn_search is_active">조회</button>
            </div>
         </div>
      </div>
      <ul data-v-a54c4c26="" data-v-3b1b5d32="" class="search_info" style="width:858px;">
         <li data-v-a54c4c26="" class="info_item"><p data-v-a54c4c26="">한
               번에 조회 가능한 기간은 최대 6개월입니다.</p></li>
         <li data-v-a54c4c26="" class="info_item"><p data-v-a54c4c26="">기간별
               조회 결과는 입찰일 기준으로 노출됩니다.</p></li>
      </ul>
      <div data-v-8c632d9a="" data-v-3b1b5d32=""
         class="purchase_list bidding bid">
         <div data-v-24868902="" data-v-8c632d9a="" class="empty_area">
            <p data-v-24868902="" class="desc">구매 입찰 내역이 없습니다.</p>
            <a data-v-14ec1f2e="" data-v-24868902="" href="main.do"
               class="btn outlinegrey small"> SHOP 바로가기 </a>
         </div>
         <div data-v-8c632d9a="" class="v-portal" style="display: none;"></div>
      </div>
      <!---->
   </div>
</div>
</div>
</div>
</div> 
<%@ include file="../bottom2.jsp"%>