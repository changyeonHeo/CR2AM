$(function(){

	bringCategory();
    var cscateList = null;
    
    $(".category_list").change(function(){
        var cnum = $(this).val();
        bringCsCategory(cnum);
    })

    function inputCscateCheck(){
        if($(".category_list").val == "" || $(".category_list").val == null || $(".category_list").val == "select"){
            return false;
        }
        if($(".csname").val== "" || $(".csname").val == null) {
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
                if (result.length == 0) {
                    alert("카테고리를 불러왔지만 아무것도 없다요~");
                } else {
                    console.info("카테고리 불러오는거 성공했다요~");
                    console.info("불러온 갯수 : "+result.length);	
                    $(".category_list").empty
                    $(".category_list").append('<option value="select">-대분류를 선택해주세요-</option>');
                    $.each(result,function(index,item){
						if($("input.cnum").val()==item.cnum){
                            $(".category_list").append('<option value="'+item.cnum+'" selected>'+item.cname+'</option>');
						}else{
							$(".category_list").append('<option value="'+item.cnum+'">'+item.cname+'</option>');
						}
                        
                    })
                }
            },
            error: function () {
                console.info("시방 안됬당께요");
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
                    alert("작은카테고리를 불러왔지만 아무것도 없다요~");
                    cscategoryList = result;
                } else {
                    console.info("작은카테고리 불러오는거 성공했다요~");
                    cscategoryList = result;
                }
            },
            error: function () {
                console.info("시방 안됬당께요");
            }
        })
    }
})