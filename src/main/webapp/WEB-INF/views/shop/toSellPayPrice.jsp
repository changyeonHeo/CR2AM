<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- tosellPayPrice.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="ctop.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_sell_size_check.css">
<link rel="stylesheet" type="text/css" href="css/tosell2.css">
<link rel="stylesheet" type="text/css" href="css/style_insertAddress.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/addressTotal.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.btn_confirm {
   padding: 0 32px 32px;
   margin-bottom: -30px;
}
</style>
<script>
   $(function() {
      displayCurrentDate();
      $("span.title_txt").text("즉시 판매하기");
      $(".deadline_info_area").hide();
      $("#price_now_sell_bid").hide();

      $(".input_amount").keyup(function() {
         var replace_text = $(this).val().replace(/[^-0-9]/g, '');
         $(this).val(replace_text);
         $(".price_total").find("span.amount").text(replace_text);
      });

      $('.tab_area .item_link:first').on('click', function() {
         $(this).parent('.item').addClass('on').attr({
            'aria-selected' : 'true'
         });
         $(this).parent('.item').siblings('.item').removeClass('on').attr({
            'aria-selected' : 'false'
         });
         $("div.price_now:first").removeClass("active_input").hide();
         $("div.price_now:last").addClass("active_input").show();
         $(".deadline_info_area").show();
         $(".price_total").find("span.amount").text("-");
         $("span.title_txt").text("판매 입찰하기");
         $("button[class='btn full solid false']").text("판매 입찰 계속");
      })
      $('.tab_area .item_link:last').on(
            'click',
            function() {
               $(this).parent('.item').addClass('on').attr({
                  'aria-selected' : 'true'
               });
               $(this).parent('.item').siblings('.item').removeClass('on')
                     .attr({
                        'aria-selected' : 'false'
                     });
               $("div.price_now:first").addClass("active_input").show();
               $("div.price_now:last").removeClass("active_input").hide();
               $(".deadline_info_area").hide();
               $(".price_total").find("span.amount").text(
                     $(".list_item:first").find("span.price").text());
               $("span.title_txt").text("즉시 판매하기");
               $("button[class='btn full solid false']").text("즉시 판매 계속");
               
      })
   });

   function displayCurrentDate() {
      var currentDate = new Date();
      var formattedDate = formatDate(currentDate);
      $("#current-date").text("오늘 날짜: " + formattedDate);
   }
   
   function selectDate(select) {
      updateDate(select)
      updateButtonStyle(select);
   } 

   function updateDate(days) {
      var currentDate = new Date();
      currentDate.setDate(currentDate.getDate() + days);
      var formattedDate = formatDate(currentDate);
      $(".deadline_txt").text(days + "일 (" + formattedDate + " 마감)");
   }

   function formatDate(date) {
      var year = date.getFullYear();
      var month = (date.getMonth() + 1).toString().padStart(2, '0');
      var day = date.getDate().toString().padStart(2, '0');
      return year + '/' + month + '/' + day;
   }

   function updateButtonStyle(clickedButton) {
      $(".btn").removeClass("is_active");
      $("#"+clickedButton).addClass("is_active");
   }

   function toSell() {
      var whatyoupay = $(".price_total").find("span.amount").text();
      if(whatyoupay == "" || whatyoupay == "-"){
         alert("희망 금액을 입력해주세요")
      } else if (whatyoupay == "0"){
         alert("0원 이상으로 입력해주세요")
      } else {
         if ($(".price_now .active_input").find("span.amount").length == 1) {
           location.href = "toSellFinal.do?price=" + whatyoupay + "&pnum="
               + $("#pnum").val();
         } else {
            location.href = "toSellFinal.do?price=" + whatyoupay + "&pnum="
               + $("#pnum").val() + "&size=" + $("p.size_txt").text()+ "&date=" + $(".deadline_txt").text().split("(")[1].split(" ")[0];
         }
      }
   }
</script>
<input type="hidden" value="${dto.pnum}" name="pnum" id="pnum">


<div data-v-65b424ce="" data-v-0078c730=""
   class="container sell lg step-1">
   <!---->
   <div data-v-65b424ce="" class="content">
      <div data-v-f64cdfc8="" data-v-65b424ce="" class="buy_immediate">
         <div class="product_info_area">
            <div class="product_info">

               <div data-v-6805fc8a="" data-v-b57d39f0="" class="product"
                  style="background-color: rgb(244, 244, 244);">
                  <div data-v-17ca498c="" data-v-6805fc8a=""
                     class="product_inner_tag display_tag_item">
                     <!---->
                     <span data-v-17ca498c="" class="tag_text"> </span>
                  </div>

                  <picture data-v-44ba780a="" data-v-6805fc8a=""
                     class="picture product_img"> <!-- <source data-v-44ba780a="" type="image/webp" 
srcset="https://kream-phinf.pstatic.net/MjAyMzA5MDRfMjc2/MDAxNjkzODE4NTc1MjU4.
haFpb52nBQTBLuB--aDilrjspLDxBV9Fk27uD6sD7dYg.NUzBosBz1ovbPSmmEFgEWADPXDsGi80xAUhjd7a5Zi0g.JPEG/
a_c2a914ba8449467da0de7349eaa7593e.jpg?type=l_webp">
<source data-v-44ba780a="" 
srcset="https://kream-phinf.pstatic.net/MjAyMzA5MDRfMjc2/MDAxNjkzODE4NTc1MjU4.
haFpb52nBQTBLuB--aDilrjspLDxBV9Fk27uD6sD7dYg.NUzBosBz1ovbPSmmEFgEWADPXDsGi80xAUhjd7a5Zi0g.JPEG/
a_c2a914ba8449467da0de7349eaa7593e.jpg?type=l">
<img data-v-44ba780a="" alt="상품 이미지" 
src="https://kream-phinf.pstatic.net/MjAyMzA5MDRfMjc2/MDAxNjkzODE4NTc1MjU4.
haFpb52nBQTBLuB--aDilrjspLDxBV9Fk27uD6sD7dYg.NUzBosBz1ovbPSmmEFgEWADPXDsGi80xAUhjd7a5Zi0g.JPEG/
a_c2a914ba8449467da0de7349eaa7593e.jpg?type=l" loading="lazy" class="image full_width"> -->
                  <img src="files/${dto.pimage}" class="image full_width">
                  </picture>
                  <!---->
                  <!---->
                  <!---->
               </div>

               <div data-v-b57d39f0="" class="product_detail">
                  <strong data-v-b57d39f0="" class="model_number">${dto.pcode}</strong>
                  <p data-v-b57d39f0="" class="model_title">${dto.pname}</p>
                  <p data-v-b57d39f0="" class="model_ko">${dto.pgender}</p>
                  <div data-v-b57d39f0="" class="model_desc">
                     <p data-v-b57d39f0="" class="size_txt">${size}</p>
                     <!---->
                  </div>
               </div>
            </div>
         </div>

         <div class="price_descision_box">
            <ul class="price_list">
               <li class="list_item">
                  <p class="title">즉시 구매가</p> <span class="price">${dto.pprice}</span>
                  <span class="unit">원</span>
               </li>
               <li class="list_item">
                  <p class="title">즉시 판매가</p> <span class="price">${dto.pprice}</span>
                  <span class="unit">원</span>
               </li>
            </ul>

<input type="hidden" name="id" id="id" class="id" value="${loginMember.id}">
<section data-v-0eedeb11="" data-v-a81ebe06="">
    <div data-v-0eedeb11="" class="section_unit">
        <div data-v-0eedeb11="" class="section_content" style="display: none;">
            <div data-v-0eedeb11="" class="delivery_info">
                <div data-v-05a4f438="" data-v-0eedeb11="" class="address_info">
                    <dl data-v-05a4f438="" class="info_list">
                        <div data-v-05a4f438="" class="info_box">
                            <input type="hidden" name="cname">
                            <dt data-v-05a4f438="" class="title">받는 분</dt>
                            <dd data-v-05a4f438="" class="desc">(받을사람)</dd>
                        </div>
                        <div data-v-05a4f438="" class="info_box">
                            <input type="hidden" name="phone">
                            <dt data-v-05a4f438="" class="title">연락처</dt>
                            <dd data-v-05a4f438="" class="desc">(연락처)</dd>
                        </div>
                        <div data-v-05a4f438="" class="info_box">
                            <input type="hidden" name="address1">
                            <input type="hidden" name="address2">
                            <dt data-v-05a4f438="" class="title">배송 주소</dt>
                            <dd data-v-05a4f438="" class="desc">(주소1 + 주소2)</dd>
                        </div>
                    </dl>
                </div><a data-v-14ec1f2e="" data-v-0eedeb11="" href="#" class="btn btn_edit outlinegrey small"> 변경 </a>
            </div>
        </div>
    </div>
</section>




<div data-v-2077f721="" data-v-2969fd09="" data-v-0eedeb11="" class="layer_delivery layer md">
    <div data-v-2077f721="" class="layer_container">
        <a data-v-2969fd09="" data-v-2077f721="" href="#" class="btn_layer_close">
            <div data-v-2969fd09="" data-v-2077f721="">
                <span>X</span>
            </div>
        </a>
        <div data-v-2077f721="" class="layer_header">
            <h2 data-v-2969fd09="" data-v-2077f721="" class="title"></h2>
        </div>
        <div data-v-2077f721="" class="layer_content" style="display: none;">
            <div data-v-2969fd09="" data-v-2077f721="" class="delivery_bind">
                <div data-v-2969fd09="" data-v-2077f721="" class="delivery_input">
                    <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box" data-v-2077f721="">
                        <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">이름</h4>
                        <div data-v-5ee806c3="" class="input_item">
                            <input data-v-5ee806c3="" type="text" placeholder="수령인의 이름" autocomplete="off" class="input_txt text_fill"></div>
                        <p data-v-2969fd09="" data-v-5ee806c3="" class="input_error">올바른 이름을 입력해주세요. (2 - 50자)</p>
                    </div>
                    <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box" data-v-2077f721="">
                        <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">휴대폰 번호</h4>
                        <div data-v-5ee806c3="" class="input_item">
                            <input data-v-5ee806c3="" type="tel" id="tel" name="tel" placeholder="- 없이 입력" autocomplete="off" class="input_txt"></div>
                        <p data-v-2969fd09="" data-v-5ee806c3="" class="input_error">정확한 휴대폰 번호를 입력해주세요.</p>
                    </div>
                    <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box" data-v-2077f721="">
                        <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">우편번호</h4>
                        <div data-v-5ee806c3="" class="input_item">
                            <input data-v-5ee806c3="" type="text" name="zipcode" id="zipcode" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt">
                            <a data-v-14ec1f2e="" data-v-2969fd09="" href="#" class="btn btn_zipcode outline small" data-v-5ee806c3="" onclick="kakaopost()"> 우편번호 </a>
                        </div>
                    </div>
                    <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box" data-v-2077f721="">
                        <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">주소</h4>
                        <div data-v-5ee806c3="" class="input_item">
                            <input data-v-5ee806c3="" name="address1" id="address1" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt">
                        </div>
                    </div>
                    <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box" data-v-2077f721="">
                        <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">상세 주소</h4>
                        <div data-v-5ee806c3="" class="input_item">
                            <input data-v-5ee806c3="" name="address2" id="address2" type="text" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt">
                        </div>
                    </div>
                </div>
            </div>
            <div data-v-2969fd09="" class="v-portal" style="display: none;"></div>
            <div data-v-2969fd09="" data-v-2077f721="" class="layer_btn">
                <a data-v-14ec1f2e="" data-v-2969fd09="" href="#" class="btn btn_delete outlinegrey medium" data-v-2077f721=""> 취소 </a>
                <a data-v-14ec1f2e="" data-v-2969fd09="" href="#" class="btn btn_save solid medium" data-v-2077f721=""> 저장하기 </a>
            </div>
        </div>
        <div data-v-2077f721="" class="layer_content" style="display: none;">
            <div data-v-efbe323e="" data-v-2077f721="" class="list_wrap"><!---->
                <div data-v-1c284ef0="" data-v-efbe323e="" class="my_list" data-v-2077f721=""><!---->
                    <div data-v-1c284ef0="" class="other">
                        <div data-v-1c284ef0="" class="other_list">
                            <div data-v-7d49a47c="" class="my_item is_active select" data-v-1c284ef0="">
                                <div data-v-7d49a47c="" class="info_bind"><!---->
                                    <div data-v-be4e2246="" class="address_info" data-v-7d49a47c="">
                                        <div data-v-be4e2246="" class="name_box">
                                            <span data-v-be4e2246="" class="name">(1이름)</span>
                                            <span data-v-be4e2246="" class="mark">기본 배송지</span>
                                        </div>
                                        <p data-v-be4e2246="" class="phone">(1전화번호)</p>
                                        <div data-v-be4e2246="" class="address_box">
                                            <span data-v-be4e2246="" class="zipcode">(1우편번호)</span>
                                            <span data-v-be4e2246="" class="address">(1주소)</span>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-7d49a47c="" class="btn_bind">
                                    <span>O</span>
                                </div>
                            </div>
                            <div data-v-7d49a47c="" class="my_item select" data-v-1c284ef0="">
                                <div data-v-7d49a47c="" class="info_bind">
                                    <div data-v-be4e2246="" class="address_info" data-v-7d49a47c="">
                                        <div data-v-be4e2246="" class="name_box">
                                            <span data-v-be4e2246="" class="name">(2이름)</span>
                                        </div>
                                        <p data-v-be4e2246="" class="phone">(2전화번호)</p>
                                        <div data-v-be4e2246="" class="address_box">
                                            <span data-v-be4e2246="" class="zipcode">(2우편번호)</span>
                                            <span data-v-be4e2246="" class="address">(2주소)</span>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-7d49a47c="" class="btn_bind" style="display: none;">
                                    <span>O</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            <div class="instant_group">
               <div class="tab_area buy_tab">
                  <ul class="tab_list">
                     <li role="tab" aria-selected="false" class="item"
                        aria-controls="11"><a class="item_link" aria-controls="11">
                           판매 입찰</a></li>
                     <li role="tab" aria-selected="true" class="item on"
                        aria-controls="12"><a class="item_link" aria-controls="12">즉시
                           판매</a></li>
                  </ul>
               </div>
               <div class="price_now active_input" id="price_now_sell_now">
                  <dl class="price_now_box">
                     <dt class="price_now_title">즉시 판매가</dt>
                     <dd class="price">
                        <span class="amount">${dto.pprice}</span> <span class="unit">원</span>
                     </dd>
                  </dl>
                  <div class="price_warning" style="display: none;"></div>
               </div>
               <div class="price_now" id="price_now_sell_bid">
                  <dl class="price_now_box">
                     <dt class="price_now_title">판매 희망가</dt>
                     <dd class="price">
                        <input type="text" pattern="([0-9]+{0,1}[0-9]*,{0,1})*[0-9]"
                           placeholder="희망가 입력" required="required" class="input_amount">
                        <span class="unit">원</span>
                     </dd>
                  </dl>
               </div>
               <div class="price_bind">
                  <dl class="price_addition">
                     <dt class="price_title">
                        <span>검수비</span>
                     </dt>
                     <dd class="price_text">무료</dd>
                  </dl>
                  <dl class="price_addition">
                     <dt class="price_title">
                        <span>수수료</span>
                     </dt>
                     <c:set var="change" value="${(dto.pprice*(1/20))%10*10}" />
                     <dd class="price_text">
                        -
                        <fmt:formatNumber value="${change}" type="number" />원
                     </dd>
                  </dl>
                  <dl class="price_addition">
                     <dt class="price_title">
                        <span>배송비</span>
                        <!---->
                     </dt>
                     <dd class="price_text">선불 ・ 판매자 부담</dd>
                  </dl>
               </div>
               <div class="deadline_info_area">
                  <div class="section_title">
                     <h3 class="title_txt">입찰 마감기한</h3>
                  </div>
                  <div class="section_content">
                     <div class="bid_deadline">
                        <p class="deadline_txt">30일 (2024/02/04 마감)</p>
                        <div class="deadline_tab">
                           <a class="btn outlinegrey medium" onclick="selectDate(1)" id="1"> 1일 </a> 
                           <a class="btn outlinegrey medium" onclick="selectDate(3)" id="3"> 3일 </a> 
                           <a class="btn outlinegrey medium" onclick="selectDate(7)" id="7"> 7일 </a> 
                           <a class="btn outlinegrey medium is_active" onclick="selectDate(30)" id="30"> 30일 </a> 
                           <a class="btn outlinegrey medium" onclick="selectDate(60)" id="60"> 60일 </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="buy_total_confirm" is-instant="true">
                  <div class="price_total">
                     <dl class="price_box">
                        <dt class="price_title">정산금액</dt>
                        <dd class="price">
                           <span class="amount">${dto.pprice-charge}</span> <span
                              data-v-679d7250="" class="unit">원</span>
                        </dd>
                     </dl>
                     <span class="price_warning" style="display: none;"> <em>주의!
                     </em>
                     </span>
                  </div>
                  <div class="btn_confirm">
                     <a href="#" class="blind full solid false"> 계속하기 </a>
                     <button type="button" class="btn full solid false"
                        onclick="toSell()">즉시 판매 계속</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   </body>