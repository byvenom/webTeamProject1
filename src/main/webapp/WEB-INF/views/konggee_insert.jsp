<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="footer-wrapper">
		<div id="footer-content" style="height: 1000px">
			<div id="fbox4">
				<h2 align="center">
					강아지 <span>게시판 글 작성</span>
				</h2>
				<form id="sub1" method="post" 
					action="<%=request.getContextPath()%>/konggee_insert_ok.do"
					enctype="multipart/form-data">
					<table width="1000" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<th>작성자</th>
							<td><input name="writer" value="관리자" style="width: 930px"
								readonly="readonly"></input></td>
						</tr>
						<tr>
							<th>게시판 종류</th>
							<td><select name="cate" style="height: 24px"
								disabled="disabled">
									<option value="kong" selected="selected">공지사항</option>
							</select></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><input type="text" name="title" style="width: 930px"
								id="title"></input></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea rows="40" cols="30" name="cont" id="cont"
									style="width: 930px; resize: none"></textarea></td>
						</tr>
						<tr>
							<th>사 진</th>
							<td><input multiple="multiple" type="file" name="file" id="file"></input></td>
						</tr>
					</table>
					<div align="center">
						<p class="button-style">
							<input type="submit" value="글작성" style="border: none;background: none" ></input>
						</p>
						&nbsp;&nbsp;&nbsp;
						<p class="button-style">
							<a href="<%=request.getContextPath()%>/main.do">홈으로</a>
						</p>
					</div>
				</form>
			</div>

		</div>
	</div>
	<div id="page-wrapper">
		<div id="page">
			<div id="content" style="height: 24px"></div>
			<div id="sidebar">
				<h2></h2>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>