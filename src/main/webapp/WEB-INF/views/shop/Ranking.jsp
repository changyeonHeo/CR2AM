<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- shop/Ranking.jsp -->    
    
<%@include file="../top_main.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css" href="/css/style_main.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.btn {
   box-shadow: none !important;
}
.title_wrap {
    height: auto;
}
.container{
    max-width: 1300px;
}
.title_wrap .title {
    font-weight: 700;
    font-size: 35px;
}
.status_value[data-v-6805fc8a] {
    font-size: 12px;
    line-height: 20px;
    position: absolute;
    right: 10px;
    top: 10px;
}
.display_tag_item.product_inner_tag[data-v-6805fc8a] {
    border-radius: 6px;
    display: flex;
    flex-direction: column;
    font-size: 13px;
    font-weight: 600;
    height: 26px;
    justify-content: center;
    left: 8px;
    line-height: 17px;
    padding: 0;
    position: absolute;
    text-align: center;
    top: 8px;
    width: 26px;
    z-index: 1;
}
    hr {
    	background-color: black;
    	height: 3px;
    	border-top:0;
	}
	.footer-tel, .footer-text, a {
		margin-left:0 !important;
	}
</style>

<div class="container">
      <div class="home lg">
         <div class="home_card_list">
            <div class="home_products">
               <div class="container_title">
               <br><br>
                  <div class="title_wrap">                                           
                        <div class="title"> ☻ </div>
                        <div class="ranking-title" style="font-size: 25px; font-weight: bold;"> 위시리스트 순위 </div>                     
                  </div>
                  <br><br>
               <div class="product_list_wrap lg">
               <div data-v-e7da870c="" class="product_list list_first horizontal_product_collection_medium">
                     <c:set var="num" value="${number}"/>
                      <c:forEach var="dto" items="${productList}" varStatus="loopStatus">
                    <c:set var="num" value="${loopStatus.index + 1}"/>
                    <c:if test="${dto.pwish ne 0}">
                          <div class="product_item" style="position: relative;">       
                       <!-- <div class="product_item"> -->
                     <a href="productview.do?pnum=${dto.pnum}&pcode=${dto.pcode}&pname=${dto.pname}" class="item_inner">
                           <div class="thumb_box">
                           <div data-v-6805fc8a="" data-v-17cb73ce="" class="product" style="background-color: rgb(244, 244, 244);">
                              
                              <div data-v-17ca498c="" data-v-6805fc8a="" class="product_inner_tag display_tag_item" 
                                 style="background-color: rgb(34, 34, 34); color: rgb(255, 255, 255);">
                                 <span data-v-17ca498c="" class="tag_text">
                              <c:out value="${num}"/>
                           </span>
                              </div>
                              
                              <picture data-v-44ba780a="" data-v-6805fc8a="" class="picture product_img">
                                  <img data-v-44ba780a=""
                                  src="/files/${dto.pimage}" 
                                  loading="lazy" class="image full_width">                  
                              </picture>
                              <div data-v-6805fc8a="" class="status_value">관심상품 ${dto.pwish}</div>
                           </div>
                           </div>               
                           <div class="info_box">
                              <div class="brand">               
                                 <p data-v-17cb73ce="" class="brand-text">${dto.pbrand}</p></div>
                                 <p data-v-17cb73ce="" class="name">(${dto.pgender}) ${dto.pname}</p>
                                    <div data-v-6481d7ba="" data-v-17cb73ce="" class="tags">
                                    <div data-v-17ca498c="" data-v-6481d7ba="" class="tag display_tag_item" 
                                    style="background-color: rgb(242, 249, 246); color: rgb(49, 180, 110);">
                                    </div></div>
                              <div data-v-17cb73ce="" class="price">
                              <div data-v-17cb73ce="" class="amount lg">
                                 <em data-v-17cb73ce="" class="num">
                                  <fmt:formatNumber value="${dto.pprice}" type="number" /> 원
                                 </em>
                              </div>               
                              <div data-v-17cb73ce="" class="desc"><p data-v-17cb73ce="">즉시 구매가</p></div>
                              </div>               
                              </div>
                        </a>             
                              <span id="wishButton_${dto.pcode}" class="wishButton" 
                                    data-pcode="${dto.pcode}" data-state="unselected">   
                         <i class="fa fa-heart" style="color: #gray; font-size: 20px;"></i>
                     </span>              
                        </div>
                        </c:if>
                        </c:forEach>
                        </div>
                     </div>
                     </div>
                  </div>
                  </div>
               </div>
<!--               <div align="center">
                  <ul>
                      <c:if test="${startPage > pageBlock}">
                              <li><a href="product.do?pageNum=${startPage-3}">이전</a></li>
                          </c:if>
                           <c:forEach var="i" begin="${startPage}" end="${endPage}">
                              <li><a href="product.do?pageNum=${i}">${i}</a></li>
                           </c:forEach>
                           <c:if test="${endPage < pageCount}">
                              <li><a href="product.do?pageNum=${startPage+3}">다음</a></li>
                           </c:if>
                      </ul>
               </div> -->   
         </div>
         <%@include file="../bottom2.jsp"%>
<script>
$(document).ready(function() {
        // 페이지 로드 시 쿠키에서 위시 버튼 상태를 읽어와서 적용
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
                data: {mem: mem, pcode: pcode},
                dataType: "text",
                success: function(response) {

                    // 버튼 상태 변경
                    var newState = currentState === "unselected" ? "selected" : "unselected";
                    currentButton.data("state", newState);
                    // 버튼 아이콘 색상 변경
                    updateWishButtonState(currentButton);

                    // 쿠키에 상태 저장
                    setCookie('wishState_' + mem + '_' + pcode, newState, 365); //365=쿠키 유효 기간
                    
                    showNotification(response, "", pcode, newState);//사라지는 알림창
                },
                error: function(xhr, status, error) {
                    alert("에러 발생: " + xhr.responseText);
                } 
            });
        }
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

        function updateWishButtonState(button) {
            var newState = button.data('state');
            var iconColor = newState === "selected" ? "red" : "gray";
            button.find('i').css('color', iconColor);
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