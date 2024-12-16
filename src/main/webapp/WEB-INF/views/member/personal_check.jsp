<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>본인인증</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_input.css?after">
<link rel="stylesheet" type="text/css" href="css/style_login.css?after">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

<script>
   $(document).on("click", "#e-check", function() {
      $("#ChecktoEmail").show();
      $("#ChecktoHp").hide();
      document.getElementById("checkselect").value = "email";
   });

   $(document).on("click", "#h-check", function() {
      $("#ChecktoEmail").hide();
      $("#ChecktoHp").show();
      document.getElementById("checkselect").value = "phone";
   });

   var code = "";
   $(document).on('click', '#emailAuth', function(e) {
      const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
      //Ajax로 전송
      jQuery.ajax({
         url : './EmailAuth',
         data : {
            email : email
         },
         type : 'POST',
         dataType : 'text',
         success : function(result) {
            $("#emailAuth").val("재전송");
            if (result) {
               $("#authCode").attr("disabled", false);
               code = result;
               alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
            } else {
               alert("전송된 값 없음");
            }
         },
         error : function() {
            alert("에러 발생");
         }
      }); //End Ajax
   });

   function emailCheck() {
      const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기

      if (inputCode == code) {
         $("#emailAuthWarn").html('인증번호가 일치합니다');
         $("#emailAuthWarn").css('color', 'green');
         $('#emailAuth').attr('disabled', 'true');
         $('#email').attr('readonly', true);
         document.getElementById("emailcheck").value = 'ok';
         document.getElementById("personal").value = 'success';
      } else {
         $("#emailAuthWarn").html('인증번호가 일치하지 않습니다');
         $("#emailAuthWarn").css('color', 'red');
         document.getElementById("emailcheck").value = 'no';
      }
   }

   var code2 = "";
   $(document).on("click", "#phoneChk", function() {
      var hp1 = $("#hp1").val();
      var hp2 = $("#hp2").val();
      var hp3 = $("#hp3").val();
      var phone = hp1 + hp2 + hp3;
      $.ajax({
         type : "GET",
         url : "phoneCheck?phone=" + phone,
         cache : false,
         success : function(data) {
            $("#phoneChk").val("재전송");
            if (data == "error") {
               alert("핸드폰 번호가 올바르지 않습니다.")
               $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
               $(".successPhoneChk").css("color", "red");
               $("#hp2").attr("autofocus", true);
            } else {
               alert("인증번호 발송이 완료되었습니다.\n핸드폰에서 인증번호 확인을 해주십시오.");
               $("#phone2").attr("disabled", false);
               $("#hp1").attr("readonly", true);
               $("#hp2").attr("readonly", true);
               $("#hp3").attr("readonly", true);
               code2 = data;
            }
         }
      });
   });

   function phoneCheck() {
      if ($("#phone2").val() == code2) {
         $(".successPhoneChk").text("인증번호가 일치합니다.");
         $(".successPhoneChk").css("color", "green");
         $("#phoneDoubleChk").val("true");
         $('#phoneChk').attr('disabled', true);
         $("#hp1").attr("readonly", true);
         $("#hp2").attr("readonly", true);
         $("#hp3").attr("readonly", true);
         $("#phone2").attr("disabled", true);
         document.getElementById("personal").value = 'success';
      } else {
         $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
         $(".successPhoneChk").css("color", "red");
         $("#hp1").attr("readonly", false);
         $("#hp2").attr("readonly", false);
         $("#hp3").attr("readonly", false);
         $("#phoneDoubleChk").val("false");
         $(this).attr("autofocus", true);
      }
   }
   $(document).ready(function() {
       $('#e-check').on('click', function() {
           $('#e-check').parent().removeClass('gray4').addClass('black');
           $('#h-check').parent().removeClass('black').addClass('gray4');
       });

       $('#h-check').on('click', function() {
           $('#h-check').parent().removeClass('gray4').addClass('black');
           $('#e-check').parent().removeClass('black').addClass('gray4');
       });
   });
</script>
<script type="text/javascript">
   function check() {
      if (document.getElementById('checkselect').value == 'email'
            && document.getElementById('emailcheck').value != 'ok') {
         alert("이메일 인증번호가 일치하지 않습니다")
         return;
      }

      if (document.getElementById('checkselect').value == 'phone'
            && document.getElementById('phoneDoubleChk').value != 'true') {
         alert("핸드폰 인증번호가 일치하지 않습니다")
         return;
      }
      
      document.f.submit()
   }
</script>
<style>
.btn.tac span {
   margin: 0;
}

</style>
</head>
<body>
   <div>
      <div style="width: 650px;">
         <div>
            <div class="btn tac">
            <form name="f" method="POST" action="checkOk.do">
               <fieldset>
               <div class="box" style="padding-top: 40px;">
               <div class="btn tac" style="display: flex; margin-left: 225px;"> 
                  <div class="box_btn w144 h45 fs15">
                     <a class="look_link" id="e-check" style="width: 105px; font-size:12px;">이메일</a>
                  </div>
                  <div class="box_btn w144 h45 fs15 gray4">
                     <a class="look_link" id="h-check" style="width: 105px; font-size:12px;">휴대폰</a>
                  </div>
               </div>
               <br><br>
               <input type="hidden" name="checkselect" id="checkselect" value="email"><br>
               <div align="center" id="ChecktoEmail" class="addbtn">
                  <div>
                     <input name="email" id="email" type="email" value="${dto.email}" 
                           style="margin-top:5px;width:136px;" readonly> 
                     <button class="w-btn-outline w-btn-gray-outline" type="button" id="emailAuth" 
                           style="border:none; height:30px;line-height: 0px;">전송<br><br></button> 
                  </div>
                  <div style="margin-top: 15px;">
                  <input type="text" id="authCode" name="authCode" placeholder="인증 코드를 입력해주세요." 
                     onkeyup="emailCheck();" class="form_input form_name" 
                     style="width:200px;height:32px;font-size:15px;border:0;border-radius:15px;
                     outline:none;padding-left:10px;background-color: rgb(233,233,233);"disabled required><br></div>
                  <div id="emailAuthWarn" class="emailAuthWarn" 
                     style="display: inline; margin-left:5px;"></div>
                  <input type="hidden" name="emailcheck" id="emailcheck" value="">
               </div>
               <div class="addbtn" align="center" id="ChecktoHp" style="display:block; display: none">
                  <div>
                     <input type="text" name="hp1" id="hp1" style="width: 30px;margin-top:5px;" value="${dto.hp1} " readonly>-
                     <input type="text" name="hp2" id="hp2" style="width: 35px;margin-top:5px;" value="${dto.hp2} " readonly>-
                     <input type="text" name="hp3" id="hp3" style="width: 35px;margin-top:5px;" value="${dto.hp3}" style="margin: 0 auto" readonly>&nbsp;&nbsp;&nbsp;&nbsp; 
                     <button class="w-btn-outline w-btn-gray-outline" type="button"id="phoneChk"
                           style="border:none; height:30px;line-height: 0px;">전송<br><br></button> 
                  </div>
                  <input type="text" id="phone2" name="phone2" placeholder="인증 코드를 입력해주세요." 
                     onkeyup="phoneCheck();" class="form_input form_name" 
                     style="margin-top: 15px;width:200px;height:32px;font-size:15px;border:0;border-radius:15px;
                     outline:none;padding-left:10px;background-color:rgb(233,233,233);"disabled required><br>
                  <div class="point successPhoneChk"
                     style="display: inline; margin-left:5px;"></div>
                  <input type="hidden" id="phoneDoubleChk" name="phoneDoubleChk">
               </div>
               <br>
               <div class="btn tac" style="margin-top:0;">
                  <a class="custom-btn certi-fin" href="javascript:check();" 
                     style="margin:20px;">인증하기</a>
               </div>
               </div>
               </fieldset>
            </form>
            </div>
         </div>
      </div>
   </div>
</body>
</html>