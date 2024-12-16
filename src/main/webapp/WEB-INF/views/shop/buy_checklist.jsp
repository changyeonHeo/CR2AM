<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- buy_checklist.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="ctop.jsp" %>

<link rel="stylesheet" type="text/css" href="css/style_ctop.css">
<link rel="stylesheet" type="text/css" href="css/style_sell_size_check.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
.logo {
    display: flex;
    width: 125px;
    height: 25px;
    background-size: 250px 50px;
    content: "";
}
input[type='checkbox']:checked+label {
 	display: block;
    width: 20px;
    height: 20px;
   /*  background: url('img/check.jpg') no-repeat 0 1px / contain; */
    background-image: url('img/checked.jpg');
    border: none;
}
</style>

<script>

$(document).ready(function () {
    $(".title_txt").text("구매 동의하기");
    $(".btn.full.solid").prop("disabled", true);
	// check_area클릭할때 화면이동 방지
    $(".check_area").click(function (e) {
        e.preventDefault();
        var checkboxId = $(this).find('input[type="checkbox"]').attr('id');
        selectCheckbox(checkboxId);
    });

    function selectCheckbox(checkboxId) {
        var checkbox = $("#" + checkboxId);
        checkbox.prop("checked", !checkbox.prop("checked"));
        checkAllCheckboxes(); 
    }

    function allCheckboxesAreSelected() {
        var checkboxes = $("[name='myCheck']");
        return checkboxes.length === checkboxes.filter(":checked").length;
    }

    function checkAllCheckboxes() {
        var checkboxes = $("[name='myCheck']");
        var continueButton = $(".btn.full.solid");

        continueButton.prop("disabled", checkboxes.filter(":checked").length !== checkboxes.length);

        if (checkboxes.filter(":checked").length !== checkboxes.length) {
            continueButton.click(function () {
                alert("모두 체크하셔야 이동 가능합니다.");
            });
        } else {
            continueButton.off("click");
            continueButton.click(function () {
                var destinationPage = "toBuyPricePay.do?pnum="+$("input[id='pnum']").val()+"&size="+$('.size_txt').text();
                window.location.href = destinationPage;
            });
        }
    }
});

</script>

	<div class="container sell lg">
		<div class="content_area">
			<div class="sell_before">
				<div class="sell_before_check">
	
		<div>
			<div class="title_area">
				<h2 class="check_title">
				<span class="accent_text" style="color:#ef6253;">구매</span>
				하시기 전에 <br class="br_mo">
				꼭 확인하세요.</h2>
			</div>

			<div class="buy_product_area">
				<div class="buy_product">
					<div class="product" style="background-color: rgb(244, 244, 244);">
						<div class="product_inner_tag display_tag_item">
							<span class="tag_text">  </span>
						</div>
							<picture class="picture product_img">
								<img src="img/${dto.pimage}" loading="lazy" class="image full_width">
							</picture></div>
						<div class="buy_info">
						<div class="model_info">
							<strong class="model_number">
							<span class="text" id="pcode" name="pcode">${dto.pcode}</span></strong>
							<p class="model_title"id="pname" name="pname">${dto.pname}  </p>
							<p class="model_ko" id="pgender" name="pgender"> ${dto.pgender} </p>
							<div class="model_desc"><p class="size_txt" id="size" name="size">${size}</p>
							<input type="hidden" id="pnum" name="pnum" value="${dto.pnum}">
						</div>
						</div>
						</div>
						</div>
					</div>
					<div>
						<ul class="check_list mo">
						<li class="check_item">
						<a href="#" class="check_area" onclick="selectCheckbox('myCheck1')">
					<div class="notice_group">
						<strong><p class="notice_maintext">구매하려는 상품이 맞습니다.</p></strong>
						<p class="notice_subtext">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.<br>단, 상품의 이미지는 촬영 환경에 따라 실제와 다를 수 있습니다.</p>
					</div>
					<div class="checkbox_item">
	    				<input type="checkbox" id="myCheck1" name="myCheck">
	    				<label for="myCheck1"></label>
					</div>
						</a>
						</li>
	
						<li class="check_item">
						<a href="#" class="check_area" onclick="selectCheckbox('myCheck2')">
					<div class="notice_group">
						<strong><p class="notice_maintext">국내/해외에서 발매한 정품 · 새상품입니다.</p></strong>
						<p class="notice_subtext">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 
						국내 발매 상품 여부는 확인해드리지 않습니다.</p>
					</div>
					<div class="checkbox_item">
 						   <input type="checkbox" id="myCheck2" name="myCheck">
 						   <label for="myCheck2"></label>
					</div>
						</a>
						</li>
	
	
						<li class="check_item">
						<a href="#" class="check_area" onclick="selectCheckbox('myCheck3')">
					<div class="notice_group">
						<strong><p class="notice_maintext">제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</p></strong>
						<p class="notice_subtext">박스/페키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</p>
					</div>
					<div class="checkbox_item">
						<input type="checkbox" id="myCheck3" name="myCheck">
						<label for="myCheck3"></label>
					</div>
						</a>
						</li>

						<li class="check_item">
						<a href="#" class="check_area" onclick="selectCheckbox('myCheck4')">
					<div class="notice_group">
						<strong><p class="notice_maintext">패키지(포장) 개봉 검수에 대한 주의사항을 확인합니다. </p></strong>
						<p class="notice_subtext">
							검수 과정 중 밀봉 및 실링이 모두 개봉되어 CR2AM 패키지로 포장되어 발송됩니다. 오리지널 폴리백이 포함되지 않을 수 있습니다.
						</p>
					</div>
					<div class="checkbox_item">
						 <input type="checkbox" id="myCheck4" name="myCheck">
						 <label for="myCheck4"></label>
					</div>
						</a>
						</li>

 						<li class="check_item">
						<a href="#" class="check_area" onclick="selectCheckbox('myCheck5')">
					<div class="notice_group">
						<strong><p class="notice_maintext">
							CR2AM의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</p><strong>
						<p class="notice_subtext">
							건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.</p>
					</div>						
					<div class="checkbox_item">
						<input type="checkbox" id="myCheck5" name="myCheck">
						<label for="myCheck5"></label>
					</div>
						</a>
						</li>
					</ul>
				</div>
					<div class="btn_confirm lg">
						<button type="button" class="btn full solid" name="buyBotton"> 구매 계속 </button>	
					</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>

