<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script src="js/check.js" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="css/style_address.css">
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.layer_container[data-v-2077f721] {
   box-shadow: none;
}

a {
   text-decoration: none !important;
}
</style>
<script type="text/javascript">
function check(){
    if (!f.name.value){
        alert("이름을 입력해 주세요!!")
        f.name.focus()
        return
    }
   if(!f.tel.value){
      alert("전화번호를 입력해 주세요!!")
      f.tel.focus()
      return
   }
    
    if (!f.zipcode.value){
        alert("우편번호를 입력해 주세요!!")
        f.zipcode.focus()
        return
    }
    
    if (!f.address1.value){
        alert("주소를 입력해 주세요!!")
        f.address1.focus()
        return
    }
    if (!f.address2.value){
        alert("상세주소를 입력해 주세요!!")
        f.address2.focus()
        return
    }

    document.f.submit()
}
</script>
<div data-v-2077f721 class="layer_container">
   <a data-v-2969fd09="" data-v-2077f721="" href="#"
      class="btn_layer_close"><div data-v-2969fd09="" data-v-2077f721="">
         <svg data-v-2969fd09="" xmlns="http://www.w3.org/2000/svg"
            class="ico-close icon sprite-icons">
            <use data-v-2969fd09=""
               href="/_nuxt/f45cf20461dd6e4e6d8591d181767f33.svg#i-ico-close"
               xlink:href="/_nuxt/f45cf20461dd6e4e6d8591d181767f33.svg#i-ico-close"></use></svg>
      </div> <!----></a>
   <form name="f" method="post"
      action="address_insert.do" onsubmit="">
      <div data-v-2077f721="" class="layer_header">
         <h2 data-v-2969fd09="" data-v-2077f721="" class="title">새 주소 추가</h2>
         <input type="hidden" value="${mem}" name="mem">
      </div>
      <div data-v-2077f721="" class="layer_content">
         <div data-v-2969fd09="" data-v-2077f721="" class="delivery_bind">
            <div data-v-2969fd09="" data-v-2077f721="" class="delivery_input">
               <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                  data-v-2077f721="">
                  <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">이름</h4>
                  <div data-v-5ee806c3="" class="input_item">
                     <input data-v-5ee806c3="" type="text" placeholder="수령인의 이름"
                        name="name" id="name" autocomplete="off" class="input_txt">
                  </div>
               </div>
               <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                  data-v-2077f721="">
                  <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">휴대폰
                     번호</h4>
                  <div data-v-5ee806c3="" class="input_item">
                     <input data-v-5ee806c3="" type="tel" placeholder="- 없이 입력"
                        oninput="autoHyphen2(this)" maxlength="13" autocomplete="off"
                        class="input_txt" name="tel" id="tel">
                  </div>
                  <p data-v-2969fd09="" data-v-5ee806c3="" class="input_error">
                     휴대폰 번호를 입력해주세요.</p>
               </div>
               <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                  data-v-2077f721="">
                  <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">우편번호</h4>
                  <div data-v-5ee806c3="" class="input_item">
                     <input data-v-5ee806c3="" type="text" placeholder="우편 번호를 검색하세요"
                        readonly="readonly" autocomplete="off" class="input_txt"
                        name="zipcode" id="zipcode"><a data-v-14ec1f2e=""
                        data-v-2969fd09="" onclick="kakaopost()"
                        class="btn btn_zipcode outline small" data-v-5ee806c3="">
                        우편번호 </a>
                  </div>
               </div>
               <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                  data-v-2077f721="">
                  <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">주소</h4>
                  <div data-v-5ee806c3="" class="input_item">
                     <input data-v-5ee806c3="" type="text" name="address1"
                        id="address1" placeholder="우편 번호 검색 후, 자동입력 됩니다"
                        readonly="readonly" autocomplete="off" class="input_txt">
                  </div>
               </div>
               <div data-v-5ee806c3="" data-v-2969fd09="" class="input_box"
                  data-v-2077f721="">
                  <h4 data-v-2969fd09="" data-v-5ee806c3="" class="input_title">상세
                     주소</h4>
                  <div data-v-5ee806c3="" class="input_item">
                     <input data-v-5ee806c3="" type="text" name="address2"
                        id="address2" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off"
                        class="input_txt">
                  </div>
               </div>
            </div>
            <div data-v-2969fd09="" data-v-2077f721="" class="delivery_check">
               <div data-v-384af6ef="" data-v-2969fd09="" class="checkbox_item"
                  data-v-2077f721="">
                  <input data-v-384af6ef="" id="check1" type="checkbox" name=""
                     class="blind"> <label data-v-384af6ef="" for="check1"
                     class="check_label"> <svg data-v-384af6ef=""
                        xmlns="http://www.w3.org/2000/svg"
                        class="icon sprite-icons ico-check-inactive"></svg> <!----></label>
               </div>
            </div>
         </div>
         <div data-v-2969fd09 class="v-portal" style="display: none;"></div>
         <div data-v-2969fd09 data-v-2077f721 class="layer_btn">
            <a href="javascript:closeTabClick()" data-v-14ec1f2e data-v-2969fd09
               class="btn btn_delete outlinegrey medium" data-v-2077f721> 취소 </a>
            <a data-v-14ec1f2e data-v-2969fd09 onClick="javascript:check()"
               class="btn btn_save solid medium" data-v-2077f721> 저장하기 </a>
         </div>
      </div>
   </form>
</div>
<script>
   function kakaopost() {
      new daum.Postcode({
         oncomplete : function(data) {
            document.querySelector("#zipcode").value = data.zonecode;
            document.querySelector("#address1").value = data.address;
            document.querySelector("#address2").value = "";
         }
      }).open();
   }
</script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("tel").addEventListener("keyup", function(event) {
            inputPhoneNumber(event.target);
        });
    });
    
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
    
    function closeTabClick() {
        window.close();
    }
</script>
</body>
</html>