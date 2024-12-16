<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_input.css?after">

<!-- member_input.jsp -->

<script>
$(document).on('click', '#dupChkBtn', function(e) {
   e.preventDefault();  
   var chkId = $('#idInput').val();
      
    if(chkId == ''){
       alert("아이디를 입력해주세요")
        $("#dupChk").html("");
    } else {
      jQuery.ajax({
        type : 'POST',
        url : "idChk.do",
        data : {
           id : chkId
        },
        dataType:'text', 
        success : function(result){
           if(result != 'fail'){
               $("#dupChk").html("아이디 사용 가능");
                  $("#dupChk").css('color', 'green');
                  document.getElementById("idcheck").value = 'ok';
            } else {
                  $("#dupChk").html("이미 있는 아이디입니다.");
                  $("#dupChk").css('color', 'red');      
                  document.getElementById("idcheck").value = 'no';
            }
      }, 
        error: function() {
           alert("에러 발생");
        }
      });
   }
});
     
function kakaopost() {
   new daum.Postcode({
       oncomplete: function (data) {
           document.querySelector("#zipcode").value = data.zonecode;
            document.querySelector("#address1").value = data.address;
            document.querySelector("#address2").value = "";
         }
      }).open();
}

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


function isCheck(){            
   $('#letsCheck').html('회원가입')
   document.f.action = "member_input.do";     
   document.f.target = '_self';  
}

function emailCheck(email_address){     
   email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
   if(!email_regex.test(email_address)){ 
      return false; 
   }else{
      return true;
   }
}
function validateEmail() {
   var emailInput = document.getElementById('email');
   var resultDiv = document.getElementById('result');

   var email = emailInput.value;

   if (emailCheck(email)) {
      $('#result').css('color', 'purple');
       $('#result').html('유효한 이메일입니다.')
   } else {
      $('#result').css('color', 'red');
       $('#result').html('유효하지 않은 이메일입니다.')
   }
   
}
</script>
<script type="text/javascript">

function check(){
	var isValid = true;
	
	if (!f.name.value){
        alert("이름을 입력해 주세요!!");
        f.name.focus();
        isValid = false;
        return;
    }
	
	var genderChecked = false;
	for (var i = 0; i < f.gender.length; i++) {
	    if (f.gender[i].checked) {
	        genderChecked = true;
	        break;
	    }
	}

	if (!genderChecked) {
	    alert("성별을 선택해주세요.");
	    isValid = false;
	    return;
	}
	
	if (!f.address1.value){
        alert("주소를 입력해 주세요!!");
        f.address1.focus();
        isValid = false;
        return;
    }
    
    if (!f.address2.value){
        alert("상세주소를 입력해 주세요!!");
        f.address2.focus();
        isValid = false;
        return;
    }
	
   	if (f.id.value == ""){
		alert("아이디를 입력해 주세요!!");
       	f.id.focus();
       	isValid = false;
       	return;
   	}
   
    if (document.getElementById('idcheck').value != 'ok'){
        alert("사용할 수 없는 아이디 입니다");
        f.id.focus();
        isValid = false;
        return;
    }
    
    if (!f.passwd.value){
        alert("비밀번호를 입력해 주세요!!");
        f.passwd.focus();
        isValid = false;
        return
    }
    
    if (!f.passwd2.value){
        alert("비밀번호를 입력해 주세요!!");
        f.passwd2.focus();
        isValid = false;
        return;
    }
    
    if (passwd !== passwd2) {
        alert("비밀번호가 일치하지 않습니다!!");
        isValid = false;
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
    
    if (!f.email.value){
        alert("이메일을 입력해 주세요!!");
        f.email.focus();
        isValid = false;
        return
    } 
    
    var email = $('#email').val();
    var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    if (!email_regex.test(email)) {
        alert("유효하지 않은 이메일입니다.");
        f.email.focus(); 
        isValid = false;
        return;
    }
    
    if (!f.hp1.value||!f.hp2.value||!f.hp3.value){
        alert("전화번호를 입력해 주세요!!");
        f.hp1.focus();
        isValid = false;
        return;
    }
    
    if (!f.zipcode.value){
        alert("우편번호를 입력해 주세요!!");
        f.zipcode.focus();
        isValid = false;
        return;
    }
    
    if (isValid) {
        document.f.submit();
    }
}
      
function validateId() {
   var id = f.id.value;
    var idRegex = /^[a-zA-Z0-9]+$/;

    if (id && !idRegex.test(id)) {
        alert("아이디는 영어와 숫자만 입력 가능합니다.");
        f.id.focus();
        return false;
    }

    return true;
}
      
      
function allowOnlyNumbers(event) {
   if (event.which < 48 || event.which > 57) {
       event.preventDefault();
    }
}
      
function autoFocus(maxlength, currentId, nextId) {
   var field = document.getElementById(currentId);
    var length = field.value.length;
      if (length === maxlength) {
       document.getElementById(nextId).focus();
    }
}     

function personalCheck(){
   var myForm = document.f;
   var url = "personal_check.do";
   window.open("" ,"f", "width=500, height=400, resizable=no"); 
   myForm.action = url; 
   myForm.method = "post";
   myForm.target = "f";
   myForm.submit();
}       
</script>
<style>
   #woman, #man {
      cursor: pointer;
   }
</style>
</head>
<html>
<div id="wrapper">
   <div id="openTag" class="renew-2308">
      <div id="cnt">
         <h2 class="subtitle">회원가입</h2>
         <div class="cntbody">
            <ol class="join_step">
               <li class="agree"><span>01</span> 이용약관 동의</li>
               <li class="form active"><span>02</span> 회원정보입력</li>
               <li class="finish"><span>03</span> 회원가입 완료</li>
            </ol>
            <div id="join_input">
               <form name="f" id="f" method="post" action="javascript:personalCheck()">
               <div class="chkpwd" style="display: inline; margin-left: 5px;" id="isCheckMessage"></div>
                  <fieldset>
                     <legend class="hidden">기본정보입력(필수)</legend>
                     <div class="box" style="width:804px;">
                        <div>
                           <label for="join_name"> 
                                 이름 <span>*</span>
                           </label> 
                           <input type="text" name="name" id="join_name"
                              class="form_input form_name" maxlength="30">
                        </div>
                        <div>
                           <label> 
                                 성별 <span>*</span>
                           </label>
                           <p class="check">
                              <input type="radio" name="gender" value="남자" id="woman"> 
                              <label for="woman">남자</label> 
                              <input type="radio" name="gender" value="여자" id="man"> 
                              <label for="man">여자</label>
                           </p>
                        </div>
                        <div>
                           <ul class="address">
                              <li>
                                 <input type="text" name="zipcode" id="zipcode"
                                 class="form_input form_zipcode" maxlength="10" readOnly>
                                 <span class="box_btn w95 h35 fs13 white2"> 
                                    <a onclick="kakaopost()">주소 검색</a>
                                 </span>
                              </li>
                              <li>
                                    주소 <span>&nbsp;*</span> 
                                 <input type="text" name="address1" id="address1"
                                 class="form_input form_address1" maxlength="40" readOnly>
                              </li>
                              <li>
                                 <input type="text" name="address2" id="address2"
                                 class="form_input form_address2" maxlength="25">
                              </li>
                           </ul>
                        </div>
                        <div class="addbtn">
                           <label for="join_id"> 아이디 <span>*</span></label> 
                           <input type="text" name="id" id="idInput" class="form_input form_id" maxlength="20"
                                   style="width:218px;">
                           <span id="Idch" class="box_btn w95 h35 fs13 white2"> 
                              <a id="dupChkBtn">중복확인</a>
                           </span><br>
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
                           5px; display: none; color: red">1</div>
                        </div>
                        <div>
                           <label for="join_pw1"> 비밀번호 확인 <span>*</span></label> 
                           <input type="password" oninput="pwd_chk()"
                              onkeyup="passwordCheck();" name="passwd2" id="passwd2"
                              class="form_input form_name" maxlength="30"><br>
                           <div class="chkpwd" style="display: inline; margin-left: 188px; 
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
                        <div class="addbtn">
                           <label for="join_id"> 이메일 <span>*</span></label> 
                              <input onkeyup = "validateEmail();" type="email" name="email" id="email" class="form_input form_id">
                           <span class="box_btn w95 h35 fs13 white2">        
                           </span>   
                           <div  id="result" style = "margin-left:188px;"></div>
                        </div>
                     </div>
                  </fieldset>
                  <div class="btn tac">
                     <span class="box_btn w144 h45 fs15" onclick="check()">
                        <a id="letsCheck">본인인증</a>
                     </span>   
                     <span class="box_btn w144 h45 fs15 gray4"> 
                        <a href="login.do">취소</a>
                     </span>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
</html>