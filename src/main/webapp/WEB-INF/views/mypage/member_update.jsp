<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- mypage/member_update.jsp -->
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<link rel="stylesheet" type="text/css" href="css/style_input.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function passwordCheck() {
      var passwd = $('#passwd').val();
      var passwd2 = $('#passwd2').val();
      var resultDiv = document.getElementById('passwordCheckMessage');
      
      var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
      
      if(passwordRegex.test(passwd)){
         if(passwd ==passwd2){
            resultDiv.innerHTML = '비밀번호가 일치하며 유효합니다.';
            resultDiv.style.color = 'green';
         }else{
            resultDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
            resultDiv.style.color = 'red';
         }
      }else{
         resultDiv.innerHTML = '비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.';
         resultDiv.style.color = 'red';
      }   
   }
</script>

<script type="text/javascript">
function check(){   
   var isValid = true;
   
   if (!f.passwd.value){
        alert("비밀번호를 입력해 주세요!!");
        f.passwd.focus();
        isValid = false;
        return;
    }
    
    if (!f.passwd2.value){
        alert("비밀번호를 입력해 주세요!!");
        f.passwd2.focus();
        isValid = false;
        return;
    }
    
    var passwd = $('#passwd').val();
    var passwd2 = $('#passwd2').val();
    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
    if (!passwordRegex.test(passwd)) {
        alert("비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.");
        f.passwd.focus();
        isValid = false;
        return;
    }

    if (!f.hp1.value||!f.hp2.value||!f.hp3.value){
        alert("전화번호를 입력해 주세요!!");
        f.hp1.focus();
        isValid = false;
        return;
    }
    
    if (isValid) {
        document.f.submit();
    }
}
</script>

<div id="wrapper">
   <div id="openTag" class="renew-2308">
      <div id="cnt">
         <h2 class="subtitle">회원정보 수정</h2>
         <div class="cntbody">
            <div id="join_input">
               <form name="f" id="f" method="post" action="member_update.do?id=${loginMember.id}">
               <div class="chkpwd" style="display: inline; margin-left: 5px;" id="isCheckMessage"></div>
                  <fieldset>
                     <div class="box" style="width:804px;">
                     <c:set var="info" value="${loginfo}"/>
                        <div style="font-size: 16px;">
                           <label for="join_name">이름</label> 
                           ${info.name}
                        </div>
                        <div class="addbtn" style="font-size: 16px;">
                           <label for="join_id"> 아이디 </label> 
                           ${info.id}
                           <div class="chkpwd" style="margin-left: 188px" 
                              id="dupChk"></div> 
                           <input type="hidden" id="idcheck">
                        </div>
                        <div style="position: relative">
                           <label for="join_pw"> 비밀번호 <span>*</span></label> 
                           <input type="password" oninput="pwd_chk()"
                              onkeyup="passwordCheck();" name="passwd" id="passwd"
                              class="form_input form_name" maxlength="30">
                           <div class="pwd_check" style="display: inline; margin-left: 
                           5px; display: none; color: red"></div>
                        </div>
                        <div>
                           <label for="join_pw1"> 비밀번호 확인 <span>*</span></label> 
                           <input type="password" oninput="pwd_chk()"
                              onkeyup="passwordCheck();" name="passwd2" id="passwd2"
                              class="form_input form_name" maxlength="30">
                           <div class="chkpwd" style="display: inline; margin-left: 5px; 
                           color: red" id="passwordCheckMessage"></div>
                        </div>
                        <div class="mobile addbtn">
                           <label for="join_cell"> 휴대폰 번호 <span>*</span></label> 
                           <input type="text" name="hp1" id="hp1" class="form_input form_cell1" 
                              maxlength="3" onkeyup="autoFocus(3, this.id, 'hp2')"
                              onkeypress="allowOnlyNumbers(event)">
                           <input type="text" name="hp2" id="hp2" class="form_input form_cell2"
                              maxlength="4" onkeyup="autoFocus(4, this.id, 'hp3')"
                              onkeypress="allowOnlyNumbers(event)"> 
                           <input type="text" name="hp3" id="hp3" class="form_input form_cell3"
                              maxlength="4" onkeypress="allowOnlyNumbers(event)"> 
                        </div>
                        <div class="addbtn" style="font-size: 16px;">
                           <label for="join_email"> 이메일 </label> 
                           ${info.email} 
                        </div>
                     </div>
                  </fieldset>
                  <div class="btn tac">
                     <span class="box_btn w144 h45 fs15" onclick="check()">
                        <a id="letsCheck">수정완료</a>
                     </span>
                     <span class="box_btn w144 h45 fs15 gray4"> 
                   <a href="javascript:void(0);" onclick="window.location='loginfo.do?id=${loginMember.id}'">취소</a>
               </span>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>