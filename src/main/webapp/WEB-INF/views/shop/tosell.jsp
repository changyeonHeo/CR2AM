<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="../top2.jsp" %>
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        /* 추가된 CSS 스타일 */
        .size-button {
            padding: 10px;
            margin: 5px;
            background-color: #57E693;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-container {
            text-align: center; /* 버튼 컨테이너를 가운데 정렬 */
        }
    </style>
        <script>
        $(document).ready(function () {
            // 220부터 330까지 5씩 증가하는 값으로 버튼 생성
			var dto = $("dto");
            var type = $("type");
            $("#item-name").append('<h3><span>'+'${dto.pname}'+'</span></h3>')
            $("#item-image").append('<img src="/files/'+'${dto.pimage}'+'">')
            let count = 0;
            for (var i = 220; i <= 330; i += 5) {
                // 버튼을 동적으로 생성하여 button-container에 추가
                count += 1;
                $('#button-container').append('<button class="size-button" id="' + i + '">' + i + '</button>');
                if (count % 5 == 0) {
                    $('#button-container').append('<br>');
                }
            }
            $('.size-button').click(function () {
                let size = $(this).attr("id");
                location.href = "auctiontosell.do?pnum=${dto.pnum}"+"&size=" + size;
            })
        });
    </script>
</head>

<body>
    <!-- 버튼이 추가될 위치 -->
	<div align="center">
		<div id="item-name"></div>
        <div id="item-image"></div>
	    <div id="button-container"></div>
	</div>


<%@include file="../bottom2.jsp" %>