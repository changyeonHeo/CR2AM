<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style-reviewWrite.css">
    
<style>
   .proup {
      text-align: center;
      margin-top: 50px;
   }
   #previewImg {
        display: block;
        margin: 0 auto; 
        max-width: 200px;
        max-height: 200px;
    }
</style>
<script>
$(document).ready(function() {
    $("#upprofile").on("change", function(e) {
        var files = e.target.files;
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#previewImg").attr("src", e.target.result);
            $("#previewImg").css("display", "block");
        }
        reader.readAsDataURL(files[0]);
    });

    $("#cancelBtn").on("click", function() {
        window.close();
    });
    
    
    $("form").submit(function(e) {
        if ($("#upprofile").get(0).files.length === 0) {
            e.preventDefault(); 
            window.close(); 
        }
    });
});


</script>

<html>
<body>
    <div style="text-align:center;">
        <form name="f" action="update_profile.do?id=${loginMember.id}" method="post" enctype="multipart/form-data">
            <h2 class="proup">프로필 수정</h2>
            <div>                  
                <input type="file" name="proimg" id="upprofile" class="box" style="margin-bottom:5px;">
                <img id="previewImg" src="" alt="미리보기" style="display:none;">   
            </div>

            <div class="btn tac">
                <span class="box_btn w144 h45 fs15">
                    <button type="submit" style="text-align: center;">
                        <strong>변경하기</strong>
                    </button>
                </span>
                <span class="box_btn w144 h45 fs15 gray4"> 
                    <button id="cancelBtn">취소</button>
                </span>
            </div>
        </form>
    </div>
</body>
</html>