<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- board/board_content.jsp -->
    
<%-- <%@ include file="../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>
		
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">
<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">

    <div class="mmmiddle_area">
	  <div>
         <h4 class="log_info"> 문의 내용 </h4>
         <hr>
      </div> 
	<div>
	<br>      
		<table class="ta2" style="width:700px;">
			<tr>	
				<th bgcolor="#F5F5F5" width="20%">제목</th>
				<td width="20%">
					${getBoard.btitle}</td>
				<th bgcolor="#F5F5F5" width="20%">작성일</th>
					<td width="20%">
						${getBoard.bregdate}
					</td>
			</tr>
			<tr>
				<th bgcolor="#F5F5F5" width="15%">문의내용</th>	
				<td height="200" colspan="3">${getBoard.bcontent}</td>
			</tr>
			<tr name="qnaimage">
				<th bgcolor="#F5F5F5" width="15%" name="qnaimage">상품이미지</th>
				<td align="center" colspan="3" name="qnaimage"><br>
					<img src="/files/${getBoard.bimage}" 
						width="150" height="150" onError="this.style.visibility='hidden'">
					<br><br>
				</td>
			</tr>		
			<tr>
				<td colspan="4">
				   <div align="right">
						<!-- <input type="button" value="글쓰기" onclick="window.location='write.do'"> -->
						<input type="button" class="btn12" value="글수정" onclick="window.location='update.do?bnum=${getBoard.bnum}&id=${getBoard.id}'"> &nbsp;&nbsp;
						<input type="button" class="btn12" value="목록보기" onclick="window.location='list.do?bnum=${getBoard.bnum}&id=${getBoard.id}'">&nbsp;&nbsp;
						<input type="button" class="btn12" value="글삭제" onclick="window.location='delete.do?bnum=${getBoard.bnum}&id=${getBoard.id}'">&nbsp;
				   </div>
				</td>
			</tr>
		</table>


<hr style="border: 1px solid #7F7F7F; width:700px; margin-left:0px;">  
<div id="commentSection">
    <table border="1" style="width:700px;" class="ta2" id="commentTable">
        <c:if test="${empty getBreply or fn:length(getBreply) == 0}">
            <tr>
                <td colspan="4" width="100%">댓글이 없습니다.</td>
            </tr>
        </c:if>
    </table>
    
    <a href="#" onclick="loadcomment(); return false;" id="loadMoreBtn">더보기</a><br>
    <a href="#" id="loadLessBtn">줄이기</a><br>
    
    <table>
       <tr>
           <td colspan="4">
               <form id="commentForm" onsubmit="return false;">
                   <textarea name="bcontent" id="bcontent" rows="5" cols="50" style="height: 100; width: 700;  
                   border: 1px solid #ccc;" placeholder="댓글을 입력하세요"></textarea><br>
                   <input type="hidden" name="bnum" value="${getBoard.bnum}">
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
</div>
<br><br><br><br><br><br><br><br><br>
<footer>
<%@ include file="../bottom2.jsp"%></footer>

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
var totalComments = 0; // 전체 댓글 수를 저장하는 변수 추가

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
        url: "getBreply.do",
        data: { pageNum: page, pageSize: pageSize, bnum: "${getBoard.bnum}" },
        dataType: 'json',
        success: function (data) {
            // 기존 댓글 목록을 제거
            if (page === 1) {
                currentData = [];
                $("#commentTable").empty();
            }
            if (data.getBreply.length === 0 && page === 1) {
                $("#commentTable tbody").append("<tr><td colspan='4' align='center'>댓글이 없습니다.</td></tr>");
            }
            for (var i = 0; i < data.getBreply.length; i++) {
                var breply = data.getBreply[i];
                var newRow = "<tr>" +
                	"<td align='center' width='20%'>" + (breply.id === 'admin' ? '관리자' : breply.id) + "</td>" +
                    "<td align='left' width='50%'>" + breply.bcontent + "</td>" +
                    "<td align='center' width='20%'>" + breply.begdate + "</td>" +
                    "<td>";

                if (breply.id == "${loginMember.id}") {
                    newRow += "<a href='breplyDelete.do?brenum=" + breply.brenum + "&id=" + breply.id + "&bnum=" + breply.bnum + "'>삭제</a>";
                }

                newRow += "</td></tr>";

                $("#commentTable").append(newRow);

                // 새로운 댓글을 배열에 추가
                currentData.push(breply);
            }

            // 전체 댓글 수 업데이트
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