<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- admin_review_content.jsp -->   

<%@ include file="../admin/admin_top.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .styled-table th, .styled-table td {
        border: 3px solid #717171;
        padding: 8px;
        text-align: left;
        border-radius: 7px;
    }
</style>

<body>

   <table border="0" width="50%" class="outline" align="center">
      <caption><h2> STYLE 보 기 </h2></caption>
         <tr>     
            <th width="20%" class="m1">작성자</th>
            <td width="25%" align="center">${getReview.id}</td>
            <th width="20%" class="m1">작성일</th>
            <td width="20%" align="center">${getReview.regdate}</td>
         </tr>
         <tr>   
            <th width="20%" class="m1">글제목</th>
            <td width="20%" align="center">
               ${getReview.rtitle}</td>
            <th width="20%" class="m1">상품</th>
            <td width="20%" align="center">
                  ${getReview.rproduct}
            </td>
         </tr>
         <tr>
         <th width="15%" class="m1">상품이미지</th>
            <td align="center" colspan="3">
               <img src="/files/${getReview.rimage}" width="150" height="200">
            </td>
         </tr>
         <tr>
            <th width="15%" class="m1">내용</th>
            <td height="100" colspan="4">${getReview.rcontent}</td>
         </tr>      
         <tr>
            <td align="center" colspan="4">
               <input type="button" value="목록보기" onclick="window.location='admin_review_list.do'">   
            </td>
         </tr>
      </table>

    <div align="center">
    <table border="1" width="50%" align="center">
    <caption><h2 align="left"> 댓 글 </h2></caption>
        <c:choose>
            <c:when test="${empty getReply or fn:length(getReply) == 0}">
                <tr> 
                    <td colspan="3" width="100%">댓글이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="reply" items="${getReply}">
                    <tr>
                        <td align="center" width="20%"><c:out value="${reply.id}" /></td>
                        <td align="left" width="50%"><c:out value="${reply.rcontent}" /></td>
                        <td align="center" width="20%"><c:out value="${reply.regdate}" /></td>
                               <td align="center" width="10%">                        
                        <a href="admin_review_comment_delete.do?renum=${reply.renum}&rnum=${getReview.rnum}">삭제
                                </a>
                         </td>                           
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
    
    <a href="#" onclick="loadcomment(); return false;" id="loadMoreBtn">더보기</a><br>
    <a href="#" id="loadLessBtn">줄이기</a><br>
    </div>
    
<script>

var currentPage = 1;
var pageSize = 5;

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
        url: "getReply.do", // Change the URL to your actual endpoint
        data: { pageNum: page, pageSize: pageSize, rnum: "${getReview.rnum}" },
        dataType: 'json',
        success: function (data) {
            if (page === 1) {
               currentData = [];
                $("#commentTable").empty();
            }
            if (data.getReply.length === 0) {
                $("#commentTable tbody").append("<tr><td colspan='4' width='100%' align='center'>댓글이 없습니다.</td></tr>");
            }

            for (var i = 0; i < data.getReply.length; i++) {
                var reply = data.getReply[i];
                var newRow = "<tr>" +
                    "<td align='center' width='20%'>" + reply.id + "</td>" +
                    "<td align='left' width='50%'>" + reply.rcontent + "</td>" +
                    "<td align='center' width='20%'>" + reply.regdate + "</td>" +
                    "<td>";

                if (comment.id == "${loginMember.id}") {
                    newRow += "<a href='admin_review_comment_delete.do?renum=" + reply.renum + "'>삭제</a>";
                }

                newRow += "</td></tr>";

                $("#commentTable").append(newRow);
            }

            if (data.length < pageSize) {
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
    
    
    