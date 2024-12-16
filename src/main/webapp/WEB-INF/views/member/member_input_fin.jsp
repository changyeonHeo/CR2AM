<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   
<link rel="stylesheet" type="text/css" href="css/style_input.css">
<html>
<body>
   <div id="wrapper">
      <div id="cnt">
         <h2 class="subtitle">회원가입</h2>
         <div class="cntbody">
            <ol class="join_step">
               <li class="agree"><span>01</span>이용약관 동의</li>
               <li class="form"><span>02</span>회원정보입력</li>
               <li class="finish active"><span>03</span>회원가입 완료</li>
            </ol>
            <div id="join_finish">
               <div class="box" align="center">
                  <p class="username">
                     ${dto.name}고객님
                  </p>
                  <p class="icon">
                     <img src="img/icon_finish.png">
                  </p>
                  <div class="msg">회원가입을 진심으로 환영합니다!</div>
               </div>
               <div class="btn tac">
                  <span class="box_btn w144 h45 fs15"> 
                     <a href="login.do">로그인</a>
                  </span>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>