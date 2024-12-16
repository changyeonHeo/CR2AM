$(function(){

    $('div[class="layer_delivery layer md"]').hide();
    

    $(document).on("click", ".my_item", function(){
        console.info($(this).attr('class'));
        $(".my_item").removeClass("is_active select").find(".btn_bind").hide();
        $(this).addClass("is_active").find(".btn_bind").show();
        $(".my_item").addClass("select");
        $(".info_box").eq(0).find(".desc").text($(this).find(".name").text());
        $(".info_box").eq(1).find(".desc").text($(this).find(".phone").text());
        $(".info_box").eq(2).find(".desc").text("("+$(this).find(".zipcode").text()+")"+$(this).find(".address").text());
        $(".layer_content").hide();
        $("div[class='layer_delivery layer md']").hide();
    });

    $("#tel").on("keyup",function(){
        inputPhoneNumber(this);
    })
    getAddressList(document.getElementById("mem").value);
    $("div[class='layer_delivery layer md']").hide();
    $(".empty_delivery_info").on("click",function(){
        console.info($(this).attr('class')+" 클릭");
        $(".layer_content").eq(0).show();
        $("div[class='layer_delivery layer md']").show();
    })
    $(".add_more_btn").on("click",function(){
        console.info($(this).attr('class')+" 클릭");
        $('.layer_header').find('.title').text(" 새 주소 추가 ");
        $(".layer_content").eq(0).show();
        $("div[class='layer_delivery layer md']").show();
    })

    $('.btn_layer_close').on("click",function(){
        console.info($(this).attr('class')+" 클릭");
        $("input.input_txt").val('');
        $(".layer_content").hide();
        $("div[class='layer_delivery layer md']").hide();
    })
    $("a[class='btn btn_edit outlinegrey small']").on("click",function(){
        $('.layer_header').find('.title').text("주소록");
        $(".layer_content").eq(1).show();
        $("div[class='layer_delivery layer md']").show();
    })

    $("a[class='btn btn_delete outlinegrey medium']").on("click",function(){
        console.info($(this).attr('class')+" 클릭");
        $("input.input_txt").val('');
        $("div[class='layer_delivery layer md']").hide();
    })

    $("a[class='btn btn_save solid medium']").on("click",function(){
        console.info($(this).attr('class')+" 클릭");
        console.info($('#address1').val());
        console.info($("#address2").val());
        console.info($("input.id").val());
        insertNewAddress(document.getElementById("mem").value);
    })

    function getAddressList(mem){
        $.ajax({
               url: "getAddressListToAjax.do",
               method: "GET",
               data: {"mem": mem},
               success: function (result) {
                $("div.other_list").empty();
                if(result.length != 0){
                    
                    $(".section_content").toggle();
                    for(var i = 0 ; i < result.length ; i++){
                        if(i == 0 ){
                            $("div.other_list").append(my_itme_one);
                        }else{
                            $("div.other_list").append(my_itme_else);
                        }
                        $(".my_item").eq(i).find(".name").text(result[i].name);
                        $(".my_item").eq(i).find(".phone").text(result[i].hp1+"-"+result[i].hp2+"-"+result[i].hp3);
                        $(".my_item").eq(i).find(".zipcode").text(result[i].zipcode);
                        $(".my_item").eq(i).find(".address").text(result[i].address1+result[i].address2);
                    }
    
                }
                if(result.length == 3){
                    $('.add_more_btn').hide();
                }
                $(".info_box").eq(0).find(".desc").text(result[0].name);
                $(".info_box").eq(1).find(".desc").text(result[0].hp1+result[0].hp2+result[0].hp3);
                $(".info_box").eq(2).find(".desc").text(result[0].address1+result[0].address2);
               },
               error: function () {
                  alert("주소 리스트 못가져옴 ㅠㅠ");
                  $(".section_content").eq(1).hide();
               }
    
            })
    }

    function insertNewAddress(mem){
        var NewInsertName = $('.input_box').eq(0).find(".input_txt").val();
        var NewInsertPhone =  $('.input_box').eq(1).find(".input_txt").val();
        var NewInsertZip =  $('.input_box').eq(2).find(".input_txt").val();
        var NewInsertAddress1 =  $('.input_box').eq(3).find(".input_txt").val();
        var NewInsertAddress2 =  $('.input_box').eq(4).find(".input_txt").val();
        console.info(NewInsertName);
        console.info(NewInsertPhone);
        console.info(NewInsertZip);
        console.info(NewInsertAddress1);
        console.info(NewInsertAddress2);
        $.ajax({
            url: "insertNewAddressToAjax.do",
            method: "GET",
            data: {
            "mem": mem,
            "name": NewInsertName,
            "tel": NewInsertPhone,
            "zipcode":NewInsertZip,
            "address1" : NewInsertAddress1,
            "address2" : NewInsertAddress2
        },
            success: function(){
                console.info(mem);
                $("div[class='layer_delivery layer md']").hide();
                window.location.reload()
            },
            error: function(){
                alert("등록실패");
            }
        })
    }
})

function kakaopost() {
  new daum.Postcode({
     oncomplete : function(data) {
        document.querySelector("#zipcode").value = data.zonecode;
        document.querySelector("#address1").value = data.address;
        document.querySelector("#address2").value = "";
     }
  }).open();
}

function inputPhoneNumber( phone ) {
    if( event.keyCode != 8 ) {
        const regExp = new RegExp( /^[0-9]{2,3}-^[0-9]{3,4}-^[0-9]{4}/g );
        if( phone.value.replace( regExp, "").length != 0 ) {                
            if( checkPhoneNumber( phone.value ) == true ) {
                let number = phone.value.replace( /[^0-9]/g, "" );
                let tel = "";
                let seoul = 0;
                if( number.substring( 0, 2 ).indexOf( "02" ) == 0 ) {
                    seoul = 1;
                    phone.setAttribute("maxlength", "12");
                    console.log( phone );
                } else {
                    phone.setAttribute("maxlength", "13");
                }
                if( number.length < ( 4 - seoul) ) {
                    return number;
                } else if( number.length < ( 7 - seoul ) ) {
                    tel += number.substr( 0, (3 - seoul ) );
                    tel += "-";
                    tel += number.substr( 3 - seoul );
                } else if(number.length < ( 11 - seoul ) ) {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul ), 3 );
                    tel += "-";
                    tel += number.substr( 6 - seoul );
                } else {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul), 4 );
                    tel += "-";
                    tel += number.substr( 7 - seoul );
                }
                phone.value = tel;
            } else {
                const regExp = new RegExp( /[^0-9|^-]*$/ );
                phone.value = phone.value.replace(regExp, "");
            }
        }
    }
}

function checkPhoneNumber( number ) {
    const regExp = new RegExp( /^[0-9|-]*$/ );
    if( regExp.test( number ) == true ) { return true; }
    else { return false; }
}




var my_itme_one ="<div data-v-7d49a47c='' class='my_item is_active select' data-v-1c284ef0=''><div data-v-7d49a47c='' class='info_bind'><div data-v-be4e2246='' class='address_info' data-v-7d49a47c=''><div data-v-be4e2246='' class='name_box'><span data-v-be4e2246='' class='name'>(1이름)</span><span data-v-be4e2246='' class='mark'>기본 배송지</span></div><p data-v-be4e2246='' class='phone'>(1전화번호)</p><div data-v-be4e2246='' class='address_box'><span data-v-be4e2246='' class='zipcode'>(1우편번호)</span><span data-v-be4e2246='' class='address'>(1주소)</span></div></div></div><div data-v-7d49a47c='' class='btn_bind'><span>O</span></div></div>";
var my_itme_else = "<div data-v-7d49a47c='' class='my_item select' data-v-1c284ef0=''><div data-v-7d49a47c='' class='info_bind'><div data-v-be4e2246='' class='address_info' data-v-7d49a47c=''><div data-v-be4e2246='' class='name_box'><span data-v-be4e2246='' class='name'>(2이름)</span></div><p data-v-be4e2246='' class='phone'>(2전화번호)</p><div data-v-be4e2246='' class='address_box'><span data-v-be4e2246='' class='zipcode'>(2우편번호)</span><span data-v-be4e2246='' class='address'>(2주소)</span></div></div></div><div data-v-7d49a47c='' class='btn_bind' style='display: none;'><span>O</span></div></div>";