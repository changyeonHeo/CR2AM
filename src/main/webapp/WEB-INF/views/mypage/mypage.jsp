<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- mypage/mypage.jsp -->
 
<%--  <%@ include file="top.jsp"%> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="mypage_side.jsp"%>

<!-- <link rel="stylesheet" type="text/css" href="resources/css/style_ctop.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="resources/css/style_main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style_mypage_All.css">
<link rel="stylesheet" type="text/css" href="css/style_main.css">

<script>
    function openPopup() {
        window.open('updateprofile.do?id=${loginMember.id}', 'Image Popup', 
              'width=500,height=300');
    }
</script>

<style>
.logo {
    display: flex;
    width: 125px;
    height: 25px;
    background-size: 250px 50px;
    content: "";
}

A:hover {
   color: black;
   text-decoration: none
   
}

.purchase_list_tab {
    background-color: #fafafa;
    border-radius: 12px;
    display: flex;
    table-layout: fixed;
    width: 100%;
}
.middle_list{
    display: block;
    margin-block-start: 5em;
    margin-block-end: 5em;
    margin-inline-start: 450px;
    margin-inline-end: 0px;
}
.social_feeds .feed_card {
    width: 20%;
    box-sizing: border-box;
}
.social_feed_mansory {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* 균등하게 해주는거 */
}
.purchase_list_tab.sell .tab_item.total .count {
    margin-inline-start: 0px; 
}
</style>


<div class="content_area my-page-content">

   <div class="v-portal" style="display: none;"></div>
      
      <div class="my_home" style="list-style: none;">
         <div data-v-ffa2bac2="" class="user_membership">
         <div data-v-ffa2bac2="" class="user_detail">
            <div class="user_thumb">
               <!-- <img src="/img/profile.png" width="100" class="thumb_img"> -->
            <c:if test="${empty getMember.proimg}">
                      <img src="img/profile.png" width="100">
                   </c:if>
                   <c:if test="${not empty getMember.proimg}">
                      <img src="img/${getMember.proimg}" width="100">
                   </c:if>   
                   <!-- <input type="button" value="이미지 변경" class="profileimg" name="proimg" onclick="openPopup()"> -->
            </div>
   
      <div class="user_info">
         <div class="info_box">
         <strong class="name">${loginMember.name}</strong>
            <p data-v-ffa2bac2="" class="email">${loginMember.email}</p>
               <a data-v-14ec1f2e="" data-v-ffa2bac2="" href="loginfo.do?id=${loginMember.id}"
                   class="btn btn outlinegrey small" type="button"> 로그인 정보 </a>
             <input type="button" value="이미지 변경" class="btn btn outlinegrey small" 
                   name="proimg" onclick="openPopup()">
         </div>
      </div>
   </div>

   <div data-v-d487a8ba="" data-v-ffa2bac2="" class="membership-menu">
      <a data-v-d487a8ba="" href="/my/point" class="menu-item">
         <div data-v-d487a8ba="" class="icon-wrap">
            <img data-v-d487a8ba="" src="/img/point.jpg" name="ico-my-shortcut-point" 
               width="28" height="28" class="icon">
            <span data-v-d487a8ba="" class="name" style="margin-left:9px;"> ${loginMember.point} </span>
         </div><%-- <span data-v-d487a8ba="" class="name">${loginMember.point}</span> --%>
      </a>
      <!-- 쿠폰 관련
      <a data-v-d487a8ba="" href="/my/coupon" class="menu-item">
         <div data-v-d487a8ba="" class="icon-wrap">
            <img data-v-d487a8ba="" src="/_nuxt/assets/ico-my-shortcut-coupon.b9a76933.svg" 
               name="ico-my-shortcut-coupon" width="28" height="28" class="icon"></div>
            <span data-v-d487a8ba="" class="name">쿠폰 수</span>
      </a> -->
      <a href="main.do" class="menu-item" style="margin-top: 20px; margin-right: 20px;">
         <div class="icon-wrap">
            <img src="/img/notice.png" name="ico-my-shortcut-announce" 
               width="28" height="28" class="icon">
            <span class="badge"></span>
         </div>
            <span data-v-d487a8ba="" class="name" style="margin-top:0;">공지사항</span>
      </a>
   </div>
</div>

<div class="inventory_box">
   <div data-v-3e19b064="" data-v-4a79505a="">
      <div class="my_home_title">
         <h3 class="title"> 구매 내역 </h3>
            <a href="buy.do" class="btn_more">
            <span data-v-6752ceb2="" class="btn_txt">더보기</span>
            </a>
      </div>

   <div class="recent_purchase">
      <div class="purchase_list_tab">
         <div class="tab_item total">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">전체</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>

         <div class="tab_item tab_on">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">입찰중</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>

         <div class="tab_item">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">진행중</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>

         <div class="tab_item">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">종료</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>
      </div>
   </div>
</div>

   <div data-v-4a79505a="">
      <div class="purchase_list all bid">
         <div class="empty_area">
            <c:if test="${blistCount == 0 && bauctionCount == 0}">
                  <div class="middle_list">거래 내역이 없습니다.</div>
               </c:if>
            <!-- <p data-v-24868902="" class="middle_list">거래 내역이 없습니다.</p> -->
         </div>
         <div class="v-portal" style="display: none;"></div>
      </div>
   </div>
   <div class="my_home_title">
      <h3 class="title"> 판매 내역 </h3>
         <a href="sell.do" class="btn_more">
            <span data-v-6752ceb2="" class="btn_txt">더보기</span>   
         </a>
   </div>

   <div class="recent_purchase">
      <div class="purchase_list_tab sell">
         <div class="tab_item total">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">전체</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>

         <div class="tab_item tab_on">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">입찰중</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>

         <div class="tab_item">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">진행중</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>
         
         <div class="tab_item">
            <a href="#" class="tab_link">
               <dl class="tab_box">
               <dt class="title">종료</dt>
               <dd class="count">0</dd>
               </dl>
            </a>
         </div>
      </div>
      
   <div data-v-4a79505a="">
      <div class="purchase_list all ask">
         <div class="empty_area">   
            <c:if test="${slistCount == 0 && sauctionCount == 0}">
               <p data-v-24868902="" class="middle_list">거래 내역이 없습니다.</p>
            </c:if>
            <!-- <p data-v-24868902="" class="middle_list">거래 내역이 없습니다.</p> -->
         </div>
         <div data-v-8c632d9a="" class="v-portal" style="display: none;"></div>
      </div>
   </div>
</div>

<br><br>

   <div class="my_home_title">
      <h3 class="title"> 관심 상품 </h3>
         <a href="list_wish.do?mem=${loginMember.mem}" class="btn_more">
            <span data-v-6752ceb2="" class="btn_txt">더보기</span>
         </a>
   </div>

   <c:if test="${empty listWish}">
      <fieldset style="background-color: #fafafa; border: 0px; border-radius: 12px;">
         <div class="mypage-wish-list" align="center">
            <p>추가하신 관심 상품이 없습니다.</p><br> 
            <a data-v-14ec1f2e="" data-v-24868902="" href="main.do"
               class="btn outlinegrey small" style="margin-bottom: 5px"> 
               SHOP 바로가기 
            </a>
         </div>
      </fieldset>
   </c:if>

   <div class="interest_product">
      <div class="product_list">
           <c:if test="${not empty listWish}">
            <c:forEach var="dto" items="${listWish}">
      <div data-v-17cb73ce="" data-v-4a79505a="" class="product_item2">
         <a href="productViewgo.do?pcode=${dto.pcode}" class="item_inner">
            <div class="thumb_box">
               <div data-v-6805fc8a="" data-v-17cb73ce="" class="product" style="background-color: rgb(244, 244, 244);">
               <!-- <div class="product_inner_tag display_tag_item">
               <span class="tag_text">  </span>
               </div> -->
                  <picture data-v-44ba780a="" data-v-6805fc8a="" class="picture product_img">
                     <img data-v-44ba780a="" src="/img/${dto.pimage}" class="image full_width">
                  </picture>
                  <span id="wishButton_${dto.pcode}" class="wishButton" data-pcode="${dto.pcode}" data-state="selected"> </span>
               </div>
               <div class="info_box">
                  <div class="brand">
                     <p data-v-17cb73ce="" class="brand-text"> ${dto.pbrand} </p>
                     <p data-v-17cb73ce="" class="name"> ${dto.pname} </p>
                        <div class="price">
                           <div class="amount lg">
                              <em class="num">
                                 <fmt:formatNumber value="${dto.pprice}" type="number" />원
                              </em>
                              <div data-v-17cb73ce="" class="desc">
                                 <p data-v-17cb73ce="" style="margin:3px 0px 3px;">즉시 구매가</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </a>
         </div>
            </c:forEach>
            </c:if>
         </div>
      </div>
   </div>
</div></div></div>


<!-- 
  <div id="header-mypage-menu" style="margin: 0px 0 30px 100px">
   <fieldset>
      <div style="margin-top: 0px">
         <img src="resources/img/profile.png" width="100">
      </div>
      <div style="margin-left: 5px">
         <a style="font-size: 20px; font-weight: bold;">${loginMember.name}</a><br>
         <a style="font-size: 15px; color: gray;">${loginMember.email}</a><br>
         <br> <a href="loginfo.do?id=${loginMember.id}"> <input
            type="button" value="로그인 정보" class="header-mypage-menu"
            style="background-color: white;">
         </a>
      </div>
      <div id="mypage-inner-menu">
         <div>
            <img src="resources/img/point.jpg" width="30">
            <div style="margin: 5px 0 0 5px">${loginMember.point}</div>
         </div>
         <div style="margin-left: 0px">
            <img src="resources/img/notice.png" width="30"
               style="margin-left: 20px"><br>
            <div style="margin: 5px 0 0 5px">공지사항</div>
         </div>
      </div>
   </fieldset>
   <br> <br> <br>
   <div style="margin-left: 0px; display: flex;">
      <h5>
         <strong>구매 내역</strong>
      </h5>
      <a class="more-mypage" href="buy.do">더보기 ></a>
   </div>
   <br>
   <fieldset style="background-color: #F8F7F7; border: 0px">
      <div class="look_box" data-v-4a9bf2df="">
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>전체</p>
               <p>
                  <font color="red"
                     style="margin-left: 7px; font-size: 20px; font-weight: bold;">${blistCount + bauctionCount}</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>입찰 중</p>
               <p>
                  <font color="black"
                     style="margin-left: 16px; font-size: 20px; font-weight: bold;">${bauctionCount}</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>진행 중</p>
               <p>
                  <font color="black"
                     style="margin-left: 16px; font-size: 20px; font-weight: bold;">0</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>종료</p>
               <p>
                  <font color="black"
                     style="margin-left: 7px; font-size: 20px; font-weight: bold;">${blistCount}</font>
               </p>
            </div>
         </div>
      </div>
   </fieldset>
   <c:if test="${blistCount == 0 && bauctionCount == 0}">
      <div class="mypage-prod-list">거래 내역이 없습니다.</div>
   </c:if>
   <br> <br>
   <div style="margin-left: 50px; display: flex;">
      <h5>
         <strong>판매 내역</strong>
      </h5>
      <a class="more-mypage" href="sell.do">더보기 ></a>
   </div>
   <br>
   <fieldset style="background-color: #F8F7F7; border: 0px">
      <div class="look_box" data-v-4a9bf2df="">
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>전체</p>
               <p>
                  <font color="green"
                     style="margin-left: 7px; font-size: 20px; font-weight: bold;">${slistCount + sauctionCount}</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>입찰 중</p>
               <p>
                  <font color="black"
                     style="margin-left: 16px; font-size: 20px; font-weight: bold;">${sauctionCount}</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>진행 중</p>
               <p>
                  <font color="black"
                     style="margin-left: 16px; font-size: 20px; font-weight: bold;">0</font>
               </p>
            </div>
         </div>
         <div class="look_list" data-v-4a9bf2df="">
            <div class="look_link" data-v-4a9bf2df="">
               <p>종료</p>
               <p>
                  <font color="black"
                     style="margin-left: 7px; font-size: 20px; font-weight: bold;">${slistCount}</font>
               </p>
            </div>
         </div>
      </div>
   </fieldset>
   <c:if test="${slistCount == 0 && sauctionCount == 0}">
      <div class="mypage-prod-list">거래 내역이 없습니다.</div>
   </c:if>
   <br> <br>
   <div style="margin-left: 50px; display: flex;">
      <h5>
         <strong>관심 상품</strong>
      </h5>
      <a class="more-mypage" href="list_wish.do?id=${loginMember.id}">
         더보기 >
      </a>
   </div>
   <br>
   <c:if test="${empty listWish}">
      <fieldset style="background-color: #F8F7F7; border: 0px">
         <div class="mypage-wish-list">
            <p>추가하신 관심 상품이 없습니다.</p><br> 
            <a data-v-14ec1f2e="" data-v-24868902="" href="main.do"
               class="btn outlinegrey small" style="margin-left: 35px"> 
               SHOP 바로가기 
            </a>
         </div>
      </fieldset>
   </c:if>
   <c:if test="${not empty listWish}">
      <c:forEach var="dto" items="${listWish}">
         <div style="margin: 0 0 40px 45px; display: inline-block;">
            <div style="position: relative; width: 204px">
               <img src="resources/img/${dto.pimage}" class="mypage_wish"> 
               <span id="wishButton_${dto.pcode}" class="wishButton"
                  data-pcode="${dto.pcode}" data-state="selected"> 
                  <i class="fa fa-heart" style="color: #CCCCCC; font-size: 20px;"></i>
               </span>
               <P>
                  <a data-v-1a946b5f class="brand-text">${dto.pbrand}</a>
               </P>
               <p data-v-1a946b5f="" class="name"
                  style="margin-bottom: 10px; white-space: pre-line;">${dto.pname}</p>
               <a style="font-weight: bold"><fmt:formatNumber
                     value="${dto.pprice}" type="number" />원</a>
            </div>
         </div>
      </c:forEach>
   </c:if> -->

<%@ include file="../bottom2.jsp"%>

<script>
   //위시 ajax----------
   $(document)
         .ready(
               function() {
                  // 페이지 로드 시 쿠키에서 위시 버튼 상태 및 찜 개수를 읽어와서 적용
                  $('.wishButton').each(
                        function() {
                           var pcode = $(this).data('pcode');
                           var id = "${loginMember.id}";
                           var savedState = getCookie('wishState_'
                                 + id + '_' + pcode);

                           if (savedState) {
                              $(this).data('state', savedState);
                              updateWishButtonState($(this));
                           }
                        });

                  $(document).on(
                        'click',
                        '.wishButton',
                        function(e) {
                           e.preventDefault();
                           var pcode = $(this).data("pcode");
                           var id = "${loginMember.id}";
                           var currentState = $(this).data("state");
                           var currentButton = $(this);

                           clickWishButton(id, pcode, currentState,
                                 currentButton);
                        });

                  function clickWishButton(id, pcode, currentState,
                        currentButton) {
                     var url = currentState === "unselected" ? "insert_wish.do"
                           : "delete_wish.do";

                     // 서버 요청 및 버튼 상태 변경은 이전과 동일
                     $
                           .ajax({
                              url : url,
                              type : "POST",
                              data : {
                                 id : id,
                                 pcode : pcode
                              },
                              dataType : "text",
                              success : function(response) {
                                 var newState = currentState === "unselected" ? "selected"
                                       : "unselected";
                                 currentButton.data("state",
                                       newState);
                                 updateWishButtonState(currentButton);

                                 // 쿠키에 상태 저장
                                 setCookie('wishState_' + id + '_'
                                       + pcode, newState, 365); //365=쿠키 유효 기간

                                 location.reload();
                              },
                              error : function(xhr, status, error) {
                                 alert("에러 발생: " + xhr.responseText);
                              }
                           });
                  }

                  function updateWishButtonState(button) {
                     var newState = button.data('state');
                     var iconColor = newState === "selected" ? "red"
                           : "#CCCCCC";
                     button.find('i').css('color', iconColor);
                  }

                  // 쿠키 관련 함수들
                  function setCookie(cookieName, cookieValue,
                        daysToExpire) {
                     var d = new Date();
                     d.setTime(d.getTime()
                           + (daysToExpire * 24 * 60 * 60 * 1000));
                     var expires = "expires=" + d.toUTCString();
                     document.cookie = cookieName + "=" + cookieValue
                           + ";" + expires + ";path=/";
                  }

                  function getCookie(cookieName) {
                     var name = cookieName + "=";
                     var decodedCookie = decodeURIComponent(document.cookie);
                     var cookieArray = decodedCookie.split(';');

                     for (var i = 0; i < cookieArray.length; i++) {
                        var cookie = cookieArray[i];
                        while (cookie.charAt(0) == ' ') {
                           cookie = cookie.substring(1);
                        }

                        if (cookie.indexOf(name) == 0) {
                           return cookie.substring(name.length,
                                 cookie.length);
                        }
                     }
                     return "";
                  }
               });
</script>