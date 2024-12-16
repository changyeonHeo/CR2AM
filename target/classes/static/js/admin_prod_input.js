$(function () {
   var cateList;
   var cscateList;

   bringCategory();
	bringBrand();
   function prodCheck() {
      var pcodeValue = $("#pcode").val();
      var pbrandValue = $("#pbrand").val();
      var cnameValue = $("#cname").val();
      var csnameValue = $("#csname").val();
      var pnameValue = $("#pnmae").val();
      var penameValue = $("#pename").val();
      var pgenderValue = $("#pgender").val();
      var pimageValue = $("#pimage").val();
      var ppriceValue = $("#pprice").val();
      var pcontentsValue = $("#pcontents").val();

      if (pcodeValue.trim() === "") {
         alert("상품코드를 입력해 주세요");
         $("input#pcode").focus();
         return false;
      }
      if (pbrandValue.trim() === "") {
         alert("브랜드를 입력해주세요");
         $("input#pbrand").focus();
         return false;
      }
      if (cnameValue.trim() === "" || cnameValue === "select") {
         alert("대분류를 선택해 주세요");
         $("input#cname").focus();
         return false;
      }
      if (csnameValue.trim() === "" || csnameValue === "select") {
         alert("소분류를 선택해 주세요");
         $("input#csname").focus();
         return false;
      }
      if (pnameValue.trim() === "") {
         alert("상품명을 입력해 주세요");
         $("input#pname").focus();
         return false;
      }
      if (penameValue.trim() === "") {
         alert("영문상품명을 입력해 주세요");
         $("input#pename").focus();
         return false;
      }
      if (pgenderValue.trim() === "") {
         alert("성별을 선택해 주세요");
         $("input#pgender").focus();
         return false;
      }
      if (pimageValue.trim() === "") {
         alert("상품이미지를 선택해 주세요");
         $("input#pimage").focus();
         return false;
      }
      if (ppriceValue.trim() === "") {
         alert("상품가격을 입력해 주세요");
         $("input#pprice").focus();
         return false;
      }
      if (pcontentsValue.trim() === "") {
         alert("상품소개를 입력해 주세요");
         $("input#pcontents").focus();
         return false;
      }
      if (ppointValue.trim() === "") {
         alert("상품포인트를 입력해 주세요");
         $("input#ppoint").focus();
         return false;
      }
      return true;
   }

   $(".category_list").change(function () {
      if ($(".category_list").val() == "select") {
      } else {
         var scval = $(".category_list").val();
         bringCsCategory(scval);
      }
   })

   $(document).on("click", "#csname", function () {
      var text = $("#cname :selected").text();
      if (text.includes("선택하세요")) {
         alert("상위 분류를 먼저 선택해 주세요");
      }
   });


   $(document).on("change", "#csname", function () {
      var address = document.f.action;
      var text = $("#csname :selected").text();
      var ccode = text.split("[");
      var cco = ccode[1].split("]");
      if (address.includes("?")) {
         address = address.split("=")[0] + "=" + cco[0];
      } else {
         address = address + "?code=" + cco[0];
      }
      document.f.action = address;
   });

   function bringCategory() {
      $.ajax({
         url: "/getCategoryListToAjax.do",
         method: "POST",
         contentType: "application/json",
         success: function (result) {
            caetList = result;
            if (result.length == 0) {
              alert("카테고리를 불러왔지만 내용이 없습니다.");
            } else {
               console.info("카테고리 불러오는거 성공했습니다~");
               console.info("불러온 갯수 : " + result.length);
               $.each(result, function (index, item) {
                  $(".category_list").append('<option value="' + item.cnum + '">' + item.cname + '</option>');
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
                alert("소분류 카테고리를 불러왔지만 내용이 없습니다.");
               cscategoryList = result;
               $("#csname").children('option:not(:first)').remove();
            } else {
               console.info("작은카테고리 불러오는거 성공했습니다.");
               $("#csname").children('option:not(:first)').remove();
               $.each(result, function (index, item) {
                  $(".cscategory_list").append('<option value="' + item.csnum + '" >' + item.csname + '</option>');
               })
            }
         },
         error: function () {
            console.info("시방 안됬당께요");
         }
      })
   }

   function bringBrand() {
      $.ajax({
         url: "getBrandListToAjax.do",
         method: "POST",
         contentType: "application/json",
         success: function (result) {
            console.info("브랜드 정보 호출 성공");
            $.each(result, function (index, item) {
               $(".pbrand").append("<option value=" + item.pbnum + ">" + item.pbrand + "</option>");
            })
         },
         error: function () {
            console.info("브랜드 호출 실패");
         }
      })
   }

})