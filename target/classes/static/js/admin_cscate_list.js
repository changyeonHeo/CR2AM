$(function(){
    var cnum = $(".cnum").val();
	bringCsCategory(cnum);
    function bringCsCategory(cnum) {
        var dataToSend = cnum;
        $.ajax({
            url: "/getCsCategoryListToAjax.do",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(dataToSend),
            success: function (result) {
                if (result.length == 0) {
                    alert("소분류 카테고리를 불러왔지만 내용이 없습니다.");
                    $(".outline2").append('<tr><td colspan="3">등록된 소분류 카테고리가 없습니다.</td></tr>');
                } else {
                    console.info("소분류 카테고리 불러오기가 성공했습니다.");
                    console.info("불러온 갯수 : " + result.length);
                    $.each(result, function (index, item) {
                        $("table.outline2").append('<tr><td align="center">' + item.csnum + '&nbsp;&nbsp;/&nbsp;&nbsp;' + item.csname + '</td><td align="center"><a href="admin_cscate_update.do?csnum=' + item.csnum + '"> 수정 </a> |<a href="admin_cscate_delete.do?csnum=' + item.csnum + '">삭제</a></td></tr>	');
                    })
                }
            },
            error: function () {
                console.info("시방 안됬당께요");
            }
        })
    }
})