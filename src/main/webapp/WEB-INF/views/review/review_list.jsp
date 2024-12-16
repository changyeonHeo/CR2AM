<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- review/list_myReview.jsp -->

<%-- <%@ include file = "../mypage/top.jsp" %> --%>
<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style_main.css">
<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.styled-table th, .styled-table td {
	border: 6px solid #454545c9;
	border-radius: 5px;
}
hr {
   background-color: black;
   width: 100%;
   height: 3px;
}
p {
   margin-bottom: 0;
} 

.check_area {
   width: 85%;
   /* padding-left: 100px; */
   padding-bottom: 50px;
}
 .social_feeds .feed_card {
    width: 20%;
    box-sizing: border-box;
}
.social_feed_mansory {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* 균등하게 해주는거 */
}

</style>

   <!-- <div class="info_area"> -->
    <div class="mmmiddle_area">  
      <div>
         <h4 class="log_info"> MY STYLE </h4>
         <hr>
      </div>
 	  <br><br>
	<div data-v-fa9bbe1c="">
    <c:if test="${empty listMyReview}">
		<h3>등록된 게시물이 없습니다.</h3>
	</c:if> 
	
 	<div class="social_feed_mansory social-feeds social_feeds grid_4">
    <c:forEach var="dto" items="${listMyReview}">				
		<div class="feed_card item square">
           <a href="review_content.do?rnum=${dto.rnum}&id=${dto.id}">
			<div class="card_box">
			<div class="social_image_box square">
				<picture data-v-44ba780a="" data-v-646685ef="" class="picture social_img">
					<img data-v-44ba780a="" src="/files/${dto.rimage}" class="image full_width">
				</picture></div>						
			<div class="card_detail">
				<div class="user_box">
				<span class="user_name user_name">
				<span data-v-7ddd6c4e="">${dto.id}</span></span></div>
				<div class="user_box">
				<span class="user_name user_name">
				<span data-v-7ddd6c4e="">${dto.rproduct}</span></span></div>
				<div class="user_box">
				<span class="user_name user_name">
				<span data-v-7ddd6c4e="">${dto.regdate}</span></span>
			</div>
		</div>
		</div>
			</a>
		</div>
		<div class="gutter_item"></div>	
	</c:forEach>

		</div>			   
		 <br>
</div>

   <div align="center">
   <c:if test="${startPage > pageBlock}">
        <a href="review_list.do?pageNum=${startPage - pageBlock}&id=${loginMember.id}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i}]</b>
            </c:when>
            <c:otherwise>
                <a href="review_list.do?pageNum=${i}&id=${loginMember.id}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <a href="review_list.do?pageNum=${startPage + pageBlock}&id=${loginMember.id}">[다음]</a>
    </c:if>
</div>
</div>
</div>

<%@ include file="../bottom2.jsp"%>  
