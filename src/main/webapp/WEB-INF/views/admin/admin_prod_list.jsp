<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- admin/admin_prod_list.jsp -->

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

            <%@ include file="admin_product.jsp" %>

                <script type="text/javascript">

                    $(function () {
                        var arr = new Array();
                        $("#checkAll").click(function () {
                            if ($("#checkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                            else $("input[name='chk']").prop("checked", false);
                        });

                        $("input[name=chk]").click(function () {
                            var total = $("input[name=chk]").length;
                            var checked = $("input[name=chk]:checked").length;
                            if (total != checked) $("#checkAll").prop("checked", false);
                            else $("#checkAll").prop("checked", true);
                        });

                        $("#deleteBtn").click(function () {
                            var cnt = $("input[name='chk']:checked").length;
                            console.info(cnt);
                            $("input.checkbox:checked").each(function(){
                                arr.push($(this).val());
                                console.info($(this).val());
                                console.info(arr[0]);
                            });
                            if (cnt == 0) {
                                alert("선택된 상품이 없습니다.");
                            }
                            else {
                                var confirmDelete = confirm("정말로 선택된 상품을 삭제하시겠습니까?");
                                if (confirmDelete) {
                                    deleteprod(arr);
                                } else {
                                    return;
                                }
                            }
                        });
                        function deleteprod(arr){
                            var dateToSend = arr;
                            $.each(arr,function(index,item){
                                console.info(index+1+"번째 :"+item);
                            })
                              console.info(arr.length);
                                    $.ajax({
                                        type: "POST",
                                        url: "ad_prod_delete.do",
                                        dataType: "json",
                                        contentType: "application/json; charset=UTF-8",
                                        data: JSON.stringify(dateToSend),
                                        success: function (response) {
                                            alert("선택된 상품이 삭제되었습니다.");
                                            window.location.reload();
                                        },
                                        error: function (xhr, status, error) {
                                            alert("삭제 도중 오류가 발생했습니다.");
                                            console.error(error);
                                        }
                                    });
                        }
                    }); 
                </script>
                <br><br>
                <div align="center">
                    <hr color="green" width="300">
                    <h2>상 품 목 록</h2>
                    <hr color="green" width="300">
                </div>

                <!-- <form name="f" action="admin_prod_delete.do" method="post"> -->
                <table border="0" width="60%" class="outline">
                    <div align="left" style="margin-left:335px; margin-bottom:10px;">
                        <button id="deleteBtn" type="button"> 선택 삭제 </button>
                    </div>
                    <tr bgcolor="#ebebeb">
                        <th style="width: 10%;">
                            <div style="width: 100%; text-align: center;">
                                <input type="checkbox" name="allcheck" id="checkAll" style="width: 15px; height: 15px;">
                            </div>
                        </th>
                        <th style="width: 10%;">상품코드</th>
                        <th style="width: 15%;">브랜드</th>
                        <th style="width: 20%;">상품명</th>
                        <th style="width: 15%;">이미지</th>
                        <th style="width: 10%;">성별</th>
                        <th style="width: 10%;">정가</th>
                        <th style="width: 10%;">수정</th>
                    </tr>
                    <c:if test="${empty listProduct}">
                        <tr>
                            <td colspan="7">등록된 상품이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="dto" items="${listProduct}">
                        <tr>
                            <td>
                                <!-- <input type="checkbox" class="checkbox" style="width: 15px; height: 15px; margin-left:37.5px;"/> -->
                                <input type="checkbox" class="checkbox" name="chk" value="${dto.pcode}"
                                    style="width: 15px; height: 15px; margin-left:37.5px;" />
                            </td>
                            <td align="center" class="pcode">${dto.pcode}</td>
                            <td align="center">${dto.pbrand}</td>
                            <td align="center">${dto.pname}</td>
                            <td align="center" class="pimage">
                                <a href="admin_prod_view.do?pcode=${dto.pcode}">
                                    <img src="/files/${dto.pimage}" width="40" height="40">
                                </a>
                            </td>
                            <td align="center">${dto.pgender}</td>
                            <td align="right">
                                <fmt:formatNumber value="${dto.pprice}" pattern="###,###" /> 원
                            </td>
                            <td align="center">
                                <a href="admin_prod_update.do?pcode=${dto.pcode}"> 수정 </a>
                                <%-- <a href="javascript:void(0);"
                                    onclick="checkDelAndSubmit('${dto.pcode}', '${dto.pimage}')">삭제</a> --%>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                </form>
                </body>

                </html>   