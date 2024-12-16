<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<a href="insertAuction.do">등록해보기</a>
	</div>
	<div align="center">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>등록자 ID</th>
					<th>상품 번호</th>
					<th>상품 가격</th>
					<th>사이즈</th>
					<th>현재 상태</th>
					<th>등록일자</th>
					<th>판매일자</th>
				</tr>
			</thead>
			<a id="refresh">새로고침</a>
			<tbody id="names-q1">

			</tbody>
			<c:forEach var="dto" items="${listAuction}">
				<tr>
					<td>${dto.anum}</td>
					<td>${dto.id}</td>
					<td>${dto.pnum}</td>
					<td>${dto.price}</td>
					<td>${dto.product_size}</td>
					<c:choose>
						<c:when test="${dto.atype eq 'b'}">
							<c:choose>
								<c:when test="${dto.status eq 1 }">
									<td>구매완료</td>
								</c:when>

								<c:otherwise>
									<td>입찰중</td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${dto.atype eq 's'}">
							<c:choose>
								<c:when test="${dto.status eq 1 }">
									<td>판매완료</td>
								</c:when>
								<c:when test="${dto.status eq 2 }">
									<td>검수중</td>
								</c:when>
								<c:when test="${dto.status eq 3 }">
									<td>판매취소</td>
								</c:when>

								<c:otherwise>
									<td>판매중</td>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
					<td>등록일 : ${dto.insertdate}</td>
					<c:choose>
						<c:when test="${dto.saledate eq 'n'}">
							<td align="center">-</td>
						</c:when>
						<c:otherwise>
							<td>판매일 : ${dto.saledate}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script>
        function q1() {
        	$("#refresh").onclick{
        	
            $.ajax({
                type: "GET",
                url: "/getlist.do",
                data: {},
                success: function(response){
                    $("#names-q1").empty()
                    let listAuction = 
                    let bike_list = response["getStationList"]["row"]
                    for (let i = 0; i < bike_list.length; i++){
                        let name_stat = bike_list[i]["stationName"]
                        let rack_cnt = bike_list[i]["rackTotCnt"]
                        let park_bike = bike_list[i]["parkingBikeTotCnt"]
                        
                        let tr_bike = ``
                        if(park_bike < 3){
                            tr_bike = `<tr class="tr_color">
                                            <td>${name_stat}앞</td>
                                            <td>${rack_cnt}</td>
                                            <td>${park_bike}</td>
                                        </tr>`
                        }
                        else{
                            tr_bike = `<tr>
                                            <td>${name_stat}앞</td>
                                            <td>${rack_cnt}</td>
                                            <td>${park_bike}</td>
                                        </tr>`
                        }
                        
                        
                        $("#names-q1").append(tr_bike)
                    }
                }
            })
        }
        }
    </script>
</body>
</html>