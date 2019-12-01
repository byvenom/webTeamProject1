<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script>
var phoneRegExp = /^(01[016789]{1}|02|0[3-6]{1}[0-5]{1})-([0-9]{3,4})-([0-9]{4})$/;
function checkvalue(){
	if($.trim($("#title").val())==""){
  		alert("가게명을 입력해주세요");
  		$("#id").val("").focus();
  		return false;
  	}
	if($.trim($("#addr").val())==""){
  		alert("주소를 입력해 주세요");
  		$("#id").val("").focus();
  		return false;
  	}
	if($.trim($("#location").val())==""){
  		alert("소재지를 입력해 주세요");
  		$("#id").val("").focus();
  		return false;
  	}
	if($.trim($("#cont").val())==""){
  		alert("가게 설명을 입력하세요!");
  		$("#id").val("").focus();
  		return false;
  	}
	if (!phoneRegExp.test($.trim($("#tel").val()))) {
        alert("전화번호를 확인해 주세요.");
        $("#phone").val("").focus();
        return false;
    }
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div id="footer-wrapper">
		<div id="footer-content">
			<h2>PLACE 등록 페이지</h2>
			<form action="placeinsert_ok.do" onsubmit="return checkvalue()" enctype="multipart/form-data" method="post" >
				<div align="center">
					<table>
						<tr>
							<td>가게명</td>
							<td><input type="text" name="title" id="title" size="50"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="addr" id="addr" size="50"></td>
						</tr>
						<tr>
							<td>분류</td>
							<td><select name="cate">
							<option value="동물병원">동물병원</option>
							<option value="애견카페">애견카페</option>
							<option value="애견동반식당">애견동반식당</option>
							<option value="숙박업소">숙박업소</option>
							<option value="애견호텔">애견호텔</option>
							<option value="동반카페">동반카페</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>소재지</td>
							<td><input type="text" name="location" id="location" size="50"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" id="tel" size="50"></td>
						</tr>
						<tr>
							<td>가게설명</td>
							<td><textarea rows="8" cols="51" style="resize: none;" name="cont" id="cont"></textarea></td>
						</tr>
						<tr>
							<td>사진</td>
							<td><input type="file" name="file" multiple="multiple"></td>
						</tr>
					</table>
					<input type="submit" value="등록하기">
					<input type="button" value="취소" onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>