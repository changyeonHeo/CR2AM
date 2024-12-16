<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- mypage/wishList.jsp -->

<%-- <%@ include file = "../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="mypage_side.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
hr {
   background-color: black;
   width: 100%;
   height: 3px;
}
p {
   margin-bottom: 0;
}

</style>

    <div class="mmmiddle_area">
       <div>
         <h4 class="log_info"> 관심 </h4>
         <hr>
      </div> 

    <c:if test="${empty listWish}">
      <div data-v-24868902="" class="empty_area" align="center">
      <p>추가하신 관심 상품이 없습니다.</p>
      </div>
   </c:if>

<c:forEach var="wish" items="${listWish}">
<li data-v-1a946b5f>
   <div data-v-1a946b5f class="wish_item2">
          
      <div data-v-1a946b5f="" class="wish_product">
         <div data-v-1a946b5f="" class="product_box">
            <div data-v-6805fc8a="" data-v-1a946b5f="" class="product" style="background-color: rgb(244, 244, 244);">
            <a href="productViewgo.do?pcode=${wish.pcode}">
            <picture data-v-44ba780a data-v-6805fc8a class="picture product_img">
               <img data-v-44ba780a="" alt="상품 이미지" src="/img/${wish.pimage}" 
               class="image full_width" style="width: 80px; height: 80px;">
            </picture></a>
            </div>
         </div>
            <div data-v-1a946b5f="" class="product_detail">
               <div>
                 <p data-v-1a946b5f class="brand-text">${wish.pbrand}</p>
               </div>
                 <p data-v-1a946b5f="" class="name">${wish.pname}</p>
            </div>
            <div data-v-37ab8099="" data-v-1a946b5f="" class="wish_buy">
            <div data-v-37ab8099="">
               <div data-v-0b6ddb6a="" data-v-37ab8099="" class="division_btn_box lg">
                  <button data-v-0b6ddb6a="" class="btn_action" style="background-color: rgb(239, 98, 83); width:160px">
					<strong data-v-0b6ddb6a="" class="title">구매</strong>
					<div data-v-0b6ddb6a="" class="price">
						<span data-v-0b6ddb6a="" class="amount">
						<em data-v-0b6ddb6a="" class="num">
							<fmt:formatNumber value="${wish.pprice}" pattern="###,###"/>
						</em>
						<span data-v-0b6ddb6a="" class="won">원</span></span>
						<span data-v-0b6ddb6a="" class="desc">즉시 구매가</span>
					</div></button>
               </div>
                  <a data-v-37ab8099="" href="#" class="wishButton" data-pcode="${wish.pcode}">
                      삭제
                  </a>
            </div>
         </div>
      </div>
   </div> 
</li>
</c:forEach>
<br><br>
<div align="center">
<c:if test="${startPage > pageBlock}">
        <a href="list_wish.do?pageNum=${startPage - pageBlock}&mem=${loginMember.mem}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i}]</b>
            </c:when>
            <c:otherwise>
                <a href="list_wish.do?pageNum=${i}&mem=${loginMember.mem}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <a href="list_wish.do?pageNum=${startPage + pageBlock}&mem=${loginMember.mem}">[다음]</a>
</c:if>
</div>
</div></div></div>

<%@ include file="../bottom2.jsp"%> 

<script>
$(document).ready(function () {
    // 페이지 로드 시 쿠키에서 위시 버튼 상태를 읽어와서 적용
    $('.wishButton').each(function () {
        var pcode = $(this).data('pcode');
        var mem = "${loginMember.mem}";
        var savedState = getCookie('wishState_' + mem + '_' + pcode);

        if (savedState) {
            $(this).data('state', savedState);
            updateWishButtonState($(this));
        }
    });

    $(document).on('click', '.wishButton', function (e) {
        e.preventDefault();

        var pcode = $(this).data("pcode");
        var mem = "${loginMember.mem}";
        var currentState = $(this).data("state");
        var currentButton = $(this);

        clickWishButton(mem, pcode, currentState, currentButton);
    });

    function clickWishButton(mem, pcode, currentState, currentButton) {
        // delete_wish.do만 호출하도록 수정
        $.ajax({
            url: "delete_wish.do",
            type: "POST",
            data: {mem: mem, pcode: pcode},
            dataType: "text",
            success: function (response) {

                // 버튼 상태 변경
                var newState = currentState === "unselected" ? "selected" : "unselected";
                currentButton.data("state", newState);

                // 버튼 아이콘 색상 변경
                updateWishButtonState(currentButton);

                // 쿠키에 상태 저장
                setCookie('wishState_' + mem + '_' + pcode, newState, 365); // 쿠키 유효 기간: 365일

                // 삭제된 항목에 해당하는 wish_item2을 숨김
                currentButton.closest('.wish_item2').hide();
                
                showNotification(response);//사라지는 알림창
            },
            error: function (xhr, status, error) {
                alert("에러 발생: " + xhr.responseText);
            }
        });
    }
    function showNotification(title, message) {
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
                });

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
        var iconColor = newState === "selected" ? "red" : "black";
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