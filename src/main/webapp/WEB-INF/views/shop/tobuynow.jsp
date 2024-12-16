<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- tobuynow.jsp -->

<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
    <style>

    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
$(document).ready(function(){
    
})

        $(document).ready(function () {
            displayCurrentDate();
            $(".deadline_info_area").hide();


            // 버튼 클릭 시 날짜 계산 및 스타일 변경
            $(".btn").on("click", function () {
                var days = parseInt($(this).data("days"));
                updateDate(days);
                updateButtonStyle($(this));
            });

            // 판매 입찰 버튼 클릭 시 입찰 마감기한 부분을 토글
            $('.tab_area .item_link').on('click', function () {
                // 클릭된 탭에 해당 속성 추가
                $(this).parent('.item').addClass('on').attr({
                    'aria-selected': 'true'
                });

                // 클릭된 탭을 제외한 다른 탭에 해당 속성 제거
                $(this).parent('.item').siblings('.item').removeClass('on').attr({
                    'aria-selected': 'false'
                });

                // 판매 입찰 버튼을 클릭한 경우에만 입찰 마감기한 부분을 토글
                if ($(this).parent('.item').index() === 0) {
                    $(".deadline_info_area").toggle();
                } else {
                    // 다른 탭을 클릭한 경우 입찰 마감기한 부분을 숨김
                    $(".deadline_info_area").hide();
                }
            });
        });
        function displayCurrentDate() {
            var currentDate = new Date();
            var formattedDate = formatDate(currentDate);
            $("#current-date").text("오늘 날짜: " + formattedDate);
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
            clickedButton.addClass("is_active");
        }
    </script>
    <link rel="stylesheet" href="../../css/tosell2.css">
</head>

<body>
    <div class="content_wapper">
        <div class="content">
            <div class="product_info_area">
                <div class="product_info">
                    <div class="product">
                        <img src="../../picture/다운로드.jpg
                    " class="image full_width">
                    </div>
                    <div class="product_detail">
                        <strong class="model_detail">(상품번호)</strong>
                        <p class="model_title">(일반)</p>
                        <p class="model_ko">(한글)</p>
                        <div class="model_desc">
                            <p class="size_txt">(사이즈)</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="price_descision_box">
                <ul class="price_list">
                    <li class="list_item">
                        <p class="title">즉시 구매가</p>
                        <span class="price">(가격)</span>
                        <span class="unit">원</span>
                    </li>
                    <li class="list_item">
                        <p class="title">즉시 판매가</p>
                        <span class="price">(가격)</span>
                        <span class="unit">원</span>
                    </li>
                </ul>
                <div class="instant_group">
                    <div class="tab_area buy_tab">
                        <ul class="tab_list">
                            <li class="item">
                                <a class="item_link" aria-controls="11">판매 입찰</a>
                            </li>
                            <li role="tab" aria-selected="true" class="item on" aria-controls="12">
                                <a class="item_link">즉시 판매</a>
                            </li>
                        </ul>
                    </div>
                    <div class="price_now" hidden>
                        <dl class="price_now_box">
                            <dt class="price_now_title"> 즉시 판매가 </dt>
                            <dd class="price">
                                <span class="amount">(즉시 판매가격)</span>
                                <span class="unit">원</span>
                            </dd>
                        </dl>
                        <div class="price_warning" style="display: none;">
                        </div>
                    </div>
                    <div class="price_now active_input">
                        <dl class="price_now_box">
                            <dt class="price_now_title"> 판매 희망가</dt>
                            <dd class="price">
                                <input type="text" pattern="([0-9]+{0,1}[0-9]*,{0,1})*[0-9]" placeholder="희망가 입력"
                                    required="required" class="input_amount">
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
                            <dd class="price_text">(수수료)원</dd>
                        </dl>
                        <dl class="price_addition">
                            <dt class="price_title"><span>배송비</span><!----></dt>
                            <dd class="price_text">선불 ・ 판매자 부담</dd>
                        </dl>
                    </div>
                </div>
                <div class="deadline_info_area">
                    <div class="section_title">
                        <h3 class="title_txt">입찰 마감기한</h3>
                    </div>
                    <div class="section_content">
                        <div class="bid_deadline">
                            <p class="deadline_txt"></p>
                            <div class="deadline_tab">
                                <a class="btn outlinegrey medium" data-days="1">1일</a>
                                <a class="btn outlinegrey medium" data-days="3">3일</a>
                                <a class="btn outlinegrey medium" data-days="7">7일</a>
                                <a class="btn outlinegrey medium is active" data-days="30">30일</a>
                                <a class="btn outlinegrey medium" data-days="60">60일</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="buy_total_confirm" is-instant="true">
                    <div class="price_total">
                        <dl class="price_box">
                            <dt class="price_title"> 정산금액 </dt>
                            <dd class="price">
                                <span class="amount">(금액에 - 수수료)</span>
                                <span data-v-679d7250="" class="unit">원</span>
                            </dd>
                        </dl>
                        <span class="price_warning" style="display: none;">
                            <em>주의! </em>
                        </span>
                    </div>
                    <div class="btn_confirm">
                        <a href="#" class="blind full solid false"> 계속하기 </a>
                        <button type="button" class="btn full solid false"> 즉시 판매 계속 </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>

</html>