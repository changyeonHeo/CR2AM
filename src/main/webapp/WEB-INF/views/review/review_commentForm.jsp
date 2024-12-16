<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- commentForm.jsp -->

<div align="center">
   <form name="f" action="review_commentForm.do?rnum=${replyMember.rnum}&id=${replyMember.id}" method="post">                               
      <table border="1" width="25%">
         <tr>
            <td align="center" width="20%">내 용</td>
            <td><textarea name="rcontent" rows="11" cols="40" class="box"></textarea></td>
         </tr>
         <tr>
            <td align="center" colspan="2">
               <input type="submit" value="등록">
               <input type="button" value="목록보기" onclick="window.location='review-list.do'">
            </td>
         </tr>
      </table>
   </form>
</div>
    