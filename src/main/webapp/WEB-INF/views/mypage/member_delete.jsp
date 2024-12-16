<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- mypage/member_delete.jsp -->

<%-- <%@ include file="top.jsp"%> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<style>
input {
    -webkit-appearance: auto !important;
}
</style>

<div data-v-ab6e088a="">
<h4 style="font-size: 17px; font-weight: bold;" align="center">회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요.</h4>
<div class="withdrawal_terms" data-v-ab6e088a="">
   <div class="terms_box" data-v-ab6e088a="">
   <h5 class="terms_title" data-v-ab6e088a="">
   <span class="checkbox_item" data-v-384af6ef="" data-v-ab6e088a="">
<!--  <input id="title0" type="checkbox" name=""class="CheckList" data-v-384af6ef="">-->      <label for="title0" class="check_label" data-v-384af6ef="">
      <input id="title0" type="checkbox" name=""class="CheckList" 
      	style="width:25px; height:25px;" data-v-384af6ef="">
   
      <span class="label_txt" data-v-384af6ef="">CR2AM을 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.</span>
      </label>
   </span>
   </h5>
   <div class="terms_detail" data-v-ab6e088a="">
      <ul class="terms_list" data-v-ab6e088a="">
      <li class="terms_item" data-v-ab6e088a=""> 내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시물/댓글), 미사용 보유 포인트 등</li> 
      <td> 사용자의 모든 정보가 사라지며 재가입 하더라도 복구가 불가능합니다.</td>
      <li class="terms_item" data-v-ab6e088a=""> 탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다 </li>
      </ul>
   </div>
   </div>
   <div class="terms_box" data-v-ab6e088a="">
      <h5 class="terms_title" data-v-ab6e088a="">
      <span class="checkbox_item" data-v-384af6ef="" data-v-ab6e088a="">
<!-- 	 <input id="title1" type="checkbox" name="" class="CheckList" data-v-384af6ef=""> -->
         <label for="title1" class="check_label" data-v-384af6ef="">
         <input id="title1" type="checkbox" name="" class="CheckList" 
         	style="width:25px; height:25px;" data-v-384af6ef="">
         <span class="label_txt" data-v-384af6ef="">관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.</span>
         </label>
      </span>
      </h5>
      <div class="terms_detail" data-v-ab6e088a="">
         <h6 class="terms_subtitle" data-v-ab6e088a=""> 1. 전자상거래 등 소비자 보호에 관한 법률 </h6>
         <ul class="terms_list" data-v-ab6e088a="">
         <li class="terms_item" data-v-ab6e088a=""> 계약 또는 청약철회 등에 관한 기록: 5년 보관 </li>
         <li class="terms_item" data-v-ab6e088a=""> 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 </li>
         <li class="terms_item" data-v-ab6e088a=""> 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 </li>
         </ul>
      </div>
      <div class="terms_detail" data-v-ab6e088a="">
         <h6 class="terms_subtitle" data-v-ab6e088a=""> 2. 통신비밀보호법 </h6>
         <ul class="terms_list" data-v-ab6e088a="">
         <li class="terms_item" data-v-ab6e088a=""> 접속 로그 기록: 3개월 보관 </li>
         </ul>
      </div>
      <div class="terms_detail" data-v-ab6e088a="">
         <h6 class="terms_subtitle" data-v-ab6e088a=""> 3. 내부 기준에 따라 별도 보관 </h6>
         <ul class="terms_list" data-v-ab6e088a="">
         <li class="terms_item" data-v-ab6e088a=""> 부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 보관 </li>
         </ul>
      </div>
   </div>
   <div class="terms_box" data-v-ab6e088a="">
      <h5 class="terms_title" data-v-ab6e088a="">
      <span class="checkbox_item" data-v-384af6ef="" data-v-ab6e088a="">
<!--     <input id="title2" type="checkbox" name="" class="CheckList" data-v-384af6ef=""> -->
         <label for="title2" class="check_label" data-v-384af6ef="">
      	 <input id="title2" type="checkbox" name="" class="CheckList" 
      	 	style="width:25px; height:25px;" data-v-384af6ef="">
      	 
         <span class="label_txt" data-v-384af6ef="">CR2AM 탈퇴가 제한된 경우에는 아래 내용을 참고하시기 바랍니다.</span>
         </label>
      </span>
      </h5>
      <div class="terms_detail" data-v-ab6e088a="">
         <ul class="terms_list" data-v-ab6e088a="">
         <li class="terms_item" data-v-ab6e088a=""> 진행 중인 거래(판매/구매)가 있을 경우: 해당 거래 종료 후 탈퇴 가능 </li>
         <li class="terms_item" data-v-ab6e088a=""> 진행 중인 입찰(판매/구매)가 있을 경우: 해당 입찰 삭제 후 탈퇴 가능 </li>
         <li class="terms_item" data-v-ab6e088a=""> 미납 수수료(착불 발송비/페널티)가 있을 경우: 해당 결제 완료 후 탈퇴 가능 </li>
         <li class="terms_item" data-v-ab6e088a=""> 이용 정지 상태인 경우: 이용 정지 해제 후 탈퇴 가능 </li>
         </ul>
      </div>
   </div>   
</div>
   <div class="withdrawal_check" data-v-ab6e088a="">
      <div class="checkbox_item" style="margin-top:8px;" data-v-384af6ef="" data-v-ab6e088a="">
	     <input id="title3" type="checkbox" name="" class="CheckList" 
	     	style="width:25px; height:25px;" data-v-384af6ef="">
         <span class="label_txt" data-v-384af6ef="">회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</span>

      </div>
   </div>
   <div class="withdrawal_btn_box" data-v-ab6e088a="">
       <a class="btn outlinegrey medium" data-v-14ec1f2e="" data-v-ab6e088a="" onclick="checkAndOpenWithdrawalPopup()"> 탈퇴하기 </a>
       <a href="loginfo.do?id=${loginMember.id}" class="btn solid medium" data-v-14ec1f2e="" data-v-ab6e088a=""> 취소하기 </a>
   </div>
</div>
</div>


<div id="overlay" class="overlay" style="display: none;"></div>
<div id="withdrawalPopup" class="modal">
    <div class="modal-content" style="border: none">
        <div class="layer_header">
            <h2 class="title" data-v-2077f721="" data-v-79f8507c=""> 정말 탈퇴하시겠습니까? </h2>
        </div>
        <div class="layer_content" data-v-2077f721="">
            <!-- 팝업 내용 -->
            <p class="withdrawal_desc" data-v-2077f721="" data-v-79f8507c="">탈퇴하기 클릭 시 바로 탈퇴 처리됩니다.<br>
            탈퇴 후 14일 이내 재가입할 수 없으며,<br>재가입 시 동일 이메일을 사용할 수 없습니다.</p>
            <div class="withdrawal_btn_box" data-v-2077f721="" data-v-79f8507c="">
                <div data-v-384af6ef="" data-v-79f8507c="" class="checkbox_item" data-v-2077f721="">
                    <input data-v-384af6ef="" id="undefined" type="checkbox" name="" class="blind">
                    <label data-v-384af6ef="" for="undefined" class="check_label">
                        <span data-v-384af6ef="" class="label_txt">CR2AM 회원을 탈퇴하겠습니다.</span>
                    </label>
                </div>
                <button type="button" class="btn solid medium" data-v-14ec1f2e="" data-v-79f8507c="" data-v-2077f721=""> 
                    <a onclick="closeWithdrawalPopup()"> 탈퇴 안 할래요 </a>
                </button>
                <a href="member_delete.do?mem=${loginMember.mem}" data-v-79f8507c="" data-v-2077f721="" class="link_withdrawal"> 탈퇴하기 </a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
function openWithdrawalPopup() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('withdrawalPopup').style.display = 'block';
}

function closeWithdrawalPopup() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('withdrawalPopup').style.display = 'none';
}
</script>

<script type="text/javascript">
function checkAndOpenWithdrawalPopup() {
    // Check if all checkboxes with class 'CheckList' are checked
    var checkboxes = document.querySelectorAll('.CheckList');
    var allChecked = true;

    checkboxes.forEach(function (checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });

    if (allChecked) {
        openWithdrawalPopup();
    } else {
        alert("회원탈퇴 내용을 모두 동의해 주셔야 탈퇴가 가능합니다");
    }
}

</script>

<%@ include file="../bottom2.jsp"%>
