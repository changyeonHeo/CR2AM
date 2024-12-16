<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    

<html>
<%@ include file="../admin/admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
    </head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>

        var size_num = 0;

            $(function () {
                
                var product_name = $("#pname").val();
                if(product_name !== ""||product_name !== null){
                    getList(product_name);
                }


                $("#type_select").change(function () {
                    if ($("#type_select").val() == "choose") {
                        $("#type").show();
                        $("#plusSizeArr").show();
                        $("#removeSizeArr").show();
                    } else {
                        $("#type").hide();
                    }
                });

                $("#plusSizeArr").on("click", function () {
                    if (size_num <= 23) {
                        plusSizeArr(size_num);
                        size_num++;
                    } else {
                        alert("사이즈는 최대 23개만 넣을 수 있습니다.");
                    }
                });

                $("#removeSizeArr").on("click", function () {
                    if (size_num > 0) {
                        removeSizeArr(size_num);
                        size_num--;
                    } else {
                        alert("못지워요~")
                    }
                });

            });

            function plusSizeArr(data) {
                $("#insertTable").append("<tr id='insertTr" + data + "'><th colspan='2'>" + data + "</th><td colspan='2'><input name='" + data + "' type='text'></td></tr>")
            }

            function removeSizeArr(data) {
                $("#insertTr" + data).remove();
            }

            function getList(product_name) {
                $.ajax({
                    url: "getListToAjax.do",
                    method: "GET",
                    data: { pname: product_name },
                    success: function (result) {
                        if (result.length !== 0) {
                            $("#type").show();
                            for (var i = 0; i < result.length; i++) {
                                $("#insertTable").append("<tr id='insertTr" + i + "'><th colspan='2'>" + i + "</th><td colspan='2'><input name='" + i + "' type='text' value='" + result[i].c_size + "'></td></tr>");
                            }
                            size_num = result.length;
                            $("option[value='choose']").attr("selected","selected");
                        } else {
                            $("#type").hide();
                            $("#plusSizeArr").hide();
                            $("#removeSizeArr").hide();
                        }
                    },
                    error: function () {
                    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            }


        </script>
    <body>
    	<br><br>
        <div>
            <div>
                <div align="center">
                    <form action="sizeUpdate.do" method="post">
                        <input type="hidden" name="pcode" value="${pcode}">
                        <table border="1" id="insertTable" class="outline2">
                            <tr bgcolor="#ebebeb">
                                <th>상품이름/프라임값</th>
                                <td id="productName"><input name="pname" id="pname" type="text" value="${pname}" ></td>
                                <th>타입</th>
                                <td>
                                    <select id="type_select" name="type_select">
                                        <option value="s">신발(기본 220 ~ 330)</option>
                                        <option value="c">의류(기본 XXS ~ XXL)</option>
                                        <option value="o">원사이즈(기본 One Size)</option>
                                        <option value="choose" >선택하기</option>
                                    </select>
                                    <input id="type" name="type" hidden>
                                    <a id="plusSizeArr">+</a>
                                    <a id="removeSizeArr">-</a>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <input type="submit" value="확인">
                    </form>
                </div>
            </div>
        </div>
    </body>


    </html>