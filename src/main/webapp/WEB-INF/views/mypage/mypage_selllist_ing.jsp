<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- mypage/mypage_selllist_ing.jsp -->	
	
<%-- <%@ include file="../mypage/top.jsp"%> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_sell.css">
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
.container.my .snb_main_title[data-v-0adb81cc] {
	margin-bottom: 0 !important;
	margin-top: 0 !important;
}
</style>

<script>
    function getBuyList(id) {
        $.ajax({
            url: "getBuyListFromPageAjax.do",
            method: "GET",
            data: {
                "id": id
            },
            success: function (result) {
                alert("불러오기 성공!");
                
                if(result.size != 0){
                    $('.count').eq(0).text(result.length);
                $('div[class="purchase_list bidding bid"]').toggle();
                
                for (var i = 0; i < result.length; i++) {
                    $('div[class="purchase_list bidding bid"]').eq(1).append(insertBuyList);
                    $("img[class='list_item_img']").eq(i).attr("src","resources/img/"+result[i].rimage);
                    $("p.list_item_title").eq(i).text(result[i].rtitle);
                    $("p.list_item_description").eq(i).text(result[i].rproduct);
                    $("p[class='secondary_title display_paragraph']").eq(i).text(result[i].reg_date);
                }
            }else{
                 alert("없다!");
            }
            },
            error: function () {
                alert("구매기록 호출실패");
            }
        })
    }

    var insertBuyList = "<div data-v-29479193='' class='purchase_list_display_item' style='background-color: rgb(255, 255, 255);'><div data-v-29479193='' class='purchase_list_product'><div data-v-29479193='' class='list_item_img_wrap'><img data-v-29479193='' alt='product_image' src='' class='list_item_img' style='background-color: rgb(244, 244, 244);''></div><div data-v-29479193='' class='list_item_title_wrap'><p data-v-29479193='' class='list_item_title'>(제품이름)</p><p data-v-29479193='' class='list_item_description'><span data-v-29479193=''>(사이즈)</span></p></div></div><div data-v-29479193='' class='list_item_status'><div data-v-29479193='' class='list_item_column column_secondary'><p data-v-da58a2f2='' data-v-29479193='' class='secondary_title display_paragraph'style='color: rgba(34, 34, 34, 0.5);'>(구매일 YY/MM/DD)</p></div></div></div>";
</script>
<script>
   $(document)
         .ready(
               function() {
                  $("#datepicker1")
                        .datepicker(
                              {
                                 dateFormat : 'yy-mm-dd',
                                 showOtherMonths : true,
                                 showMonthAfterYear : true,
                                 changeYear : true,
                                 changeMonth : true,
                                 showOn : "both",
                                 yearSuffix : "년",
                                 monthNamesShort : [ '1월', '2월',
                                       '3월', '4월', '5월', '6월',
                                       '7월', '8월', '9월', '10월',
                                       '11월', '12월' ],
                                 monthNames : [ '1월', '2월', '3월',
                                       '4월', '5월', '6월', '7월',
                                       '8월', '9월', '10월', '11월',
                                       '12월' ],
                                 dayNamesMin : [ '일', '월', '화', '수',
                                       '목', '금', '토' ],
                                 dayNames : [ '일요일', '월요일', '화요일',
                                       '수요일', '목요일', '금요일', '토요일' ],
                                 minDate : "-5Y",
                                 maxDate : "+today",
                                 
                                 onClose : function() {
                                    var datepicker1 = $(
                                          "#datepicker1")
                                          .datepicker('getDate');
                                    var datepicker2 = $(
                                          "#datepicker2")
                                          .datepicker('getDate');

                                    if (datepicker2 != null) {
                                       if (datepicker1 > datepicker2) {
                                          alert("기간을 다시 설정해주세요. \n종료일로 설정됩니다.");
                                          $("#datepicker1")
                                                .val(
                                                      $(
                                                            "#datepicker2")
                                                            .val());
                                       }
                                    }
                                 }
                              });

                  $("#datepicker2")
                        .datepicker(
                              {

                                 dateFormat : 'yy-mm-dd',
                                 showOtherMonths : true,
                                 showMonthAfterYear : true,
                                 changeYear : true,
                                 changeMonth : true,
                                 showOn : "both",
                                 yearSuffix : "년",
                                 monthNamesShort : [ '1월', '2월',
                                       '3월', '4월', '5월', '6월',
                                       '7월', '8월', '9월', '10월',
                                       '11월', '12월' ],
                                 monthNames : [ '1월', '2월', '3월',
                                       '4월', '5월', '6월', '7월',
                                       '8월', '9월', '10월', '11월',
                                       '12월' ],
                                 dayNamesMin : [ '일', '월', '화', '수',
                                       '목', '금', '토' ],
                                 dayNames : [ '일요일', '월요일', '화요일',
                                       '수요일', '목요일', '금요일', '토요일' ],
                                 minDate : "-5Y",
                                 maxDate : "+today"

                                 ,
                                 beforeShow : function() {

                                    var datepicker1 = $(
                                          "#datepicker1")
                                          .datepicker('getDate');

                                    if (datepicker1 != null) {
                                       $(this).datepicker(
                                             'option',
                                             'minDate',
                                             datepicker1);
                                    }
                                 }
                              });
               });
</script>

<script>
   $(document).ready(function() {
      $("#datepicker1").datepicker({
        
         onSelect: function() {
            var date = $.datepicker.formatDate("yymmdd", $("#datepicker1").datepicker("getDate"));
            console.log(date);
         }
      });

      $("#datepicker2").datepicker({
         // 기존 설정 유지
         onSelect: function() {
            var date = $.datepicker.formatDate("yymmdd", $("#datepicker2").datepicker("getDate"));
            console.log(date);
         }
      });

      $('input').change(function() {
         console.log($(this).datepicker("getDate"));
      });
   });
</script>
<script>
   $(function() {
      var id = $("input#id").val();
      getBuyList(id);
      
   });
</script>

<div class="mmmiddle_area"> 
<div data-v-0adb81cc="" data-v-764de31e="" class="container my md" style="padding-top:0;">
<div data-v-3b1b5d32="" data-v-0adb81cc=""
	class="content_area my-page-content">
	<div data-v-3b1b5d32="" class="my_purchase">
		<div data-v-3b1b5d32="" class="v-portal" style="display: none;"></div>
		<div data-v-61e7a8a3="" data-v-3b1b5d32="" class="content_title">
			<div data-v-61e7a8a3="" class="title">
				<h3 data-v-61e7a8a3="">판매 내역</h3>
            <!---->
         </div>
         <!---->
      </div>
      <div data-v-2cbb289b="" data-v-3b1b5d32=""
         class="purchase_list_tab detail_tab">
         <div data-v-2cbb289b="" class="tab_item">
            <a data-v-2cbb289b="" href="sell.do" class="tab_link"><dl
                  data-v-2cbb289b="" class="tab_box">
                  <dd data-v-2cbb289b="" class="count">0</dd>
                  <dt data-v-2cbb289b="" class="title">판매 입찰</dt>
               </dl></a>
         </div>
         <div data-v-2cbb289b="" class="tab_item tab_on">
            <a data-v-2cbb289b="" href="#" class="tab_link"><dl
                  data-v-2cbb289b="" class="tab_box">
                  <dd data-v-2cbb289b="" class="count">0</dd>
                  <dt data-v-2cbb289b="" class="title">진행중</dt>
               </dl></a>
         </div>
         <div data-v-2cbb289b="" class="tab_item">
            <a data-v-2cbb289b="" href="sell_end.do" class="tab_link"><dl
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
            <p data-v-24868902="" class="desc">판매 입찰 내역이 없습니다.</p>
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