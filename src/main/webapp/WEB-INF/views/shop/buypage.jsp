<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- buypage.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="ctop.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_sell_size_check.css">
<link rel="stylesheet" type="text/css" href="css/style_ctop.css">
<link rel="stylesheet" type="text/css" href="css/tosell2.css">
<link rel="stylesheet" type="text/css" href="css/style-buyPage.css">
<link rel="stylesheet" type="text/css" href="css/style-insertAddress.css">
<link rel="stylesheet" type="text/css" href="css/style_address.css">
<link rel="stylesheet" type="text/css" href="css/style_buyaddress.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="js/addressTotal.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input[type='checkbox']:checked+label {
   display: block;
   width: 20px;
   height: 20px;
   background-image: url('img/checked.jpg');
   border: none;
}

.btn_confirm {
   padding: 0 32px 32px;
   margin-bottom: -30px;
}

.container .sell .tab_area .buy_tab .item.on .item_link {
   background-color: #ef6253;
}

.price_box .price {
   color: #ef6253;
}
a {
   text-decoration: none !important;
}
.label_txt {
	writing-mode: horizontal-tb;
}
.logo {
    display: flex;
    width: 125px;
    height: 25px;
    background-size: 250px 50px;
    content: "";
}
.select_area {
    min-height: 402px;
    padding: 22px 0 0 20px;
}
</style>
<script>
   $("span.title_txt").text("배송/결제");

   function updateButtonStyle(clickedButton) {
      $(".pay_select").removeClass("is_select");
      $("#" + clickedButton).addClass("is_select");

      if (clickedButton == 1) {
         document.getElementById("pg").value = 'kcp';
      } else if (clickedButton == 2) {
         document.getElementById("pg").value = 'naverpay';
      } else if (clickedButton == 3) {
         document.getElementById("pg").value = 'kakaopay';
      } else if (clickedButton == 4) {
         document.getElementById("pg").value = 'tosspay';
      }
   }

   $(document)
         .ready(
               function() {
                  $(".btn.full.solid").prop("disabled", true);
                  // notice_check클릭할때 화면이동 방지
                  $(".notice_check").click(
                        function(e) {
                           e.preventDefault();
                           var checkboxId = $(this).find(
                                 'input[type="checkbox"]')
                                 .attr('id');
                           selectCheckbox(checkboxId);
                        });

                  function selectCheckbox(checkboxId) {
                     var checkbox = $("#" + checkboxId);
                     checkbox.prop("checked", !checkbox.prop("checked"));
                     checkAllCheckboxes();
                  }

                  function checkAllCheckboxes() {
                     var checkboxes = $("[name='myCheck']");
                     var continueButton = $(".btn.full.solid");

                     continueButton
                           .prop(
                                 "disabled",
                                 checkboxes.filter(":checked").length !== checkboxes.length);

                     if (checkboxes.filter(":checked").length !== checkboxes.length) {
                        continueButton.click(function() {
                           alert("모두 체크하셔야 이동 가능합니다.");
                        });
                     } else {
                        continueButton.off("click");
                     }
                  }
               });

   var IMP = window.IMP;
   IMP.init("imp80888527");

   function requestPay() {
      if (document.getElementById("pg").value == '') {
         alert("결제 방법을 선택해 주세요.");
      } else {
         var pricce = Math.round(document.getElementById("total").value);
         $("#total").val(pricce);
         IMP.request_pay({
            pg : document.getElementById("pg").value,
            pay_method : 'card',
            merchant_uid : "merchant_" + new Date().getTime(),
            name : document.getElementById("pname").value,
            amount : Math.round(document.getElementById("total").value),
            buyer_email : document.getElementById("email").value,
            buyer_name : document.getElementById("name").value,
            buyer_tel : document.getElementById("hp").value,
            buyer_addr : document.getElementById("addr").value,
            buyer_postcode : document.getElementById("zip").value
         }, function(rsp) { // callback
            console.log(rsp);
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += '고유ID : ' + rsp.imp_uid;
               msg += '상점 거래ID : ' + rsp.merchant_uid;
               msg += '결제 금액 : ' + rsp.paid_amount;
               msg += '이름 : ' + rsp.name;
               alert(msg);
               $("#form").attr("action", "buyPage.do").submit();
            } else {
               alert("결재실패!!")
            }
         });
      }
   }
</script>
<form method="post" id="form" name="form">
   <input type="hidden" value="${dto.pnum}" name="pnum" id="pnum">
   <input type="hidden" value="${size}" name="size">
   <input type="hidden" value="${date}" name="date">
   <input type="hidden" value="${loginMember.mem}" id="mem">

   <div data-v-65b424ce="" data-v-0078c730=""
      class="container sell lg step-1">
      <div data-v-65b424ce="" class="content">
         <div data-v-f64cdfc8="" data-v-65b424ce="" class="buy_immediate">
            <div class="product_info_area">
               <div class="product_info">

                  <div data-v-6805fc8a="" data-v-b57d39f0="" class="product"
                     style="background-color: rgb(244, 244, 244);">
                     <div data-v-17ca498c="" data-v-6805fc8a=""
                        class="product_inner_tag display_tag_item">
                        <span data-v-17ca498c="" class="tag_text"></span>
                     </div>
                     <picture data-v-44ba780a="" data-v-6805fc8a=""
                        class="picture product_img"> <img
                        src="img/${dto.pimage}" class="image full_width"> </picture>
                  </div>

                  <div data-v-b57d39f0="" class="product_detail">
                     <strong data-v-b57d39f0="" class="model_number">${dto.pcode}</strong>
                     <p data-v-b57d39f0="" class="model_title">${dto.pname}</p>
                     <input type="hidden" id="pname" value="${dto.pname}">
                     <p data-v-b57d39f0="" class="model_ko">${dto.pgender}</p>
                     <div data-v-b57d39f0="" class="model_desc">
                        <p data-v-b57d39f0="" class="size_txt">${size}</p>
                     </div>
                  </div>

               </div>
            </div>
            <div class="divide"></div>
            <div class="price_descision_box" style="margin-top: 28px">
               <input type="hidden" name="id" id="id" class="id"
                  value="${loginMember.id}">
               <div data-v-0eedeb11="" class="section_title">
                  <h3 class="head_text">배송 주소</h3>
                  <a data-v-0eedeb11="" href="#" class="add_more_btn">+ 새 주소 추가</a>
               </div>
               <div data-v-0eedeb11="" class="section_content">
                  <a data-v-0eedeb11="" href="#" class="empty_delivery_info"> <span
                     data-v-0eedeb11="" class="guide_txt">주소를 추가해주세요.</span>
                  </a>
               </div>
               <div data-v-0eedeb11="" class="section_content"
                  style="display: none;">
                  <div data-v-0eedeb11="" class="delivery_info">
                     <div data-v-05a4f438="" data-v-0eedeb11="" class="address_info">
                        <dl data-v-05a4f438="" class="info_list">
                           <div data-v-05a4f438="" class="info_box">
                              <input type="hidden" name="cname">
                              <dt data-v-05a4f438="" class="title"><strong>받는 분</strong></dt>
                              <dd data-v-05a4f438="" class="desc">(받을사람)</dd>
                           </div>
                           <div data-v-05a4f438="" class="info_box">
                              <input type="hidden" name="phone">
                              <dt data-v-05a4f438="" class="title">연락처</dt>
                              <dd data-v-05a4f438="" class="desc">(연락처)</dd>
                           </div>
                           <div data-v-05a4f438="" class="info_box">
                              <input type="hidden" name="address1"> <input
                                 type="hidden" name="address2">
                              <dt data-v-05a4f438="" class="title">배송 주소</dt>
                              <dd data-v-05a4f438="" class="desc">(주소1 + 주소2)</dd>
                           </div>
                        </dl>
                     </div>
                     <a data-v-14ec1f2e="" data-v-0eedeb11="" href="#"
                        class="btn btn_edit outlinegrey small"> 변경 </a>
                  </div>
               </div>

               <div data-v-2077f721="" data-v-2969fd09="" data-v-0eedeb11=""
                  class="layer_delivery layer md" style="display: none;">
                  <div data-v-2077f721="" class="layer_container">
                     <a data-v-2969fd09="" data-v-2077f721="" href="#"
                        class="btn_layer_close">
                        <div data-v-2969fd09="" data-v-2077f721="">
                           <span>X</span>
                        </div>
                     </a>
                     <div data-v-2077f721="" class="layer_header">
                        <h2 data-v-2969fd09="" data-v-2077f721="" class="title"></h2>
                     </div>
                     <div data-v-2077f721="" class="layer_content"
                        style="display: none;">
                        <div data-v-2969fd09="" data-v-2077f721="" class="delivery_bind">
                           <div data-v-2969fd09="" data-v-2077f721=""
                              class="delivery_input">
                              <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                                 data-v-2077f721="">
                                 <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">이름</h4>
                                 <div data-v-5ee806c3="" class="input_item">
                                    <input data-v-5ee806c3="" type="text" placeholder="수령인의 이름"
                                       autocomplete="off" class="input_txt text_fill">
                                 </div>
                                 <p data-v-2969fd09="" data-v-5ee806c3="" class="input_error">
                                    올바른 이름을 입력해주세요. (2 - 50자)</p>
                              </div>
                              <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                                 data-v-2077f721="">
                                 <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">
                                    휴대폰 번호</h4>
                                 <div data-v-5ee806c3="" class="input_item">
                                    <input data-v-5ee806c3="" type="tel" id="tel" name="tel"
                                       placeholder="- 없이 입력" autocomplete="off" class="input_txt">
                                 </div>
                                 <p data-v-2969fd09="" data-v-5ee806c3="" class="input_error">
                                    정확한 휴대폰 번호를 입력해주세요.</p>
                              </div>
                              <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                                 data-v-2077f721="">
                                 <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">우편번호</h4>
                                 <div data-v-5ee806c3="" class="input_item">
                                    <input data-v-5ee806c3="" type="text" name="zipcode"
                                       id="zipcode" placeholder="우편 번호를 검색하세요" readonly="readonly"
                                       autocomplete="off" class="input_txt"> <a
                                       data-v-14ec1f2e="" data-v-2969fd09="" href="#"
                                       class="btn btn_zipcode outline small" data-v-5ee806c3=""
                                       onclick="kakaopost()"> 우편번호 </a>
                                 </div>
                              </div>
                              <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                                 data-v-2077f721="">
                                 <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">주소</h4>
                                 <div data-v-5ee806c3="" class="input_item">
                                    <input data-v-5ee806c3="" name="address1" id="address1"
                                       type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다"
                                       readonly="readonly" autocomplete="off" class="input_txt">
                                 </div>
                              </div>
                              <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                                 data-v-2077f721="">
                                 <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">
                                    상세 주소</h4>
                                 <div data-v-5ee806c3="" class="input_item">
                                    <input data-v-5ee806c3="" name="address2" id="address2"
                                       type="text" placeholder="건물, 아파트, 동/호수 입력"
                                       autocomplete="off" class="input_txt">
                                 </div>
                              </div>
                           </div>
                           <!-- 
						    <div class="delivery_check" style="width: auto; display: flex; align-items: center;">
						    <div class="checkbox_item">
						        <input id="check1" type="checkbox" name="" class="blind"> 
						        <label for="check1" class="check_label" style="display: flex; align-items: center;"> 
						            <svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-inactive"></svg> 
						            <span class="label_txt">기본 배송지로 설정</span>
						        </label>
						    </div>
							</div> -->
                        </div>
                        <div data-v-2969fd09="" class="v-portal" style="display: none;"></div>
                        <div data-v-2969fd09="" data-v-2077f721="" class="layer_btn">
                           <a data-v-14ec1f2e="" data-v-2969fd09="" href="#"
                              class="btn btn_delete outlinegrey medium" data-v-2077f721="">
                              취소 </a> <a data-v-14ec1f2e="" data-v-2969fd09="" href="#"
                              class="btn btn_save solid medium" data-v-2077f721=""> 저장하기
                           </a>
                        </div>
                     </div>
                     <div data-v-2077f721="" class="layer_content"
                        style="display: none;">
                        <div data-v-efbe323e="" data-v-2077f721="" class="list_wrap">
                           <div data-v-1c284ef0="" data-v-efbe323e="" class="my_list"
                              data-v-2077f721="">
                              <div data-v-1c284ef0="" class="other">
                                 <div data-v-1c284ef0="" class="other_list">
                                    <div data-v-7d49a47c="" class="my_item is_active select"
                                       data-v-1c284ef0="">
                                       <div data-v-7d49a47c="" class="info_bind">
                                          <div data-v-be4e2246="" class="address_info"
                                             data-v-7d49a47c="">
                                             <div data-v-be4e2246="" class="name_box">
                                                <span data-v-be4e2246="" class="name">(1이름)</span> <span
                                                   data-v-be4e2246="" class="mark">기본 배송지</span>
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
                                    <div data-v-7d49a47c="" class="my_item select"
                                       data-v-1c284ef0="">
                                       <div data-v-7d49a47c="" class="info_bind">
                                          <div data-v-be4e2246="" class="address_info"
                                             data-v-7d49a47c="">
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
                                       <div data-v-7d49a47c="" class="btn_bind"
                                          style="display: none;">
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
            </div>
            <div class="divide"></div>
            <div class="price_descision_box" style="margin-top: 28px">
               <div data-v-0eedeb11="" class="section_title">
                  <h3 class="head_text">결제 방법</h3>
               </div>
               <div>
                  <div data-v-2969fd09="" data-v-5ee806c3="" class="input_title"
                     style="display: flex;">
                     <div style="color: gray; font-size: 15px">
                        <strong>일반 결제</strong>
                     </div>
                     <div style="color: #D3D3D3; font-size: 11px; margin-left: 5px">일시불·할부</div>
                  </div>
                  <div style="display: flex; margin-top: 10px">
                     <a class="pay_select" onclick="updateButtonStyle(1)" id="1">신용카드
                     </a> <a class="pay_select" onclick="updateButtonStyle(2)" id="2">
                        네이버페이 <img src="img/npay.png"
                        style="width: 35px; height: 13px; margin-top: 3px" align="right">
                     </a> <a class="pay_select" onclick="updateButtonStyle(3)" id="3">
                        카카오페이 <img src="img/kakaopay.jpg"
                        style="width: 38px; height: 15px; margin-top: 2px" align="right">
                     </a> <a class="pay_select" onclick="updateButtonStyle(4)" id="4">
                        토스페이 <img src="img/toss.jpg"
                        style="width: 42px; height: 17px; margin-top: 1px" align="right">
                     </a> <input type="hidden" id="pg" value="">
                  </div>
                  <div style="margin-top: 10px; font-size: 12px; color: gray">
                     체결 후 결제 정보 변경은 불가하며 분할 납부 변경은 카드사 문의 바랍니다.<br> 단, 카드사별 정책에
                     따라 분할 납부 변경 시 수수료가 발생할 수 있습니다.
                  </div>
                  <div style="margin-top: 10px">
                     <div class="benefit">
                        <div class="benefit_object">현대카드</div>
                        <div class="benefit_content" style="margin-left: 50px">
                           즉시할인 4% + 특별 할부 혜택</div>
                     </div>
                     <div class="benefit">
                        <div class="benefit_object">토스</div>
                        <div class="benefit_content" style="margin-left: 72px">
                           40만원 이상 즉시할인 4%</div>
                     </div>
                     <div class="benefit">
                        <div class="benefit_object">삼성카드</div>
                        <div class="benefit_content" style="margin-left: 50px">
                           20만원 이상 LINK 청구할인 5천원</div>
                     </div>
                     <div class="benefit">
                        <div class="benefit_object">네이버페이</div>
                        <div class="benefit_content" style="margin-left: 40px">2만
                           포인트 적립</div>
                     </div>
                     <div class="benefit">
                        <div class="benefit_object">국민카드</div>
                        <div class="benefit_content" style="margin-left: 50px">
                           18개월 특별 할부 혜택</div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="divide"></div>
            <div class="price_descision_box" style="margin-top: 28px">
               <div data-v-0eedeb11="" class="section_title">
                  <h3 class="head_text">최종 주문정보</h3>
               </div>
               <div style="margin-top: 10px">
                  <div>
                     <div class="pay_object" style="color: black">구매가</div>
                     <div class="pay_content" style="font-weight: bold">
                        <fmt:formatNumber value="${dto.pprice}" pattern="#,###" />
                        원
                     </div>
                  </div>
                  <br>
                  <div style="margin-top: 5px">
                     <div class="pay_object">검수비</div>
                     <div class="pay_content">무료</div>
                  </div>
                  <br>
                  <div style="margin-top: 5px">
                     <div class="pay_object">수수료</div>
                     <c:set var="fee" value="${dto.pprice*(1/35)}" />
                     <div class="pay_content">
                        <fmt:formatNumber value="${fee}" pattern="#,###" />
                        원
                     </div>
                  </div>
                  <br>
                  <div style="margin-top: 5px">
                     <div class="pay_object">배송비</div>
                     <c:set var="dfee" value="3000" />
                     <div class="pay_content">
                        <fmt:formatNumber value="${dfee}" pattern="#,###" />
                        원
                     </div>
                  </div>
                  <br>
               </div>
            </div>
            <div class="divide"></div>
            <div style="padding: 0 32px">
               <ul class="check_list mo">
                  <li class="check_item_area"><a class="notice_check"
                     onclick="selectCheckbox('myCheck1')">
                        <div class="notice_group">
                           <p class="notice_main">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우,
                              거래가 취소될 수 있습니다.</p>
                           <p class="notice_sub">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래
                              진행 상태 알림을 받을 수 없습니다.</p>
                        </div>
                        <div class="checkbox_item">
                           <input type="checkbox" id="myCheck1" name="myCheck"> <label
                              for="myCheck1"></label>
                        </div>
                  </a></li>
                  <li class="check_item_area"><a class="notice_check"
                     onclick="selectCheckbox('myCheck2')">
                        <div class="notice_group">
                           <p class="notice_main">창고 보관을 선택한 경우, 구매자에게 배송되지 않고 KREAM
                              창고에 보관됩니다.</p>
                           <p class="notice_sub">검수 합격 후 보관이 완료되면 창고 이용료(현재 첫 30일 무료)가
                              결제됩니다.</p>
                        </div>
                        <div class="checkbox_item">
                           <input type="checkbox" id="myCheck2" name="myCheck"> <label
                              for="myCheck2"></label>
                        </div>
                  </a></li>
                  <li class="check_item_area" style="padding: 16px 0"><a
                     class="notice_check" onclick="selectCheckbox('myCheck3')">
                        <div class="notice_group">
                           <p class="notice_main">‘바로 결제하기’ 를 선택하시면 즉시 결제가 진행되며, 단순
                              변심이나 실수에 따른 구매 결정 후 취소는 불가능합니다.</p>
                           <p class="notice_sub">본 거래는 개인간 거래로 전자상거래법(제17조)에 따른
                              청약철회(환불, 교환) 규정이 적용되지 않습니다. 단, 조작 실수 등을 고려하여 계정당 하루 1회 구매를 거부할
                              수 있습니다.</p>
                        </div>
                        <div class="checkbox_item">
                           <input type="checkbox" id="myCheck3" name="myCheck"> <label
                              for="myCheck3"></label>
                        </div>
                  </a></li>
                  <li class="check_item_area"><a class="notice_check"
                     onclick="selectCheckbox('myCheck4')">
                        <div class="notice_group">
                           <p class="notice_main">구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</p>
                        </div>
                        <div class="checkbox_item">
                           <input type="checkbox" id="myCheck4" name="myCheck"> <label
                              for="myCheck4"></label>
                        </div>
                  </a></li>
               </ul>
            </div>
            <div class="price_descision_box" style="margin: 15px 0 5px">
               <div class="pay_object_total">총 결제금액</div>
               <c:set var="totalPay" value="${dto.pprice + fee + dfee}" />
               <div class="pay_content_total">
                  <fmt:formatNumber value="${totalPay}" pattern="#,###" />
                  원
               </div>
            </div>
            <input type="hidden" name="total" id="total" value="${totalPay}"> <input
               type="hidden" id="email" value="${loginMember.email}"> <input
               type="hidden" id="name" value="${loginMember.name}"> <input
               type="hidden" id="hp"
               value="${loginMember.hp1}-${loginMember.hp2}-${loginMember.hp3}">
            <input type="hidden" id="addr"
               value="${loginMember.address1 + loginMember.address2}"> <input
               type="hidden" id="zip" value="${loginMember.zipcode}">
            <div class="btn_confirm lg">
               <button type="button" class="btn full solid" name="buyBotton"
                  onclick="javascript:requestPay()">결제하기</button>
            </div>
</form>
</div>
</div>
</body>