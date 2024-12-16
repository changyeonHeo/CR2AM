<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- main.jsp -->

<%@include file="top_main.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_main.css">
   
<style>
.btn {
   box-shadow: none !important;
}
.carousel-inner img {
  width: 100%;
  height: 580px;
}
.container{
    max-width: 1300px;
}

.title_wrap .title {
    font-weight: 700;
    font-size: 20px;
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

   <!-- Start of Container -->
   <div id="container">
   <!-- Start of Carousel -->
   <div id="demo" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
        <li data-target="#demo" data-slide-to="4"></li>
      </ul>
      <!-- The slideshow -->
      <div class="carousel-inner">
        <div align="center" class="carousel-item active">
          <img src="img/banner_Image1.webp" alt="ban-img-0">
        </div>
        <div align="center" class="carousel-item">
          <img src="img/banner_Image0.webp" alt="ban-img-1">
        </div>
        <div align="center" class="carousel-item">
          <img src="img/banner_Image2.webp" alt="ban-img-2">
        </div>
        <div align="center" class="carousel-item">
          <img src="img/banner_Image3.webp" alt="ban-img-3">
        </div>
        <div align="center" class="carousel-item">
          <img src="img/banner_Image4.webp" alt="ban-img-4">
        </div>
      </div>
        
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
     </div>
   
      <div class="container">
         <div class="home lg">
            <div class="home_card_list">  
            <div class="home_products">
               <div class="container_title">
                  <div class="title_wrap">
                     <div class="title" style="font:bold;"> CR2AM </div>
                     <div class="sub_title"> Kicks Rule Everything Around Me </div>
                  </div>
                  <br><br>
               <!-- <main id="main-prd"> -->
               <div class="product_list_wrap lg">
                  <div data-v-e7da870c="" class="product_list list_first horizontal_product_collection_medium">
                  <c:forEach var="listProduct" items="${listProduct}">
                      <div class="product_item" style="position: relative;">               
                  <!-- <div class="product_item"> -->
                     <%-- <a href="productview.do?pnum=${listProduct.pnum}" class="item_inner"> --%>
                     <a href="productview.do?pnum=${listProduct.pnum}&pcode=${listProduct.pcode}&pname=${listProduct.pname}" class="item_inner">
                        <div class="thumb_box">
                        <div data-v-6805fc8a="" data-v-17cb73ce="" class="product" style="background-color: rgb(244, 244, 244);">
                           <picture data-v-44ba780a="" data-v-6805fc8a="" class="picture product_img">
                            <img data-v-44ba780a=""
                            src="img/${listProduct.pimage}" 
                            loading="lazy" class="image full_width">                  
                        </div>
                        </div>
      
                        <div class="info_box">
                           <div class="brand">
                              <p data-v-17cb73ce="" class="brand-text">${listProduct.pbrand}</p></div>
                              <p data-v-17cb73ce="" class="name">(${listProduct.pgender}) ${listProduct.pname}</p>
                                 <div data-v-6481d7ba="" data-v-17cb73ce="" class="tags">
                                 <div data-v-17ca498c="" data-v-6481d7ba="" class="tag display_tag_item" style="background-color: rgb(242, 249, 246); color: rgb(49, 180, 110);">
                                 </div>
                                 </div>
                           <div data-v-17cb73ce="" class="price">
                              <div data-v-17cb73ce="" class="amount lg">
                                 <em data-v-17cb73ce="" class="num">
                                  <fmt:formatNumber value="${listProduct.pprice}" type="number" /> 원
                                 </em>
                              </div>               
                           <div data-v-17cb73ce="" class="desc"><p data-v-17cb73ce="">즉시 구매가</p></div>
                           </div>
                        </div>                        
                        </a>
                              <span id="wishButton_${listProduct.pcode}" class="wishButton"
                                   data-pcode="${listProduct.pcode}" data-state="unselected">
                                   <i class="fa fa-heart" style="color: #CCCCCC; font-size: 20px;"></i>
                                </span>
                     </div>
                     </c:forEach>
                  </div>
               </div>
            </div>      
            </div>
         </div>
      </div>
      </div>
   </div>

<%@ include file="bottom2.jsp"%>

<script>
   //위시 ajax----------
    $(document).ready(function() {
    // 페이지 로드 시 쿠키에서 위시 버튼 상태 및 찜 개수를 읽어와서 적용
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

        // 서버 요청 및 버튼 상태 변경은 이전과 동일
        $.ajax({
           url: url,
            type: "POST",
            data: {mem: mem, pcode: pcode},
            dataType: "text",
            success: function(response) {
                var newState = currentState === "unselected" ? "selected" : "unselected";
                currentButton.data("state", newState);
                updateWishButtonState(currentButton);
                
                // 쿠키에 상태 저장
                setCookie('wishState_' + mem + '_' + pcode, newState, 365); //365=쿠키 유효 기간
                
                showNotification(response, "", pcode, newState);
                
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
        var iconColor = newState === "selected" ? "red" : "#CCCCCC";
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