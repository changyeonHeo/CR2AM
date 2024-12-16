<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- board/board_writeForm.jsp -->   

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
      var day = today.getDate();

      month = (month < 10) ? "0" + month : month;
      day = (day < 10) ? "0" + day : day;

      return year + "-" + month + "-" + day;
    }

    document.getElementById("bregdate").value = getCurrentDate();
  };
</script>

<!-- <div id="header-second-contents" style="padding-left: 100px; padding-bottom: 50px;"> -->
	<div class="mmmiddle_area">	
	  <div>
         <h4 class="log_info"> 문의 하기 </h4>
         <hr style="background-color: black; height: 3px">
      </div>    
   
   <form name="f" method="post" action="write.do" enctype="multipart/form-data" onsubmit="return check()">
   <div>
      <table class="board-write">
            <colgroup>
               <col style="width:99px;">
                <col>
            </colgroup>   
            <tbody>
                <tr class="first">
                   <td scope="row"><label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"><strong>작성자</strong></label></td>
                   <td>
                       <input type="text" id="id" name="id" value="${loginMember.id}" readonly
                        class="txt2" style="width:500px;">
                   </td>
                </tr>
                <tr>
                   <td scope="row">
                   <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;">
                   	<strong>제목</strong>
                   </label>
                   </td>
                   <td>
                       <input type="text" id="btitle" name="btitle" class="txt2" style="width:500px;" 
                              placeholder="제목을 입력해주세요.">
                   </td>
                </tr>   
                <tr>
                   <td scope="row">
 					<label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"> 
                    	<strong>사진첨부</strong>
                    </label>                                   
                   </td>
                    <td>                      
                       <br><input type="file" name="bimage" class="box" style="margin-bottom:5px;">
                            <img id="img" src="" alt="미리보기" style="display:none; max-width:100px; max-height:100px;">     
                    </td>
                </tr>   
                <tr>
                	<td scope="row">
                    <!-- <th scope="row"> -->
                    <label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"> 
                    	<strong>문의사항 </strong>
                    </label>
                    </td>
                    <td>
                       <br>
                       <textarea id="bcontent" name="bcontent" rows="30" class="txt2" 
                                   placeholder=" 내용을 입력해주세요" cols="120" 
                                   style="width:500px;height:267px; border-radius: 10px; 
                                   border-width: medium; border-color: black; border: 2px solid black;"></textarea>
                    </td>
                </tr>   
                <tr>
                   <td scope="row"><label for="ip_tit" style="padding-top: 10px; padding-bottom: 5px;"><strong>날짜</strong></label></td>
                   <td>
                       <input type="text" id="bregdate" name="bregdate" class="txt2" 
                         style="width:500px;" value="${dto.getBregdate}" readonly/>
                   </td>
                </tr>   
         </tbody>
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