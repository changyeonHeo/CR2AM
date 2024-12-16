<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_size_input.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<script>
        function selectSize(Size) {
            // 부모 창의 함수를 호출하여 선택한 값을 전달
            window.opener.setSelectedSize(Size);
            window.close();
        }
	</script>


<html>
<head>
	<title> 사이즈 입력하기 </title>
	<link rel="stylesheet" type="text/css" href="css/style_admin.css">
</head>
<body>
	<div align="left">
		<h2> &nbsp;&nbsp;&nbsp; 신발  </h2>
		<hr color="black" width="95%" align="center">
	</div>
	<br>
	<div align="center">
		    <button onclick="selectSize(230)">230</button>
		    <button onclick="selectSize(235)">235</button>
		    <button onclick="selectSize(240)">240</button>
		    <button onclick="selectSize(245)">245</button>
		    <button onclick="selectSize(250)">250</button>
		    <button onclick="selectSize(255)">255</button>
		    <button onclick="selectSize(260)">260</button>
		    <button onclick="selectSize(265)">265</button>
		    <button onclick="selectSize(270)">270</button>		    		    		    		    
	</div>    
		<br><BR><BR>
	<div align="left">
		<h2>  &nbsp;&nbsp;&nbsp; 의류 등  </h2>
		<hr color="black" width="95%" align="center">
	</div>
	<br>
	<div align="center">		
		    <button onclick="selectSize('XS')"> XS </button>
		    <button onclick="selectSize('S')"> S </button>
		    <button onclick="selectSize('M')"> M </button>
		    <button onclick="selectSize('L')"> L </button>
			<button onclick="selectSize('XL')"> XL </button>	    
		    <br><br>
		    <button onclick="selectSize(90)"> 90 </button>
		    <button onclick="selectSize(95)"> 95 </button>
		    <button onclick="selectSize(100)"> 100 </button>
	</div>
</body>
</html>


