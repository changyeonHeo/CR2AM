<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- loginfo.jsp -->

    
<%-- <%@ include file="top.jsp"%> --%>

<%@ include file="../top_mylog.jsp"%>
<%@ include file="../mypage/mypage_side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="css/style_mypage.css">
<link rel="stylesheet" type="text/css" href="css/style_main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style_mypage_Add.css">

<style>
hr {
   background-color: black;
   width: 100%;
   height: 3px;
}
p {
   margin-bottom: 0;
}

</style>   

   <div class="mmmiddle_area">
      <div>
         <h4 class="log_info">로그인 정보</h4>
         <hr>
      </div>
      
<div class="profile_info" data-v-cf6a6ef4="">
<div class="profile_group" data-v-8b96a82e="" data-v-cf6a6ef4="">
<h4 class="group_title" data-v-8b96a82e="">내 계정</h4>

<div class="unit" data-v-0c9f3f9e="" data-v-cf6a6ef4="" data-v-8b96a82e="">
<h5 class="title" data-v-0c9f3f9e=""  style="padding-top: 5px;">이메일 주소</h5>
<div class="unit_content" data-v-0c9f3f9e="">
<p class="desc email" data-v-24a03828="" data-v-cf6a6ef4="" data-v-0c9f3f9e="">
${myinfo.email}</p>
</div>
</div>

</div></div>
<div class="profile_info" data-v-cf6a6ef4="">
<div class="profile_group" data-v-8b96a82e="" data-v-cf6a6ef4="">
<div class="unit" data-v-0c9f3f9e="" data-v-cf6a6ef4="" data-v-8b96a82e="">
<h5 class="title" data-v-0c9f3f9e=""> 비밀 번호 </h5>
<div class="unit_content" data-v-0c9f3f9e="">
<%--  <input type="password" class="desc2" value="${myinfo.passwd}" readonly> --%>
<%-- <p class="desc password" readonly data-v-24a03828="" data-v-cf6a6ef4="" data-v-0c9f3f9e="">
${myinfo.passwd}</p> --%>

<p class="desc email" data-v-24a03828="" data-v-cf6a6ef4="" data-v-0c9f3f9e="">
<input type="password" value="${myinfo.passwd}" readonly>
</p>

</div>
</div></div></div>

<div class="profile_info" data-v-cf6a6ef4="">
<div class="profile_group" data-v-8b96a82e="" data-v-cf6a6ef4="">
<h4 class="group_title" style="padding-top:5px;" data-v-8b96a82e="">개인 정보</h4>

<div class="unit" data-v-0c9f3f9e="" data-v-cf6a6ef4="" data-v-8b96a82e="">
<h5 class="title" data-v-0c9f3f9e=""  style="padding-top: 5px;">휴대폰 번호</h5>
<div class="unit_content" data-v-0c9f3f9e="">
<p class="desc email" data-v-24a03828="" data-v-cf6a6ef4="" data-v-0c9f3f9e="">
${myinfo.hp1}-${myinfo.hp2}-${myinfo.hp3}</p>
</div>
</div>      
 

 </div></div>
		<div class="profile_info" style="padding-top:15px;" data-v-cf6a6ef4="">
		<div class="profile_group" data-v-8b96a82e="" data-v-cf6a6ef4="">      
               <div class="btn_box" style="margin-left:375px; margin-bottom:8px;" data-v-61e7a8a3="">
                  <a data-v-14ec1f2e data-v-61e7a8a3 href="member_update.do?id=${loginMember.id}" class="btn btn_add"> 
                  <span data-v-61e7a8a3 class="btn_txt"> 정보수정  </span>
                  </a>
                  <br>
                  </div>

                <div class="btn_box"  style="margin-left:375px; margin-bottom:8px;" data-v-61e7a8a3="">
                  <a data-v-14ec1f2e data-v-61e7a8a3 href="member_deleteAgree.do?id=${loginMember.id}" class="btn btn_add"> 
                  <span data-v-61e7a8a3 class="btn_txt"> 회원탈퇴  </span>
                  </a>
                 </div>
 		</div></div></div></div>
 
 
 
 
 
 
 
 
 
 
 
 
 
<%--  
      <div>
         <h3 class="my_info">내 계정</h3>
         <div class="unit">
            <h5 class="title">이메일 주소</h5>
            <div class="unit_content">
               <p class="info_contents">${myinfo.email}</p>
            </div>
         </div>
         <div class="unit">
            <h5 class="title">비밀번호</h5>
             <div class="unit_content">
                 <input type="password" class="info_contents" value="${myinfo.passwd}" readonly>
             </div>   
         </div>
      </div>
      <div>
         <h3 class="my_info">개인 정보</h3>
         <div class="unit" style="border-bottom: 1px solid #ebebeb;">
            <h5 class="title">휴대폰 번호</h5>
            <div class="unit_content">
               <p class="info_contents">${myinfo.hp1}-${myinfo.hp2}-${myinfo.hp3}</p>
            </div>   
         </div>
         <a href="member_update.do?id=${loginMember.id}">정보수정</a>
      </div>
      <a href="member_deleteAgree.do?id=${loginMember.id}">회원탈퇴</a>
   </div>
</div> --%>
<br><br>
<%@ include file="../bottom2.jsp"%>