<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mypage/top.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style_check.css">
    
<!-- mypage_check_end.jsp -->
<!-- 검수완료 페이지 -->


<style>

hr {
   background-color: black;
   width: 100%;
   height: 2px;
}

p {
   margin-bottom: 0;
}

</style>

    <div class="check_area" align="left">
       <div>
         <h4 class="log_info"> 검수 </h4>
         <hr>
      </div> 
      <div class="purchase_list_tab sell detail_tab">
		<div class="tab_item tab_on">
 			<a href="mypage_check_ing.do" class="tab_link">   
		      	<span class="check_title"> 검수중 </span>
	   		</a>
	   	</div>
		<div class="tab_item">
			<a href="mypage_check_end.do" class="tab_link">
				<span class="selfont"> 검수완료 </span>
			</a>
		</div>
		  </div>	  
	</div>
</div>
	<br>
	<br>
<%@ include file="../bottom2.jsp"%>