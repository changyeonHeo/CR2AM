<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- board/board_updateForm.jsp -->

<%-- <%@ include file="../mypage/top.jsp"%> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<script type="text/javascript">
function check(){
   if (f.btitle.value == ""){
      alert("제목을 입력해 주세요!!")
      f.btitle.focus()
      return false
   }
   if (f.bcontent.value == ""){
      alert("내용을 입력해 주세요!!")
      f.bcontent.focus()
      return false
   }
   return true
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

    document.getElementById("bregdate").value = getCurrentDate();
  };
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
   src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


    <div class="mmmiddle_area">
     <div>
         <h4 class="log_info"> 문의 수정 </h4>
         <hr>
      </div> 
<!-- <div id="header-second-contents" style="padding-left: 100px; padding-bottom: 50px;"> -->
   <form name="f" method="post" action="update.do?bnum=${getBoard.bnum}" enctype="multipart/form-data" onsubmit="return check()">
   <div>
   <br>
      <table class="board-write">      
            <colgroup>
               <col style="width:99px;">
                <col>
            </colgroup>   
            <tbody>
         <tr class="first">
               <td scope="row">
                     <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;" readonly>
                   <strong> 작성자 </strong></label>
               </td>
               <td>
                   <input type="text" id="id" name="id" value="${loginMember.id}" readonly
                     class="txt2" style="width:500px;">
                </td>  
            </tr>                 
                <tr>
                   <td scope="row"><label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                         <strong> 제목 </strong></label></td>
                   <td>
                       <input type="text" id="btitle" name="btitle" class="txt2" style="width:500px;" 
                          value="${getBoard.btitle}" placeholder="제목을 입력해주세요.">
                   </td>
                </tr>            
                <tr>
                   <td scope="row">
                <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"> 
                       <strong>사진첨부</strong>
                    </label>                                   
                   </td>
                    <td>                      
                       <br>
                     <img src="/files/${getBoard.bimage}" width="80" height="80" onError="this.style.visibility='hidden'">
                     <input type="file" name="bimage" class="box" >
                     <input type="hidden" name="bimage2" value="${getBoard.bimage}"/>
                    </td>
                </tr>                
                <tr>
                   <td scope="row">
                    <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"> 
                       <strong>문의사항 </strong>
                    </label>
                    <td>
                       <br>
                       <textarea id="bcontent" name="bcontent" rows="30" class="txt2" 
                                   placeholder=" 내용을 입력해주세요" cols="120" 
                                   style="width:500px;height:267px; border-radius: 10px; 
                                   border-width: medium; border-color: black; border: 2px solid black;">${getBoard.bcontent}</textarea>
                    </td>
                </tr>                                        
                <tr>
                   <td scope="row"><label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                         <strong> 날짜 </strong></label></td>
                   <td>
                       <input type="text" id="bregdate" name="bregdate" class="txt2" 
                         style="width:500px;" value="${dto.getBregdate}" readonly/>
                   </td>
                </tr>
                </body>
            </table> 
            </div>                  
             <div class="btn tac">
                <span class="box_btn w144 h45 fs15">
                   <button type="submit" id="register_Btn" style="margin-left: 270px;">
                   <strong> 등록하기 </strong></button>
                </span>
             </div>
            </form>   
         </div>
      </div>
      
<%@ include file="../bottom2.jsp"%>