<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- toSellChooseSize.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ include file="ctop.jsp" %>

<link rel="stylesheet" type="text/css" href="css/style_sell_size_check.css">

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

                            <script>

                        $(document).on('click', '.select_link', function () {

                            $(".order_btn_area").show();
                            $(".order_btn_area").find("span.order_price").text($(this).find("span.price").text());
                            $(this).parent('.select_item').addClass('active').attr({ 'aria-selected': 'true' });
                            $(this).parent('.select_item').siblings('.select_item').removeClass('active').attr({ 'aria-selected': 'false' });
                        });

                        $(function () {
                            $(".title_txt").text("판매하기");
                            $(".order_btn_area").hide();
                            var product_name = $("#pname").val();
                            console.info(product_name);
                            callSizeList(product_name);
                            $("#sellButton").on('click', function () {
                                alert($(".select_item[aria-selected='true']").find("span.price").text());
                                location.href = "sell_checklist.do?pnum=" + $("input[id='pnum']").val() + "&size=" + $(".select_item[aria-selected='true']").find("span.size").text() + "&price=" + $(".select_item.active").find("span.price").text();
                            })

                            function callSizeList(product_name) {
                            console.info("펑션시작");
                            var dataToSend = product_name;
                            $.ajax({
                                url: "/getProductDetailListToAjax.do",
                                method: "POST",
                                contentType: "application/json",
                                data: JSON.stringify(dataToSend),
                                success: function (result) {
                                    var pricelist = result.priceList;
                                    var sizelist = result.sizeList;
                                    console.info("아작스 성공");
                                    console.info("사이즈 리스트 : "+sizelist.length);
                                    console.info("가격 리스트 : "+pricelist.length);
                                    if (sizelist.length !== 0) {
                                        for (var i = 0; i < sizelist.length; i++) {
                                            var init = "";
                                            if (pricelist[i] == 0) {
                                                $("ul[class='select_list grid_list grid_2']").append("<li class='select_item'><button role='button' aria-selected='false' class='select_link sell'><div class='link_inner'><span class='size'>"
                                                    + sizelist[i]
                                                    + "</span><span id='pprice' class='price'>판매입찰 가격자리 </span></div></button></li>");
                                            } else {
                                                $("ul[class='select_list grid_list grid_2']").append("<li class='select_item'><button role='button' aria-selected='false' class='select_link sell'><div class='link_inner'><span class='size'>"
                                                    + sizelist[i]
                                                    + "</span><span id='pprice' class='price'>"
                                                    + pricelist[i]
                                                    + "</span></div></button></li>");
                                            }
                                        }
                                    } else {
                                        alert("관리자에게 문의해 사이즈를 추가해주세요");
                                    }
                                },
                                error: function (request, status, error) {
                                    alert("실패했다!");
                                }
                            })
                        }

                        });

                        
                    </script>
                    
        <div class="container sell lg">
            <div class="content_area">
                <div class="sell_before">
                    <div class="sell_before_check">
                        <div class="product_info">
                            <div class="product_thumb">
                                <div class="product" style="background-color: rgb(244, 244, 244);">

                                    <div class="product_inner_tag display_tag_item">
                                        <span class="tag_text"> </span>
                                    </div>
                                    <picture class="picture product_img"> <!-- 그냥 로고 띄워놨음 -->
                                        <img src="/files/${dto.pimage}" loading="lazy" class="image full_width">
                                    </picture>
                                </div>
                            </div>
                            <input type="hidden" id="pname" name="pname" value="${dto.pname}">
                            <input type="hidden" id="pnum" name="pnum" value="${dto.pnum}">
                            <div class="product_detail" width="100%">
                                <p id="pcode" class="code">${dto.pcode}</p>
                                <p id="pcname" class="name"> ${dto.pname}</p>
                                <p id="pgender" class="translated_name">${dto.pname}</p>
                                <!-- <div class="badge badge_product shipping_express"></div> -->
                            </div>
                        </div>
                        <div class="v-portal" style="display: none;"></div>
                    </div>
                    <div class="sell_before_select">
                        <div class="select_area">
                            <ul class="select_list grid_list grid_2">
                            </ul>
                        </div>
                        <div class="order_btn_area">
                            <button class="btn_order order_sell sell clickable" id="sellButton">
                                <div class="box_sellcho">
                                    <div class="order_case_info">
                                        <span class="order_price"> 가격 </span>
                                    </div>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </body>