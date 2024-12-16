<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- admin_board_content.jsp -->

<%@ include file="../admin/admin_top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">
<tr height="75%">
   <td width="80%"><br>
   <br>
   <br>

      <table border="0" width="50%" class="outline" align="center">
         <caption>
            <h2>문의사항</h2>
         </caption>
         <tr>
            <th width="15%" class="m1">작성자</th>
            <td>${getBoard.id}</td>
         </tr>
            <th width="15%" class="m1">제목</th>
            <td>${getBoard.btitle}</td>         
		 <tr>
		 </tr>
         <tr>
            <th width="15%" class="m1">상품이미지</th>
            <td align="center"><img src="/files/${getBoard.bimage}"
               width="150" height="150" onError="this.style.visibility='hidden'"></td>
         </tr>
         <tr>
            <th width="15%" class="m1">문의 내용</th>
            <td colspan="3">${getBoard.bcontent}</td>
         </tr>
         <tr>
            <th width="15%" class="m1">작성일</th>
            <td>${getBoard.bregdate}</td>
         </tr>
         <tr>
            <td align="right" colspan="4"><input type="button" value="목록보기"
               onclick="window.location='admin_board_list.do?bnum=${getBoard.bnum}&id=${getBoard.id}'">
               <input type="button" value="문의삭제"
               onclick="window.location='delete_adminBoard.do?bnum=${getBoard.bnum}&id=${getBoard.id}'">
            </td>
         </tr>
      </table> <br>
     <div id="commentContainer" align="center">
         <table border="3" width="50%"  id="commentTable"
            style="border-collapse: collapse; border-color: black;"
            > 
            <caption>
               <h2 align="left"> 댓 글 </h2>
            </caption>   
               <c:if test="${empty getBreply or fn:length(getBreply) == 0}">
                  <tr>
                     <td colspan="4" align="center">댓글이 없습니다.</td>
                  </tr>
               </c:if>
                                 
         </table>
          <a href="#" onclick="loadcomment(); return false;" id="loadMoreBtn">더보기</a>
          <a href="#" id="loadLessBtn">줄이기</a><br>
         <table>
               <tr>
                <td colspan="4" aling="center">
                    <form id="commentForm" onsubmit="return false;">
                        <textarea name="bcontent" id="bcontent" rows="5" cols="101" placeholder="댓글을 입력하세요"></textarea>
                        <input type="hidden" name="bnum" value="${getBoard.bnum}">
                        <input type="hidden" name="id" value="${loginMember.id}">
                        <br>
                        <input type="button" class="btn13" value="등록" onclick="submitComment()"
                        style="margin-left:679px;margin-top:15px;">
                    </form>
                </td>
            </tr>
         </table>
   </div>
   
<script>
function submitComment() {
    var formData = $("#commentForm").serialize();
    $.ajax({
        type: "POST",
        url: "board_comment.do",
        data: formData,
        success: function (data) {
            $("#bcontent").val('');
            loadComments(1);
        },
        error: function () {
            alert("댓글 등록에 실패했습니다.");
        }
    });
}

var currentPage = 1;
var pageSize = 5;
var totalComments = 0;

var currentData = [];

$(document).ready(function () {
    $("#loadMoreBtn").on("click", function () {
        currentPage++;
        loadComments(currentPage);
    });

    $("#loadLessBtn").on("click", function () {
        currentPage = 1;
        loadComments(currentPage);
    });

    loadComments(1);
});

function loadComments(page) {
    $.ajax({
        type: "GET",
        url: "getBreply.do",
        data: { pageNum: page, pageSize: pageSize, bnum: "${getBoard.bnum}" },
        dataType: 'json',
        success: function (data) {
            // 기존 댓글 목록을 제거
            if (page === 1) {
                currentData = []; 
                $("#commentTable").empty();
            }
            if (data.getBreply.length === 0) {
                $("#commentTable tbody").append("<tr><td colspan='4' align='center'>댓글이 없습니다.</td></tr>");
            }
            for (var i = 0; i < data.getBreply.length; i++) {
                var breply = data.getBreply[i];
                var newRow = "<tr>" +
                	"<td align='center' width='20%'>" + (breply.id === 'admin' ? '관리자' : breply.id) + "</td>" +
                    "<td align='left' width='50%'>" + breply.bcontent + "</td>" +
                    "<td align='center' width='20%'>" + breply.begdate + "</td>" +
                    "<td>";

                
                newRow += "<a href='admin_breplyDelete.do?brenum=" + breply.brenum + "&id=" + breply.id + "&bnum=" + breply.bnum + "'>삭제</a>";
                

                newRow += "</td></tr>";

                $("#commentTable").append(newRow);

                // 새로운 댓글을 배열에 추가
                currentData.push(breply);
            }

            totalComments = data.totalComments;

            if (data.getBreply.length < pageSize) {
                $("#loadMoreBtn").hide();
                if (page === 1) {
                    $("#loadLessBtn").hide();
                } else {
                    $("#loadLessBtn").show();
                }
            } else {
                $("#loadMoreBtn").show();
                $("#loadLessBtn").hide();
            }
        },
        error: function () {
            alert("댓글 목록 갱신에 실패했습니다.");
        }
    });
}
</script>