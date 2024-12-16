<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- review/review_content.jsp -->	

<%@ include file="../top_main.jsp" %>
<%-- <%@ include file="../mypage/top.jsp" %> --%>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">  
<link rel="stylesheet" type="text/css" href="css/style_check.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
#header-second-contents {
	max-width: 800px;
	padding-top: 100px;
	padding-right: 50px;
	padding-bottom: 50px;
	margin-left: 350px;
	display: flex;
	height: 580px;
}

#bcontent {
	width: 500px !important;
	height: 50px !important;
}
</style>

<div id="header-second-contents">
	<div align="center">
		<table width="400px" class="ta2">
			<tr>	
				<th bgcolor="#F5F5F5" width="20%"> 작성자 </th>
				<td> ${getReview.id}</td>
			</tr>
			<tr>	
				<th bgcolor="#F5F5F5" width="20%"> 글제목 </th>	
				<td> ${getReview.rtitle} </td>
			</tr>
			<tr>
				<th bgcolor="#F5F5F5" width="20%"> 상품명 </th>	
				<td> ${getReview.rproduct} </td>
			</tr>
			<tr>
				<th bgcolor="#F5F5F5" width="20%">상품이미지</th>
				<td align="center"><br>
					<img src="/files/${getReview.rimage}" width="210" height="210"><br><br>
				</td>
			</tr>
			<tr>	
				<th bgcolor="#F5F5F5" width="20%"> 내용 </th>
				<td height="100" >${getReview.rcontent}</td>
			</tr>
			<tr>
				<th bgcolor="#F5F5F5" width="20%"> 작성일 </th>
				<td> ${getReview.regdate} </td>
			</tr>		
			<tr>
				<td colspan="2">
					<div align="right">
					<c:choose>
						<c:when test="${loginMember.id eq getReview.id}">				
						<input type="button" class="btn12" value="글수정" onclick="window.location='review_update.do?rnum=${getReview.rnum}&id=${getReview.id}'"> &nbsp;&nbsp;
						<input type="button" class="btn12" value="내 목록보기" onclick="window.location='review_list.do?id=${loginMember.id}'">&nbsp;&nbsp;
						<input type="button" class="btn12" value="글삭제" onclick="window.location='review_delete.do?rnum=${getReview.rnum}&id=${getReview.id}'">&nbsp;
						</c:when>
					</c:choose>
					</div>				
				</td>
			</tr>
		</table>
		
	<hr style="border: 1px solid #7F7F7F;">
	
    <table border="1"  width="600px" class="ta2" id="commentTable">
            <c:if test="${empty getReply or fn:length(getReply) == 0}">
                <tr> 
                    <td colspan="4" width="100%" align="center">댓글이 없습니다.</td>
                </tr>
            </c:if>
    </table>
    
    <a href="#" onclick="loadcomment(); return false;" id="loadMoreBtn">더보기</a><br>
    <a href="#" id="loadLessBtn">줄이기</a><br>
    
    <table>
       <tr>
           <td colspan="4">
               <form id="commentForm" onsubmit="return false;">
                   <textarea name="rcontent" id="rcontent" rows="5" cols="50" style="height: 100; width: 720;  
                   border: 2px solid #ccc; border-radius: 10px;" placeholder="댓글을 입력하세요"></textarea><br>
                   <input type="hidden" name="rnum" value="${getReview.rnum}">
                   <input type="hidden" name="id" value="${loginMember.id}">
                   <div align="right">
                   <input type="button" class="btn13" value="등록" onclick="submitComment()"></div>
               </form>
           </td>
       </tr>
   </table>      

</div>
</div>
</div>

</body>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
  
  
<%@ include file="../bottom2.jsp"%>

<script>
function submitComment() {
   var id = "${loginMember.id}";
   
   if (!id || id.trim() === "") {
        alert("회원만 댓글 달기가 가능합니다.");
        return;
    }
   
    var formData = $("#commentForm").serialize();
    $.ajax({
        type: "POST",
        url: "review_comment.do",
        data: formData,
        success: function (data) {
            $("#rcontent").val('');
            loadComments(1);
        },
        error: function () {
            alert("댓글 등록에 실패했습니다.");
        }
    });
}


var currentPage = 1;
var pageSize = 5;

var currentData = []; // 현재 댓글 목록을 저장할 배열

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
        url: "getReply.do",
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

                if (reply.id == "${loginMember.id}") {
                    newRow += "<a href='review_comment_delete.do?renum=" + reply.renum + "&id=" + reply.id + "&rnum=" + reply.rnum + "'>삭제</a>";
                } 

                newRow += "</td></tr>";

                $("#commentTable").append(newRow);

                // 새로운 댓글을 배열에 추가
                currentData.push(reply);
            }

            if (data.getReply.length < pageSize) {
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
	
	
	
<%--     <table border="1"  width="600px" class="ta2">
        <c:choose>
            <c:when test="${empty getReply or fn:length(getReply) == 0}">
                <tr> 
                    <td colspan="4" width="100%">댓글이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="reply" items="${getReply}">
                    <tr>
                        <td bgcolor="#F5F5F5" align="center" width="20%"><c:out value="${reply.id}" /></td>
                        <td align="left" width="50%"><c:out value="${reply.rcontent}" /></td>
                        <td align="center" width="20%"><c:out value="${reply.regdate}" /></td>
                        <c:choose>
				            <c:when test="${loginMember.id eq reply.id}">
				                <td align="center" width="10%">
				                <a href="review_comment_delete.do?renum=${reply.renum}&id=${loginMember.id}&rnum=${reply.rnum}">
				                	<input type="button" class="btn13" value="삭제" 
				                	style="font-size:12px; width:50px; height:25px; text-align: center;">&nbsp;&nbsp;
				                </a></td>
				            </c:when>
				            <c:otherwise>
				            <td></td>
				            </c:otherwise>
				        </c:choose>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <tr>
            <td colspan="4">
               <div align="right">
                <c:choose>
				  <c:when test="${loginMember.id eq 'admin'}">	    
				  </c:when>
				  <c:otherwise>
				      <a href="review_commentForm.do?rnum=${getReview.rnum}&id=${loginMember.id}">
				      	 <input type="button" class="btn13" value="댓글쓰기">&nbsp;&nbsp;</a>
				  </c:otherwise>
				</c:choose>
				</div>           
            </td>
        </tr>
    </table> --%>

<%--     <c:if test="${startPage > pageBlock}">
        <a href="content_review.do?pageNum=${startPage - pageBlock}&rnum=${getReview.rnum}&id=${loginMember.id}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i}]</b>
            </c:when>
            <c:otherwise>
                <a href="content_review.do?pageNum=${i}&rnum=${getReview.rnum}&id=${loginMember.id}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <a href="content_review.do?pageNum=${startPage + pageBlock}&rnum=${getReview.rnum}&id=${loginMember.id}">[다음]</a>
    </c:if> --%>
    
    
<%-- </div>
</div>
</div>

</body>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../bottom2.jsp"%> --%>

