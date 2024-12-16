<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- top_main.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.catelist{
   width : 100%;
   height : 65px;
   left: -10px;
    position: fixed;
    right: 0;
    top: 65px;
    z-index: 3;
}
.header.fixed {
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
    height : 135px;
    z-index: 0;
}

</style>

<link rel="stylesheet" type="text/css" href="css/style_ctop.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style-header.css">
<link rel="stylesheet" type="text/css" href="css/style-index.css">   
<link rel="stylesheet" type="text/css" href="css/style-common.css">   
   
<!DOCTYPE html>

<html>
<head>
<title> CR2AM | 한정판 거래의 FLEX </title>
</head>
<body>

<%@include file="top_mylog.jsp"%>

   <div class="catelist">
   <div data-v-77726920="" class="portal_target vue-portal-target">   
 
      <!-- Start of Dropdown -->      
       <div id="header-second" class="catelist" style="max-width:1000px;">
         <div class="btn-group header-second-btn-box">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <button type="button" id="header-sec-rank" style=""
                     class="btn btn-basic header-second-btn-group"
                     onclick="location.href='ranking.do';">랭킹</button>
            <div class="btn-group">
               <button type="button" id="header-sec-items"
                  class="btn btn-basic dropdown-toggle header-second-btn-group"
                  data-toggle="dropdown">브랜드별</button>
               <div class="dropdown-menu">
                  <ul class="no_dot">
                     <c:forEach var="listBrand" items="${listBrand}">
                     <a class="dropdown-item"
                        href="productlist.do?mode=pbrand&pbnum=${listBrand.pbnum}">${listBrand.pbrand}</a>
                </c:forEach>            
                  </ul>
               </div>
            </div>
            <div class="btn-group">
               <button type="button" id="header-sec-items"
                  class="btn btn-basic dropdown-toggle header-second-btn-group"
                  data-toggle="dropdown">카테고리별</button>
               <div class="dropdown-menu">
               <ul class="no_dot">
                     <c:forEach var="listCate2" items="${listCate2}">
                     <a class="dropdown-item"
                        href="productlist.do?mode=cname&cname=${listCate2}">${listCate2}</a>
                </c:forEach>          
               </ul>
               </div>
            </div>
 <%--           <c:choose>
                <c:when
                  test="${pageContext.request.requestURI eq '/shop/product/productAllList.jsp'}">
                  <button type="button" id="header-sec-rank"
                     class="btn btn-basic header-second-btn-group border-btm-red"
                     onclick="location.href='productAllList.do';">전체상품</button>
               </c:when> --%>
               <%-- <c:otherwise> --%>
                  <button type="button" id="header-sec-rank" style=""
                     class="btn btn-basic header-second-btn-group"
                     onclick="location.href='productAllList.do';">전체상품</button>
<%--                </c:otherwise>
            </c:choose> --%>
         </div>
      </div>      
    </div>
    </div>
    
   