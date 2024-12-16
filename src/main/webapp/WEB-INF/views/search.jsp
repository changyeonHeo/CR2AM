<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- search.jsp -->   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="css/style_search.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/searchajax.js" charset="UTF-8"></script>

<script>
function clearInput() {
    document.getElementById('productInput').value = ''; // 입력된 검색어 지우기
}
</script>

<html>
<head>
 <title> CR2AM | 한정판 거래의 FLEX </title> 
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div class="layout_base lg wrap has_tab win_os lg" tabindex="0">
		<div class="vue-portal-target">
			<div data-v-2077f721="" data-v-3efebc96="" class="layer lg layer_search lg">
				<div data-v-2077f721="" class="layer_container">
					<!-- <a data-v-3efebc96="" data-v-2077f721="" href="#" class="btn_layer_close"></a> -->
				
		<div data-v-2077f721="" class="layer_header"></div>
			<div data-v-2077f721="" class="layer_content">
				<div data-v-3efebc96="" data-v-2077f721="" class="search_container">
					<div data-v-3efebc96="" data-v-2077f721="" class="search_wrap">
					<div data-v-63326639="" data-v-3efebc96="" class="search_area" data-v-2077f721="">
						<div data-v-63326639="" class="search">
							<input data-v-63326639="" type="text" placeholder="브랜드, 상품, 카테고리 입력" title="검색창" 
									class="input_search show_placeholder_on_focus" id="productInput" onkeyup="search(this);">
								<button data-v-63326639="" class="btn_search_delete" onclick="clearInput()">										   
									<img src="/img/xxx.png" style="width:25px; height:25px; margin-left: -8px; margin-top: -3px;">
								</button>
						</div>
					</div>
				</div>
			</div> 
			<div data-v-3efebc96="" data-v-2077f721="" class="suggest_wrap">
				<div data-v-3efebc96="" data-v-2077f721="" class="suggest_area">
					<div data-v-c9703de2="" data-v-3efebc96="" class="suggest_list mo">
   					<div id="productList"></div>
					   <!-- <h1 id="selected"></h1> -->
						<div data-v-50e9c89a="" class="layer_search_title_wrap">											
							<div data-v-50e9c89a="" class="title_sub_text">
								<span data-v-50e9c89a="" class="title">최근 검색어</span>
							 	<div data-v-50e9c89a="" data-v-3efebc96="" class="title_sub_text" data-v-2077f721="">
							      <c:if test="${not empty searchList}">
							         <a href="deleteAllSearch.do"> 검색어 지우기</a>
							      </c:if>
							   	</div>
							</div>
						</div>
								
			<div data-v-50e9c89a="" class="layer_search_item_content_wrap">
				<div data-v-704623ba="" data-v-c71c7ed4="" class="recent_box" data-v-50e9c89a="">
					<div data-v-704623ba="" class="search_list" style="margin-left:12px;">              
						<c:if test="${empty searchList}">
							최근 검색어가 없습니다
						</c:if>
						<c:if test="${not empty searchList}">
							<c:forEach var="search" items="${searchList}">
								<div data-v-704623ba="" class="search_item">
									<a href="searchResult.do?cmd=${cmd}&subject=${search}">
										<div data-v-704623ba="" class="search_item_text"> ${search} </div>
									</a>					                 
									<a href="deleteSearch.do?subject=${search}">
					                  	<img src="/img/small_xxx.png" style="width:15px; height:15px;">
									</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
								</div>
							</div>
						</div>			
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
   
</body>
</html>


