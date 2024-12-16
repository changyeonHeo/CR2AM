<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- productView.jsp -->

<%@include file="../top_mylog.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_shopprod_view.css">
<link rel="stylesheet" type="text/css" href="css/style_bottom.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
   $(document).ready(function() {
      $("button[name='tosell']").click(function() {
         location.href = "tosell.do?pnum=" + '${dto.pnum}';
      });
      $("button[name='tobuy']").click(function() {
         location.href = "tobuy.do?pnum=" + '${dto.pnum}';
      });

   })
   
</script>
<script>
  $(document).ready(function() {
    $(".write_img a").click(function(e) {

      var isLoggedIn = "${loginMember.id}" && "${loginMember.id}" !== "null" && "${loginMember.id}" !== "empty";

      if (!isLoggedIn) {
        e.preventDefault();
        alert("로그인 후 작성 가능합니다.");
      }
    });
  });
</script>
<style>
textarea {
    -webkit-appearance: none;
    background-color: transparent;
    border: 0;
    border-radius: 0;
    outline: 0;
    padding: 0;
    width: 100%
}
.picture.product_img {
    max-height: 100%; 
    overflow-y: auto; 
}
/* .picture.product_img img {
    width: auto;
    height: auto;
} */
 .container{
    max-width: 1300px;
}
.content[data-v-2e141d90] {
   margin-top: auto;
   margin-left: auto;
   margin-right: auto;
   margin-bottom: auto;
   max-width: 1277px;
   overflow: hidden;
   padding: 30px 40px 0px;
}
.test {
    position: relative;
    z-index: 1;
    opacity: 1;
    background: #fff;
    margin-bottom: 13px;
}

.footer-all {
   margin-top: -20px;
   height: 350px;
   background-color: #fff;
   display: block;
   z-index: 1;
   opacity: 1;
   padding: 30px 290px 0px;
}
.styled-table th, .styled-table td {
        border: 6px solid #454545c9;
        border-radius: 5px;
    }
.social_feeds {
    display: flex;
    flex-wrap: wrap;
}

.social_feeds .feed_card {
    width: 20%;
    box-sizing: border-box;
    padding: 10px;
}
.write_img {
   margin-top : -40px;
   margin-bottom : 15px;
   padding-left : 1150px;
}
	hr {
    	background-color: black !important;
    	height: 3px !important;
    	border-top:0 !important;
	}
	.footer-tel, .footer-text, a {
		margin-left:0 !important;
	}
	.footer-all {
		padding-left: 37px;
		padding-right: 37px;
		}
		
	.product_img[data-v-6805fc8a] {
		width: 0;
	}	                           

</style>

<html>
<head>
<title> CREAM | 한정판 거래의 FLEX </title>
</head>
<body>

   <div class="portal_target vue-portal-target"> </div>

   <div class="center title">
      <!-- <div data-v-6695735c="" class="portal_target vue-portal-target"></div> --></div>
   <div class="vue-portal-target"> </div>

   <div data-v-2e141d90="" class="content">
      <div class="container detail lg">
         <h2 data-v-2e141d90="" class="blind"> 상품 상세 </h2>
            <div class="column_bind">
               <div class="column">
               <div class="spread"></div>
               <div class="column_box" style="width: 560px;">
               <div class="detail_banner_area lg">
               <div data-v-6d15d8fc="">
               <div class="flicking-viewport" 
                  style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">            
               <div class="flicking-camera" style="transform: translate(0px);">
                  <div class="slide_content">
                  <div class="product" style="background-color: #FFFFFF;">
                  <div class="product_inner_tag display_tag_item">
                  <span class="tag_text"> </span>
                  </div>
               <picture class="picture product_img">
                <img alt="상품 이미지" src="/files/${dto.pimage}" loading="auto" 
                    fetchpriority="high" class="image full_width"
                    style="width: 80%; height: 100%; display: block; margin: 0 auto;">
               </picture> 

               </div>
               </div>
               
            <div class="slide_content" style="background-color: rgb(246, 238, 237);">
               <div class="product" style="background-color: rgb(246, 238, 237);">
                  <div class="product_inner_tag display_tag_item">
                     <span class="tag_text">  </span></div>
                     </div></div>
                     <div class="slide_content" style="background-color: rgb(246, 238, 237);">
                     <div class="product" style="background-color: rgb(246, 238, 237);">
                     <div class="product_inner_tag display_tag_item">
                        <span class="tag_text"> </span>
                     </div></div></div>
                  </div>

            <div class="flicking-pagination flicking-pagination-bullets"></div>
            </div></div></div>

            <div class="product-linked-group-list"></div>
               <div class="banner_alert lg"></div>
            </div></div>

            <div class="column">
               <div class="column_box">
                  <div class="column_top">
                     <div class="price-container">
                        <div class="price-text-container">
                           <p data-v-da58a2f2="" data-v-2387e107="" class="price-label display_paragraph" style="color: rgb(34, 34, 34);">즉시 구매가</p>
                           <p data-v-da58a2f2="" data-v-2387e107="" class="price display_paragraph" style="color: rgb(34, 34, 34);">
                              <fmt:formatNumber value="${dto.pprice}" pattern="###,###" />
                           </p>
                           <p class="price-description display_paragraph"></p>
                        </div>

                     <div class="layer-coupon-container">
                     <div class="v-portal" style="display: none;"></div>
                     </div></div>

                  <div class="main-title-container">
                  <p data-v-e50e2e68="" class="title" style="font-weight:530;"> ${dto.pname} </p>
                  <p data-v-e50e2e68="" class="sub-title"> ${dto.pcode} </p>
                  </div>

                  <div class="product_figure_wrap lg"></div>               
                     <div class="product_info_wrap">
                        <div class="detail_product_wrap">
                           <dl class="detail-product-container is-variable-font-size">
                              <div class="detail-price">
                              <div class="title-text"> 브랜드 </div>
                        <div data-v-2e0618fe="">
                           <span class="price-info"> ${dto.pbrand} </span><br>
                              <!-- <div data-v-2e0618fe="" class="fluctuation increase">
                              <span data-v-2e0618fe="" class="triangle">▲</span>
                              <span data-v-2e0618fe="">2,000 (+0.9%)</span></div> -->
                        </div></div>
                     <div class="detail-box">
                        <div class="product_title"> 성별 </div>
                        <div class="product_info"> ${dto.pgender} </div></div>
                     
                     <div class="detail-box">
                        <div class="product_title"> 분류 </div>
                        <div class="product_info"> ${dto.csname} </div></div>
                     <div class="detail-box">
                        <div class="product_title"> 등록일 </div>
                        <div class="product_info"> ${dto.pinputdate} </div></div>
                     
                     <div class="detail-box">
                        <div class="product_title"> 포인트 </div>
                        <div class="product_info color-target"> ${dto.ppoint} </div>
                     </div></dl>
                        <div class="product_title"> 상품소개  </div> <br>
                        <textarea name="pcontents" rows="5" cols="50" readOnly> ${dto.pcontents}</textarea>
                     </div>
                     </div>
                  
                  <div class="btn_wrap">
                     <div class="division_btn_box lg">
                        <a href="#" disabled="disabled" class="blind btn_division">버튼</a>
                           <button name="tobuy" class="btn_action" style="background-color: rgb(239, 98, 83);">
                              <strong class="title">구매</strong>
                           <div class="price">
                              <span class="amount">
                              <em class="num">
                                 <fmt:formatNumber value="${dto.pprice}" pattern="###,###" />
                              </em>
                                 <span class="won">원</span></span>
                                 <span class="desc">즉시 구매가</span>
                              </div></button>
                  
                           <button name="tosell" class="btn_action" style="background-color: rgb(65, 185, 121);">
                              <strong class="title">판매</strong>
                           <div class="price">
                              <span class="amount">
                              <em data-v-0b6ddb6a="" class="num">
                                 <fmt:formatNumber value="${dto.pprice}" pattern="###,###" />
                              </em>
                                 <span class="won">원</span></span>
                                 <span class="desc">즉시 판매가</span>
                              </div></button>
                           </div>
                              <a href="#" class="btn full outlinegrey large btn_wish" aria-label="관심상품">                  
                                 <span id="wishButton_${dto.pcode}" class="wishButton" data-pcode="${dto.pcode}" data-state="unselected" style=" display: flex;">
                                    <i class="fa fa-heart wish-icon" style="color: gray; font-size: 20px; margin-right: 5px;"></i>
                                 </span>
                                 <span class="btn_text">관심상품</span>
                                 <span class="wish_count" id="wishTable">${prodWish}</span>
                              </a>
                           </div></div>
                              <div class="display_sections">
                              <div class="display_section_wrap">
                              <div class="display_item">
                              <div class="delivery_way_wrap">
                              <div class="delivery-title-wrapper">
                                 <h3 class="detail_title lg"> 배송 정보 </h3></div>
                                    <div class="delivery_way">
                                    <div class="way_info">
                                    <div class="way-status-thumbnail">
                                    <img src="/img/delivery.jpg" alt="3,000원" class="way_img"></div>
                  
                  <div class="way_desc">
                  <p class="company">
                  <span class="badge_title">일반배송 </span>
                  <spanclass="title">3,000원</span></p>
                  <p class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</p></div></div></div></div>
                  
                  <div data-v-4152dfaa="">
                  <div class="point_guide">
                  <ul class="guide_list">
                  <li class="guide_item">
                  <div class="thumb_area">
                  
                  <img class="img icon sprite-icons" width="35" height="35" src="/img/1st.jpg">
                  </div>
                  
                  <div class="text_area">
                     <strong class="title">100% 정품 보증</strong>
                     <p class="desc">KREAM에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</p>
                  </div>
                  </li>                  
                     <li class="guide_item">
                  <div class="thumb_area">               
                     <img class="img icon sprite-icons" width="35" height="35" src="/img/3rd.jpg">
                  </div>
                  
                  <div class="text_area">
                  <strong class="title">엄격한 다중 검수</strong>
                  <p class="desc">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</p>
                  </div>
                     </li>
                  
                  <li class="guide_item"><div class="thumb_area">
                  <img class="img icon sprite-icons" width="35" height="35" src="/img/2nd.jpg">
                  </div>
                  
                  <div class="text_area">
                  <strong class="title">정품 인증 패키지</strong>
                  <p class="desc">검수에 합격한 경우에 한하여 CR2AM의 정품 인증 패키지가 포함된 상품이 배송됩니다.</p>
                  </div></li></ul></div></div></div>
                  </div></div></div></div> </div>
                  
                  <div class="test" id="test">
                     <div class="product_detail_item_content">               
                     <div data-v-6804fbc8="" data-v-35239e09="" class="product_detail_item_wrap detail_item">
                     <div class="feed_area detail_reviews">
                     <div class="detail_item_title feed_title">
                        <p class="product_detail_item_title reviews"> STYLE :) </p>
                     </div>
                  <br>
                     <div class="write_img">
                        <a href="review_writeForm.do?rproduct=${dto.pname}">
                          <img src="img/write.jpg" id="header-logo-img" 
                                   style="width: 50px; height: 30px; vertical-align: middle;"/></a>                     
                     </div>

                  <div data-v-fa9bbe1c=""> 
                     <c:if test="${empty prodReviewList}">
                           <h3>등록된 게시물이 없습니다.</h3>
                     </c:if> 
                     <div class="social_feed_mansory social-feeds social_feeds grid_4">
                     <c:forEach var="review" items="${prodReviewList}">               
              
                     <div class="feed_card item square">
                        <a href="review_content.do?rnum=${review.rnum}&id=${review.id}" class="">
                           <div class="card_box">
                           <div class="social_image_box square">
                              <picture data-v-44ba780a="" data-v-646685ef="" class="picture social_img">
                              <img data-v-44ba780a="" src="/files/${review.rimage}" loading="lazy" class="image full_width">
                              </picture></div>                  
                           <div class="card_detail">
                           <div class="user_box">
                              <span class="user_name user_name">
                              <span data-v-7ddd6c4e="">${review.id}</span></span></div>
                              <div class="user_box">
                              <span class="user_name user_name">
                              <span data-v-7ddd6c4e="">${review.rtitle}</span></span></div>
                              <div class="user_box">
                              <span class="user_name user_name">
                              <span data-v-7ddd6c4e=""> ${review.regdate}</span></span>
                              </div>
                           </div>
                        </div>
                        </a>
                     </div>
                  </c:forEach>
               </div>            
            <br>
<%--                <div align="center">   
             <c:if test="${startPage > pageBlock}">
                <a href="list_review.do?pageNum=1&rproduct=product1">[처음]</a>
                <a href="list_review.do?pageNum=${startPage - pageBlock}&rproduct=product1">[이전]</a>
            </c:if>
         
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <b>[${i}]</b>
                    </c:when>
                    <c:otherwise>
                        <a href="list_review.do?pageNum=${i}&rproduct=product1">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
         
            <c:if test="${endPage < pageCount}">
                <a href="list_review.do?pageNum=${startPage + pageBlock}&rproduct=product1">[다음]</a>
            </c:if>
            </div>    --%>
            </div>
         </div>
      </div>
      </div></div></div></div>

      <div class="test" id="test">
         <footer class="footer-all">  
            <div class="frame">
               <div class="footer-division-1">
                   <hr style="width: 100%; border-color: #757575;">
                   <br>
                  <div class="footer-tel"> 고객센터 1234-5678</div>
                  <div class="footer-text"> 영업시간 : AM 10:00 ~ PM 17:00(주말 및 공휴일 휴무) </div>
                  <div class="footer-text"> 점심시간 : PM 12:30 ~ PM 13:30 </div><br>
                  <strong><a href="terms2.do" style="color: black;">이용약관 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="terms3.do" style="color: black;"> 개인정보처리방침 </a></strong>
               </div>
               <div class="footer-division-2">
                  <div class="footer-text"> 회사명 : (주)CR2AM | 대표이사:안윤희 | 사업자등록번호:000-00-00000 | 호스팅사업자:(주)CR2AM </div>
                  <div class="footer-text"> 주소 : (00000) 서울특별시 강남구 </div>
                  <div class="footer-text"> 개인정보관리책임자 : 안윤희 </div>
                  
               </div>      
            </div>
         </footer>
      </div>
   </body>
</html>

<script>
//위시 ajax
$(document).ready(function() {
    // 페이지 로드하면 쿠키에서 위시 버튼 상태를 읽어와서 적용
    $('.wishButton').each(function() {
        var pcode = $(this).data('pcode');
        var mem = "${loginMember.mem}";
        var savedState = getCookie('wishState_' + mem + '_' + pcode);

        if (savedState) {
            $(this).data('state', savedState);
            updateWishButtonState($(this));
        }
    });

    function checkLogin() {
        var id = "${loginMember.id}";
        return id && id !== null;
    }

    $(document).on('click', '.wishButton', function(e) {
        e.preventDefault();

        var isLoggedIn = checkLogin();
        if (!isLoggedIn) {
            alert("로그인 후 이용해주세요.");
            return false;
        } else if(${loginMember.id eq 'admin'}) {
           alert("관리자는 관심이 불가합니다");
           return false;
        }

        var pcode = $(this).data("pcode");
        var mem = "${loginMember.mem}";
        var currentState = $(this).data("state");
        var currentButton = $(this);

        clickWishButton(mem, pcode, currentState, currentButton);
    });

    function clickWishButton(mem, pcode, currentState, currentButton) {
        var url = currentState === "unselected" ? "insert_wish.do" : "delete_wish.do";

        $.ajax({
            url: url,
            type: "POST",
            data: { mem: mem, pcode: pcode },
            dataType: "text",
            success: function(response) {
               
            loadWish(pcode);
                // 버튼 상태 변경
                var newState = currentState === "unselected" ? "selected" : "unselected";
                currentButton.data("state", newState);
                // 버튼 아이콘 색상 변경
                updateWishButtonState(currentButton);
                // 쿠키에 상태 저장
                setCookie('wishState_' + mem + '_' + pcode, newState, 365); // 365=쿠키 유효 기간

                showNotification(response, "", pcode, newState); // 사라지는 알림창
                
            },
            error: function(xhr, status, error) {
                alert("에러 발생: " + xhr.responseText);
            }
        });
    }
   //밑에 뜨는 검은색 찜완료 알림창
    function showNotification(title, message, pcode, currentState) {
        var notification = $("<div>")
            .addClass("notification")
            .text(title)
            .css({
                position: "fixed",
                bottom: "20px",
                left: "50%",
                transform: "translate(-50%, -50%)",
                backgroundColor: "#000",
                padding: "10px",
                borderRadius: "5px",
                textAlign: "center",
                color: "white",
                cursor: currentState === "selected" ? "pointer" : "auto",
            });

        notification.data("state", currentState);
        notification.data("pcode", pcode);
        notification.click(function() {
            if ($(this).data("state") === "selected") {
                window.location.href = "list_wish.do?mem=${loginMember.mem}";
            }
        });

        if (currentState === "selected") {
            var smallText = $("<span>")
                .addClass("smallText")
                .text("보러가기")
                .css({
                    fontSize: "12px",
                    marginLeft: "80px",
                    textDecoration: "underline",
                });
            notification.append(smallText);
        }

        $("body").append(notification);

        // 2초 후에 알림 창 숨기기
        setTimeout(function() {
            notification.fadeOut("slow", function() {
                $(this).remove();
            });
        }, 2000);
    }
   //버튼 상태에 따라 아이콘 색 변경
    function updateWishButtonState(button) {
        var newState = button.data('state');
        var iconColor = newState === "selected" ? "red" : "gray";
        button.find('i').css('color', iconColor);
    }
   
    function loadWish(pcode) {
        $.ajax({
            url: "getWish.do",
            type: "GET",
            data: { pcode: pcode },
            dataType: "json",
            success: function(response) {
                updateWishCount(response.wishCount);
            },
            error: function(xhr, status, error) {
                console.error("에러 발생: " + xhr.responseText);
            }
        });
    }

    function updateWishCount(wishCount) {
        $("#wishTable").text(wishCount); // 가져온 wishCount 값으로 업데이트
    }

    // 쿠키 관련 함수들
    function setCookie(cookieName, cookieValue, daysToExpire) {
        var d = new Date();
        d.setTime(d.getTime() + (daysToExpire * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
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
                return cookie.substring(name.length, cookie.length);
            }
        }
        return "";
    }
});
</script>