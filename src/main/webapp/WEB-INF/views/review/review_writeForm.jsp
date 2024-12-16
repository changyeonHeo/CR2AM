<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!-- review_writeForm.jsp --> 
   
<%-- <%@ include file="../mypage/top.jsp" %> --%>
<%@ include file="../top_main.jsp" %>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>

#header-second-contents {
   max-width: 1200px;
    padding-top: 100px;
    padding-right: 50px;
    padding-bottom: 50px;
    margin-left:350px;
   display: flex;
   height: 580px;
}

</style>

<script>
$(document).ready(function() {
   $("#upfile").on("change", handleImgFileSelect);
})
function handleImgFileSelect(e) {
   var files = e.target.files;
   var reader = new FileReader();
   reader.onload = function(e) {
      $("#img").attr("src", e.target.result);
      $("#img").css("display", "block");
   }
   reader.readAsDataURL(files[0]);
}
</script>
<script>
function reviewcheck() {  
      if (!f.rproduct.value) {
         alert("상품정보를 입력해주세요!!"); 
         f.rproduct.focus();
         return false;
      } 
      if (!f.rtitle.value) {
         alert("제목을 입력해주세요!!");
         f.rtitle.focus();
         return false;
      } 
      if (!f.rcontent.value) {
         alert("내용을 입력해주세요!!");
         f.rcontent.focus();
         return false;
      }
      if (!f.rimage.value) {
          alert("이미지를 첨부해 주세요");
          return false;
      }
      return true; 
   }
   
</script>

<div id="header-second-contents" style="padding-left: 100px; padding-bottom: 50px;">
   <form name="f" action="review_writeForm.do?id=${loginMember.id}&pname=${rproduct}" method="post" 
            enctype="multipart/form-data">                               
      <div>
      <table class="board-write">
         <div>
            <h4 class="review_write"> STYLE :) </h4> 
            <hr style="border-color: #000000; border-width:3px; width:630px;">
         </div>
            <colgroup>
               <col style="width:99px;">
                <col>
            </colgroup>
            <tbody>
                <tr class="first">
                   <td scope="row"><label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"><strong>제목</strong></label></td>
                   <td>
                       <input type="text" id="PRvwNm" name="rtitle" class="txt2" style="width:500px;" 
                              placeholder="제목을 입력해주세요." onkeypress="">
                   </td>
                </tr>
                <tr class="first">
                   <td><strong>상품이름</strong></td>
                    <td>
                   <input type="text" name="rproduct" class="box" size="40" value="${rproduct}">
               </td>
                </tr>
                <tr class="last">
                   <th>사진첨부</th>
                    <td>                      
                       <br><input type="file" name="rimage" id="upfile" class="box" style="margin-bottom:5px;">
                            <img id="img" src="" alt="미리보기" style="display:none; max-width:120px; max-height:120px;">     
                    </td>
                </tr>

                <tr>
                    <th scope="row"><label for="ip_review">상품평</label></th>
                    <td>
                       <br>
                       <textarea id="PRvwTxt" name="rcontent" rows="30" class="txt2" 
                                   placeholder=" 상품평을 입력해주세요" cols="120" 
                                   style="width:500px;height:150px; border-radius: 10px; 
                                   border-width: medium; border-color: black; border: 2px solid black;"></textarea>
                    </td>
                </tr>
         </tbody>
      </table> 
   </div>
    <div class="btn tac">
       <span class="box_btn w144 h45 fs15">
          <button type="submit" onclick="return reviewcheck()" style="margin-left: 270px;">
          <strong>리뷰 작성</strong></button>
       </span>
    </div>
   </form>
</div>
</div>
<%@ include file="../bottom2.jsp"%> 