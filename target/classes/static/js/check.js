   function check(){
      if (f.writer.value == ""){
         alert("이름을 입력해 주세요!!")
         f.writer.focus()
         return false
      }
      if (f.subject.value == ""){
         alert("제목을 입력해 주세요!!")
         f.subject.focus()
         return false
      }
      if (f.content.value == ""){
         alert("내용을 입력해 주세요!!")
         f.content.focus()
         return false
      }
      if (f.passwd.value == ""){
         alert("비밀번호을 입력해 주세요!!")
         f.passwd.focus()
         return false
      }
      return true
   }
   
   function checkId(){
        var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    alert("아이디를 다시 입력해주세요");
                    $('#id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
        
/*        const autoHyphen2 = (target) => {
            target.value = target.value
              .replace(/[^0-9]/g, '')
             .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
             .replace(/(\-{1,2})$/g, "");
           }  */  