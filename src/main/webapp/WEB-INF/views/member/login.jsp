<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- login.jsp -->

<%@include file="../top_mylog.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_login.css">

<style>
.no_dot {
  list-style-type: none;
}
.find_remove {
   padding-top: 10px;
   font-size: 0;
   text-align: center;
}
.find_remove li {
   display: inline-block;
   position: relative;
}
.find_remove li a {
   color: #8f8f8f;
   font-size: 12px;
   display: block;
   padding: 0 20px 0 16px;
}

.look_list[data-v-4a9bf2df]:last-child {
    margin-right: 0 !important;
}
*, *: after {
   box-sizing: border-box;
}
.login_title[data-v-4a9bf2df]:before {
    background: url(/img/logo.png) no-repeat;
    background-size: 250px 50px;
    content: "";
    display: inline-block;
    height: 50px;
    width: 250px
}
</style>

 <script type="text/javascript">
   function searchMember(mode){
      window.open("searchMember.do?mode="+mode, "search", "width=640, height=400")
   }
   
   function handleKeyPress(event) {
         if (event.key === "Enter") {
            loginCheck();
         }
      }
   function loginCheck(){
      if (f.id.value == ""){
         alert("아이디를 입력해 주세요!!")
         f.id.focus()
         return
      }
      if (f.passwd.value == ""){
         alert("비밀번호를 입력해 주세요!!")
         f.passwd.focus()
         return
      }
      document.f.submit()
   }
   document.addEventListener("keyup", handleKeyPress);
   
   // 입력 필드가 최소한 한 문자라도 있는지 확인하는 함수
   function checkInputs() {
     var idInput = document.getElementById('login_id');
     var pwInput = document.getElementById('login_pw');
     var loginBtn = document.getElementById('login_btn');

     // "아이디"와 "비밀번호" 입력란이 모두 최소한 한 문자라도 있는 경우 로그인 버튼 활성화
     if (idInput.value.length > 0 && pwInput.value.length > 0) {
       loginBtn.classList.remove('disabled');
     } else {
       loginBtn.classList.add('disabled');
     }
   }
   
</script>

<html>
<head>
<title> CREAM | 한정판 거래의 FLEX </title>
</head>
<body onload="document.f.id.focus();">

   <form name="f" action="login_ok.do" method="post">
   <div class="login_area" data-v-4a9bf2df="">
         <h2 class="login_title" data-v-4a9bf2df="before">
      <span class="blind" data-v-4a9bf2df=""> CR2AM </span></h2>
   <div class="has_button input_box" data-v-5ee806c3="" data-v-4a9bf2df="">
      <h3 class="input_title" data-v-5ee806c3="" data-v-4a9bf2df=""><strong>아이디</strong></h3>
   <div class="input_item" data-v-5ee806c3="">
   <input type="text" name="id" placeholder="아이디를 입력해주세요" class="input_txt" data-v-5ee806c3="">
   <!-- <input type="id" placeholder="" autocomplete="on" class="input_txt" data-v-5ee806c3=""> -->
         <button type="button" class="btn input_delete" style="display:none;" data-v-0a6aebaa="" data-v-4a9bf2df="" data-v-5ee806c3="">
         <svg xmlns="http://www.w3.org/2000/svg" class="ico-delete-circle icon sprite-icons" data-v-4a9bf2df="">
         <use href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-ico-delete-circle" 
            xlink:href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-ico-delete-circle" data-v-4a9bf2df=""></use>
         </svg>
      </button>
   </div>
      <p class="input_error" data-v-5ee806c3="" data-v-4a9bf2df=""> 아이디를 정확히 입력해주세요.</p>
   </div>


   <div class="input_box has_button" data-v-5ee806c3="" data-v-4a9bf2df="">
      <h3 class="input_title" data-v-5ee806c3="" data-v-4a9bf2df=""><strong>비밀번호</strong></h3>
   <div class="input_item" data-v-5ee806c3="">
      <input type="password" name="passwd" placeholder="비밀번호를 입력해주세요" maxlength="16" class="input_txt" data-v-5ee806c3=""></div>
      <!-- <input type="password" placeholder="" autocomplete="off" maxlength="16" class="input_txt" data-v-5ee806c3=""></div> -->
      <!-- <p class="input_error" data-v-5ee806c3="" data-v-4a9bf2df=""> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p>
         </div>-->
   <div class="login_btn_box" data-v-4a9bf2df="">
   <a href="javascript:loginCheck()" class="btn full solid black" data-v-0a6aebaa="" data-v-4a9bf2df=""> 로그인 </a></div>       
      <ul class="find_remove" style="padding-inline-start: 40px;" data-v-4a9bf2df="">
         <li class="look_list" style="position: relative;" data-v-4a9bf2df="">
           <a href="join.do" class="look_link" style="margin-left:10px;" data-v-4a9bf2df=""> 회원가입 </a>
        </li>
        <li class="look_list" style="position: relative;" data-v-4a9bf2df="">
            <a href="javascript:searchMember()" class="look_link" data-v-4a9bf2df="" style="margin-top:3px; margin-right: 15px;"> 아이디/비밀번호 찾기 </a>
         </li>
   </ul>

   <div class="social_login" data-v-4a9bf2df="">
      <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=kd1bWj0XiKuexpuvUlsY&state=STATE_STRING&redirect_uri=http://localhost:8080/naver.do" 
         button type="button" class="btn btn_login_naver full outline" data-v-0a6aebaa="" data-v-4a9bf2df="">
      <img src="img/naver_icon.jpg" alt="Website Logo" class="website-logo"> 네이버로 로그인 </a>

      <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=67bda85d88bb2dd819914ff0f9daa717&redirect_uri=http://localhost:8080/kakao.do" 
         button type="button" class="btn btn_login_apple full outline" data-v-0a6aebaa="" data-v-4a9bf2df="">
      <img src="img/kakao_icon.jpg" alt="Website Logo" class="website-logo"> KaKao로 로그인 </a>
   </div>
   </div>
      </body>
</html>