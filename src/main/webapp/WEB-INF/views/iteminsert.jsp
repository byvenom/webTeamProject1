<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
	size: 100
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div id="footer-wrapper">
		<div id="footer-content">
			<h3>아이템 추가</h3>
			<form action="additem.do" method="post" enctype="multipart/form-data">
				<div align="center">
					<table border="0" width=600px; colspan=1;>
						<tr>
							<td>종류</td>
							<td><input type="radio" name="cateplus" checked="checked"
								value="1">공용<input type="radio" name="cateplus" value="0">강아지
								<input type="radio" name="cateplus" value="2">고양이 
								<select>
									<option name="cate" value="0">사료</option>
									<option name="cate" value="1">캔/간식</option>
									<option name="cate" value="2">모래/탈취제</option>
									<option name="cate" value="3">화장실/매트</option>
									<option name="cate" value="4">건강관리</option>
									<option name="cate" value="5">목용/미용</option>
									<option name="cate" value="6">장난감</option>
									<option name="cate" value="7">식기</option>
									<option name="cate" value="8">하우스/쿠션</option>
									<option name="cate" value="9">이동장/하네스</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="price"></td>
						</tr>
						<tr>
							<td>배급사</td>
							<td><input type="text" name="sup"></td>
						</tr>
						<tr>
							<td>수량</td>
							<td><input type="text" name="num"></td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input type="file" name="file" multiple="multiple"></td>
						</tr>
					</table>
					<input type="submit" value="등록하기"> <input type="reset"
						value="초기화"> <input type="button" value="취소하기"
						onclick="history.back();">
				</div>
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>