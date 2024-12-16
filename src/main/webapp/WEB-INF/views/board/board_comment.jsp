<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- board/board_comment.jsp -->

<%-- <%@ include file="../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">
<link rel="stylesheet" type="text/css" href="css/style_check.css">

<style>

#header-second-contents {
	max-width: 3000px;
    padding-top: 10px;
    padding-right: 20px;
    padding-bottom: 15px;
    margin-left:0px;
	display: flex;
	height: 500px;
}

</style>

<script type="text/javascript">
function check(){
	if (f.bcontent.value == ""){
		alert("내용을 입력해 주세요!!")
		f.bcontent.focus()
		return false
	}
	return true
}
</script>

  <br><br>

<div id="header-second-contents" style="padding-left: 100px; padding-bottom: 50px;">
	<form name="f" action="board_comment.do?bnum=${breplyList.bnum}&id=${breplyList.id}" method="post" onsubmit="return check()"> 
	<div>
		<table class="board-write">
		    <div>
            <h4 class="review_write"> 댓글달기 </h4> 
            <hr style="border-color: #000000; border-width:3px;">
         </div>	
            <colgroup>
               <col style="width:99px;">
                <col>
            </colgroup>	
                <tr>
                    <th scope="row"><label for="ip_review"> 내 용  </label></th>
                    <td>
                       <br>
                       <textarea id="bcontent" name="bcontent" rows="30" class="txt2" 
                                   placeholder=" 내용을 입력해주세요" cols="120" 
                                   style="width:500px;height:267px; border-radius: 10px; 
                                   border-width: medium; border-color: black; border: 2px solid black;"></textarea>
                    </td>
                </tr>
         </tbody>
      </table> 
	   </div>
	    <div class="btn tac">
	       <span class="box_btn w144 h45 fs15">
	          <button type="submit" id="register_Btn" style="margin-left: 270px;">
	          <strong> 등록하기 </strong></button>
	          <input type="button" value="목록보기" onclick="window.location='re_list.board'">
	       </span>
	    </div>
	   </form>	
	</div>
	</div>

<%@ include file="../bottom2.jsp"%>

<%-- 
	<h2 style="text-align: center; font-weight: bold;"> [ 댓글 달기 ] </h2>
	  <br><br>
	<div align="center">
		<form name="f" action="board_comment.do?bnum=${breplyList.bnum}&id=${breplyList.id}" method="post"> 										
			<table border="0" class="outline" width="40%">
				<tr>
					<td align="center" width="20%">내 용</td>
					<td><textarea name="bcontent" rows="15" cols="60" class="box"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="목록보기" onclick="window.location='re_list.board'">
					</td>
				</tr>
			</table>
		</form> --%> 
	</div> 