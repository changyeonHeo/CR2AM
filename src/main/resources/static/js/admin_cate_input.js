$(function () {
    var cateList = null;
    var cscateList = null;

    bringCategory();

    $(".cscategory_input").hide();

    $("input[type='radio']").click(function () {
        $("input[type='radio']").removeClass("checked");
        $(this).addClass("checked");
        if ($(this).val() === "category") {
            $(".cscategory_input").hide();
            $(".category_input").show();
            $("#scname").val("");
            $("#cname").val("");
        } else if ($(this).val() === "cscategory") {
            $(".category_input").hide();
            $(".cscategory_input").show();
            $("#scname").val("");
            $("#cname").val("");
        }
    })

    $(".category_list").change(function () {
        if ($(".category_list").val() != "select") {
            var scval = $(".category_list").val();
            bringCsCategory(scval);
        }
    })

    $("input#cname").change(function () {
        var cnameval = $("#cname").val();
        var okcheck = true;

        $.each(cateList, function (index, result) {
            if (cnameval === result.cname) {
                alert("기존의 대분류가 존재합니다.");
                $("#cname").empty();
                $("input#cname").focus();
                $("input.submit").hide();
                okcheck = false;
                return false;
            }
        })

        if (okcheck) {
            alert("사용가능합니다.");
            $("input.submit").show();
        }
    })

    $("input#csname").change(function () {
        var csval = $("#csname").val();
        var okcheck = true;
        $.each(cscateList, function (index, result) {
            if (csval === result.csname) {
                alert("같은 항목이 있어요...");
                $("#csname").empty();
                $("#csname").focus();
                $("input.submit").hide();
                okcheck = false;
                return false;
            }
        })
        if (okcheck) {
            alert("사용가능합니다.");
            $("input.submit").show();
        }
    })

    function bringCategory() {
        $.ajax({
            url: "/getCategoryListToAjax.do",
            method: "POST",
            contentType: "application/json",
            success: function (result) {
                cateList = result;
                if (result.length == 0) {
                    alert("카테고리를 불러왔지만 아무것도 불러오지 못했습니다.");
                } else {
                    console.info("카테고리 불러오는거 성공했습니다.");
                    console.info("불러온 갯수 : " + result.length);
                    $.each(result, function (index, item) {
                        $(".category_list").append('<option value="' + item.cnum + '">' + item.cname + '</option>');
                    })
                }
            },
            error: function () {
                console.info("실패");
            }
        })
    }

    function bringCsCategory(cnum) {
        var dataToSend = cnum;
        $.ajax({
            url: "/getCsCategoryListToAjax.do",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(dataToSend),
            success: function (result) {
                cscateList = result;
                if (result.length == 0) {
                    alert("작은카테고리를 불러왔지만 아무도 없습니다.");
                    cscategoryList = result;
                } else {
                    console.info("작은카테고리 불러오는거 성공했습니다.");
                    cscategoryList = result;
                }
            },
            error: function () {
                console.info("실패");
            }
        })
    }
})
function okcheck(){
    var thisval = $("input[type='radio']:checked").val();
    alert("okcheck");
    if (thisval === "category") {
        alert("카테고리");
        var caval = $("#cname").val();
        if(caval === null || caval === ""){
            return false;
        }
        return true;
    }else if (thisval === "cscategory") {
        alert("서브카테고리");
        var cscaval = $("#csname").val();
        if(cscaval === null || cscaval === ""){
            return false;
        }
        return true;
    }
}