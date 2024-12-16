<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
   href="css/style_input.css?after">
<link rel="stylesheet" type="text/css"
   href="css/style_idpw.css?after">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- searchMember.jsp -->

<html>
<head>
<script>
$(document).on('click', '#dupChkBtn', function(e) {
   e.preventDefault();  
      var chkName = $('#name').val();
      var chkHp1 = $('#hp1').val();
      var chkHp2 = $('#hp2').val();
      var chkHp3 = $('#hp3').val();
      var select = $("#searchselect").val();
      
    if(select == "s_id"){
       jQuery.ajax({
          type : 'POST',
           url : "searchMember.do",
           data : {
              name : chkName,
              hp1 : chkHp1,
              hp2 : chkHp2,
              hp3 : chkHp3
           },
           dataType:'text', 
           success : function(result){
              if(result == "해당하는 아이디가 없습니다. 다시 입력해 주세요"){
                 alert(result)
              } else {
                 alert(result)
                 self.close();
               }
            }, 
           error: function() {
                 alert("에러 발생");
           }
         });
    } else {    
         var chkId = $('#id').val();
         
         jQuery.ajax({
          type : 'POST',
           url : "searchMember.do",
           data : {
              name : chkName,
              hp1 : chkHp1,
              hp2 : chkHp2,
              hp3 : chkHp3,
              id : chkId
           },
           dataType:'text', 
           success : function(result){
              if(result == "해당하는 비밀번호가 없습니다. 다시 입력해 주세요"){
                 alert(result)
              } else {
                 alert(result)
                 self.close();
               }
            }, 
           error: function() {
                 alert("에러 발생");
           }
         });
    }  
});
</script>
<script>
$(document).ready(function() {
   $('#se_id').on('click', function() {
      $('#se_id').parent().removeClass('gray4').addClass('black');
      $('#se_pa').parent().removeClass('black').addClass('gray4');
        $("#divId").hide();
        $("#searchselect").val("s_id");
   });
   $('#se_pa').on('click', function() {
      $('#se_pa').parent().removeClass('gray4').addClass('black');
      $('#se_id').parent().removeClass('black').addClass('gray4');
      $("#divId").show();
      $("#searchselect").val("s_pw");
   });
})
</script>
<title>회원정보찾기</title>
<style>
body {
   display: flex;
   align-items: center;
   justify-content: center;
   height: 100vh;
   margin: 0;
}

#wrapper {
   width: 350px;
}
</style>
<script type="text/javascript">
            function searchMember(){
               if (f.name.value==""){
                  alert("이름을 입력해 주세요")
                  f.name.focus()
                  return false
               }
               if (f.hp1.value==""){
                  alert("전화번호 앞자리를 입력해 주세요")
                  f.hp1.focus()
                  return false
               }
              if (f.hp2.value==""){
                  alert("전화번호  가운데 자리를 입력해 주세요")
                  f.hp2.focus()
                  return false
              }
              if (f.hp3.value==""){
                  alert("전화번호 뒷자리를 입력해 주세요")
                  f.hp3.focus()
                  return false
              }
              if (f.id.value==""){
                  alert("아이디를 입력해 주세요")
                  f.id.focus()
                  return false
            }
              return true
               
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

      </script>
</head>
<body>
   <div id="wrapper">
      <div id="openTag" class="renew-2308">
         <div id="cnt">
            <div class="cntbody">
               <div id="find" class="box_member">
                  <div class="tabcnt_find tabcnt_find0" style="display: block">
                     <form name="f" action="searchMember.do" method="post">
                        <fieldset>
                           <div class="fld" style="padding-top: 40px;">
                              <div class="btn tac"
                                 style="display: flex; margin-left: 100px; margin-bottom: 25px;">
                                 <div class="box_btn w144 h45 fs15">
                                    <a id="se_id" style="width: 105px; font-size: 12px;">아이디</a>
                                 </div>
                                 <div class="box_btn w144 h45 fs15 gray4">
                                    <a id="se_pa" style="width: 105px; font-size: 12px;">비밀번호</a>
                                 </div>
                              </div>
                              <br>
                              <br> <input type="hidden" name="searchselect"
                                 id="searchselect" value="s_id"><br>
                              <div align="center" id="SearchId" class="addbtn">
                                 <div class="fld">
                                    <label>이름</label> <input type="text" name="name" id="name"
                                       class="form_input member2" placeholder="이름을 입력해주세요">
                                 </div>
                                 <div class="fld" id="divId" style="display: none">
                                    <label>아이디</label> <input type="text" name="id" id="id"
                                       class="form_input member2" placeholder="아이디를 입력해주세요">
                                 </div>
                                 <div class="fld">
                                    <select name="hp1" id="hp1">
                                       <option value="010">010</option>
                                       <option value="011">011</option>
                                       <option value="017">017</option>
                                       <option value="016">016</option>
                                    </select> <input type="text" name="hp2" id="hp2"
                                       class="form_input member form_cell form_cell2"
                                       maxlength="4" onkeyup="autoFocus(4, this.id, 'hp3')"
                                       onkeypress="allowOnlyNumbers(event)"> <input
                                       type="text" name="hp3" id="hp3"
                                       class="form_input member form_cell form_cell3"
                                       maxlength="4" onkeypress="allowOnlyNumbers(event)">
                                 </div>
                                 <span class="box_btn block h50 fs15"> <a
                                    id="dupChkBtn">확인</a>
                                 </span>
                              </div>
                           </div>
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>