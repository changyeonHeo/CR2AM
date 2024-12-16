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
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {

				//테스트용 데이터
				var product_size_sel = {
					" " : "의류선택",
					"S" : "신발",
					"C" : "기타의류"
				};

				//sel1이 여성일경우
				var product_size_1 = {
					" " : "신발 사이즈 선택",
					"260" : "260",
					"265" : "265",
					"270" : "270",
					"275" : "275"
				};

				//sel1이 남성일경우
				var product_size_2 = {
					" " : "의류 사이즈 선택",
					"S" : "S",
					"M" : "M",
					"L" : "L",
					"XL" : "XL"
				};
				
				//sel1에 서버에서 받아온 값을 넣기위해..
				// map배열과 select 태그 id를 넘겨주면 option 태그를 붙여줌.
				// map[키이름] = 그 키에 해당하는 value를 반환한다.
				//retOption(데이터맵, select함수 id)
				
				function retOption(mapArr, select) {
					var html = '';
					var keys = Object.keys(mapArr);
					for ( var i in keys) {
						html += "<option value=" + "'" + keys[i] + "'>"
								+ mapArr[keys[i]] + "</option>";
					}

					$("select[id='" + select + "']").html(html);
				}
				
				$("select[id='product_size_sel']").on("change", function() {
					var option = $("#product_size_sel option:selected").val();
					var subSelName = '';
					if (option == "S") {
						subSelName = "product_size_1";
					} else if (option == "C") {
						subSelName = "product_size_2";
					} else {
						$("#product_size").hide();
						return;
					}
					$("#product_size").show();
					retOption(eval(subSelName), "product_size");
				})
				retOption(product_size_sel, "product_size_sel");
			});
</script>

</head>
<body>
	<!--  //안뇽 나는 종우 코딩천재 성민이형과 19차이쥬 하지만 곧 잡을거쥬?헤헿 -->
	<div align="center" width="50%">
		<form action="insertAuction.do" method="post" id="f">
			<input type="hidden" name="anum" value="0"> <input
				type="hidden" name="insertdate" value="0"> <input
				type="hidden" name="saledate" value="0"> <input type="hidden"
				name="status" value="0">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
				<tr>
					<th>
						구/판매 여부
					</th>
					<td>
						<select name="atype">
							<option  value="b">구매입찰하기</option>
							<option value="s">판매입찰하기</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<th>상풍번호</th>
					<td><input type="text" name="pnum" class="box"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" class="box"></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>
						<select name="product_size_sel" id="product_size_sel"></select>
						<select name="product_size" id="product_size" style="display: none"></select>
					</td>
				</tr>
			</table>
			<input type="submit" value="확인">
		</form>

	</div>
</body>
</html>