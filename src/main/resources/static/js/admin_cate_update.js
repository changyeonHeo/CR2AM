$(function () {
    var cateList = null;
    bringCategory();
    
    $("input#cname").change(function(){
        var cnameval = $("input#cname").val();
        $.each(cateList,function(index, item){
            if(cnameval == item.cname){
                alert("기존의 대분류가 존재합니다.");
                $("input#cname").val("");
                $("input#cname").focus;
                return false;
            }
        })
    })

    function cateCheck() {
            if ($("#cname").val() == null || $("#cname").val() == ""|| $("#cname").val() == "select") {
                return false;
            }
            return true;
    }

    function bringCategory() {
        $.ajax({
            url: "/getCategoryListToAjax.do",
            method: "POST",
            contentType: "application/json",
            success: function (result) {
                caetList = result;
                if (result.length == 0) {
                    alert("대분류를 불러왔지만 내용이 없습니다.");
                } else {
                    console.info("카테고리 불러오는거 성공했습니다.");
                    console.info("불러온 갯수 : "+result.length);
                }
            },
            error: function () {
                console.info("시방 안됬당께요");
            }
        })
    }
})