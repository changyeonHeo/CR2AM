<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- admin_cscate_update.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="admin_product.jsp" %>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/admin_cscate_update.js"></script>
</head>
<body>
    <div>
        <div>
            <div>
                <form name="f" action="admin_cscate_update.do" method="post" onsubmit="inputCscateCheck();">
                <input type="hidden" class="select-cnum" value="${dto.cnum}">
                <input type="hidden" class="cnum" value="${dto.csnum}">
                    <div class="cscategory_input">
                        <div class="category_select">
                            대분류 선택 :
                            <select class="category_list" name="cnum">
                            </select>
                        </div>
                        <div class="sccategory_insert">
                            소분류 입력 : <input type="text" name="csname" id="csname" class="csname" value="${dto.csname}">
                        </div>
                    </div>
                    <input type="submit" value="확인" >
                </form>
            </div>
        </div>
    </div>
</body>
</html>