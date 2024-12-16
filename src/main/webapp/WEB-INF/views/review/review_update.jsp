<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- review_update.jsp -->
   
<%-- <%@ include file="../mypage/top.jsp" %> --%>
<%@ include file="../top_main.jsp" %>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- review_updateForm.jsp -->

<style>
hr {
   background-color: black; 
   width: 700px;
   height: 2px;
}
.social_img[data-v-82a348c4] {
   max-width: 300px !important;
}
.buttonWrap button {
   width: 600px;
   height: 45px;
   line-height: 42px;
   border-radius: 0.32rem;
   border: 1px solid;
   border-color: rgb(51, 51, 51);
   color: rgb(51, 51, 51);
   text-align: center;
   font-size: 16px;
   font-weight: 400;
   outline: 0;
   cursor: pointer;
   background: none;
   margin-top: 10px;
   border-width: medium;
}
textarea {
   width:500px;
   height:267px; 
   border-radius: 10px; 
    border-width: medium; 
    border-color: black; 
    text-align:left;
}
.btn {
   margin-top: 20px;
}
.tac {
   text-align: center !important;
}
.btn.tac span {
   display: inline-block;
   margin: 0 2px;
}
.box_btn {
   text-align: center;
   verticl-align: top;
}
.box_btn > * {
   display: inline-block;
   margin: 0;
   border: 1px solid #333;
   outline: none;
   background: #333;
   color: #fff !important;
   font-weight: normal;
   text-align: center;
   vertical-align: middle;
   white-space: nowrap;
   cursor: pointer;
   -webkit-appearance: none;
   transition: all .2s ease;
}
.box_btn.fs15 > * {
   font-size: 15px !important;
}
.box_btn.h45 > * {
   height: 45px;
   padding: 0;
   line-height: 43px;
}
.box_btn.w144 > * {
   width: 144px;
}
.box_btn.gray4 * {
   border-color: #f8f8f8;
   background: #f8f8f8;
   color: #333 !important;
}
a {
   text-decoration: none;
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
      return true; 
   } 
</script>

<script>
  window.onload = function () {
    function getCurrentDate() {
      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth() + 1; 
      var day = today.getDate(); // day 변수를 추가하여 일자를 가져옵니다.

      month = (month < 10) ? "0" + month : month;
      day = (day < 10) ? "0" + day : day;

      return year + "-" + month + "-" + day;
    }

    document.getElementById("regdate").value = getCurrentDate();
  };
</script>
   
<div id="header-second-contents" style="padding-left: 500px; padding-bottom: 50px;">
   <form name="f" action="review_update.do?rnum=${getReview.rnum}&id=${loginMember.id}" method="post" 
            enctype="multipart/form-data" onsubmit="reviewcheck()">                               
      <div>
      <br><br><br><br><br><br>
      <table class="board-write">
         <div>
            <h4 class="review_write">리뷰 수정</h4> 
            <hr>
         </div>
            <colgroup>
               <col style="width:99px;">
                <col>
            </colgroup>
            <tbody>
                <tr class="first">
                   <th scope="row">
                   	<label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                   		<strong> 작성자 </strong></label>
               </th>
               <td>
                   <input type="text" id="id" name="id" value="${loginMember.id}" readonly
                     class="txt2" style="width:500px;">
                </td>  
            </tr>                 
                <tr>
                    <th scope="row">
                   	<label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                   		<strong> 제목 </strong></label>
               	   </th>                                 
                   <td>
                       <input type="text" id="PRvwNm" name="rtitle" class="txt2" 
                             style="width:500px;" onkeypress="" value="${getReview.rtitle}">
                   </td>
                </tr>
                <tr>
                   <td align="left"><strong> 상품 </strong></td>
                    <td>
                       <input type="text" name="rproduct" class="box" size="40" value="${getReview.rproduct}">
                      </td>
                </tr>
                <tr class="last">
                   <th>사진첨부</th>
                    <td>                      
                       <br>
                          <img id="img" alt="미리보기" 
                          	style="display:none; max-width:100px; max-height:100px;"
                            src="/files/${getReview.rimage}">
                       	<input type="file" name="rimage" id="upfile" class="box" style="margin-bottom:5px;">
                       	<input type="hidden" name="rimage2" id="upfile2" class="box" 
                       		value="${getReview.rimage}" style="margin-bottom:5px;"/>                            
                    </td>
                    <script>
                   console.log("Image Path: <%=request.getContextPath()%>/WEB-INF/views/${rimage}");
               </script>
                </tr>
                <tr>
                    <th scope="row"><label for="ip_review"> 내용 </label></th>
                    <td>
                       <textarea name="rcontent" rows="30" class="txt2" style="width:500px;height:150px; border-radius: 10px; 
                       border-width: medium; border-color: black; border: 2px solid black;">${getReview.rcontent}</textarea>
                    </td>
                </tr>
                <tr>
                   <td scope="row">
                   <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                         <strong> 작성일 </strong></label></td>
                   <td>
                       <input type="text" id="regdate" name="regdate" class="txt2" 
                         style="width:500px;" value="${dto.getRegdate}" readonly/>
                   </td>
                </tr>                               
         </tbody>
      </table> 
   </div>
    <div class="btn tac">
       <span class="box_btn w144 h45 fs15">
          <button type="submit" onclick="return reviewcheck()" style="margin-left: 200px;">
          <strong>저장</strong>
          </button>
       </span>
       <span class="box_btn w144 h45 fs15 gray4">
          <button type="button" onclick="history.back();" style="margin-left: 10px;">
          <strong>취소</strong>
          </button>
       </span>
    </div>
   </form>
</div>
<br><br><br><br><br><br><br><br>
<%@ include file="../bottom2.jsp"%> 